package com.rpgGame.app.ui.scene.dungeon
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.scene.BossTrackerUI;
	import com.rpgGame.app.ui.scene.LijinTrackerUI;
	import com.rpgGame.app.ui.scene.MibaoTrackerUI;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import org.client.mainCore.ds.HashMap;
	
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
			uiClsMap.add(EnumMapType.MAP_TYPE_Genuine,GenuineTracjerBar);
			uiClsMap.add(EnumMapType.MAP_TYPE_EQUIP,GenuineTracjerBar);
			uiClsMap.add(EnumMapType.MAP_TYPE_EXP,ExpTracjerBar);
			uiClsMap.add(EnumMapType.MAP_WORLD_BOSS,BossTrackerUI);
			uiClsMap.add(EnumMapType.MAP_TYPE_TOWERS,NineTowerTrackUIExt);
			uiClsMap.add(EnumMapType.MAP_TYPE_LIJIN,LijinTrackerUI);
			uiClsMap.add(EnumMapType.MAP_TYPE_MIBAO,MibaoTrackerUI);
			
		}
		
		override protected function onShow() : void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			var cls:Class=uiClsMap.getValue(EnumMapType.MAP_TYPE_MIBAO/*sceneData.mapType*/);
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