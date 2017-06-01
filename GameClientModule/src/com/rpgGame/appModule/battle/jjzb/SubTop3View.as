package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.manager.Mgr;
	
	import feathers.controls.Group;

	public class SubTop3View implements ISubBattleView
	{
		private var gTop:Group;
		private var topArr:Array;
		public function SubTop3View(g:Group,top:Array)
		{
			this.gTop=g;
			this.topArr=top;
			this.gTop.visible=false;
		}
		
		public function show():void
		{
			gTop.visible=true;
			Mgr.jjBattleMgr.reqChallegeRankData(2);
		}
		
		public function hide():void
		{
			gTop.visible=false;
		}
		public function setData(data:*):void
		{
			
		}
	}
}