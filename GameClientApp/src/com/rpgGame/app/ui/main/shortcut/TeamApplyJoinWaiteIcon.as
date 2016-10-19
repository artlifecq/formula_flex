package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangTeam;
	
	import org.mokylin.skin.mainui.shortcut.MessageTeamApplyJoinWaiteIconSkin;
	
	/**
	 * 入队申请icon 
	 * @author 
	 * 
	 */	
	public class TeamApplyJoinWaiteIcon extends MessageIconBase
	{
		private var _skin:MessageTeamApplyJoinWaiteIconSkin;
		
		public function TeamApplyJoinWaiteIcon()
		{
			_skin = new MessageTeamApplyJoinWaiteIconSkin();
			super(_skin, _skin.numTxt, _skin.btn);
			TipTargetManager.show( this, TargetTipsMaker.makeSimpleTextTips( LanguageConfig.getText( LangTeam.TEAM_TIP_1 ) ));
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.TEAM_APPLY_JOIN_WAITE_PANEL);
		}
		
	}
}