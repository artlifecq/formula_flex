package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.ui.alert.FangChenMiPanelExt;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.FangChenMiEnum;
	import com.rpgGame.coreData.lang.LangCHENGMI_TEXT;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.netData.player.message.SCNonagePromptMessage;
	
	/**
	 *
	 * 防沉迷管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-31 下午3:05:12
	 *
	 */
	public class FangChenMiManager
	{
		private static var _isInChenMi : Boolean = false;
		
		private static var _fangChenMiInfoTimer : GameTimer = null;
		
		private static var _fangchenmiPanel:FangChenMiPanelExt;
		
		public function FangChenMiManager()
		{
		}
		
		public static function setInChenMi(isInChenMi : Boolean) : void
		{
			_isInChenMi = true;
		}
		
		public static function checkInChenMi() : Boolean
		{
			return _isInChenMi;
		}
		
		public static function OnSCNonagePromptMessage(msg:SCNonagePromptMessage):void
		{
			switch(msg.type)
			{
				case FangChenMiEnum.FANGCHENGMI_2: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT2));
					break;
				case FangChenMiEnum.FANGCHENGMI_3: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT3));
					break;
				case FangChenMiEnum.FANGCHENGMI_4: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT4));
					break;
				case FangChenMiEnum.FANGCHENGMI_5: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT5));
					break;
				case FangChenMiEnum.FANGCHENGMI_6: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT6));
					break;
				case FangChenMiEnum.FANGCHENGMI_7: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT7));
					break;
				case FangChenMiEnum.FANGCHENGMI_8: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT8));
					break;
				case FangChenMiEnum.FANGCHENGMI_9: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT9));
					break;
				case FangChenMiEnum.FANGCHENGMI_10: 
					showChenMi(LanguageConfig.getText(LangCHENGMI_TEXT.CHENMI_TEXT10));
					break;
			}
		}
		
		private static function showChenMi(msg : String) : void
		{
			if(ClientConfig.isBanShu)
			{
				if(_fangchenmiPanel&&_fangchenmiPanel.stage!=null)
				{
					_fangchenmiPanel.updateText(msg);
				}
				else
					_fangchenmiPanel = FangChenMiPanelExt.showFangChenMiUtil(msg);
			}
			//			NoticeManager.chatSystemNotify(msg);
		}
		
		private function showChenMiClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{	
				case AlertClickTypeEnum.TYPE_SURE:
					onOk();
					break;
			}
		}
		
		private function onOk() : void
		{
			//这一步可以打开实名认证，接平台后实现。@L.L.M.Sunny 
			//WebManager.navigateToRealName();
		}
		
		public static function startFangChenMiInfoTick(delay : Number, infoFun : Function) : void
		{
			if (_fangChenMiInfoTimer)
			{
				_fangChenMiInfoTimer.destroy();
				_fangChenMiInfoTimer = null;
			}
			_fangChenMiInfoTimer = new GameTimer("FangChenMiInfoTimer", delay, 0, infoFun);
			_fangChenMiInfoTimer.start();
		}
	}
}
