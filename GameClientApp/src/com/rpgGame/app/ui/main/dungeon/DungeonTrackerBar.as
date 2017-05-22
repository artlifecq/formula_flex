package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *副本追踪
	 *@author dik
	 *2017-5-9下午3:53:06
	 */
	public class DungeonTrackerBar extends SkinUI
	{
		private var currentUI:SkinUI;
		private var uiClsMap:HashMap;
		
		public function DungeonTrackerBar()
		{
			super();
			initUIMap();
		}
		
		/**
		 *初始化UI类匹配表，增加一个副本追中在这里增加一个类型匹配就好了
		 * 
		 */
		private function initUIMap():void
		{
			uiClsMap=new HashMap();
			uiClsMap.add(EnumMapType.MAP_TYPE_LUNJIAN,LunJianTrackerUI);
			uiClsMap.add(EnumMapType.MAP_TYPE_MULTY,MultyTrackerUI);
			
		}
		
		override protected function onShow() : void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			var cls:Class=uiClsMap.getValue(/*sceneData.mapType*/2);
			if(!cls){
				return;
			}
			currentUI= new cls();
			this.addChild(currentUI);
		}
		
		
		override protected function onHide():void
		{
			super.onHide();
			if(currentUI){
				currentUI.removeFromParent();
				currentUI.dispose();
				currentUI=null;
			}
		}
	}
}