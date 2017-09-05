package com.rpgGame.app.controller.keyboard
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.PickAutoManager;
	import com.rpgGame.app.sender.RankTopSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.interfaces.IEscExcute;
	import com.rpgGame.core.manager.EscActionManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.key.KeyInfo;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.type.EnumHurtType;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import starling.display.DisplayObjectContainer;

	public class KeyFuncProcess
	{
		private static var _keyDownTm : uint;
		private static var _keyDownTabTm : uint;
		private static var text : String="";
		public static function exec(info : KeyInfo,isdown : Boolean = false) : void
		{
			var moduleStr : String;
			var funcID : String = info.funcS;
			
			switch (funcID)
			{
				case "65": //A 自动挂机
					if (TrusteeshipManager.getInstance().isAutoFightRunning)
					{
						TrusteeshipManager.getInstance().stopAutoFight();
					}
					else
					{
						TrusteeshipManager.getInstance().startAutoFight();
						AppManager.hideApp(AppConstant.SYSTEMSET_PANEL);
					}					
					break;
				case "4": //B 背包
					AppManager.showApp(AppConstant.ROLE_PANEL);
					break;
				case "5": //C 人物
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ROLE,null,true,false);
					break;
				case "13": //D 强化
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_QIANGHUA,null,true,false);
					break;
				case "14": //E
					//					CountryWarChengMenManager.testAddChengMen();
					break;
				case "8": //F 好友
					/*if (AppManager.isAppInScene(AppConstant.MULTY_PANL))
					{
					AppManager.hideApp(AppConstant.MULTY_PANL);
					}
					else if(MapDataManager.getMapInfo(MainRoleManager.actorInfo.mapID).mapType==EnumMapType.MAP_TYPE_NORMAL)
					{
					AppManager.showApp(AppConstant.MULTY_PANL);
					}*/
					
					
					//					if (!ClientConfig.isBanShu)
					//						AppManager.showApp(AppConstant.FRIEND_PANEL);
					break;
				case "1": //G 战魂
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZHANHUN,null,true,false);
					break;
				case "17": //H 帮派
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI,null,true,false);
					break;
				case "18": //I 显示掉落
					DropGoodsManager.getInstance().showScaneName(isdown);
					break;
				case "11": //J 排行榜
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_LEVELRANK,null,true,false);
					break;
				case "20": //K 武学
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_JINENG,null,true,false);
					break;
				case "7": //L 任务
					AppManager.showApp(AppConstant.TASK_PANEL);
					break;
				case "3": //M 地图
					AppManager.showApp(AppConstant.BIGMAP_PANEL);
					break;
				case "23": //N 坐骑
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZUOQI,null,true,false);
					break;
				case "10": //O 设置
					AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
					break;
				case "9": //P 队伍
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZUDUI,null,true,false);
					break;
				case "12": //Q 无
//					AppManager.showApp(AppConstant.EQUIP_CHANGE);
					break;
				case "27": //R 聊天框缩放
					//resizeChatPanel();
					break;
				case "67": //S 商城
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_SHOP,null,true,false);
					break;
				case "29": //T 坐骑上下马
					HorseManager.instance().setMountRide();
					break;
				case "30": //U
					break;
				case "6": //V pk
					//AppManager.showApp(AppConstant.MOUNT_PANEL);
					//					PKMamager.ChangeNextPkModel();
					break;
				case "33": //X 心法
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_XINFA,null,true,false);
					break;
				case "34": //Y
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_JUEXUE,null,true,false);
					break;
				case "2": //Z 
					
					break;
				case "50": //显示掉落物图标
					//DropGoodsManager.getInstance().showScaneName(isdown);
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
				case "66": //~ 
					//MainRoleManager.autoPickCtrl.DoShortcutPick();
					PickAutoManager.getInstance().autoPickCtrl.DoShortcutPick();
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
