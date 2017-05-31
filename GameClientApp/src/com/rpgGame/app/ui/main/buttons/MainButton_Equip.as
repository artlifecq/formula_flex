package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhuangbei;
	
	public class MainButton_Equip extends MainButtonBases
	{
		public function MainButton_Equip(info:FunctionBarInfo)
		{
			super(info);
		}
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_zhuangbei;
			super.initialize();
			if(!ItemSender.isReqPack){
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}
		}
	}
}