package com.rpgGame.appModule.mail
{
	import com.rpgGame.appModule.common.ViewUI;
	
	import org.mokylin.skin.app.mail.MailRead_Skin;
	
	public class MailReadPanelExt extends ViewUI
	{
		private var _skin:MailRead_Skin;
		public function MailReadPanelExt()
		{
			_skin=new MailRead_Skin();
			super(_skin);
		}	
		
		
	}
}