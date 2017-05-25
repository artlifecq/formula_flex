package starling.textures
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	import away3d.Away3D;
	import away3d.events.Event;
	import away3d.textures.BGRAData;
	
	import starling.utils.callLater;
	
	public class LabelTextureAtlas  extends TextureAtlas
	{
		private var _atlasId:int;
		private var _topBrushX:int;
		private var _topBrushY:int;
		private var _topLineY:int;
		
		private var _botBrushX:int;
		private var _botBrushY:int;
		private var _botLineY:int;
		private var _emptyRegion:Rectangle;
		
		private var _canvas:BitmapData;
		private var bgraBytes:ByteArray;
		
		private var _uploadWithAtf:Boolean;
		private var _converting:Boolean;
		private var _uploaded:Boolean;
		private var _uploadFinishHandler:Function;
		
		private static var _point:Point = new Point();
		private static var _region:Rectangle = new Rectangle();
		
		private static const BOTTOM_TO_TOP_TEXTURE_HEIGHT:int = 36;
		private static var totalLabelTextureAtlas:int;
		
		public function LabelTextureAtlas(texture:IStarlingTexture, canvas:BitmapData, atlasId:int, uploadWithAtf:Boolean=true)
		{
			super(texture);
			
			texture.autoRecycleDataEnable = false;
			_canvas = canvas;
			_uploadWithAtf = uploadWithAtf && Away3D.WORKER_COUNT > 0 && Away3D.PARSE_PNG_IN_WORKER;
			_botBrushY = _botLineY = texture.height;
			_atlasId = atlasId;
			totalLabelTextureAtlas++;
			
//			CONFIG::Debug
				{
					ConcreteTexture(texture).key = "LabelTextureAtlas_"+_atlasId;
				}
		}
		
		public function pushTest(clipRect:Rectangle, brushRegion:Boolean=false):Boolean
		{
			if(_uploaded || _converting)
			{
				return false;
			}
			
			if(clipRect.height >= BOTTOM_TO_TOP_TEXTURE_HEIGHT)
			{
				//check next line
				if(_botBrushX+clipRect.width > texture.width)
				{
					_botBrushX = 0;
					_botBrushY = _botLineY - 1;
				}
				
				if(_botBrushY - clipRect.height < _botLineY)
				{
					_botLineY = _botBrushY - clipRect.height;
				}
				
				if(_botLineY < _topLineY)
				{
					return false;
				}
				
				_point.setTo(_botBrushX, _botBrushY-clipRect.height);
				_region.setTo(_point.x, _point.y, clipRect.width, clipRect.height);
				
				if(brushRegion)
					_botBrushX += clipRect.width+1;
				
			}else{
				//check next line
				if(_topBrushX+clipRect.width > texture.width)
				{
					_topBrushX = 0;
					_topBrushY = _topLineY + 1;
				}
				
				if(clipRect.height + _topBrushY > _topLineY)
				{
					_topLineY = clipRect.height + _topBrushY;
				}
				if(_topLineY > _botLineY)
				{
					return false;
				}
				
				_point.setTo(_topBrushX, _topBrushY);
				_region.setTo(_topBrushX, _topBrushY, clipRect.width, clipRect.height);
				
				if(brushRegion)
					_topBrushX += clipRect.width+1;
			}
			return true;
		}
		
		public function addLabelBitmapData(name:String, bitmapData:BitmapData,  clipRect:Rectangle):void
		{
			if(name in _subTextures)
			{
				return;
			}
			
			if(_uploaded || _converting)
			{
				CONFIG::Starling_Debug
					{
						trace("[Starling]LabelTextureAtlas.addLabelBitmapData fail !!!| canvas if full !!")
					}
				return;
			}
			
			if(!clipRect)clipRect = bitmapData.rect;
			
			if(!pushTest(clipRect, true))
				return;
			
			_canvas.copyPixels(bitmapData, clipRect, _point);
			
			var t:IStarlingTexture = new SubTexture(_atlasTexture, _region);
			_subTextures[name] = t;
			t.isDynamic = true;
			t.key = texture.key + " | "+name;
		}
		
		public function canInsertSize(width:int, height:int):Boolean
		{
			return _botLineY - _topBrushY >=  height;
		}
		
		/** Retrieves a SubTexture by name. Returns <code>null</code> if it is not found. */
		override public function getTexture(name:String):SubTexture
		{
			if(!_uploaded)
			{
				trace("LabelTextureAtlas have not upload", name);
				return null;
			}
			
			return _subTextures[name];
		}
		
		public function get isUploaded():Boolean
		{
			return _uploaded;
		}
		
		public function upload(uploadFinishHandler:Function = null):void
		{
			if(_uploaded || _converting)
			{
				CONFIG::Starling_Debug
					{
						trace("[Starling]LabelTextureAtlas.upload return !!!|  repetitive execution")
					}
				return;
			}
			
			this._uploadFinishHandler = uploadFinishHandler;
			
			bgraBytes = new ByteArray();
			bgraBytes.endian = Endian.LITTLE_ENDIAN;
			
			_canvas.copyPixelsToByteArray(_canvas.rect, bgraBytes);
			
			var ct:ConcreteTexture = texture as ConcreteTexture;
			if(_uploadWithAtf)
			{
				//构造BGRAData需要的需要的数据
				bgraBytes.writeBoolean(true);
				bgraBytes.writeShort(_canvas.width);
				bgraBytes.writeShort(_canvas.height);
				bgraBytes.position = 0;
				ct.highQuality = ct.compressed = true;
				ct.setBgraData(new BGRAData(bgraBytes, _canvas.width, _canvas.height, true));
				_converting = true;
				ct.addEventListener(Event.COMPLETE, onConvertToATFComplete);
			}else{
				ct.uploadBitmapDataByteArray(bgraBytes);
				callLater(onUploadComplete, null, 1);
			}
		}
		
		private function onConvertToATFComplete(event:Event):void
		{
			ConcreteTexture(texture).removeEventListener(Event.COMPLETE, onConvertToATFComplete);
			_converting = false;
			onUploadComplete();
		}
		
		private function onUploadComplete():void
		{
			_uploaded = true;
			if(_uploadFinishHandler != null)
			{
				_uploadFinishHandler(this);
				_uploadFinishHandler = null;
				_canvas = null;
				CONFIG::Starling_Debug
					{
						trace("[Starling]LabelTextureAtlas.onUploadComplete | atlasId:", atlasId);
					}
			}
		}
		
		public function get atlasId():int
		{
			return _atlasId;
		}
		
		public static function get numInstance():int
		{
			return totalLabelTextureAtlas;
		}
		
		override public function dispose():void
		{
			if(texture != null)
			{
				totalLabelTextureAtlas--;
				texture.removeEventListener(Event.COMPLETE, onConvertToATFComplete);
			}
			
			CONFIG::Starling_Debug
				{
					trace("[Starling]LabelTextureAtlas.dispose !!!!!!!!!!!!!!!!!| atlasId:", _atlasId);
				}
			
			super.dispose();
			_subTextures = null;
			_subTextureNames = null;
			_uploadFinishHandler = null;
			_atlasTexture = null;
			_canvas = null;
			if(bgraBytes)
			{
				bgraBytes.clear();
				bgraBytes = null;
			}
		}
	}
}
