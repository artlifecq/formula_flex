package starling.textures {
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	
	import away3d.events.Event;
	import away3d.events.EventDispatcher;
	import away3d.textures.BGRAData;
	import away3d.tools.utils.TextureUtils;
	
	import starling.core.starling_internal;
	import starling.utils.MiniBestRectsBinPack;
	
	use namespace starling_internal;
	
	/**
	 *　　　　　　　　┏┓　　　┏┓+ +
	 *　　　　　　　┏┛┻━━━┛┻┓ + +
	 *　　　　　　　┃　　　　　　　┃ 　
	 *　　　　　　　┃　　　━　　　┃ ++ + + +
	 *　　　　　　 ████━████ ┃+
	 *　　　　　　　┃　　　　　　　┃ +
	 *　　　　　　　┃　　　┻　　　┃
	 *　　　　　　　┃　　　　　　　┃ + +
	 *　　　　　　　┗━┓　　　┏━┛
	 *　　　　　　　　　┃　　　┃　　　　　　　　　　　
	 *　　　　　　　　　┃　　　┃ + + + +
	 *　　　　　　　　　┃　　　┃　　　　　　　　　　　
	 *　　　　　　　　　┃　　　┃ + 　　　　　　
	 *　　　　　　　　　┃　　　┃
	 *　　　　　　　　　┃　　　┃　　+　　　　　　　　　
	 *　　　　　　　　　┃　 　　┗━━━┓ + +
	 *　　　　　　　　　┃ 　　　　　　　┣┓
	 *　　　　　　　　　┃ 　　　　　　　┏┛
	 *　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
	 *　　　　　　　　　　┃┫┫　┃┫┫
	 *　　　　　　　　　　┗┻┛　┗┻┛+ + + +
	 * 动态合并的Texture
	 * @author      chenbo
	 * @time        8:27:36 PM
	 * @project     StarlingDemo
	 */
	public class DynamicTexture extends EventDispatcher {
		
		private static const TEMP_RECT : Rectangle = new Rectangle();
		/** 临时bytes,长度:512x128x4 */
		starling_internal static var tempBytes : ByteArray = null;
		/** 临时数组,长度512 */
		starling_internal static var tempArray : Vector.<SubTexture> = null;
		
		private var _textureBase  : ConcreteTexture;            // Texture
		private var _textureAtlas : TextureAtlas;               // 图集
		private var _bestPacker   : MiniBestRectsBinPack;       // 快速打包程序
		private var _bgraData     : BGRAData;                   // Texture数据
		private var _disposed     : Boolean;                    // 是否被Dispose
		private var _isFitFull    : Boolean;                    // 是否填充满
		private var _lastRepack   : Boolean;                    // 上一次是否进行过了打包操作
		private var _usedArea     : int;                        // 已用面积
		private var _limitFull    : int;                        // 面积已满阀值
		private var _limitFree    : int;                        // 面积空闲阀值
		private var _dirtySubDict : Dictionary;                 // SubTexture被销毁字典
		
		/**
		 * 预先分配固定尺寸的Texture 
		 * @param width    宽度，必须为2的幂
		 * @param height   高度，必须为2的幂
		 */	
		public function DynamicTexture(width : int, height : int) : void {
			if (tempBytes == null) {
				tempBytes = new ByteArray();
				tempBytes.endian = Endian.LITTLE_ENDIAN;
				tempBytes.length = 512 * 128 * 4;
			}
			if (tempArray == null) {
				tempArray = new Vector.<SubTexture>(512);
			}
			if (TextureUtils.isPowerOfTwo(width) && TextureUtils.isPowerOfTwo(height)) {
				_disposed   = false;
				_bestPacker = new MiniBestRectsBinPack(width, height);
				_bgraData   = new BGRAData(new ByteArray(), width, height, true, 0);
				_bgraData.bgraBytes.endian = Endian.LITTLE_ENDIAN;
				_bgraData.bgraBytes.length = width * height * 4;
				_textureBase = new ConcreteTexture(false, false, true, false);
				_textureBase.setSize(width, height);
				_textureBase.setBgraData(_bgraData);
				_usedArea     = 0;
				_limitFull    = width * height * 0.80;  // 使用空间超过80%时标记为满。考虑到很多空隙的存在，即使充满使用面积也不会达到90%以上。
				_limitFree    = width * height * 0.60;  // 当使用面积小于60%以下时，就可以开始进行贴图的重建工作。
				_textureAtlas = new TextureAtlas(_textureBase);
				_dirtySubDict = new Dictionary();
			} else {
				throw new Error("DynamicTexture must be power of 2!");
			}
		}
		
		public function get isFitFull():Boolean {
			return _isFitFull;
		}

		/**
		 * 移除一个SubTexture 
		 * @param name
		 * 
		 */		
		public function removeSubTexture(name : String) : void {
			var subtexture : SubTexture = _textureAtlas.getTexture(name);
			if (subtexture) {
				markDirtyTexture(name, subtexture.region.width * subtexture.region.height, true);
			}
		}
		
		/**
		 * 更新一个子节点数据 
		 * @param name
		 * @param bitmapData
		 * 
		 */		
		public function uploadSubTexture(name:String, bitmapData:BitmapData) : void {
			var subTexture : SubTexture = _textureAtlas.getTexture(name);
			if (subTexture == null) {
				return;
			}
			_textureBase.invalidateContent();
			// Bitmapdata拷贝到临时Bytes
			tempBytes.position = 0;
			bitmapData.copyPixelsToByteArray(bitmapData.rect, tempBytes);
			tempBytes.position = 0;
			// 临时Bytes拷贝到texturedata
			var offset : int = subTexture.region.width * 4;
			for (var i:int = 0; i < subTexture.region.height; i++) {
				_bgraData.bgraBytes.position = (TEMP_RECT.y + i) * _textureBase.width * 4 + TEMP_RECT.x * 4;
				_bgraData.bgraBytes.writeBytes(tempBytes, offset * i, offset);
			}
		}
		
		/**
		 * 插入一个子节点texture 
		 * @param key       贴图名称
		 * @param bmd       贴图数据
		 * @param freeData  是否释放位图数据
		 * @param rect      贴图有效区域
		 * 
		 */		
		public function insertSubTexture(name : String, bmd : BitmapData, freeData : Boolean, rect : Rectangle = null) : SubTexture {
			// 已经存在
			var subTexture : SubTexture = _textureAtlas.getTexture(name);
			if (subTexture != null) {
				return subTexture;
			}
			if (_isFitFull) {
				return null;
			}
			if (rect == null) {
				rect = bmd.rect;
			}
			// +1 边距
			TEMP_RECT.width  = rect.width  + 1;
			TEMP_RECT.height = rect.height + 1;
			// 插入
			if (_bestPacker.insert(TEMP_RECT)) {
				_lastRepack = false;
				// 标记内部textexure内容已经过时
				_textureBase.invalidateContent();
				_textureAtlas.addRegion(name, new Rectangle(TEMP_RECT.x, TEMP_RECT.y, rect.width, rect.height), false);
				// Bitmapdata拷贝到临时Bytes
				tempBytes.position = 0;
				bmd.copyPixelsToByteArray(rect, tempBytes);
				tempBytes.position = 0;
				// 临时Bytes拷贝到texturedata
				var offset : int = rect.width * 4;
				var i:int = 0;
				for (i = 0; i < rect.height; i++) {
					_bgraData.bgraBytes.position = (TEMP_RECT.y + i) * _textureBase.width * 4 + TEMP_RECT.x * 4;
					_bgraData.bgraBytes.writeBytes(tempBytes, offset * i, offset);
					_bgraData.bgraBytes.writeUnsignedInt(0x000000); // 右侧区域清空
				}
				// 下方区域清空
				_bgraData.bgraBytes.position = (TEMP_RECT.y + i) * _textureBase.width * 4 + TEMP_RECT.x * 4;
				for (i = 0; i < TEMP_RECT.width; i++) {
					_bgraData.bgraBytes.writeUnsignedInt(0x000000);
				}
				
				subTexture = _textureAtlas.getTexture(name);
				subTexture.isDynamic = true;
				subTexture.addEventListener(Event.DISPOSED, onSubTextureDisposed);
				markDirtyTexture(name, TEMP_RECT.width * TEMP_RECT.height, false);
				if (freeData) {
					bmd.dispose();
				}
				return subTexture;
			} else {
				// 使用面积非常少，销毁数量达到阀值
				if (_lastRepack == false && _usedArea <= _limitFree) {
					repackDynamicTexture();
				}
				return null;
			}
		}
		
		/**
		 * 标记贴图 
		 * @param name  贴图名称
		 * @param area  贴图面积
		 * @param dirty 贴图是否被dispose
		 */		
		private function markDirtyTexture(name : String, area : int, dirty : Boolean) : void {
			_usedArea = dirty ? _usedArea - area : _usedArea + area;
			_dirtySubDict[name] = dirty;
			_isFitFull == _usedArea >= _limitFull;
		}
		
		/**
		 * 重建 DynamicTexture
		 */		
		private function repackDynamicTexture() : void {
			_bestPacker.reset(_textureBase.width, _textureBase.height);
			_usedArea   = 0;
			_lastRepack = true;
			// 遍历整个图集，标记出非dirty状态SubTexture
			var size : int = 0;
			var subTexture : SubTexture = null;
			for (var name : String in _dirtySubDict) {
				var isDisposed : Boolean = _dirtySubDict[name];
				subTexture = _textureAtlas.getTexture(name);
				if (isDisposed) {
					subTexture.removeEventListener(Event.DISPOSED, onSubTextureDisposed);
					_textureAtlas.removeRegion(name);
				} else {
					tempArray[size++] = subTexture;
				}
			}
			// 重置dict和texure
			_dirtySubDict = new Dictionary();
			_textureBase.invalidateContent();
			// 遍历所有的图集,开始进行重新打包操作。
			for (var i:int = 0; i < size; i++) {
				subTexture = tempArray[i];
				var rect : Rectangle = MiniBestRectsBinPack.getFreeRectangle();
				rect.x = subTexture.region.x;
				rect.y = subTexture.region.y;
				rect.width  = subTexture.region.width  + 1;
				rect.height = subTexture.region.height + 1;
				_bestPacker.placeRectangle(rect);  // 以前插入成功，现在只是原样放回去
				markDirtyTexture(subTexture.key, rect.width * rect.height, false);
			}
			if (hasEventListener(Event.CHANGE)) {
				dispatchEventWith(Event.CHANGE);
			}
		}
		
		/**
		 * SubTexture被销毁 
		 * @param e
		 * 
		 */		
		private function onSubTextureDisposed(e : Event):void {
			var subTexture : SubTexture = e.target as SubTexture;
			if (_dirtySubDict[subTexture.key] == false) {
				markDirtyTexture(subTexture.key, subTexture.region.width * subTexture.region.height, true);
			}
		}
		
		/**
		 * 检测是否存在SubTexture 
		 * @param name
		 * @return 
		 * 
		 */		
		public function hasSubTexture(name : String) : Boolean {
			return _textureAtlas.getTexture(name);
		}
		
		/**
		 * 获取SubTexture 
		 * @param name
		 * @return 
		 * 
		 */		
		public function getSubTexture(name : String) : SubTexture {
			var subTexture : SubTexture = _textureAtlas.getTexture(name);
			if (subTexture != null && _dirtySubDict[name] == true) {
				markDirtyTexture(name, subTexture.region.width * subTexture.region.height, false);
			}
			return subTexture;
		}
		
		/**
		 *  销毁Texture
		 */	
		public function dispose() : void {
			if (_disposed == false) {
				_disposed = true;
				_textureAtlas.dispose();
				_bestPacker   = null;
				_textureBase  = null;
				_textureAtlas = null;
			}
		}
		
		/**
		 * 图集 
		 * @return 
		 * 
		 */		
		public function get textureAtlas() : TextureAtlas {
			return _textureAtlas;
		}
		
		/**
		 * 动态贴图 
		 * @return 
		 * 
		 */		
		public function get textureBase():ConcreteTexture {
			return _textureBase;
		}
				
		/**
		 * 低效 
		 * @return 
		 * 
		 */		
		public function get bgraData() : BGRAData {
			return _bgraData;
		}
		
	}
}