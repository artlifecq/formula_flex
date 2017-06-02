package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	
	public class MainButton_Equip extends MainButtonBases
	{
		override protected function initialize():void
		{
			super.initialize();
			if(!ItemSender.isReqPack){
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}
		}
	}
}