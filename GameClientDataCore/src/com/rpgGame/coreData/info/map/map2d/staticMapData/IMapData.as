package com.rpgGame.coreData.info.map.map2d.staticMapData
{
	import com.rpgGame.coreData.info.map.map2d.SceneBlockDataProto;

	/**
	 * 地图静态数据接口
	 */
	public interface IMapData
	{
		function setData(data:Object):void
		function getData():Object
		function toString():String
		function get sceneId():int 
		function get mapPackName():String 
		function get name():String 
		function get poet():String 
		function get fixedPkMode():int 
		function get isHeroLevelProtect():Boolean 
		function get isNewHeroProtect():Boolean 
		function get isDeathProtect():Boolean 
		function get isClustered():Boolean 
		function get isNightAutoProtect():Boolean 
		function get isJumpLimit():Boolean 
		function get isMountLimit():Boolean 
		function set isNormalScene(value:Boolean):void 
		function get isNormalScene():Boolean 
		function set mapType(value:int):void 
		function get mapType():int ;
		function set isDeathReturnTown(value:Boolean):void; 
		function get isDeathReturnTown():Boolean;
		function get mapNameResource():String;
		function get isCanUseMedicine():Boolean;
		function get sceneBlockDataProto():SceneBlockDataProto;
//		function get startX():int;
//		function get startY():int;
//		function get endX():int;
//		function get endY():int;
//		
		/**
		 * 是否是原地副本，某个常规场景中的一个区域为一个副本 
		 * @return 
		 * 
		 */		
		function isMapLockAtrea():Boolean;
	}
}