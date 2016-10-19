package com.rpgGame.app.ui.main.activityBar
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.DaTiManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import org.client.mainCore.utils.Tick;
	import org.mokylin.skin.app.daTi.DaTiIconSkin;
	
	import starling.display.DisplayObject;
	
	
	/**
	 * @author Guodong.Zhang
	 * 创建时间：2016-6-23 下午3:29:43
	 * 答题活动图标
	 */
	public class DaTiIcon extends SkinUI
	{
		private var _customSkin:DaTiIconSkin;
		private var _effect:InterObject3D;
		
		public function DaTiIcon()
		{
			_customSkin = new DaTiIconSkin()
			super(_customSkin);
		}
		
		public function onShow():void
		{
			if(_effect == null)
			{
				_effect = playInter3DAt( ClientConfig.getEffect( EffectUrl.ACTIVITY_ICON_EFFECT ), 30, 30, 0 );
			}
			addChild3D( _effect );
			Tick.addCallback(tick);
			tick();
			TipTargetManager.show(this,TargetTipsMaker.makeSimpleTextTips("点击图标参加竞赛\n参与答题获取丰厚经验奖励"));
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _customSkin.icon:
					AppManager.showAppNoHide(AppConstant.DA_TI_PANEL);
					break;
			}
		}
		
		public function onHide():void
		{
			if(_effect)
			{
				removeChild3D(_effect);
			}
			Tick.removeCallback(tick);
			TipTargetManager.remove(this);
		}
		
		private function tick(...args):void
		{
			var currentTime:Number = SystemTimeManager.curtTm; 
			if(currentTime >= DaTiManager.endTime)
			{
				DaTiManager.hideIcon();
			}
			else
			{
				var remainTime:Number = DaTiManager.startTime - currentTime;
				if(remainTime >= 0)
				{
					_customSkin.lbDesc.text = TimeUtil.formatTimeToTimeString(remainTime/1000) + "后开始";
				}
				else if(_customSkin.lbDesc.text != "进行中")
				{
					_customSkin.lbDesc.text = "进行中";
				}
			}
		}
	}
}