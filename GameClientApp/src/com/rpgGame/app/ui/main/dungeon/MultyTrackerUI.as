package com.rpgGame.app.ui.main.dungeon
{
	import org.mokylin.skin.mainui.fubenzhuizong.FuBen_Skin;
	
	import starling.display.DisplayObject;

	/**
	 *多人副本追踪 
	 * @author YT
	 * 
	 */	
	public class MultyTrackerUI extends DungeonTrackerUI
	{
		private var _skin:FuBen_Skin;
		
		public function MultyTrackerUI()
		{
			_skin=new FuBen_Skin();
			super(_skin);
		}
		override protected function onShow() : void
		{
			
		}
		override protected function onHide():void
		{
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			
		}
	}
}