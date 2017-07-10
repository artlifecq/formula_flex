package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;

	public class MainButton_WuXue extends MainButtonBases
	{
		public function MainButton_WuXue()
		{
			super();
			SkinUI.addNode(null,RTNodeID.MAIN_WU_XUE,this,60,null,false);
		}
	}
}