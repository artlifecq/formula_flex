package com.rpgGame.app.ui.main.shortcut
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangMount;
	
	import org.mokylin.skin.mainui.shortcut.MessageMountBreadInviteWaiteIconSkin;
	
	/**
	 * 坐骑繁育邀请icon 
	 * @author 陈鹉光
	 * 
	 */
	public class MessageMountBreadInviteWaiteIcon extends MessageIconBase
	{
		private var _skin:MessageMountBreadInviteWaiteIconSkin;
		/** 下一次邀请繁育的时间 **/
		private var _lastInviteTime:int;
		/** 定时器 **/
		private var _gTime:GameTimer;

		public function MessageMountBreadInviteWaiteIcon()
		{
			_skin = new MessageMountBreadInviteWaiteIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
			TipTargetManager.show( this, TargetTipsMaker.makeSimpleTextTips( LanguageConfig.getText( LangMount.MOUNT_TIP_62 ) ) );
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.MOUNT_BREAD_INVITE_WAITE_PANEL);
		}
		
		/**
		 * 开始计时 
		 * 
		 */		
		public function startTime():void
		{
			if( _gTime == null )
			{
				_gTime = new GameTimer("MessageMountBreadInviteWaiteIcon");
				_gTime.onUpdate = onUpdate;
			}
			
			_gTime.start();
		}
		
		/**
		 * 更新显示 
		 * 
		 */		
		private function onUpdate():void
		{
			_lastInviteTime = MountManager.getLastNextInviteTime();
			_skin.labInviteExpireTime.htmlText = LanguageConfig.getText( "邀请过期时间：$秒", _lastInviteTime );
			if( _lastInviteTime <= 0 )
			{
				_gTime.stop();
				_gTime = null;				
			}
		}
		
		public function removeTime():void
		{
			if( _gTime != null )
			{
				_gTime.stop();
				_gTime = null;				
			}
		}
	}
}