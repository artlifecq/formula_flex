package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangTeam;
	
	import org.mokylin.skin.mainui.shortcut.MessageTeamInviteWaiteIconSkin;
	
	/**
	 * 组队邀请icon 
	 * @author 陈鹉光
	 * 
	 */	
	public class TeamInviteWaiteIcon extends MessageIconBase
	{
		private var _skin:MessageTeamInviteWaiteIconSkin;
		
		public function TeamInviteWaiteIcon()
		{
			_skin = new MessageTeamInviteWaiteIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
			TipTargetManager.show( this, TargetTipsMaker.makeSimpleTextTips( LanguageConfig.getText( LangTeam.TEAM_TIP_2 ) ) );
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.TEAM_INVITE_WAITE_PANEL);
		}
		
	}
}