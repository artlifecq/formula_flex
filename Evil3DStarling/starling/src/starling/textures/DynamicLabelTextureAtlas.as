package starling.textures
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	import flash.utils.getTimer;
	
	import away3d.events.Event;

	/**
	 * 动态文本贴图集 
	 * @author wewell@163.com
	 * 
	 */	
	public class DynamicLabelTextureAtlas 
	{
		private var _currentAtlas:LabelTextureAtlas;
		private var _singleTextures:Dictionary;
		private var _bitmapFonts:Dictionary;
		private var _canvas:BitmapData;
		
		private var _atlasId:int;
		private var _textureAtlasIDMap:Dictionary;
		private var _textureAtlasMap:Dictionary;
		
		
		/**超过此高度的文本视为非规整文本，另行单独渲染*/
		private static const SINGLE_HEIGHT:int = 128;
		private static const MAX_SIZE:int = 512;
		
		/**文本批次渲染,开启会增加一定的显存消耗(1M~17M),但会显著降低drawcall次数*/
		public static var useLabelBatchRender:Boolean = true;
		
		public function DynamicLabelTextureAtlas()
		{
			_singleTextures = new Dictionary();
			_bitmapFonts = new Dictionary();
			_textureAtlasMap = new Dictionary();
			_textureAtlasIDMap = new Dictionary();
		}
		
		private function get canvas():BitmapData
		{
			return _canvas ||= new BitmapData(MAX_SIZE, MAX_SIZE);
		}
		
		private function gc():void
		{
			var time:int = getTimer();
			var subTextures:Dictionary;
			var st:IStarlingTexture;
			var name:String;
			var activedCount:int;
			var atlas:LabelTextureAtlas;
			var numAtlas:int;
			for (var id:* in _textureAtlasMap)
			{
				numAtlas++;
				
				if(id == _atlasId)
					continue;
				
				atlas = LabelTextureAtlas(_textureAtlasMap[id]);
				subTextures = atlas.subTextures;
				activedCount = 0;
				for (name in subTextures)
				{
					st = subTextures[name];
					activedCount++;
					if(st.referencedMeshCount < 1 && !_bitmapFonts.hasOwnProperty(name))
					{
						st.dispose();
						delete _textureAtlasIDMap[name];
						activedCount--;
					}
				}
				
				if(activedCount <= 0)
				{
					numAtlas--;
					atlas.dispose();
					delete _textureAtlasMap[id];
				}
				
				if(getTimer()-time > 10)break;
			}
			
			var totalTextures:int;
			for (name in _singleTextures)
			{
				st = _singleTextures[name];
				totalTextures++;
				if(st.referencedMeshCount < 1 && !_bitmapFonts.hasOwnProperty(name))
				{
					totalTextures--;
					st.dispose();
					delete _singleTextures[name];
				}
			}
			
			trace("[starling]DynamicLabelTextureAtlas.gc |useTime:", getTimer() - time, " | numSingleTextures:", totalTextures, " | numAtlas:",numAtlas);
		}
		
		public function addLabelBitmapData(name:String, bitmapData:BitmapData,  clipRect:Rectangle, isBitmpaFont:Boolean=false):IStarlingTexture
		{
			if(!clipRect)clipRect = bitmapData.rect;
			
			//字体
			if(isBitmpaFont)
			{
				_bitmapFonts[name] = true;
			}
			
			var t:IStarlingTexture;
			t = fromClipBitmapDataBytes(bitmapData, clipRect);
			_singleTextures[name] = t;
			
			//不使用批次渲染
			if(!useLabelBatchRender)
				return t;
			
			
			//超高文本
			if(	clipRect.height > SINGLE_HEIGHT)
			{
				return t;
			}
			
			if(!_currentAtlas)
			{
				_currentAtlas = _textureAtlasMap[_atlasId] = new LabelTextureAtlas(TextureFactory.empty(MAX_SIZE, MAX_SIZE), canvas);
			}
			
			//插入测试
			var canPush:Boolean = _currentAtlas.pushTest(clipRect);
			
			if(!canPush)
			{
				openNextAtlas();
			}
			
			_currentAtlas.addLabelBitmapData(name, bitmapData, clipRect);
			
			//记录所在贴图集编号
			_textureAtlasIDMap[name] = _atlasId;
			
			return t;
		}
		
		private function openNextAtlas():void
		{
			_currentAtlas.upload( onTextureUpload );
			_canvas.fillRect(_canvas.rect, 0x0);
			
			_atlasId++;
			_currentAtlas = _textureAtlasMap[_atlasId] = new LabelTextureAtlas(TextureFactory.empty(MAX_SIZE, MAX_SIZE), canvas);
		}
		
		private function onTextureUpload(atlas:LabelTextureAtlas):void
		{
			var n:String, atfTexture:IStarlingTexture, bgraTexture:IStarlingTexture;
			var subTextures:Dictionary = atlas.subTextures;
			for(n in subTextures)
			{
				atfTexture = subTextures[n];
				
				bgraTexture =  _singleTextures[n];
				if(bgraTexture)
					bgraTexture.dispatchEventWith(Event.CHANGE, false, atfTexture);
			}
			
			gc();
		}
		
		/** Retrieves a SubTexture by name. Returns <code>null</code> if it is not found. */
		public function getTexture(name:String):IStarlingTexture
		{
			var t:IStarlingTexture;
			
			var atlas:LabelTextureAtlas = name in _textureAtlasIDMap ?  _textureAtlasMap[_textureAtlasIDMap[name]] : null;
			if(atlas)
				t = atlas.getTexture(name);
			
			if(!t)
				t = _singleTextures[name];
			
			return  t;
		}
		
		/**
		 * @param bmd
		 * @param bgraBytes
		 * @param clipRect 如果为null，则不进行优化裁剪
		 * @return 
		 * 
		 */	
		private function fromClipBitmapDataBytes(bmd:BitmapData,clipRect:Rectangle=null,  bgraBytes:ByteArray=null):IStarlingTexture
		{
			var clip:Rectangle = clipRect || bmd.rect;
			
			if (bgraBytes) {
				bgraBytes.clear();
			} else {
				bgraBytes = new ByteArray();
			}
			// 小端:bgra格式
			bgraBytes.endian = Endian.LITTLE_ENDIAN;
			
			bmd.copyPixelsToByteArray(clip, bgraBytes);
			
			var texture:IStarlingTexture = TextureFactory.empty(clip.width, clip.height);
			
			bgraBytes.position = 0;
			texture.root.uploadBitmapDataByteArray(bgraBytes, 0);
			return texture;
		}
	}
}
