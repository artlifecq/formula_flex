package  com.rpgGame.appModule.battle.jjzb
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.CharAttributeUpdateEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.zhengba.message.SCJJReadyToStartMessage;
	
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.VS_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class JJBattleHeadPanelExt extends SkinUIPanel
	{
		private var _skin:VS_Skin;
		private var _timer:GameTimer;
		private var _endTime:int;
		private var _leftHeadIcon:UIAsset;
		private var _rightHeadIcon:UIAsset;
		private var _rightHpX:int;
		private var _initW:int;
		private var _leftHpImg:UIAsset;
		private var _rightHpImg:UIAsset;
		private var _leftGid:Number;
		private var _otherGid:Number;
		private var _delay:int;
		public function JJBattleHeadPanelExt()
		{
			_skin=new VS_Skin();
			super(_skin);
			_rightHpX=(_skin.skinRight.skin as Head__Role_Right).role_xuecao.x;
			_initW=(_skin.skinRight.skin as Head__Role_Right).role_xuecao.width;
			MCUtil.removeSelf(_skin.uiTime);
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>=0) 
			{
				var str:String=TextUtil.SecondToHMS2(left).replace(/ :/g,"x");
				_skin.uiTime.label=str;
			}
			else
			{
				_timer.stop();
			}
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
	
			var str:String=TextUtil.SecondToHMS2(2*60).replace(/ :/g,"x");
			_skin.uiTime.label=str;
			
			var msg:SCJJReadyToStartMessage=data;
			//左边
			var skinL:Head_Role_Left=_skin.skinLeft.skin as Head_Role_Left;
			skinL.lbName.text=msg.jJPlayerInfo_1.enemyName;
			skinL.numZhandouli.label=msg.jJPlayerInfo_1.enemyFightPower+"";
			skinL.role_xuecao.scaleX=1;
			_leftHpImg=skinL.role_xuecao;
			if (_leftHeadIcon==null) 
			{
				_leftHeadIcon=new UIAsset();
				_leftHeadIcon.x=23;
				_leftHeadIcon.y=10;
				skinL.container.addChild(_leftHeadIcon);
			}
			_leftHeadIcon.styleName=AssetUrl.getRoleHeadUrl(msg.jJPlayerInfo_1.enemyJob,msg.jJPlayerInfo_1.enemySex,"middle");
			var skinR:Head__Role_Right=_skin.skinRight.skin as Head__Role_Right;
			if (_rightHeadIcon==null) 
			{
				_rightHeadIcon=new UIAsset();
				_rightHeadIcon.x=318;
				_rightHeadIcon.y=10;
				
				skinR.container.addChild(_rightHeadIcon);
			}
			_rightHpImg=skinR.role_xuecao;
			skinR.lbName.text=msg.jJPlayerInfo_2.enemyName;
			skinR.numZhandouli.label=msg.jJPlayerInfo_2.enemyFightPower+"";
			skinR.role_xuecao.scaleX=1;
			skinR.role_xuecao.x=_rightHpX;
			_rightHeadIcon.styleName=AssetUrl.getRoleHeadUrl(msg.jJPlayerInfo_2.enemyJob,msg.jJPlayerInfo_2.enemySex,"middle");
			_rightHeadIcon.scaleX=-1;
			_otherGid=msg.jJPlayerInfo_2.enemyPlayerId;
			_leftGid=msg.jJPlayerInfo_1.enemyPlayerId;
			CharAttributeManager.addEvent(_leftGid,CharAttributeType.HP,myHpChange);
			CharAttributeManager.addEvent(_otherGid,CharAttributeType.HP,otherHpChange);
			_delay=setTimeout(onFightStart,msg.delayTime*1000);
			//onFightStart();
		}
		
		private function otherHpChange(eve:CharAttributeUpdateEvent):void
		{
			// TODO Auto Generated method stub
			var role : SceneRole = SceneManager.getSceneObjByID(eve.charID) as SceneRole;
			if (!role)
				return;
			var roleData : RoleData = role.data as RoleData;
			updateOtherHp(roleData.totalStat.hp/roleData.totalStat.life);
		}
		
		private function myHpChange(eve:CharAttributeUpdateEvent):void
		{
			// TODO Auto Generated method stub
			var role : SceneRole = SceneManager.getSceneObjByID(eve.charID) as SceneRole;
			if (!role)
				return;
			var roleData : RoleData = role.data as RoleData;
			updateMyHp(roleData.totalStat.hp/roleData.totalStat.life);
		}
		private function updateMyHp(per:Number):void
		{
			_leftHpImg.scaleX=per;
		}
		private function updateOtherHp(per:Number):void
		{
			_rightHpImg.scaleX=per;
			_rightHpImg.x=_rightHpX+_initW*(1-per);
		}

		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x=(sw-this.width)*0.5;
			this.y=0;
		}
		override protected function onShow():void
		{
			super.onShow();
			
			
		}
		
		private function onFightStart():void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_JJBT_OVER_PANEL);
			return;
			if (!_timer) 
			{
				_timer=new GameTimer("JJBattleHeadPanelExt");
				_timer.onUpdate=onTimer;
			}
			//两分钟
			_endTime=getTimer()+2*60*1000;
			_timer.start();
			onTimer();
		}
		override protected function onHide():void
		{
			super.onHide();
			CharAttributeManager.removeEvent(_leftGid,CharAttributeType.HP,myHpChange);
			CharAttributeManager.removeEvent(_otherGid,CharAttributeType.HP,otherHpChange);
			_otherGid=0;
			_leftGid=0;
			if (_timer) 
			{
				_timer.stop();
				_timer.destroy();
				_timer=null;
			}
			if (0!=_delay) 
			{
				clearTimeout(_delay);
				_delay=0;
			}
			
		}
	}
}