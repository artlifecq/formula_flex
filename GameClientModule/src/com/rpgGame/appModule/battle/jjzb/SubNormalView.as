package com.rpgGame.appModule.battle.jjzb
{
	import feathers.controls.Group;

	public class SubNormalView implements ISubBattleView
	{
		private var gNormal:Group;
		private var normalArr:Array;
		public function SubNormalView(g:Group,normal:Array)
		{
			this.gNormal=g;
			this.normalArr=normal;
			this.gNormal.visible=false;
		}
		
		public function show():void
		{
			this.gNormal.visible=true;
		}
		
		public function hide():void
		{
			this.gNormal.visible=false;
		}
		
		public function setData(data:*):void
		{
			
		}
	}
}