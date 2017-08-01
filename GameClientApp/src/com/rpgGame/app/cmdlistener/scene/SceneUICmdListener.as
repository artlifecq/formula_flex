package com.rpgGame.app.cmdlistener.scene
{
	import com.rpgGame.app.manager.BaZhenTuManager;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景UI控制器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-11 上午10:26:37
	 *
	 */
	public class SceneUICmdListener extends BaseBean
	{
		public function SceneUICmdListener()
		{
			super();
		}

		override public function start() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_START, onSwitchStart);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			EventManager.addEvent(CountryEvent.COUNTRY_TRANSFER_COUNTRY, onTransferCountry);
			//
			finish();
		}

		/**
		 * 移民时处理的面板
		 *
		 */
		private static function onTransferCountry() : void
		{
			AppManager.hideApp(AppConstant.TASK_DIAILOG_FUNC_PANEL);
		}

		private static function onSwitchStart() : void
		{
			AppManager.hideApp(AppConstant.TASK_DIAILOG_FUNC_PANEL);
			AppManager.hideApp(AppConstant.SOCIETY_BEAST_FIGHT_INFO_PANEL);
			AppManager.hideApp(AppConstant.BOSS_HURT_RANK_PANEL);
			AppManager.hideApp(AppConstant.COUNTRY_TAO_NI_INFO_PANEL);
			AppManager.hideApp(AppConstant.COUNTRY_TAO_NI_TASK_BAR_PANEL);
			AppManager.hideApp(AppConstant.OPEN_FUNCTION);
		}

		private static function onSwitchCmp() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (!sceneData)
				return;
			if (sceneData.isAnimalBarScene)
			{
				AppManager.hideApp(AppConstant.COUNTRY_PANEL);
				AppManager.showAppNoHide(AppConstant.SOCIETY_BEAST_FIGHT_INFO_PANEL);
				MainUIManager.hideTaskBar();
			}
			else if (sceneData.isTaoNiScene)
			{
				AppManager.showAppNoHide(AppConstant.COUNTRY_TAO_NI_INFO_PANEL);
				AppManager.showAppNoHide(AppConstant.COUNTRY_TAO_NI_TASK_BAR_PANEL);
				MainUIManager.hideTaskBar();
			}
			/*else if (sceneData.mapType == EnumMapType.MAP_TYPE_FAMILY_BATTLE_SCENE)
			{
				AppManager.showApp(AppConstant.FAMILY_WAR_DUNGEON_INFO_PANEL);
				AppManager.showApp(AppConstant.FAMILY_WAR_DUNGEON_KILL_RANK_PANEL);
				AppManager.hideApp(AppConstant.FAMILY_WAR_WAIT_JION_DUNGEON_PANEL);
				GameAlert.closeAlert(LangAlertInfo.joinFamilyWar);
				AppManager.hideApp(AppConstant.FAMILY_WAR_BID_PANEL);
				AppManager.showApp(AppConstant.FAMILY_WAR_DUNGEON_MONSTER_PANEL);
				MainUIManager.hideTaskBar();
			}
			else if (sceneData.mapType == EnumMapType.MAP_TYPE_BAZHENTU_SCENE)
			{
				AppManager.showApp(AppConstant.BA_ZHEN_TU_DETAIL_PANEL);
				BaZhenTuManager.todayEnterTimes += 1;
				MainUIManager.hideTaskBar();
			}
			else if (sceneData.mapType == EnumMapType.MAP_TYPE_JAIL_DUNGEON)
			{
				AppManager.showApp(AppConstant.CROWN_QIU_JIN_END_TIME);
//				MainUIManager.hideTaskBar();
			}*/
			else if (sceneData.isMazeScene)
			{
				AppManager.showAppNoHide(AppConstant.MAZE_RANK_PANEL);
				AppManager.showAppNoHide(AppConstant.MAZE_ALERT_PANEL);
				MainUIManager.hideTaskBar();
			}
			else if(MainRoleManager.isInCountryWar)
			{
				AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_RIGHT_BAR_PANEL);
				AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_BOTTOM_BAR_PANEL);
				MainUIManager.hideTaskBar();
			}
			else
			{
				AppManager.hideApp(AppConstant.FAMILY_WAR_DUNGEON_INFO_PANEL);
				AppManager.hideApp(AppConstant.FAMILY_WAR_DUNGEON_KILL_RANK_PANEL);
				AppManager.hideApp(AppConstant.FAMILY_WAR_WAIT_JION_DUNGEON_PANEL);
				AppManager.hideApp(AppConstant.FAMILY_WAR_BID_PANEL);
				AppManager.hideApp(AppConstant.FAMILY_WAR_DUNGEON_MONSTER_PANEL);
				AppManager.hideApp(AppConstant.BA_ZHEN_TU_DETAIL_PANEL);
				AppManager.hideApp(AppConstant.CROWN_QIU_JIN_END_TIME);
				AppManager.hideApp(AppConstant.MAZE_RANK_PANEL);
				AppManager.hideApp(AppConstant.MAZE_LAST_RANL_PANEL);
				AppManager.hideApp(AppConstant.MAZE_ALERT_PANEL);
				AppManager.hideApp(AppConstant.COUNTRY_WAR_RIGHT_BAR_PANEL);
				AppManager.hideApp(AppConstant.COUNTRY_WAR_BOTTOM_BAR_PANEL);
				MainUIManager.showTaskBar();
			}
		}
	}
}
