package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
	
	public class MainButton_Bag extends MainButtonBases
	{
		public function MainButton_Bag(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_beibao;
			super.initialize();
		}
	}
}