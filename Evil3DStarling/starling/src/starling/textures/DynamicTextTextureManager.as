package starling.textures {
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import starling.core.starling_internal;
	
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
	 * 【单例模式】动态文字贴图管理程序<br>
	 * DynamicTextTextureManager
	 * @author      chenbo
	 * @time        7:56:42 PM
	 * @project     StarlingDemo
	 */
	public class DynamicTextTextureManager {
				
		/** 贴图数量，8张。程序启动时设置生效，稍后设置将不再生效。 */
		public static var TEXTURE_COUNT  : int = 8;
		/** 贴图宽度:1024。已经生成的贴图不再有效。对后续的动态贴图生效。 */
		public static var TEXTURE_WIDTH  : int = 1024;
		/** 贴图高度:512 。 已经生成的贴图不再有效。对后续的动态贴图生效。*/
		public static var TEXTURE_HEIGHT : int = 512;
		
		/** 是否启用文本动态合并策略 */
		public static var ENABLE_TEXT_BATCH : Boolean = false;
		
		private static var _instance : DynamicTextTextureManager;
		
		private var _textures : Vector.<DynamicTexture>
		private var _current  : int;
		
		public function DynamicTextTextureManager() {
			if (_instance != null) {
				throw new Error("Single Ton");
			}
			_current  = -1;
			_instance = this;
			_textures = new Vector.<DynamicTexture>(TEXTURE_COUNT);
		}
		
		private function getCurrentTexture() : DynamicTexture {
			if (_current < 0) {
				_current = 0;
			} else if (_current >= _textures.length) {
				_current = 0;
			}
			if (_textures[_current] == null) {
				_textures[_current] = new DynamicTexture(TEXTURE_WIDTH, TEXTURE_HEIGHT);
				return _textures[_current];
			}
			return _textures[_current];
		}
		
		private function switchBest() : void {
			_current++;
		}
		
		/**
		 * 更新贴图数据 
		 * @param name           贴图名称
		 * @param bitmapData     贴图数据
		 * 
		 */		
		public function uploadSubTexture(name:String, bitmapData:BitmapData):void {
			for (var i:int = 0; i < _textures.length; ++i) {
				if (_textures[i] != null && _textures[i].hasSubTexture(name)) {
					_textures[i].uploadSubTexture(name, bitmapData);
				}
			}
		}
		
		/**
		 * 获取一个SubTexture
		 * @param name
		 * @return 
		 * 
		 */		
		public function getSubTexture(name : String) : SubTexture {
			for (var i:int = 0; i < _textures.length; ++i) {
				if (_textures[i] != null) {
					var subTexture : SubTexture = _textures[i].getSubTexture(name);
					if (subTexture) {
						return subTexture;
					}
				}
			}
			return null;
		}
		
		/**
		 * 创建一个SubTexture 
		 * @param name       Texture名称
		 * @param bmd        Texture对应位图数据。
		 * @param freeData   是否释放位图数据
		 * @param rect       Texture对应位图所在区域
		 * @return           SubTexture
		 * 
		 */		
		public function createSubTexture(name : String, bmd : BitmapData, freeData : Boolean, rect : Rectangle = null) : IStarlingTexture {
			var subTexture : SubTexture = getSubTexture(name);
			if (subTexture) {
				if (freeData) {
					bmd.dispose();
				}
				return subTexture;
			}
			// 尝试获取新的贴图
			var dynTexture : DynamicTexture = getCurrentTexture();
			subTexture = dynTexture.insertSubTexture(name, bmd, freeData, rect);
			// 插入不成功，再尝试一次。
			if (subTexture == null) {
				switchBest();
				dynTexture = getCurrentTexture();
				subTexture = dynTexture.insertSubTexture(name, bmd, freeData, rect);
			}
			return subTexture;
		}
		
		/**
		 * 动态Texture管理程序 
		 * @return 
		 * 
		 */		
		public static function get instance():DynamicTextTextureManager {
			if (_instance == null) {
				_instance = new DynamicTextTextureManager();
			}
			return _instance;
		}
		
		/**
		 *  将会释放所有贴图。对已经生成引用的会造成影响。
		 */		
		public function dispose() : void {
			for (var i:int = 0; i < _textures.length; ++i) {
				if (_textures[i] != null) {
					_textures[i].dispose();
				}
				_textures[i] = null;				
			}
		}
	}
}
