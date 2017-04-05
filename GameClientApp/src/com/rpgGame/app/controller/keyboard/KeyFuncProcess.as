package com.rpgGame.app.controller.keyboard
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.interfaces.IEscExcute;
	import com.rpgGame.core.manager.EscActionManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.key.KeyInfo;
	
	import starling.display.DisplayObjectContainer;
    
    import flash.utils.getTimer;

	public class KeyFuncProcess
	{
		private static var _keyDownTm : uint;
		private static var _keyDownTabTm : uint;

		public static function exec(info : KeyInfo) : void
		{
			var moduleStr : String;
			var funcID : String = info.funcS;
			var state : Boolean = false;

			switch (funcID)
			{
				case "1": //G GM命令面板
					if (!ClientConfig.isRelease)
					{
						if (AppManager.isAppInScene(AppConstant.GM_PANEL))
							AppManager.hideApp(AppConstant.GM_PANEL);
						else
							AppManager.showApp(AppConstant.GM_PANEL);
					}
					break;
				case "2": //Z 自动挂机
					if (TrusteeshipManager.getInstance().isAutoFightRunning)
						TrusteeshipManager.getInstance().stopAutoFight();
					else
						TrusteeshipManager.getInstance().startAutoFight();
					break;
				case "3": //m 地图
					//AppManager.showApp(AppConstant.WORLD_MAP_PANEL);
					AppManager.showApp(AppConstant.BIGMAP_PANEL);
					break;
				case "4": //B 背包
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.ROLE_PANEL);
					break;
				case "5": //C 人物
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.ROLE_PANEL);
					break;
				case "6": //V 技能
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.SPELL_PANEL);
					break;
				case "7": //L 任务
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.TASK_PANEL);
					break;
				case "8": //F 好友
//					if (!ClientConfig.isBanShu)
//						AppManager.showApp(AppConstant.FRIEND_PANEL);
					break;
				case "9": //P 队伍
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.TEAM_PANEL);
					break;
				case "10": //O 商城
					/*if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.SHOP_SYSTEM_PANEL);*/
					AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
					break;
				case "11": //J 社会
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.COUNTRY_PANEL);
					break;
				case "12": //Q 装备
					if (!ClientConfig.isBanShu)
						AppManager.showApp(AppConstant.EQUIP_CHANGE);
					break;
				case "14": //E
//					CountryWarChengMenManager.testAddChengMen();
					break;
				case "17": //H
					
					break;
				case "18": //I
//					CountryWarChengMenManager.testRemoveChengMen();
					break;
				case "27": //R 聊天框缩放
					//resizeChatPanel();
					break;
				case "29": //T 坐骑上下马
					if (!ClientConfig.isBanShu)
						MountManager.setMountRide();
					break;
				case "30": //U
					break;
				case "33": //X打坐
					//SitManager.sit();
					break;
				case "34": //Y
					break;
				case "50": //BO 切换目标
					break;
				case "51": //TAB
                    var curTime : uint = getTimer();
                    var next : Boolean = (curTime - _keyDownTabTm) < 500;
                    _keyDownTabTm = curTime;
                    SceneRoleSelectManager.selectedRole = CastSpellHelper.getNearestCanAtkRole(null, next);
					break;
				case "52": //ESC
					if (EscActionManager.executeAction() == false)
					{
						closeApp();
					}
					break;
				case "59": //+  
					break;
				case "60": //- 
					break;
			}
		}

		private static function closeApp() : void
		{
			var layer : DisplayObjectContainer = StarlingLayerManager.appUILayer;
			if (!layer || !layer.numChildren)
				return;
			var num : int = layer.numChildren;
			while (num--)
			{
				var iesc : IEscExcute = layer.getChildAt(num) as IEscExcute;
				if (iesc != null)
				{
					iesc.excute();
					return;
				}
			}
		}
	}
}
