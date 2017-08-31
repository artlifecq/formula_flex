package com.rpgGame.app.manager.scene
{
	import com.rpgGame.app.manager.DailyResetManager;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.ProtectManager;
	import com.rpgGame.app.manager.WelcomeManager;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.hud.ActivityBarManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.task.TouZhuManager;
	import com.rpgGame.app.sender.SocietySender;
	import com.rpgGame.core.app.AppMergeManager;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.manager.BGMManager;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 第一次进入场景管理类
	 * @author neil
	 *
	 */
	public class FirstEnterSceneManager
	{
		public function FirstEnterSceneManager()
		{
		}

		//--------------------------------------
		private static var _isEnterScene : Boolean = false;

		public static function setup() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onFirstEnterScene);
		}

		private static function onFirstEnterScene() : void
		{
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onFirstEnterScene);

			_isEnterScene = true;

			init();
		}

		/**
		 * 游戏公共模块初始化，在第一次进入    游戏场景     时，都要初始化好 
		 * 
		 */		
		private static function init() : void
		{
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.PRIVILEGE_MARK_TYPE, 1);
			//暂时放这里测试用，@L.L.M.Sunny 20160113
			//主角初始化
			WelcomeManager.checkWelcomeState();
			MainRoleManager.initActor();
			

			AppMergeManager.instace.setup();
			MouseCursorController.setup();
			SocietyManager.init();
			//TeamManager.setup();

			//弹出菜单初始化
			MenuManager.setup();

			CollectManager.setup();

			TouJingManager.checkTouJingState();
			MiXinManager.checkMiXinState();
			TouZhuManager.checkTouZhuState();

			DailyResetManager.setup();
			//答题
//			DaTiManager.setup();
			//国战预告
//			CountryWarForeShowManager.setup();
//			CountryWarPrepareManager.setup();

//			MazeManager.firstEnterScene();
			MainUIManager.showMainUI();
			ActivityBarManager.setup();
			SocietySender.reqGetSelfFamilyInfo();

			MapUnitDataManager.setup();
//			CountryTaoNiManager.setup();
			ProtectManager.setup();
//			GameSettingManager.setup();
			BGMManager.initProtoC({"openSound":true,
				"openMusic":true,
				"soundVolume":100,
				"musicVolume":100});
		}

		public static function get isEnterScene() : Boolean
		{
			return _isEnterScene;
		}
		
		public static function set isEnterScene(value:Boolean) : void
		{
			 _isEnterScene=value;
		}
	}
}
