package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	
	public class MainButton_Equip extends MainButtonBases
	{
		public function MainButton_Equip()
		{
			SkinUI.addNode(null,RTNodeID.MAIN_EQUIP,this,60,null,false);
		}
		override protected function initialize():void
		{
			super.initialize();
			if(!ItemSender.isReqPack){
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}
		}
	}
}