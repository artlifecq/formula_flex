package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;

	public class MainButton_Shop extends MainButtonBases
	{
		public function MainButton_Shop(info:FunctionBarInfo):void
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_shangcheng;
			super.initialize();
		}
	}
}