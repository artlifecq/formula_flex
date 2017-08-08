package com.rpgGame.appModule.battle.dfdj
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.CharAttributeUpdateEvent;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.dianfeng.message.SCReadyToStartMessage;
	
	import flash.utils.getTimer;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.VS_Skin;
	
	import starling.display.DisplayObjectContainer;
	
	public class D1v1HeadPanelExt extends SkinUIPanel
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
	
		private var _otherGid:Number;
		public function D1v1HeadPanelExt()
		{
			_skin=new VS_Skin();
			super(_skin);
			_rightHpX=(_skin.skinRight.skin as Head__Role_Right).role_xuecao.x;
			_initW=(_skin.skinRight.skin as Head__Role_Right).role_xuecao.width;
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
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
			//两分钟
			_endTime=getTimer()+2*60*1000;
			var str:String=TextUtil.SecondToHMS2(2*60).replace(/ :/g,"x");
			_skin.uiTime.label=str;
			
			var msg:SCReadyToStartMessage=data;
			//左边
			var skinL:Head_Role_Left=_skin.skinLeft.skin as Head_Role_Left;
			skinL.lbName.text=MainRoleManager.actorInfo.name;
			skinL.numZhandouli.label=MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.FIGHTING)+"";
			skinL.role_xuecao.scaleX=1;
			_leftHpImg=skinL.role_xuecao;
			if (_leftHeadIcon==null) 
			{
				_leftHeadIcon=new UIAsset();
				_leftHeadIcon.x=23;
				_leftHeadIcon.y=10;
				skinL.container.addChild(_leftHeadIcon);
			}
			_leftHeadIcon.styleName=AssetUrl.getRoleHeadUrl(MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex,"middle");
			var skinR:Head__Role_Right=_skin.skinRight.skin as Head__Role_Right;
			if (_rightHeadIcon==null) 
			{
				_rightHeadIcon=new UIAsset();
				_rightHeadIcon.x=255;
				_rightHeadIcon.y=10;
				
				skinR.container.addChild(_rightHeadIcon);
			}
			_rightHpImg=skinR.role_xuecao;
			skinR.lbName.text=msg.enemyName;
			skinR.numZhandouli.label=msg.enemyFightPower+"";
			skinR.role_xuecao.scaleX=1;
			skinR.role_xuecao.x=_rightHpX;
			_rightHeadIcon.styleName=AssetUrl.getRoleHeadUrl(msg.enemyJob,msg.enemySex,"middle");
			_rightHeadIcon.scaleX=-1;
			_otherGid=msg.enemyPlayerId.ToGID();
			CharAttributeManager.addEvent(MainRoleManager.actorInfo.id,CharAttributeType.HP,myHpChange);
			CharAttributeManager.addEvent(_otherGid,CharAttributeType.HP,otherHpChange);
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
			updateMyHp(MainRoleManager.actorInfo.totalStat.hp/MainRoleManager.actorInfo.totalStat.life);
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
			EventManager.addEvent(D1v1Event.ACTIVITY_FIGHT_START,onFightStart);
			
		}
		
		private function onFightStart():void
		{
			// TODO Auto Generated method stub
			if (!_timer) 
			{
				_timer=new GameTimer("D1v1HeadPanelExt");
				_timer.onUpdate=onTimer;
			}
			_timer.start();
			onTimer();
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(D1v1Event.ACTIVITY_FIGHT_START,onFightStart);
			CharAttributeManager.removeEvent(MainRoleManager.actorInfo.id,CharAttributeType.HP,myHpChange);
			CharAttributeManager.removeEvent(_otherGid,CharAttributeType.HP,otherHpChange);
			_otherGid=0;
			if (_timer) 
			{
				_timer.stop();
				_timer.destroy();
				_timer=null;
			}
		}
	}
}