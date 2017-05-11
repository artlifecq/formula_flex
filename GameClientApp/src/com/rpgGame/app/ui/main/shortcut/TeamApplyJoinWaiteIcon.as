package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangTeam;
	
	import org.mokylin.skin.mainui.message.Msg_Duiwu;
	
	/**
	 * 入队申请icon 
	 * @author 
	 * 
	 */	
	public class TeamApplyJoinWaiteIcon extends MessageIconBase
	{
		private var _skin:Msg_Duiwu;
		
		public function TeamApplyJoinWaiteIcon()
		{
			_skin = new Msg_Duiwu();
			super(_skin, _skin.lbNum, _skin.btnCont);
			TipTargetManager.show( this, TargetTipsMaker.makeSimpleTextTips("收到组队消息"));
		}
		
		override protected function onTouchIcon() : void
		{
			super.onTouchIcon();
			AppManager.showAppNoHide(AppConstant.SOCIAL_TEAM_ALERT,Mgr.teamMgr.getWaitNoticeData());
		}
		override protected function onCloseAll():void
		{
			super.onCloseAll();
			Mgr.teamMgr.clearAllNotice();
		}
	}
}