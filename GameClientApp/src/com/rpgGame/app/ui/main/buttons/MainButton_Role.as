package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	
	import starling.display.DisplayObjectContainer;

	public class MainButton_Role extends MainButtonBases
	{
		public function MainButton_Role()
		{
			super();
			SkinUI.addNode(null,RTNodeID.MAINROLE,this,60,null,false);
		}
	}
}