package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
	
	public class MainButton_Fightsoul extends MainButtonBases
	{
		public function MainButton_Fightsoul(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_zhanhun;
			super.initialize();
		}
	}
}