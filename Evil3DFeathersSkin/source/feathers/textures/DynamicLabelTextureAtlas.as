package feathers.textures
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import feathers.themes.GuiTheme;
	
	import starling.textures.ConcreteTexture;
	import starling.textures.IStarlingTexture;
	import starling.textures.LabelTextureAtlas;
	import starling.textures.TextureFactory;
	
	import utils.TimerServer;

	/**
	 * 动态文本贴图集 
	 * @author wewell@163.com
	 * 
	 */	
	public class DynamicLabelTextureAtlas 
	{
		private var _currentAtlas:LabelTextureAtlas;
		private var _singleTextures:Dictionary;
		private var _singleTextureLength:int;
		private var _canvas:BitmapData;
		
		private var _atlasId:int;
		private var _textureAtlasIDMap:Dictionary;
		private var _textureAtlasMap:Dictionary;
		private var _lazyBmds:Dictionary;
		private var _lazyBmdLenght:int;
		
		/**超过此高度的文本视为非规整文本，另行单独渲染*/
		private static const SINGLE_HEIGHT:int = 128;
		private static const MAX_SIZE:int = 512;
		
		/**回收短时间内未使用的显存*/
		private static const RECYCLE_GPU_MEMORY_TIME:int = 10*1000;
		/**彻底销毁长时间未使用的对象*/
		private static const GCTIME:int = 10*60*1000;//10min
		private static const HELPER_POINT:Point = new Point(0, 0);
		
		public function DynamicLabelTextureAtlas()
		{
			_singleTextures = new Dictionary();
			_textureAtlasMap = new Dictionary();
			_textureAtlasIDMap = new Dictionary();
			_lazyBmds = new Dictionary();
			
			TimerServer.addLoop(trimSingleTextures, RECYCLE_GPU_MEMORY_TIME);
			TimerServer.addLoop(trimAtlas, GCTIME);
		}
		
		private function get canvas():BitmapData
		{
			return _canvas ||= new BitmapData(MAX_SIZE, MAX_SIZE);
		}
		
		private function trimAtlas():void
		{
			var time:int = getTimer();
			var subTextures:Dictionary;
			var st:IStarlingTexture;
			var name:String;
			var activedCount:int;
			var atlas:LabelTextureAtlas;
			var numAtlas:int;
			var gui:GuiTheme = GuiTheme.ins;
			for (var id:int in _textureAtlasMap)
			{
				numAtlas++;
				atlas = LabelTextureAtlas(_textureAtlasMap[id]);
				
				if(!atlas.isUploaded)
					continue;
			
				subTextures = atlas.subTextures;
				
				if(time - atlas.texture.lastUsedTime > RECYCLE_GPU_MEMORY_TIME)
				{
					atlas.texture.invalidateContent();
					
					if(time - atlas.texture.lastUsedTime > GCTIME)
					{
						activedCount = 0;
						for (name in subTextures)
						{
							st = subTextures[name];
							activedCount++;
							if(st.referencedMeshCount > 0)
							{
								break;	
							}else{
								activedCount--;
							}
						}
						
						if(activedCount <= 0)
						{
							numAtlas--;
							for(name in subTextures)
							{
								gui.removeTexture(name);
								delete _textureAtlasIDMap[name];
							}
							delete _textureAtlasMap[id];
							atlas.dispose();
						}
					}
				}
			}
			CONFIG::Starling_Debug
			{
				trace("[starling]DynamicLabelTextureAtlas.gc |useTime:", getTimer() - time," | numAtlas:",numAtlas);
			}
		}
		
		private function trimSingleTextures():void
		{
			var name:String;
			var st:IStarlingTexture;
			var totalTextures:int;
			var time:int = getTimer();
			
			var gui:GuiTheme = GuiTheme.ins;
			var isAtlasFull:Boolean = false;
			var cacheToAtlas:Boolean = false;
			const gc_time:int = (GCTIME >> 1);
			for (name in _singleTextures)
			{
				st = _singleTextures[name];
				totalTextures++;
				if(!st.autoRecycleEnable)
					cacheToAtlas = true;
				else if(time - st.lastUsedTime > RECYCLE_GPU_MEMORY_TIME)
				{
					cacheToAtlas = st.referencedMeshCount > 0 && st.height <= SINGLE_HEIGHT && st.width <= MAX_SIZE;
					
					if(st.referencedMeshCount < 1)
					{
						st.invalidateContent();
						
						if(time - st.lastUsedTime > gc_time)
						{
							if(name in _lazyBmds)
							{
								_lazyBmds[name].dispose();
								delete _lazyBmds[name];
								_lazyBmdLenght--;
							}
							gui.removeTexture(name);
							delete _singleTextures[name];
							_singleTextureLength--;
							st.isDynamic = false;
							st.dispose();
						}
					}
				}
				
				if( cacheToAtlas && !isAtlasFull && (name in _lazyBmds))
				{
					if( pushToAtlas(name, _lazyBmds[name]) )
					{
						_lazyBmds[name].dispose();
						delete _lazyBmds[name];
						_lazyBmdLenght--;
					}else{
						isAtlasFull = true;
						break;
					}
				}
			}
			
			if(isAtlasFull)
			{
				TimerServer.callAfterFrame(uploadCurrentAtlas);
			}
			
			CONFIG::Starling_Debug
			{
				trace("[starling]DynamicLabelTextureAtlas.gc |useTime:", getTimer() - time, " | numSingleTexture:", _singleTextureLength);
			}
		}
		
		public function creatTextureFromBitmapData(name:String, bitmapData:BitmapData,  clipRect:Rectangle=null, isBitmpaFont:Boolean=false, disposeBitmapData:Boolean=true):IStarlingTexture
		{
			clipRect ||= bitmapData.rect;
			var t:IStarlingTexture = getTexture(name);
			if(t)
			{
				t.referencedMeshCount++;
				if(disposeBitmapData)bitmapData.dispose();
				return t;
			}
			
			t = TextureFactory.fromBitmapDataByMemoryItem(bitmapData, false, false, "bgra", false, clipRect);
			_singleTextures[name] = t;
			_singleTextureLength++;
			t.autoRecycleEnable = !isBitmpaFont;
			t.referencedMeshCount = 1;
			t.isDynamic = true;
			CONFIG::Debug
				{
					ConcreteTexture(t).key = name;
				}
			
			var outOfLimit:Boolean = clipRect.height > SINGLE_HEIGHT || clipRect.width > MAX_SIZE;
			if(!outOfLimit && (GuiTheme.ENABLE_TEXT_BATCH_RENDER || isBitmpaFont))
			{
				if(!clipRect.equals(bitmapData.rect))//clip
				{
					var lazyBmd:BitmapData = new BitmapData(clipRect.width, clipRect.height, true, 0);
					lazyBmd.copyPixels(bitmapData, clipRect, HELPER_POINT);
					if(disposeBitmapData)bitmapData.dispose();
				}else{
					lazyBmd = bitmapData;
				}
				_lazyBmds[name] = lazyBmd;
				_lazyBmdLenght++;
			}
			
        	return t;
		}
		
		private function pushToAtlas(name:String, bitmapData:BitmapData):Boolean
		{
			if(!_currentAtlas)
			{
				_currentAtlas = _textureAtlasMap[_atlasId] = new LabelTextureAtlas(TextureFactory.empty(MAX_SIZE, MAX_SIZE), canvas, _atlasId);
			}
			
			//插入测试
			var canPush:Boolean = _currentAtlas.pushTest(bitmapData.rect);
			
			if(!canPush)
			{
				return false;
			}
			
			_currentAtlas.addLabelBitmapData(name, bitmapData, bitmapData.rect);
			CONFIG::Starling_Debug
				{
					//trace("[starling]DynamicLabelTextureAtlas.addLabelBitmapData | name:", name);
				}
				
			//记录所在贴图集编号
			_textureAtlasIDMap[name] = _atlasId;
			return true;
		}
		
		private function openNextAtlas():void
		{
			_atlasId++;
			_currentAtlas = _textureAtlasMap[_atlasId] = new LabelTextureAtlas(TextureFactory.empty(MAX_SIZE, MAX_SIZE), _canvas, _atlasId);
			_canvas.fillRect(_canvas.rect, 0x0);
		}
		
		private function uploadCurrentAtlas():void
		{
			if( !_currentAtlas.isUploaded )
			{
				_currentAtlas.upload( onTextureUpload );
			}
		}
		
		private function onTextureUpload(atlas:LabelTextureAtlas):void
		{
			var n:String, subTexture:IStarlingTexture, singleTexture:IStarlingTexture;
			var subTextures:Dictionary = atlas.subTextures;
			var time:int = getTimer();
			for(n in subTextures)
			{
				subTexture = subTextures[n];
				
				singleTexture =  _singleTextures[n];
				if(singleTexture != null)
				{
					singleTexture.dispatchEventWith(Event.CHANGE, false, subTexture);
					
					singleTexture.invalidateContent();
					singleTexture.isDynamic = false;// pre dispose
					singleTexture.dispose();
					delete _singleTextures[n];
					_singleTextureLength--;
				}
			}
			
			//next
			openNextAtlas();
		}
		
		/** Retrieves a SubTexture by name. Returns <code>null</code> if it is not found. */
		public function getTexture(name:String):IStarlingTexture
		{
			var t:IStarlingTexture = _singleTextures[name];
			
			if(!t)
			{
				var atlas:LabelTextureAtlas = name in _textureAtlasIDMap ?  _textureAtlasMap[_textureAtlasIDMap[name]] : null;
				if(atlas)
					t = atlas.getTexture(name);
			}
			
			if(t && t.disposed)
			{
				GuiTheme.ins.removeTexture(name);
				t = null;
			}
			
			return  t;
		}
		
		/**
		 * ITextureAtlas method
		 * @param name
		 * 
		 */		
		public function removeRegion(name:String):void
		{
				//do nothing! wait before gc it self.
		}
	}
}
