package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_renwu;
	
	public class MainButton_Role extends MainButtonBases
	{
		public function MainButton_Role(info:FunctionBarInfo):void
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_renwu;
			super.initialize();
		}
		
	}
}