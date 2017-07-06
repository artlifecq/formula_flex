package com.rpgGame.app.scene.trigger
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.trigger.handler.MultyTriggerHandler;
	import com.rpgGame.app.scene.trigger.handler.WczbTriggerHandler;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *触发区域池
	 *@author dik
	 *2017-7-4
	 **/
	public class TriggerPool
	{
		private static var handlerMap:HashMap=new HashMap();
		
		public function TriggerPool()
		{
		}
		
		/**
		 *根据地图类型设置对应地图的处理器
		 * 
		 */
		public static function setup():void
		{
			handlerMap.add(EnumMapType.MAP_TYPE_MULTY,MultyTriggerHandler);
			handlerMap.add(EnumMapType.MAP_TYPE_WCZB,WczbTriggerHandler);
		}
		
		/**
		 *获取当前的触发处理器
		 * @return 
		 * 
		 */
		public static function getHandler() : TriggerHandler{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			var cls:Class=handlerMap.getValue(sceneData.mapType);
			if(cls == null) return null;
			 return new cls() as TriggerHandler;
		}
	}
}