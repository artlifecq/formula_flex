package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_wuxue;
	
	public class MainButton_Kongfu extends MainButtonBases
	{
		public function MainButton_Kongfu(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_wuxue;
			super.initialize();
		}
	}
}