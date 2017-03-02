package com.game.engine2D.scene.render.vo.img
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.staticdata.CharAngleType;
	import com.game.engine2D.core.ATFStarlingTextureAtlas;
	import com.game.engine2D.core.ATFSubTexture;
	import com.game.engine2D.core.ATFTextureAtlas;
	import com.game.engine2D.core.ITextureMaterial;
	import com.game.engine2D.core.TexturePack;
	import com.game.engine2D.scene.StatusConvert;
	import com.game.engine2D.scene.render.vo.ActionInfo;
	import com.game.engine2D.scene.render.vo.SheetData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.mainCore.libCore.dispose.DisposeHelper;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import starling.textures.IStarlingTexture;
	
	
	/**
	 * 换装缓存数据原型
	 * @author Carver
	 * @modifier guoqing.wen
	 * 修改时间：2016-3-31 上午10:33:37
	 */
	public class RenderImgData implements IRenderImgData
	{
		/**
		 * 使用shape的scaleX渲染此时无需翻转bitmapdata，
		 * 1,2,3方向直接拿5,6，7方向资源
		 */
		private static const RENDER_SHAP : int = 1;
		
		private static var renderID:uint = 0;
		
		public var id:uint = 0;
		/**
		 * @private
		 * RenderUnitStatus
		 */
		private var _aps : RenderUnitStatus;
		
		/**
		 * key: 角度
		 * value: BitmapData
		 */
		private var _rotationDict : Dictionary;
		
		/**
		 * 存放每一帧位图的反射class
		 */
		private var _sourceClassDic : Dictionary;
		
		/**
		 * 存放每一帧位图的BitmapData数据
		 */
		private var _sourceBitmapDataDic : Dictionary;
		
		private var _renderType:int = RENDER_SHAP;
		
		public function RenderImgData()
		{
			id = renderID++;
		}
		
		/**
		 * @private
		 * 获取指定方向指定帧的位图资源
		 */
		public function getBitmapData(actionName:uint, $angle:int, $frame:int):BitmapData
		{
			var bitmapData:BitmapData;
			
			if(_renderType == RENDER_SHAP)
			{
				var sourceKey:uint = StatusConvert.getIdByNum(actionName, GlobalConfig2D.resAngleFunc($angle), $frame);
				bitmapData = _sourceBitmapDataDic[sourceKey];
				if(!bitmapData)
				{
					var cls:Class = _sourceClassDic[sourceKey];
					if(cls)
					{
						bitmapData = new cls();
						_sourceBitmapDataDic[sourceKey] = bitmapData;
						delete _sourceClassDic[sourceKey];
					}
				}
			}
			else
			{
				//bitmapData = getScaleBitmapData($angle, $frame);
			}
			return bitmapData;
		}
		
		/**
		 * 获取贴图
		 */
		public function getSubTexture($key:String):ATFSubTexture
		{
			if (_textureAtlas){
				return _textureAtlas.getTexture(_sourceClassDic[$key]);
			}
			else if (_textureSubSingle){
				return _textureSubSingle;
			}
			return null;
		}
		
		/**
		 * 获取贴图
		 */
		public function getStarlingTexture($key:String):IStarlingTexture
		{
			if (_textureStarlingAtlas)
			{
				return _textureStarlingAtlas.getTexture(_sourceClassDic[$key]);
			}
			return null;
		}
		
		/**
		 * 判断当前方向的图片是否需要翻转
		 * 1，2，3 方向的图片可以由 7，6，5 水平翻转得到
		 * @param $angle
		 * @return
		 *
		 */
		private function isNeedFlipHorizontal($angle : int) : Boolean
		{
			return $angle > CharAngleType.ANGEL_0 && $angle < CharAngleType.ANGEL_180;
		}
		
		/**
		 * @private
		 * 释放
		 * */
		public function dispose() : void
		{
			if (_aps)
			{
				_aps.dispose();
				_aps = null;
			}
			var key:*;
			var bd:BitmapData;
			var cls:Class;
			
			if(_sourceBitmapDataDic!=null)
			{
				for (key in _sourceBitmapDataDic)
				{
					bd = _sourceBitmapDataDic[key];
					DisposeHelper.add(bd);
					bd = null;
				}
				_sourceBitmapDataDic = null;
			}
			if (_textureAtlas)
			{
				_textureAtlas.dispose();
				_textureAtlas = null;
			}
			if (_textureStarlingAtlas)
			{
				_textureStarlingAtlas.dispose();
				_textureStarlingAtlas = null;
			}
			if (_textureSubSingle){
				_textureSubSingle.dispose();
				_textureSubSingle = null;
			}
			if (_textureSingle){
				_textureSingle.texture.dispose();
				_textureSingle.dispose();
				_textureSingle = null;
			}
			if (_sourceClassDic != null)
			{
				var source : Object;
				for (key in _sourceClassDic)
				{
					source = _sourceClassDic[key];
					if (source is ByteArray)
						(source as ByteArray).clear();
					source = null;
				}
				_sourceClassDic = null;
			}
			
			if (_rotationDict != null)
			{
				for (key in _rotationDict)
				{
					bd = _rotationDict[key];
					DisposeHelper.add(bd);
					bd = null;
				}
				_rotationDict = null;
			}
		}
		
		
		private var _textureSubSingle:ATFSubTexture;
		private var _textureSingle:ITextureMaterial;
		private var _textureAtlas:ATFTextureAtlas;
		private var _textureStarlingAtlas:ATFStarlingTextureAtlas;
		/**
		 *
		 * @param aps
		 * @param actionInfoDic
		 * @param extractor 提取器 @L.L.M.Sunny 2015-4-29
		 *
		 */
		public function initForDic(aps : RenderUnitStatus, actionInfoDic : Dictionary, extractor : Function) : void
		{
			_aps = aps;
			_sourceClassDic = new Dictionary();
			_sourceBitmapDataDic = new Dictionary();
			for each (var actionInfo : ActionInfo in actionInfoDic)
			{
				var length : int = actionInfo.framVec.length;
				var sheetData : SheetData;
				for (var i : int = 0; i < length; i++)
				{
					sheetData = actionInfo.framVec[i];
					var key : uint = StatusConvert.getIdByNum(actionInfo.action, actionInfo.angle, i);
					_sourceClassDic[key] = extractor(sheetData.className);
				}
			}
		}
		
		/** atf资源集 */
		public function initForATFDic(aps:RenderUnitStatus, _actionInfoDic:Dictionary, pack:TexturePack):void
		{
			_textureAtlas = new ATFTextureAtlas(pack);
			_aps = aps;
			_sourceClassDic = new Dictionary();
			_sourceBitmapDataDic = new Dictionary();
			
			for each (var actionInfo:ActionInfo in _actionInfoDic) 
			{
				var length:int = actionInfo.framVec.length;
				var sheetData:SheetData;
				for (var i:int = 0; i < length; i++) 
				{
					sheetData = actionInfo.framVec[i];
					var key:uint = StatusConvert.getIdByNum(actionInfo.action, actionInfo.angle, i);
					_sourceClassDic[key] = sheetData.className;
				}
			}
		}
		
		/** atf资源集 */
		public function initForATFStarlingDic(aps:RenderUnitStatus, _actionInfoDic:Dictionary, pack:TexturePack):void
		{
			_textureStarlingAtlas = new ATFStarlingTextureAtlas(pack);
			_aps = aps;
			_sourceClassDic = new Dictionary();
			_sourceBitmapDataDic = new Dictionary();
			
			for each (var actionInfo:ActionInfo in _actionInfoDic) 
			{
				var length:int = actionInfo.framVec.length;
				var sheetData:SheetData;
				for (var i:int = 0; i < length; i++) 
				{
					sheetData = actionInfo.framVec[i];
					var key:uint = StatusConvert.getIdByNum(actionInfo.action, actionInfo.angle, i);
					_sourceClassDic[key] = sheetData.className;
				}
			}
		}
		
		/** 加载单张位图  */
		public function initForBitmapData(aps : RenderUnitStatus, status : uint, angle : uint, frame : uint, bitmapData : BitmapData) : void
		{
			_aps = aps;
			_sourceBitmapDataDic = new Dictionary();
			_sourceClassDic = new Dictionary();
			
			var region:Rectangle = bitmapData.rect.clone();
			_textureSingle = MaterialUtils.getSingleMaterialByBitmapData(bitmapData);
			_textureSubSingle = new ATFSubTexture(_textureSingle,region, null, 0, 0,aps.fullSourchPath);
		}
		
		public function setWriteDepthEnable(value:Boolean):void
		{
			if (_textureAtlas)
			{
				_textureAtlas.setWriteDepthEnable(value);
			}
		}
	}
}