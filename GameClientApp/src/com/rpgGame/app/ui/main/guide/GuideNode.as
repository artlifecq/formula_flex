package com.rpgGame.app.ui.main.guide
{
	import com.rpgGame.coreData.clientConfig.Q_player_guide;
	
	import starling.display.DisplayObject;

	internal class GuideNode
	{
		public var target:DisplayObject;
		public var config:Q_player_guide;
		public function GuideNode()
		{
		}
		public function dispose():void
		{
			target=null;
			config=null;
		}
	}
}