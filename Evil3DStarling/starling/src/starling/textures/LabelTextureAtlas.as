package starling.textures
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	import away3d.events.Event;
	import away3d.textures.BGRAData;
	
	import starling.core.Starling;
	
	public class LabelTextureAtlas  extends TextureAtlas
	{
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
		private var _convertFinish:Boolean;
		private var _uploadFinishHandler:Function;
		
		private static var _point:Point = new Point();
		private static var _region:Rectangle = new Rectangle();
		
		private static const BOTTOM_TO_TOP_TEXTURE_HEIGHT:int = 36;
		
		public function LabelTextureAtlas(texture:IStarlingTexture, canvas:BitmapData, uploadWithAtf:Boolean=true)
		{
			super(texture);
			
			_canvas = canvas;
			_uploadWithAtf = uploadWithAtf;
			_botBrushY = _botLineY = texture.height;
		}
		
		public function pushTest(clipRect:Rectangle, brushRegion:Boolean=false):Boolean
		{
			if(_convertFinish || _converting)
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
		
		public function addLabelBitmapData(name:String, bitmapData:BitmapData,  clipRect:Rectangle):IStarlingTexture
		{
			var t:IStarlingTexture = getTexture(name);
			if(t != null)
				return t;
			
			if(_convertFinish || _converting)
			{
				if(Starling.current.showTrace)trace("[Starling]LabelTextureAtlas.addLabelBitmapData | 已转换或正在转换成ATF,不能再插入子贴图")
				return null;
			}
			
			if(!clipRect)clipRect = bitmapData.rect;
			
			if(!pushTest(clipRect, true))
				return null
			
			_canvas.copyPixels(bitmapData, clipRect, _point);
			
			t = new SubTexture(_atlasTexture, _region);
			t.key = name;
			_subTextures[name] = t;
			
			return getTexture(name);
		}
		
		public function canInsertSize(width:int, height:int):Boolean
		{
			return _botLineY - _topBrushY >=  height;
		}
		
		/** Retrieves a SubTexture by name. Returns <code>null</code> if it is not found. */
		override public function getTexture(name:String):IStarlingTexture
		{
			if(!_convertFinish)
				return null;
			
			return _subTextures[name];
		}
		
		public function get subTextures():Dictionary
		{
			return _subTextures;
		}
		
		public function upload(uploadFinishHandler:Function = null):void
		{
			if(_convertFinish || _converting)
			{
				if(Starling.current.showTrace)trace("[Starling]LabelTextureAtlas.upload | 已upload或正在uploadATF,重复调用被忽略")
				return;
			}
			
			this._uploadFinishHandler = uploadFinishHandler;
			
			if (bgraBytes) {
				bgraBytes.clear();
			} else {
				bgraBytes = new ByteArray();
			}
			// 小端:bgra格式
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
			}
		}
		
		private function onConvertToATFComplete(event:Event):void
		{
			ConcreteTexture(texture).removeEventListener(Event.COMPLETE, onConvertToATFComplete);
			_converting = false;
			_convertFinish = true;
			if(_uploadFinishHandler != null)
			{
				if(Starling.current.showTrace)trace("[Starling]LabelTextureAtlas.onConvertToATFComplete");
				_uploadFinishHandler(this);
			}
		}
		
		override public function dispose():void
		{
			if(Starling.current.showTrace)trace("[Starling]LabelTextureAtlas.dispose");
			super.dispose();
			_atlasTexture = null;
		}
	}
}
