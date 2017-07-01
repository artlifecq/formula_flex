package com.rpgGame.app.ui.main
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.main.activityBar.ActivityBar;
	import com.rpgGame.app.ui.main.buff.BuffBar;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.app.ui.main.chat.ChatBar;
	import com.rpgGame.app.ui.main.chat.SystemMsgBar;
	import com.rpgGame.app.ui.main.head.MainRoleHeadBar;
	import com.rpgGame.app.ui.main.head.MonsterBossBar;
	import com.rpgGame.app.ui.main.head.MonsterEliteBar;
	import com.rpgGame.app.ui.main.head.MonsterNormalBar;
	import com.rpgGame.app.ui.main.head.RoleHeadBar;
	import com.rpgGame.app.ui.main.hubaozhuizong.HuBaoTracjerBar;
	import com.rpgGame.app.ui.main.navigation.NavigationBar;
	import com.rpgGame.app.ui.main.shortcut.ShortcutBar;
	import com.rpgGame.app.ui.main.shortcut.ShortcutMessageBar;
	import com.rpgGame.app.ui.main.smallmap.SmallMapBar;
	import com.rpgGame.app.ui.main.taskbar.TaskBar;
	import com.rpgGame.app.ui.main.team.TeamLeftFixedBar;
	import com.rpgGame.app.ui.main.top.ExpBar;
	import com.rpgGame.app.ui.main.top.TopBar;
	import com.rpgGame.app.ui.scene.dungeon.DungeonTrackerBar;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.events.HuBaoEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.SceneInteractiveEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangYuMaQiShou;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.display.Stage;
	import flash.geom.Point;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Stage;
	
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
		
		private const SHOW_BLOOD_TIPS:Number=0.2;
		
		// 头部
		private var _topBar : TopBar;
		private var _expBar : ExpBar;
		// 人物头像
		private var _headBar : MainRoleHeadBar;
		
		/**
		 *玩家头像 
		 */
		private var _playerHead:RoleHeadBar;
		/**
		 *怪物头像 
		 */
		private var _bossHead:MonsterBossBar;
		private var _eliteHead:MonsterEliteBar;
		private var _normalHead:MonsterNormalBar;
		
		// 小地图
		private var _smallMapBar : SmallMapBar;
		// 快捷栏
		private var _shortcutBar : ShortcutBar;
		// 导航栏
		private var _navigationBar : NavigationBar;
		// 聊天框
		private var _chatBar : ChatBar;
		//系统消息条
		private var _systemMsgBar:SystemMsgBar;
		//任务追踪栏
		private var _taskBar:TaskBar;
		//护宝追踪
		private var _hubaoTrackerBar:HuBaoTracjerBar;
		//副本追踪
		private var _trackerBar:DungeonTrackerBar;
		
		private var _teamFixedBar:TeamLeftFixedBar;
		//buff
		private var _buffBar:BuffBar;
		
		private var _lowBloodBg:UIAsset;
		
		//		/** 主工具栏 **/
		//		private var _mainBar : ShortcutBar;
		//		/** 人物头像栏 **/
		//		private var _headBar : MainRoleHeadBar;
		//		/** 当前选中的英雄头像栏 **/
		//		private var _selectRoleHeadBar : SelectRoleHeadBar;
		//		/** 小地图 **/
		//		private var _miniMapBar : MiniMapBar;
		//		/** 任务栏 **/
		//		private var _taskBar : TaskBar;
		//		/** 聊天栏 **/
		//		private var _chatBar : ChatBar;
		/** 活动栏 **/
		private var _activityBar : ActivityBar;
		//		/** 右边的进度提示 **/
		//		private var _hintBattleBar : HintBattleBar;
		//		/** 夺经、刺探、运镖追踪栏 **/
		//		private var _taskTrackPanel : TaskEventTrackPanel;
		//		/** 队伍队员列表 **/
		//		private var _teamBar : TeamBar;
		//		/** 御马场活动界面 **/
		//		private var _yuMaChangActivityBar:HurtRankPanel;
		/** cd时间 **/
		private var _cdTime : int = TIME;
		private var selectedRole:SceneRole;
		private var lowBloodTween:TweenLite;
		
		public function MainGUI()
		{
			init();
		}
		
		public function get shortcutBar():ShortcutBar
		{
			return _shortcutBar;
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
			MainButtonManager.init();
			initBar();
			FunctionOpenManager.openNoticeByLevel(MainRoleManager.actorInfo.totalStat.level);
			//isShowEventTrackPanel();
			registerEvent();
		}
		
		/**
		 * 初始化面板
		 *
		 */
		private function initBar() : void
		{
			this._topBar = new TopBar();
			_expBar=new ExpBar();
			this.addChild(this._expBar);
			_topBar.y=5;
			this.addChild(this._topBar);
			this._headBar = new MainRoleHeadBar();
			this.addChild(this._headBar);
			this._smallMapBar = new SmallMapBar();
			this.addChild(this._smallMapBar);
			this._navigationBar = new NavigationBar();
			this.addChild(this._navigationBar);
			this._shortcutBar = new ShortcutBar();
			this.addChild(this._shortcutBar);
			this._chatBar = new ChatBar();
			this.addChild(this._chatBar);
			this._systemMsgBar=new SystemMsgBar();
			this.addChild(this._systemMsgBar);
			this._taskBar=new TaskBar();
			_trackerBar=new DungeonTrackerBar();
			_hubaoTrackerBar=new HuBaoTracjerBar();
			
			
			
			_buffBar=new BuffBar();
			this.addChild(_buffBar);
			
			_playerHead=new RoleHeadBar();
			_bossHead=new MonsterBossBar();
			_eliteHead=new MonsterEliteBar();
			_normalHead=new MonsterNormalBar();
			
			_lowBloodBg=new UIAsset();
			_lowBloodBg.touchable=false;
			_lowBloodBg.styleName="ui/common/dyingeffect.png";
			
			onSwitchCmp();
			this._teamFixedBar=new TeamLeftFixedBar();
			this.addChild(_teamFixedBar);
			//			_chatBar = new ChatBar();
			//			addChild(_chatBar);
			//			
			//			_selectRoleHeadBar = new SelectRoleHeadBar();
			//			_selectRoleHeadBar.defaultParent = this;
			//			
			//			_miniMapBar = new MiniMapBar();
			//			addChild(_miniMapBar);
			//			
			//			_taskBar = new TaskBar();
			//			addChild(_taskBar);
			//			
			_activityBar = new ActivityBar();
			addChild(_activityBar);
			//			
			//			_hintBattleBar = new HintBattleBar();
			//			addChild(_hintBattleBar);
			//			
			//			_teamBar = new TeamBar();
			//			addChild(_teamBar);
			//			
			//			_headBar = new MainRoleHeadBar();
			//			addChild(_headBar);
			//			
			//			_mainBar = new ShortcutBar();
			//			addChild(_mainBar);
			//			
			//			_taskTrackPanel = new TaskEventTrackPanel();
			//			addChild(_taskTrackPanel);
			//			
			//			_yuMaChangActivityBar = new HurtRankPanel();
			//			addChild(_yuMaChangActivityBar);
			//			_yuMaChangActivityBar.hide();
		}
		
		/**
		 * 注册事件
		 *
		 */
		private function registerEvent() : void
		{
			//EventManager.addEvent(TouJingEvent.TOUJING_ACCEPT_TASK, isShowEventTrackPanel);
			//EventManager.addEvent(TouJingEvent.MIXIN_ACCEPT_TASK, isShowEventTrackPanel);
			//EventManager.addEvent(YunBiaoEvent.ACCEPT_BIAO, isShowEventTrackPanel);
			//
			//EventManager.addEvent(TouJingEvent.TOUJING_COMPLETE, isShowEventTrackPanel);
			//EventManager.addEvent(YunBiaoEvent.COMPLETED_BIAO, isShowEventTrackPanel);
			//EventManager.addEvent(YunBiaoEvent.BIAO_DISAPPER, isShowEventTrackPanel);
			//EventManager.addEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, isShowEventTrackPanel);
			//
			//EventManager.addEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, isShowEventTrackPanel);
			//EventManager.addEvent(TaskEvent.MIXIN_GIVEUP_SUCCES, updateGiveUpTask);
			AppDispather.instance.addEventListener(AppEvent.APP_LOAD_ERROR,onAppLoadError);
			
			//EventManager.addEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT, onOpenPanel);
			//EventManager.addEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel);
			//EventManager.addEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo);
			
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			
			EventManager.addEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, showHead);
			EventManager.addEvent(MainPlayerEvent.SELFHP_CHANGE,showLowBlood);
			EventManager.addEvent(HuBaoEvent.HUBAO_ZHUIZONG,onhubao);
			EventManager.addEvent(HuBaoEvent.HUBAO_HUSONGSHIBAI,onhubao);
			EventManager.addEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,onhubao);
		}
		
		//护宝
		private function onhubao(msg:*):void
		{
			onSwitchCmp();
		}
		
		private function showLowBlood():void
		{
			var value:int=MainRoleManager.actorInfo.totalStat.hp;
			var max:int=MainRoleManager.actorInfo.totalStat.life;
			var per:Number=value/max;
			if(per<=SHOW_BLOOD_TIPS&&per!=0){
				this.addChild(_lowBloodBg);
				lowBloodTween=TweenLite.to(_lowBloodBg,0.5,{alpha:0.5,onComplete:tweenLowBood});
			}else{
				this.removeChild(_lowBloodBg);
				if(lowBloodTween){
					lowBloodTween.kill();
					lowBloodTween=null;
				}
			}
			
		}
		
		private function tweenLowBood():void
		{
			if(_lowBloodBg.alpha==0.5){
				TweenLite.to(_lowBloodBg,0.5,{alpha:1,onComplete:tweenLowBood});
			}else{
				TweenLite.to(_lowBloodBg,0.5,{alpha:0.5,onComplete:tweenLowBood});
			}
		}
		
		private  function showHead(role : SceneRole) : void
		{
			if(selectedRole==role/*||role==MainRoleManager.actor*/){
				return;
			}
			
			this.removeChild(_playerHead);
			this.removeChild(_bossHead);
			this.removeChild(_eliteHead);
			this.removeChild(_normalHead);
			selectedRole=role;
			//可以选中自己
			//            if (role==MainRoleManager.actor) {
			//                // 选中自己是不显示
			//                return;
			//            }
			if(!role){
				return;
			}
			switch(role.type){
				case SceneCharType.PLAYER:
					if (EnumMapType.MAP_TYPE_D1V1==MapDataManager.currentScene.mapType) 
					{
						return;
					}
					else if (EnumMapType.MAP_TYPE_TOWERS==MapDataManager.currentScene.mapType) 
					{
						return;
					}
					this.addChild(_playerHead);
					break;
				case SceneCharType.MONSTER:
					var data:MonsterData=role.data as MonsterData;
					var bornData : Q_monster = MonsterDataManager.getData(data.modelID); 
					var type:int=bornData.q_monster_type;
					if(type== MonsterType.NORMAL){
						this.addChild(_normalHead);
					}else if(type== MonsterType.ELITE){
						this.addChild(_eliteHead);
					}else if(type== MonsterType.BOSS){
						this.addChild(_bossHead);
					}
					break;
			}
		}
		
		/**
		 * 销毁事件
		 *
		 */
		private function unregisterEvent() : void
		{
			//EventManager.removeEvent(TouJingEvent.TOUJING_ACCEPT_TASK, isShowEventTrackPanel);
			//EventManager.removeEvent(TouJingEvent.MIXIN_ACCEPT_TASK, isShowEventTrackPanel);
			//EventManager.removeEvent(YunBiaoEvent.ACCEPT_BIAO, isShowEventTrackPanel);
			
			//EventManager.removeEvent(TouJingEvent.TOUJING_COMPLETE, isShowEventTrackPanel);
			//EventManager.removeEvent(YunBiaoEvent.COMPLETED_BIAO, isShowEventTrackPanel);
			//EventManager.removeEvent(YunBiaoEvent.BIAO_DISAPPER, isShowEventTrackPanel);
			//EventManager.removeEvent(YunBiaoEvent.CHECK_ON_LOGIN_BIAO, isShowEventTrackPanel);
			//E
			//EventManager.removeEvent(TaskEvent.MIXIN_COMPLETED_SUCCES, isShowEventTrackPanel);
			//EventManager.removeEvent(TaskEvent.MIXIN_GIVEUP_SUCCES, updateGiveUpTask);
			AppDispather.instance.removeEventListener(AppEvent.APP_LOAD_ERROR,onAppLoadError);
			
			//EventManager.removeEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT, onOpenPanel);
			//EventManager.removeEvent(YuMaQiShouEvent.YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT, onClosePanel);
			//EventManager.removeEvent(RankEvent.PLUNDER_HURT_RANK_CHANGE, updateRankInfo);
			
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			EventManager.removeEvent(HuBaoEvent.HUBAO_ZHUIZONG,onhubao);
			EventManager.removeEvent(HuBaoEvent.HUBAO_HUSONGSHIBAI,onhubao);
			EventManager.removeEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,onhubao);
		}
		
		private function onAppLoadError(e:AppEvent):void
		{
			GameAlert.showAlertUtil(LangAlertInfo.onAppLoadError,null,e.appInfo.resName);
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
				//				_yuMaChangActivityBar.hide();
			}
		}
		
		/**
		 * 伤害排行榜改变 
		 * 
		 */		
		private function updateRankInfo():void
		{
			//			_yuMaChangActivityBar.show();
			//			if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			//			{
			//				_taskTrackPanel.onHide();
			//			}
			//			_taskBar.onHide();
			//			_hintBattleBar.visible = false;
		}
		
		/**
		 *  地图切换完成
		 * 
		 */		
		private function onSwitchCmp() : void
		{//L.l("地图加载完成");
			
			this.removeChild(_playerHead);
			this.removeChild(_bossHead);
			this.removeChild(_eliteHead);
			this.removeChild(_normalHead);
			
			setCurrentSceneUI();
			
			
			//			if( YuMaQiShouManager.isInBiMaWenActivity() )//在御马场场景，并且在后动时间内
			//			{
			//				_yuMaChangActivityBar.show();
			//				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			//				{
			//					_taskTrackPanel.onHide();
			//				}
			//				_taskBar.onHide();
			//				_hintBattleBar.visible = false;
			//			}
			//			else if( YuMaQiShouManager.isInYuMaChangScene() )//活动关闭了，但是还在御马场场景
			//			{
			//				_yuMaChangActivityBar.hide();
			//				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			//				{
			//					_taskTrackPanel.onHide();
			//				}
			//				_taskBar.onHide();
			//				_hintBattleBar.visible = false;
			//			}
			//			else
			//			{
			//				_yuMaChangActivityBar.hide();
			//				if (TouJingManager.hasTouJingTask() || MiXinManager.hasMixinTask() || YunBiaoManager.hasBiao) //是否偷经任务或者是密信任务
			//				{
			//					_taskTrackPanel.onShow();
			//				}
			//				_taskBar.onShow();
			//				_hintBattleBar.visible = true;
			//			}
		}
		
		/**
		 *设置当前场景特有的ui 
		 * 
		 */
		private function setCurrentSceneUI():void
		{
			var mapId:int=MainRoleManager.actorInfo.mapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
			var mapCfg:Q_map=sceneData.getData();
			
			if(HuBaoManager.instance().ishuing)
			{
				this.removeChild(_taskBar);
				this.removeChild(_trackerBar);
				this.addChild(_hubaoTrackerBar);
			}
			else if(true||mapCfg.q_map_zones==1||mapCfg.q_map_type!=EnumMapType.MAP_TYPE_NORMAL){//副本或者不是普通的基本地图
				this.removeChild(_taskBar);
				this.addChild(_trackerBar);
				this.removeChild(_hubaoTrackerBar);
			}else{
				this.addChild(_taskBar);
				this.removeChild(_trackerBar);
				this.removeChild(_hubaoTrackerBar);
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
			this._topBar.resize(sWidth, sHeight);
			this._headBar.resize(sWidth, sHeight);
			this._smallMapBar.resize(sWidth, sHeight);
			this._shortcutBar.resize(sWidth, sHeight);
			this._navigationBar.resize(sWidth, sHeight);
			this._chatBar.resize(sWidth, sHeight);
			this._expBar.resize(sWidth, sHeight);
			this._systemMsgBar.resize(sWidth, sHeight);
			this._playerHead.resize(sWidth, sHeight);
			this._taskBar.resize(sWidth, sHeight);
			this._hubaoTrackerBar.resize(sWidth, sHeight);
			/*if(_taskBar.parent){
			
			}*/
			
			this._bossHead.resize(sWidth, sHeight);
			this._eliteHead.resize(sWidth, sHeight);
			this._normalHead.resize(sWidth, sHeight);
			this._buffBar.resize(sWidth, sHeight);
			this._teamFixedBar.resize(sWidth,sHeight);
			_lowBloodBg.width=sWidth;
			_lowBloodBg.height=sHeight;
			
			//			_mainBar.resize(sWidth, sHeight);
			//			_headBar.resize(sWidth, sHeight);
			//			_selectRoleHeadBar.resize(sWidth, sHeight);
			//			_miniMapBar.resize(sWidth, sHeight);
			//			_taskBar.resize(sWidth, sHeight);
			//			_chatBar.resize(sWidth, sHeight);
			_activityBar.resize(sWidth, sHeight);
			//			_hintBattleBar.resize(sWidth, sHeight);
			//			_teamBar.resize(sWidth, sHeight);
			//			_taskTrackPanel.resize(sWidth, _taskBar.y + _taskBar.height);
			ShortcutMessageBar.instence.resize(sWidth, sHeight);
			//			_yuMaChangActivityBar.resize(sWidth, _taskBar.y);
		}
		
		public function getBtnGlobalPos(btnName : String) : Point
		{
			return _navigationBar.getBtnGlobalPos(btnName);
		}
		
		/**
		 * 显示主界面
		 *
		 */
		public function show() : void
		{
			StarlingLayerManager.mainUILayer.addChild(this);
			//isShowEventTrackPanel();
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
	}
}


