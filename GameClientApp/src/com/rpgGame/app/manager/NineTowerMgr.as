package com.rpgGame.app.manager
{
	import com.rpgGame.app.ui.scene.dungeon.NineTowerTrackUIExt;

	public class NineTowerMgr
	{
		public static var ins:NineTowerMgr=new NineTowerMgr();
		private var _track:NineTowerTrackUIExt;
		public function NineTowerMgr()
		{
		}
		
		public function setPanel(track:NineTowerTrackUIExt):void
		{
			// TODO Auto Generated method stub
			_track=track;
		}
	}
}