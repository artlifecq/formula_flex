package com.rpgGame.app.ui.main.smallmap 
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.utils.SystemSetUtil;
	import com.rpgGame.app.view.uiComponent.menu.ShieldingMenu;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GameSettingEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.SystemTimeEvent;
	import com.rpgGame.core.manager.sound.SimpleMp3Player;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.role.MonsterBornData;
	import com.rpgGame.netData.login.message.ResHeartMessage;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.map.map_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Shape;
	
	public class SmallMapBar extends SkinUI {
		private static const MAXMAPSCALE : Number = 1;
		private static const MINMAPSCALE : Number = 0.3;
		private static const STEPMAPSCALE : Number = 0.10;
		private var _skin : map_Skin;
		
		private var _initBgX : int;
		
		private var _gapDecX : int;
		private var _gapIncX : int;
		private var _gapMX : int;
		private var _gapWX : int;
		
		private var _tween : TweenLite;
		
		private var _smallMap : SmallMap;
		
		private var _timer : GameTimer;
		
		private var _mapScale : Number = 0.3;
		private var isPlay:Boolean;
		
		public function SmallMapBar() {
			this._skin = new map_Skin();
			super(this._skin);
			isPlay=true;
			this._initBgX = this._skin.grp_cont.x;
			
			//			this._gapDecX = this._skin.btnDecrease.x - this._skin.grp_cont.x;
			//			this._gapIncX = this._skin.btnIncrease.x - this._skin.grp_cont.x;
			//			this._gapMX = this._skin.btnM.x - this._skin.grp_cont.x;
			//			this._gapWX = this._skin.btnWord.x - this._skin.grp_cont.x;
			
			this.initSmallMap();
			this.setState(true);
			this.startTimer();			
			
			EventManager.addEvent(SystemTimeEvent.SEVER_TIMR,updateTime);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, this.onMapSwitchCompleteHandler);
			
//			EventManager.addEvent(GameSettingEvent.SOUND_MUTE_ONE, sound_mute_one);
//			sound_mute_one();
		}
		
		public function resize(w : int, h : int) : void {
			this.y = 7;
			this.x = w - this._skin.width;
		}
		
		override protected function onShow():void {
			super.onShow();
			this.showSmallMap();
			this._smallMap.openRoad();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			this._smallMap.closeRoad();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void {
			
			switch (target) {
				case this._skin.btnClose:
					this.setState(false);
					break;
				case this._skin.btnOpen:
					this.setState(true);
					break;
				case this._skin.btnSMax:
					this.setMapScale(true);
					break;
				case this._skin.btnSMin:
					this.setMapScale(false);
					break;
				case this._skin.btnMap://打开大地图世当前地图
					AppManager.showApp(AppConstant.BIGMAP_PANEL);
					break;
				case this._skin.btnMail://打开邮件
					AppManager.showApp(AppConstant.MAIL_PANEL);
					break;
				case this._skin.btnSet://打开设置
					AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
					break;
				case this._skin.btnSound://打开声音
					setAllMute(!(SimpleMp3Player.openSound));
//					ClientSettingGameSetMananger.saveMainToServer();
					break;
				case this._skin.btnPaiHang://打开排行榜
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_FIGHTFLAGRANK);
					break;
				case this._skin.btnGm://GM
					//					AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
					break;
				case this._skin.btnHide://屏蔽场景
					var menus : Array = SystemSetUtil.getShieldingMenu();
					ShieldingMenu.GetInstance().show(menus,-1,-1,80);
					break;
				case this._skin.btnWeb://打开官网
					AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
					break;
				case this._skin.btnSelect://换线
					menus = MenuUtil.getsystemChangeLine();
					MenuManager.showMenu(menus,null, -1, -1, 80);
					break;
			}
		}
		
		public function setAllMute(isMute:Boolean):void
		{
			SimpleMp3Player.openSound=isMute;
			EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ALL);
		}
		
