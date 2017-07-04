package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;

	public class MainButton_ZhanHun extends MainButtonBases
	{
		public function MainButton_ZhanHun()
		{
			super();
			SkinUI.addNode(null,RTNodeID.MAIN_ZHANHUN,this,60,FightSoulManager.instance().hasSthNotice,false,null,true);
		}
	}
}