package com.rpgGame.coreData.info.map.map2d
{
	/**
	 *
	 * 地图资源数据，跟资源对应
	 * @author zgd
	 * 创建时间：2014-11-27 下午10:05:19
	 * 
	 */
	public class MapDataInfo
	{
		/**------------------场景资源加载后数据(from SceneResMgr)------------------*/
		public var mapMoveData:Vector.<Vector.<Boolean>>;//移动数据
		public var mapShadeData:Vector.<Vector.<Boolean>>;//遮挡数据
		public var mapPKAbleData:Vector.<Vector.<Boolean>>;//是否可PK数据(是否安全区)
		public var mapExp10XData:Vector.<Vector.<Boolean>>;//10倍经验区
		public var mapExp20XData:Vector.<Vector.<Boolean>>;//20倍经验区
		public var mapEffects:Vector.<EffectInfo>;//场景特效数据
		
		public function dispose():void
		{
			mapMoveData = null;
			mapShadeData = null;
			mapPKAbleData = null;
			mapExp10XData = null;
			mapExp20XData = null;
			mapEffects = null;
		}
		
	}
}