//		private function sound_mute_one():void
//		{
//			if (BGMManager.isMuteAll)
//			{
//				miniSkin.btnShengYin.styleClass = ButtonShengyinMute;
//			}
//			else
//			{
//				miniSkin.btnShengYin.styleClass = ButtonShengyin;
//			}
//		}
		
		// event
		private function onMapSwitchCompleteHandler() : void {
			this.showSmallMap();
		}
		
		public function updateTime(msg:ResHeartMessage):void
		{
			var date:Date = new Date(msg.time.fValue);
			var hour:String=date.hours>9?date.hours.toString():"0"+date.hours;
			var fen:String=date.minutes>9?date.minutes.toString():"0"+date.minutes;
			_skin.lbTime.text=hour+":"+fen;
			
			//显示延迟格
			//			var delay:Number=msg.time.fValue-SystemTimeManager.delayTiemByServer;
			//			if(delay<=100) _skin.UI_net.styleName = "ui/mainui/top/signal00.png";
			//			else if(delay>100&&delay<=200) _skin.UI_net.styleName = "ui/mainui/top/signal01.png";
			//			else _skin.UI_net.styleName = "ui/mainui/top/signal02.png";
		}
		
		private var _offsetValue:int=30;
		private function initSmallMap() : void {
			var mask : Shape = new Shape();
			mask.graphics.beginFill(0x00FF00);
			mask.graphics.drawCircle(0, 0, (this._skin.UIMap.width+50)/2);//, this._skin.UIMap.height, 5);
			mask.graphics.endFill();
			mask.x = this._skin.UIMap.x+this._skin.UIMap.width/2;
			mask.y = this._skin.UIMap.y+this._skin.UIMap.height/2;
			this._skin.grp_cont.addChildAt(mask, this._skin.grp_cont.getChildIndex(this._skin.UIMap) + 1);
			
			this._smallMap = new SmallMap(this, SmallMap.RadarMap, (this._skin.UIMap.width+60), (this._skin.UIMap.height+60), this._mapScale);
			this._smallMap.x = this._skin.UIMap.x;
			this._smallMap.y = this._skin.UIMap.y;
			this._skin.grp_cont.addChildAt(this._smallMap, this._skin.grp_cont.getChildIndex(this._skin.UIMap) + 1);
			this._smallMap.x=this._smallMap.x-_offsetValue;
			this._smallMap.y=this._smallMap.y-_offsetValue;
			this._smallMap.mask = mask;
			
			//			this._skin.lbLocation.width=110;
			this._skin.lbLocation.wordWrap=false;
		}
		
		private function setState(isOpen : Boolean) : void {
			if (this._tween) {
				this._tween.kill();
			}
			var targetX : int = isOpen ? this._initBgX : this._skin.width + this._initBgX;
			this._tween = TweenLite.to(this._skin.grp_cont, 0.5, {x : targetX});
			this._skin.btnClose.visible = isOpen;
			this._skin.btnOpen.visible = !isOpen;
		}
		
		private function setMapScale(add : Boolean) : void {
			this._mapScale += STEPMAPSCALE * (add ? 1 : -1);
			if (this._mapScale < MINMAPSCALE) {
				this._mapScale = MINMAPSCALE;
			} else if (this._mapScale > MAXMAPSCALE) {
				this._mapScale = MAXMAPSCALE;
			}
			this._smallMap.mapScale = this._mapScale;
		}
		
		private function showSmallMap() : void {
			var sceneData : SceneData = MapDataManager.currentScene;
			if (null == sceneData) {
				return;
			}
			this._smallMap.showMap(sceneData.sceneId);
			//			this._smallMap.openRoad();
			var npcs : Vector.<MonsterBornData> = NpcCfgData.getSceneNpcDatas(sceneData.sceneId);
			var monsters : Array = MonsterDataManager.getSceneMonsterDatas(sceneData.sceneId);
			var transports : Array = TransCfgData.getSceneTransportDatas(sceneData.sceneId);
			this._smallMap.updataData(monsters, transports, npcs);
		}
		
		private function startTimer() : void {
			this._timer = new GameTimer("SmallMapBar", 500);
			this._timer.onUpdate = this.timerUpdate;
			this._timer.start();
		}
		
		private function timerUpdate() : void {
			if (MapDataManager.currentScene) {
				this._skin.lbName.text = MapDataManager.currentScene.name;
				this._skin.lbLocation.text = "(" + int(MainRoleManager.actor.position.x) + "," + Math.abs(int(MainRoleManager.actor.position.z)) + ")";
			}
			//this._smallMap.timerUpdate();
		}
	}
}
