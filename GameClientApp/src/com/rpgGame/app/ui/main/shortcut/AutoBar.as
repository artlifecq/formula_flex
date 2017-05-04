package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import feathers.controls.SkinnableContainer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.mainui.guaji.GuaJi_Skin;
	import org.mokylin.skin.mainui.guaji.ZiDongZhanDou;
	import org.mokylin.skin.mainui.guaji.button.ButtonClose;
	import org.mokylin.skin.mainui.guaji.button.ButtonShezhi;
	import org.mokylin.skin.mainui.tishi.Sing_TipsSkin;
	
	import starling.core.Starling;
	import starling.display.Sprite;

	/**
	 * 自动战斗动画类
	 * 
	 * */
	public class AutoBar extends Sprite
	{
		private var effectSk:Inter3DContainer;
		private var fightEffect:EffectObject3D;
		private var walkEffect:EffectObject3D;
		private var setUI:SkinnableContainer;
		public var setSkin:ZiDongZhanDou;
		private var guajiUI:SkinnableContainer;
		public var guajiSkin:GuaJi_Skin;
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
			
			guajiUI= new SkinnableContainer();
			guajiUI.x=-435;
			guajiUI.y=220;
			guajiUI.visible=true;
			guajiSkin=new GuaJi_Skin();
			guajiUI.skin=guajiSkin;
			this.addChild(guajiUI);
			
			
			fightEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_ZIDONGZHANDOU));
			walkEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_ZIDONGXUNLU));
			
			/*var rreffectSk1:Inter3DContainer=new Inter3DContainer();
			rreffectSk1.x=0;
			var readyEffect1:EffectObject3D=rreffectSk1.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
			this.addChild(rreffectSk1);
			
			
			var rreffectSk2:Inter3DContainer=new Inter3DContainer();
			rreffectSk2.x=100;
			var readyEffect2:EffectObject3D=rreffectSk2.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
			this.addChild(rreffectSk2);
			
			
			
			var rreffectSk3:Inter3DContainer=new Inter3DContainer();
			rreffectSk3.x=200;
			var readyEffect3:EffectObject3D=rreffectSk3.addInter3D(ClientConfig.getEffect(EffectUrl.UI_JINENGKUANG_BJ));
			this.addChild(rreffectSk3);
			
			
			
			setTimeout(function(){
				readyEffect1.playEffect(0,0.05);
				readyEffect2.playEffect(0,0.03);
				readyEffect3.playEffect(0,0.01);
			},2000);*/
		}
		private function addEvent():void
		{
			EventManager.addEvent(TaskEvent.AUTO_FIGHT_START,effctPlay);
			EventManager.addEvent(TaskEvent.AUTO_FIGHT_STOP,effctStop);
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
			effctStop();
		}
		
		private function effctPlay():void
		{
			setUI.visible=true;
			fightEffect.playEffect(0,1);
		}
		
		private function effctStop():void
		{
			setUI.visible=false;
			fightEffect.stopEffect();
		}
		
	}
}