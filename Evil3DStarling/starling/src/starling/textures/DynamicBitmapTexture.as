package starling.textures
{
	import flash.display.BitmapData;
	import flash.display3D.Context3DTextureFormat;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import starling.utils.FreeRectangleChoiceHeuristic;
	import starling.utils.MathUtil;
	import starling.utils.MaxRectsBinPack;

	/**
	 * 动态贴图 [释放大贴图bitmapData,锁屏恢复重新拼大图]
	 * @author guoqing.wen
	 * 
	 */
	public class DynamicBitmapTexture
	{
		private var _bitmapObj:Dictionary = null;
		private var _mTexture:IStarlingTexture;
		private var _mTextureAtlas:TextureAtlas;
		private var _maxWidth:int = 0;
		private var _maxHeight:int = 0;
		private var _fontRects:Vector.<Rectangle> = null;
		private var _fontNames:Vector.<String> = null;
		
		public function DynamicBitmapTexture()
		{
			super();
			_bitmapObj = new Dictionary();
			_fontRects = new Vector.<Rectangle>();
			_fontNames = new Vector.<String>();
		}

		/**
		 * 是否存在key的资源
		 * @param key
		 * 
		 */
		public function hasTexture(key:String):Boolean
		{
			if (_mTextureAtlas)
				return _mTextureAtlas.getTexture(key);
			return false;
		}
		
		/**
		 * 添加bitmapData到大贴图 
		 * @param key
		 * @param bitmapData
		 * @return 在大图中的SubTexture
		 * 
		 */
		public function addBitmapData(key:String, bitmapData:BitmapData):IStarlingTexture
		{
			insertBitmapData(key, bitmapData);
			createTextureAtlas();
			return getTexture(key);
		}
		
		public function getBitmapData(key:String):BitmapData
		{
			return (key in _bitmapObj) ? _bitmapObj[key].bitmapData : null;
		}
			
		/**
		 * 删除bitmapData到大贴图 
		 * @param key
		 * @param regenerated:是否重新生成大贴图
		 * 
		 */
		public function removeBitmapData(key:String, disposed:Boolean = false, regenerated:Boolean = false):void
		{
			var indexKey:int = _fontNames.indexOf(key);
			if (indexKey != -1)
			{
				var bdObj:Object = _bitmapObj[key];
				_fontNames.splice(indexKey, 1);
				_fontRects.splice(indexKey, 1);
				
				if (disposed && bdObj && bdObj.bitmapData)
					bdObj.bitmapData.dispose();
				
				_bitmapObj[key] = null;
				delete _bitmapObj[key];
				
				if (regenerated)
					createTextureAtlas();
				
				bdObj = null;
			}
		}
		
		/**
		 * 删除所有的 
		 * @param disposed
		 * @param regenerated
		 * 
		 */
		public function removeBitmapDataAll(disposed:Boolean = false):void
		{
			for (var i:int = _fontNames.length - 1; i >= 0; i--) 
			{
				removeBitmapData(_fontNames[i], disposed);
			}
			disposeTexture();
			_maxWidth = 0;
			_maxHeight = 0;
		}
		
		/**
		 *  删除多个bitmapData到大贴图 
		 * @param keys：对应的key
		 * @param disposed:是否释放对应的bitmapData
		 * @param regenerated:是否重新生成大贴图
		 * 
		 */
		public function removeBitmapDatas(keys:Vector.<String>, disposed:Boolean = false, regenerated:Boolean = false):void
		{
			if (keys == null || keys.length == 0)
				return;
			for (var i:int = keys.length - 1; i >= 0; i--) 
			{
				removeBitmapData(keys[i], disposed);
			}
			if (regenerated)
				createTextureAtlas();
		}
		
		/**
		 *  添加多个bitmapData到大贴图 
		 * @param keys：对应的key
		 * @param bitmapDatas:key对应的bitmapData
		 * 
		 */
		public function addBitmapDatas(keys:Vector.<String>, bitmapDatas:Vector.<BitmapData>):void
		{
			if (keys.length != bitmapDatas.length)
				throw new Error("数组参数keys,bitmapDatas的长度必须相同");
			for (var i:int = keys.length - 1; i >= 0; i--) 
			{
				insertBitmapData(keys[i], bitmapDatas[i]);
			}
			createTextureAtlas();
		}
		
		/**
		 * 获取贴图集里面text贴图 
		 * @param text:贴图的名称
		 * @return 
		 * 
		 */
		public function getTexture(text:String):IStarlingTexture
		{
			if (_mTextureAtlas)
				return _mTextureAtlas.getTexture(text);
			return null;
		}
		
		/**
		 * 搜索最小矩形框
		 */
		protected function createMaxRectsBinPack(fontRects:Vector.<Rectangle>):MaxRectsBinPack
		{
			return FreeRectangleChoiceHeuristic.findMinFitBin(fontRects, MathUtil.getNextPowerOfTwo(_maxWidth > _maxHeight ? _maxWidth : _maxHeight)); 
		}
		
		/**
		 * 生成大图，使用MacRects算法 
		 */
		protected function createTextureAtlas():Boolean
		{
			var fontName:String = null;
			var rect:Rectangle = null;
			var len:int = _fontNames.length;
			var destPoint:Point = new Point();
			var bitmapObj:Object = null;
			var bitmapData:BitmapData = null;
			var pack:MaxRectsBinPack = createMaxRectsBinPack(_fontRects);
			
			if (pack == null)
			{
				trace("贴图集资源大小超过2048*2048大小限制！");
				return false;
			}
			
			disposeTexture();
			
			bitmapData = createEmptyBitmapData(pack.binWidth, pack.binHeight);
			_mTexture = createEmptyTexture(pack.binWidth, pack.binHeight);
	
			if (_mTextureAtlas)
				_mTextureAtlas.updateTexture(_mTexture);
			else
				_mTextureAtlas = new TextureAtlas(_mTexture);
			
			for (var i:int = 0; i < len; i++) 
			{
				fontName = _fontNames[i];
				bitmapObj = _bitmapObj[fontName];
				if (bitmapObj)
				{
					bitmapObj.rect = pack.usedRectangles[i];
					destPoint.x = ++bitmapObj.rect.x;
					destPoint.y = ++bitmapObj.rect.y;
					bitmapData.copyPixels(bitmapObj.bitmapData, bitmapObj.bitmapData.rect, destPoint);
					if (bitmapObj.isAdd)
					{
						bitmapObj.isAdd = false;
						_mTextureAtlas.addRegion(fontName, bitmapObj.rect);
					}
					else
					{
						_mTextureAtlas.updateSubTexture(fontName, bitmapObj.rect);
					}
				}
			}
			
			uploadTexture(bitmapData);
			
			//释放bitmapData
			disposeEmptyBitmapData(bitmapData);
			return true;
		}
		
		/** 释放创建的大贴图 */
		protected function disposeEmptyBitmapData(bitmapData:BitmapData):void
		{
			//释放bitmapData
			if (bitmapData)
				bitmapData.dispose();
		}
		
		/**
		 * 创建一个空的bitmapData及对应Textrue 
		 * @param textureWidth：宽，2的次幂
		 * @param textureHeight：高，2的次幂
		 * @return 返回创建的bitmapData对象
		 * 
		 */
		protected function createEmptyBitmapData(textureWidth:int, textureHeight:int):BitmapData
		{
			//使用压缩纹理 
			var bitmapData:BitmapData = new BitmapData(textureWidth, textureHeight, true, 0);
			return bitmapData;
		}

		/**
		 * 创建一个空的Textrue 
		 * @param textureWidth：宽，2的次幂
		 * @param textureHeight：高，2的次幂
		 * @return 返回创建的bitmapData对象
		 * 
		 */
		protected function createEmptyTexture(textureWidth:int, textureHeight:int):IStarlingTexture
		{
			//使用压缩纹理 
			_mTexture = TextureFactory.empty(textureWidth, textureHeight, false, false,Context3DTextureFormat.BGRA);
			return _mTexture;
		}
		
		/** 获取贴图集TextureAtlas对象 */
		protected function get textureAtlas():TextureAtlas
		{
			if (_mTextureAtlas == null)
				_mTextureAtlas = new TextureAtlas(_mTexture);
			return _mTextureAtlas;
		}
		
		/** 上传贴图 */
		protected function uploadTexture(bitmapData:BitmapData):void
		{
			_mTexture.root.uploadBitmapData(bitmapData);
		}
		
		/** 释放贴图和大图资源 */
		protected function disposeTexture():void
		{
			//大贴图
			if (_mTexture != null)
			{
				_mTexture.dispose();
				_mTexture = null;
			}
		}
		
		/**
		 * 添加一张位图 
		 * @param key:标实
		 * @param bitmapData
		 * 
		 */
		protected function insertBitmapData(key:String, bitmapData:BitmapData):void
		{
			var rect:Rectangle = null;
			
			if (hasTexture(key))
				return;
			rect = bitmapData.rect.clone();
			rect.width++;
			rect.height++;
			
			_fontRects.push(rect);
			_fontNames.push(key);
			_bitmapObj[key] = {bitmapData:bitmapData, isAdd:true};
			
			if (bitmapData.width > _maxWidth)
				_maxWidth = bitmapData.width;
			
			if (bitmapData.height > _maxHeight)
				_maxHeight = bitmapData.height;
		}
		
		public function dispose():void
		{
			disposeTexture();
			if (_mTextureAtlas)
				_mTextureAtlas.dispose();
			_mTextureAtlas = null;
			if (_bitmapObj)
			{
				for each(var bitmapObj:Object in _bitmapObj) 
				{
					if (bitmapObj && bitmapObj.bitmapData)
						(bitmapObj.bitmapData as BitmapData).dispose();
				}
			}
			_fontNames = null;
			_fontRects = null;
			_bitmapObj = null;
			//super.dispose();
		}
	}
}