package com.rpgGame.app.process
{
    import com.game.engine2D.Scene;
    import com.game.engine3D.core.poolObject.PoolContainer3D;
    import com.game.engine3D.manager.Stage3DLayerManager;
    import com.game.engine3D.process.BaseProcess;
    import com.game.engine3D.scene.render.RenderSet3D;
    import com.game.engine3D.scene.render.RenderUnit3D;
    import com.game.engine3D.utils.StatsUtil;
    import com.game.mainCore.core.manager.LayerManager;
    import com.game.mainCore.core.timer.GameTimer;
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.SingleClientTest;
    import com.rpgGame.app.manager.BeanRegisterManager;
    import com.rpgGame.app.manager.ClientTriggerManager;
    import com.rpgGame.app.manager.GlobalSettingManager;
    import com.rpgGame.app.manager.SceneCameraLensEffectManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.scene.FirstEnterSceneManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.ui.ResLoadingView;
    import com.rpgGame.app.ui.tips.AmountTip;
    import com.rpgGame.app.ui.tips.BlessTip;
    import com.rpgGame.app.ui.tips.BuffTip;
    import com.rpgGame.app.ui.tips.D1v1RankRewardExt;
    import com.rpgGame.app.ui.tips.D1v1RankTipExt;
    import com.rpgGame.app.ui.tips.D1v1TipExt;
    import com.rpgGame.app.ui.tips.EquipTip;
    import com.rpgGame.app.ui.tips.ExtarItemTip;
    import com.rpgGame.app.ui.tips.FriendHeroTips;
    import com.rpgGame.app.ui.tips.ItemTip;
    import com.rpgGame.app.ui.tips.JiXianBuffTip;
    import com.rpgGame.app.ui.tips.JiXianPanelTip;
    import com.rpgGame.app.ui.tips.LostSkillTip;
    import com.rpgGame.app.ui.tips.MapAreaTip;
    import com.rpgGame.app.ui.tips.MeiRenGuiZeTip;
    import com.rpgGame.app.ui.tips.MeridainPointTip;
    import com.rpgGame.app.ui.tips.MountBeastCardTip;
    import com.rpgGame.app.ui.tips.MountSpellTips;
    import com.rpgGame.app.ui.tips.MountTip;
    import com.rpgGame.app.ui.tips.NineTowerTipExt;
    import com.rpgGame.app.ui.tips.NormalTip;
    import com.rpgGame.app.ui.tips.OpenGridTip;
    import com.rpgGame.app.ui.tips.PKModeTip;
    import com.rpgGame.app.ui.tips.PassiveSpellTip;
    import com.rpgGame.app.ui.tips.PetTip;
    import com.rpgGame.app.ui.tips.ShiJieBossRewardTips;
    import com.rpgGame.app.ui.tips.SocietyBuildItemTip;
    import com.rpgGame.app.ui.tips.SocietySpellTotalTip;
    import com.rpgGame.app.ui.tips.SpellTip;
    import com.rpgGame.app.ui.tips.TeamTipExt;
    import com.rpgGame.app.ui.tips.TxtPropChangeTip;
    import com.rpgGame.app.ui.tips.TxtTip;
    import com.rpgGame.app.ui.tips.VipMoTipExt;
    import com.rpgGame.app.ui.tips.VipNoneTipExt;
    import com.rpgGame.app.ui.tips.WangChengRewardTips;
    import com.rpgGame.app.ui.tips.cheats.CheatsIntraductTipExt;
    import com.rpgGame.app.ui.tips.cheats.CheatsNodePointTip;
    import com.rpgGame.app.ui.tips.cheats.CheatsTipExt;
    import com.rpgGame.core.events.MapEvent;
    import com.rpgGame.core.manager.tips.TipManager;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.utils.ConsoleDesk;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.type.TipType;
    
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    
    import org.client.mainCore.bean.BeanEvent;
    import org.client.mainCore.bean.BeanManager;
    import org.client.mainCore.manager.EventManager;
    import org.client.mainCore.utils.Tick;

	/**
	 *
	 * 开始游戏
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-3 下午2:53:32
	 *
	 */
	public class StartGame extends BaseProcess
	{
		public function StartGame()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_START_GAME;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			GameLog.addShow("Progress：准备进入游戏...");
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "准备进入游戏...";
			if (isProcessed)
			{
				getConfig();
			}
			else
			{
				initBean();
			}
		}

		private function initBean() : void
		{
			GameLog.addShow("Progress：执行BEAN控制");
			BeanRegisterManager.setup();
			BeanManager.addEventListener(BeanEvent.COMPLETE, onAllBeanComplete);
			BeanManager.start();
		}

		private function onAllBeanComplete(e : Event) : void
		{
			BeanManager.removeEventListener(BeanEvent.COMPLETE, onAllBeanComplete);
			if (ClientConfig.isSingle)
			{
				SingleClientTest.createRoleData();
				startGame();
			}
			else
			{
				getConfig();
			}
		}

		private function getConfig() : void
		{
			SystemTimeManager.reqServerTimeAndHeart();
			//因为这里暂时没有服务器给客户端传入配置数据了，所以暂时不要了
//			EventManager.addEvent(MiscEvent.CONGFIG_ALL_CMP, startGame);
//			ClientConfigSender.reqConfig();
			
			startGame();//上面的代码，暂时注释掉，应该还没有加这些协议，这个代码临时加上的，弥补流程
		}

		private function startGame() : void
		{
			if (!isProcessed)
			{
				tipsSetup();
				FirstEnterSceneManager.setup();//监听场景切换完成事件（仅是第一次进入游戏的第一个进入场景），初始化游戏所有公共的模块
				SceneManager.setup();//初始化场景，new 场景
				SceneCameraLensEffectManager.setup();//镜头特效初始化
				ClientTriggerManager.setup();
				//
				MainRoleManager.initActor();
				GlobalSettingManager.init();
				//

				Stage3DLayerManager.stage.addEventListener(KeyboardEvent.KEY_UP,onShowFrameState);
				initMM();
				showFrameState();
			}

			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			SceneSwitchManager.changeMap();
		}
		
		private var isShow:Boolean = true;
		private function onShowFrameState(e:KeyboardEvent):void
		{
			if(e.shiftKey&&e.keyCode==Keyboard.D)
			{
				CONFIG::Debug {
					isShow = !isShow;
					if(isShow)
					{
						StatsUtil.showAwayStats(Stage3DLayerManager.stage,Stage3DLayerManager.stage3DProxy);
					}
					else
					{
						StatsUtil.hideAwayStats();
					}
				}
				LayerManager.showOrHideMM();
				ConsoleDesk.showOrHide(Stage3DLayerManager.stage);
//				Starling.current.showStats=!Starling.current.showStats;
			}
		}
		
		private function showFrameState():void
		{
			CONFIG::Debug {
				StatsUtil.showAwayStats(Stage3DLayerManager.stage,Stage3DLayerManager.stage3DProxy);
			}			
//			LayerManager.showOrHideMM();
//				Starling.current.showStats=true;
			ConsoleDesk.showOrHide(Stage3DLayerManager.stage);
            // 屏蔽未捕获信息
//            Log.logCallBack = GameLog.logItem;
		}
		
		private function tipsSetup() : void
		{
			TipTargetManager.setup();

			TipManager.setup();
			TipManager.registerTipsParserClass(TipType.TXT_TIP, TxtTip);
			TipManager.registerTipsParserClass(TipType.ITEM_TIP, ItemTip);
			TipManager.registerTipsParserClass(TipType.SPELL_TIP, SpellTip);
			TipManager.registerTipsParserClass(TipType.OPEN_GRID_TIP, OpenGridTip);
			TipManager.registerTipsParserClass(TipType.FRIEND_HERO_TIP, FriendHeroTips);
			TipManager.registerTipsParserClass(TipType.EQUIP_TIP, EquipTip);
			TipManager.registerTipsParserClass(TipType.AMOUNT_TIP, AmountTip);
			TipManager.registerTipsParserClass(TipType.BUFF_TIP, BuffTip);
			TipManager.registerTipsParserClass(TipType.SOCIETY_SPELL_TOTAL_TIP, SocietySpellTotalTip);
			TipManager.registerTipsParserClass(TipType.MAP_AREA_TIP, MapAreaTip);
			TipManager.registerTipsParserClass(TipType.SOCIETY_BUILD_ITEM_TIP, SocietyBuildItemTip);
			TipManager.registerTipsParserClass(TipType.PK_MODE_TIP, PKModeTip);
			TipManager.registerTipsParserClass(TipType.MOUNT_TIP, MountTip);
			TipManager.registerTipsParserClass(TipType.MOUNT_BEAST_CARD_TIP, MountBeastCardTip);
			TipManager.registerTipsParserClass(TipType.MOUNT_SPELL_TIP, MountSpellTips);
			TipManager.registerTipsParserClass(TipType.NORMAL_TIP, NormalTip);
			TipManager.registerTipsParserClass(TipType.PROPCHANGE_TIP, TxtPropChangeTip);
			TipManager.registerTipsParserClass(TipType.LOSTSKILL_TIP,LostSkillTip);
			TipManager.registerTipsParserClass(TipType.SHIJIEBOSS_REWAD_TIP,ShiJieBossRewardTips);
			TipManager.registerTipsParserClass(TipType.WCZB_REWAD_TIP,WangChengRewardTips);
			TipManager.registerTipsParserClass(TipType.MERIDIAN_TIP,MeridainPointTip);

			TipManager.registerTipsParserClass(TipType.PASSIVESKILL_TIP,PassiveSpellTip);
			TipManager.registerTipsParserClass(TipType.EXTARITEM_TIP,ExtarItemTip);
			TipManager.registerTipsParserClass(TipType.CHEATS_NODE_TIP,CheatsNodePointTip);
			TipManager.registerTipsParserClass(TipType.CHEATS_TIP,CheatsTipExt);
			TipManager.registerTipsParserClass(TipType.CHEATS_INTRADUCTION_TIP,CheatsIntraductTipExt);
			TipManager.registerTipsParserClass(TipType.BLESS_TIP,BlessTip);
			TipManager.registerTipsParserClass(TipType.TEAM_NEAR_TEAM_TIP,TeamTipExt);
			TipManager.registerTipsParserClass(TipType.D1V1_TIP,D1v1TipExt);
			TipManager.registerTipsParserClass(TipType.D1V1_RANK_TIP,D1v1RankTipExt);
			TipManager.registerTipsParserClass(TipType.D1V1_RANK_REWARD_TIP,D1v1RankRewardExt);
			
			TipManager.registerTipsParserClass(TipType.ACTIVITY_JIXIAN_PANEL_TIP,JiXianPanelTip);
			TipManager.registerTipsParserClass(TipType.ACTIVITY_JIXIAN_BUFF_TIP,JiXianBuffTip);
			TipManager.registerTipsParserClass(TipType.TWOER_TIP,NineTowerTipExt);
			TipManager.registerTipsParserClass(TipType.VIP_LEVEL_TIP,VipMoTipExt);
			TipManager.registerTipsParserClass(TipType.VIP_NONE_TIP,VipNoneTipExt);
			
			TipManager.registerTipsParserClass(TipType.MEIREN_GUIZE_TIP,MeiRenGuiZeTip);
			TipManager.registerTipsParserClass(TipType.MEIREN_TIP,PetTip);
		}

		private function onSwitchCmp() : void
		{
			GameLog.addShow("进入场景完成，开始游戏...");
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			completeProcess();

            CONFIG::netDebug {
                NetDebug.LOG("[StarGame] 开始游戏");
            }
		}

		private function initMM() : void
		{
			LayerManager.addMmItem("serverSystemTime", SystemTimeManager, "sysDateTimeStr", 0xffff00, "服务器时间");
			LayerManager.addMmItem("sceneObjCnt", SceneManager.getScene().sceneRenderLayer, "renderObjCnt", 0x00ff00, "场景渲染对象数");
			LayerManager.addMmItem("sceneObjCnt", SceneManager.getScene().sceneRenderLayer, "baseObjCnt", 0x00ff00, "场景总对象数");
			LayerManager.addMmItem("SceneNumChildren", SceneManager.getScene().sceneRenderLayer, "numChildren", 0x00ff00, "场景显示对象数");
			LayerManager.addMmItem("ScenePlayerCount", SceneManager, "playerCount", 0x00ff00, "玩家数量");
			LayerManager.addMmItem("SceneMonsterCount", SceneManager, "monsterCount", 0x00ff00, "怪物数量");
			LayerManager.addMmItem("SceneOtherCount", SceneManager, "otherCount", 0x00ff00, "其它数量");
			LayerManager.addMmItem("gameTimerCnt", GameTimer, "timerCnt", 0xffff00, "GameTimer个数");
			LayerManager.addMmItem("TickCnt", Tick, "cnt", 0x00ff00, "Tick个数");
			LayerManager.addMmItem("EventsCnt", EventManager, "eventsNum", 0xffff00, "EventManager个数");
			LayerManager.addMmItem("SceneRole", SceneRole, "cnt", 0x00ff00, "SceneCharCnt");
			LayerManager.addMmItem("RenderSet", RenderSet3D, "cnt", 0x00ff00, "RenderSetCnt");
			LayerManager.addMmItem("RenderUnit", RenderUnit3D, "cnt", 0x00ff00, "RenderUnitCnt");
			LayerManager.addMmItem("PoolContainer3DCnt", PoolContainer3D, "cnt", 0x00ff00, "PoolContainer3D统计");
			LayerManager.addMmItem("actorGroundXYTips", MainRoleManager, "actorGroundXYTips", 0x00ff00, "主角地面坐标");
			LayerManager.addMmItem("sceneScale", Scene.scene.sceneCamera, "scale", 0x00ff00, "场景缩放");
            LayerManager.addMmItem("projectionHeight", Scene.scene.sceneCamera.lens, "projectionHeight", 0x00ff00, "垂直投影距离");
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
