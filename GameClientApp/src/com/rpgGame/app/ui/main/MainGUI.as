package com.rpgGame.app.ui.main
{
	import com.rpgGame.app.manager.YuMaQiShouManager;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.main.activityBar.ActivityBar;
	import com.rpgGame.app.ui.main.chat.ChatBar;
	import com.rpgGame.app.ui.main.head.PlayerHeadBar;
	import com.rpgGame.app.ui.main.head.SelectRoleHeadBar;
	import com.rpgGame.app.ui.main.hintBattleBar.HintBattleBar;
	import com.rpgGame.app.ui.main.miniMap.MiniMapBar;
	import com.rpgGame.app.ui.main.rank.HurtRankPanel;
	import com.rpgGame.app.ui.main.shortcut.ShortcutBar;
	import com.rpgGame.app.ui.main.shortcut.ShortcutMessageBar;
	import com.rpgGame.app.ui.main.task.TaskBar;
	import com.rpgGame.app.ui.main.task.TaskEventTrackPanel;
	import com.rpgGame.app.cmdlistener.enum.EmEvenTrackType;
	import com.rpgGame.app.ui.main.team.TeamBar;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.app.AppInfo;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.RankEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.YuMaQiShouEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangYuMaQiShou;
	
	import flash.display.Stage;
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	
	import utils.TimerServer;
	
	/**
	 * 主界面
	 * @author wewell
	 *
	 */
	public class MainGUI extends starling.display.Sprite
	{
		private var nativeStage : flash.display.Stage;
		private var starlingStage : starling.display.Stage;
		/** 秒 **/
		private static const TIME:int = int( LanguageConfig.getText( LangYuMaQiShou.TIME ) );
		/** 主工具栏 **/
		private var _mainBar : ShortcutBar;
		/** 人物头像栏 **/
		private var _headBar : PlayerHeadBar;
		/** 当前选中的英雄头像栏 **/
		private var _selectRoleHeadBar : SelectRoleHeadBar;
		/** 小地图 **/
		private var _miniMapBar : MiniMapBar;
		/** 任务栏 **/
		private var _taskBar : TaskBar;
		/** 聊天栏 **/
		private var _chatBar : ChatBar;
		/** 活动栏 **/
		private var _activityBar : ActivityBar;
		/** 右边的进度提示 **/
		private var _hintBattleBar : HintBattleBar;
		/** 夺经、刺探、运镖追踪栏 **/
		private var _taskTrackPanel : TaskEventTrackPanel;
		/** 队伍队员列表 **/
		private var _teamBar : TeamBar;
		/** 御马场活动界面 **/
		private var _yuMaChangActivityBar:HurtRankPanel;
		/** cd时间 **/
		private var _cdTime : int = TIME;
		
		public function MainGUI()
		{
			init();
		}
		
		/**
		 * 初始化
		 *
		 */
		private function init() : void
		{
			nativeStage = Starling.current.nativeStage;
			nativeStage.addEventListener(Event.RESIZE, onStageResize);
			starlingStage = Starling.current.stage;
			
			initBar();
			isShowEventTrackPanel();
			registerEvent();
		}
		
		/**
		 * 初始化面板
		 *
		 */
		private function initBar() : void
		{
			_chatBar = new ChatBar();
			addChild(_chatBar);
			
			_selectRoleHeadBar = new SelectRoleHeadBar();
			_selectRoleHeadBar.defaultParent = this;
			
			_miniMapBar = new MiniMapBar();
			addChild(_miniMapBar);
			
			_taskBar = new TaskBar();
			addChild(_taskBar);
			
			_activityBar = new ActivityBar();
			addChild(_activityBar);
			
			_hintBattleBar = new HintBattleBar();
			addChild(_hintBattleBar);
			
			_teamBar = new TeamBar();
			addChild(_teamBar);
			
			_headBar = new PlayerHeadBar();
			addChild(_headBar);
			
			_mainBar = new ShortcutBar();
			addChild(_mainBar);
			
			_taskTrackPanel = new TaskEventTrackPanel();
			addChild(_taskTrackPanel);
			
			_yuMaChangActivityBar = new HurtRankPanel();
			addChild(_yuMaChangActivityBar);
			_yuMaChangActivityBar.hide();
		}
		
		/**
		 * 注册事件
		 *
		 */
		private function registerEvent() : void
		{
			EventManager.addEvent(TouJingEvent.TOUJING_ACCEPT_TASK, isShowEventTrackPanel);
			EventManager.addEvent(TouJingEvent.MIXIN_ACCEPT_TASK, isShowEventTrackPanel);
			EventManager.addEvent(YunBiaoEvent.ACCEPT_BIAO, isShowEventTrackPanel);
			
			EventManager.addEvent(TouJingEvent.TOUJING_COMPLETE, isShowEventTrackPanel);
			EventManager.addEvent(YunBiaoEvent.COMPLETED_BIAO, isShowEventTrackPanel);
			EventManager.addEvent(YunBiaoEvent.BIAO_DISAPPER, isShowEventTrackPanel);
			EventManager.addEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, isShowEventTrackPanel);
			
			EventManager.addEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, isShowEventTrackPanel);
			EventManager.addEvent(TaskEvent.MIXIN_GIVEUP_SUCCES, updateGiveUpTask);
			AppDispather.instance.addEventListener(AppEvent.APP_LOAD_ERROR,onAppLoadError);
			
			EventManager.addEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT, onOpenPanel);
			EventManager.addEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel);
			EventManager.addEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo);
			
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}
		
		/**
		 * 销毁事件
		 *
		 */
		private function unregisterEvent() : void
		{
			EventManager.removeEvent(TouJingEvent.TOUJING_ACCEPT_TASK, isShowEventTrackPanel);
			EventManager.removeEvent(TouJingEvent.MIXIN_ACCEPT_TASK, isShowEventTrackPanel);
			EventManager.removeEvent(YunBiaoEvent.ACCEPT_BIAO, isShowEventTrackPanel);
			
			EventManager.removeEvent(TouJingEvent.TOUJING_COMPLETE, isShowEventTrackPanel);
			EventManager.removeEvent(YunBiaoEvent.COMPLETED_BIAO, isShowEventTrackPanel);
			EventManager.removeEvent(YunBiaoEvent.BIAO_DISAPPER, isShowEventTrackPanel);
			EventManager.removeEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, isShowEventTrackPanel);
			
			EventManager.removeEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, isShowEventTrackPanel);
			EventManager.removeEvent(TaskEvent.MIXIN_GIVEUP_SUCCES, updateGiveUpTask);
			AppDispather.instance.removeEventListener(AppEvent.APP_LOAD_ERROR,onAppLoadError);
			
			EventManager.removeEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT, onOpenPanel);
			EventManager.removeEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel);
			EventManager.removeEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo);
			
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}
		
		private function onAppLoadError(appInfo:AppInfo):void
		{
			GameAlert.showAlertUtil(LangAlertInfo.onAppLoadError,null,appInfo.resName);
		}
		
		/**
		 * 放弃密信任务 追踪栏更新显示
		 *
		 */
		private function updateGiveUpTask(type : int = 0) : void
		{
			var arr : Array = [];
			//是否有偷经任务
			if (TouJingManager.hasTouJingTask())
			{
				arr.push(EmEvenTrackType.TOU_JING);
			}
			
			//是否有运镖任务
			if (YunBiaoManager.hasBiao)
			{
				arr.push(EmEvenTrackType.YUN_BIAO);
			}
			
			if (arr.length <= 0)
			{
				_taskTrackPanel.onHide();
			}
		}
		
		/**
		 * 追踪任务面板显示还是隐藏
		 *
		 */
		private function isShowEventTrackPanel(id : int = 0) : void
		{
			if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			{
				_taskTrackPanel.onShow();
			}
			else
			{
				_taskTrackPanel.onHide();
			}
		}
		
		
		/**
		 * 御马场活动开启、或关闭 
		 * @param isBool
		 * 
		 */		
		private function onOpenPanel():void
		{
			if( YuMaQiShouManager.isInBiMaWenActivity() )//在御马场场景，并且在后动时间内
			{
				_yuMaChangActivityBar.show();
				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
				{
					_taskTrackPanel.onHide();
				}
				_taskBar.onHide();
				_hintBattleBar.visible = false;
			}
			else
			{
				_yuMaChangActivityBar.hide();
				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
				{
					_taskTrackPanel.onShow();
				}
				_taskBar.onShow();
				_hintBattleBar.visible = true;
			}
		}
		
		/**
		 * 御马场活动结束倒计时 
		 * 
		 */		
		private function onClosePanel():void
		{
			TimerServer.addLoop( updateTime, 1000 );
		}
		
		/**
		 * 倒计时更新 
		 * 
		 */		
		private function updateTime():void
		{
			_cdTime --;
			if ( _cdTime <= 0 )
			{
				TimerServer.remove(updateTime);
				_cdTime = TIME;
				_yuMaChangActivityBar.hide();
			}
		}
		
		/**
		 * 伤害排行榜改变 
		 * 
		 */		
		private function updateRankInfo():void
		{
			_yuMaChangActivityBar.show();
			if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			{
				_taskTrackPanel.onHide();
			}
			_taskBar.onHide();
			_hintBattleBar.visible = false;
		}
		
		/**
		 *  地图切换完成
		 * 
		 */		
		private function onSwitchCmp() : void
		{
			if( YuMaQiShouManager.isInBiMaWenActivity() )//在御马场场景，并且在后动时间内
			{
				_yuMaChangActivityBar.show();
				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
				{
					_taskTrackPanel.onHide();
				}
				_taskBar.onHide();
				_hintBattleBar.visible = false;
			}
			else if( YuMaQiShouManager.isInYuMaChangScene() )//活动关闭了，但是还在御马场场景
			{
				_yuMaChangActivityBar.hide();
				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
				{
					_taskTrackPanel.onHide();
				}
				_taskBar.onHide();
				_hintBattleBar.visible = false;
			}
			else
			{
				_yuMaChangActivityBar.hide();
				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
				{
					_taskTrackPanel.onShow();
				}
				_taskBar.onShow();
				_hintBattleBar.visible = true;
			}
		}
		
		private function onStageResize(e : *) : void
		{
			nativeStage.addEventListener(Event.ENTER_FRAME, __onResize);
		}
		
		private function __onResize(e : *) : void
		{
			if (nativeStage.stageWidth == starlingStage.stageWidth && nativeStage.stageHeight == starlingStage.stageHeight)
			{
				nativeStage.removeEventListener(Event.ENTER_FRAME, __onResize);
			}
			
			resize(starlingStage.stageWidth, starlingStage.stageHeight);
		}
		
		private function resize(sWidth : int, sHeight : int) : void
		{
			_mainBar.resize(sWidth, sHeight);
			_headBar.resize(sWidth, sHeight);
			_selectRoleHeadBar.resize(sWidth, sHeight);
			_miniMapBar.resize(sWidth, sHeight);
			_taskBar.resize(sWidth, sHeight);
			_chatBar.resize(sWidth, sHeight);
			_activityBar.resize(sWidth, sHeight);
			_hintBattleBar.resize(sWidth, sHeight);
			_teamBar.resize(sWidth, sHeight);
			_taskTrackPanel.resize(sWidth, _taskBar.y + _taskBar.height);
			ShortcutMessageBar.instence.resize(sWidth, sHeight);
			_yuMaChangActivityBar.resize(sWidth, _taskBar.y);
		}
		
		public function getBtnGlobalPos(btnName : String) : Point
		{
			return _mainBar.getBtnGlobalPos(btnName);
		}
		
		/**
		 * 显示主界面
		 *
		 */
		public function show() : void
		{
			StarlingLayerManager.mainUILayer.addChild(this);
			isShowEventTrackPanel();
			registerEvent();
			resize(starlingStage.stageWidth, starlingStage.stageHeight);
		}
		
		/**
		 * 隐藏
		 *
		 */
		public function hide() : void
		{
			unregisterEvent();
			if (this.parent)
				this.parent.removeChild(this);
		}
		
		public function showTaskBar() : void
		{
			_taskBar.visible = true;
		}
		
		public function hideTaskBar() : void
		{
			_taskBar.visible = false;
		}
	}
}


