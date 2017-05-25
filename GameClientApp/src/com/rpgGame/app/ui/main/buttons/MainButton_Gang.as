package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
	
	public class MainButton_Gang extends MainButtonBases
	{
		public function MainButton_Gang(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_banghui;
			super.initialize();
		}
	}
}