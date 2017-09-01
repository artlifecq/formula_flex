package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import feathers.controls.SkinnableContainer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.guaji.ZiDongZhanDou;
	
	import starling.display.Sprite;

	/**
	 * 自动战斗动画类
	 * */
	public class AutoBar extends Sprite
	{
		private var effectSk:Inter3DContainer;
		private var fightEffect:EffectObject3D;
		private var walkEffect:EffectObject3D;
		private var setUI:SkinnableContainer;
		public var setSkin:ZiDongZhanDou;
		public function AutoBar()
		{
			this.x=225;
			this.y =-200;
			
			init();
			addEvent();
		}
		private function init():void
		{
			effectSk=new Inter3DContainer();
			effectSk.touchable=false;
			//effectSk.x =225;
			//effectSk.y = -200;
			this.addChild(effectSk);
			setUI= new SkinnableContainer();
			setUI.x=-101;
			setUI.y=-26;
			setUI.visible=false;
			setSkin=new ZiDongZhanDou();
			setUI.skin=setSkin;
			this.addChild(setUI);
			
			fightEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_ZIDONGZHANDOU));
			walkEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_ZIDONGXUNLU));
			
			
		}
		private function addEvent():void
		{
			EventManager.addEvent(TaskEvent.AUTO_FIGHT_START,fightEffctPlay);
			EventManager.addEvent(TaskEvent.AUTO_FIGHT_STOP,fightEffctStop);
			
			EventManager.addEvent(TaskEvent.AUTO_WALK_START,taskEffctPlay);
			EventManager.addEvent(TaskEvent.AUTO_WALK_STOP,taskEffctStop);
			EventManager.addEvent(UserMoveEvent.MOVE_END,taskEffctStop);
		}
		
		public function setAutoFight():void
		{
			AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
		}
		
		public function guajiClick():void
		{
			if (TrusteeshipManager.getInstance().isAutoFightRunning)
			{
				TrusteeshipManager.getInstance().stopAutoFight();
			}
			else
			{
				TrusteeshipManager.getInstance().startAutoFight();
				AppManager.hideApp(AppConstant.SYSTEMSET_PANEL);
			}
		}
		public function fightStop():void
		{
			TrusteeshipManager.getInstance().stopAutoFight();
			fightEffctStop();
		}
		
		private function fightEffctPlay():void
		{
			taskEffctStop();
			setUI.visible=true;
			fightEffect.playEffect(0,1);
		}
		
		private function fightEffctStop():void
		{
			setUI.visible=false;
			fightEffect.stopEffect();
			/*if(TaskAutoManager.getInstance().isTaskRunning)
			{
				taskEffctPlay();
			}*/
		}
		private function taskEffctPlay():void
		{
			//setUI.visible=true;
			if(!setUI.visible)
			{
				walkEffect.playEffect(0,1);
			}
			
		}
		
		private function taskEffctStop():void
		{
			//setUI.visible=false;
			walkEffect.stopEffect();
		}
	}
}