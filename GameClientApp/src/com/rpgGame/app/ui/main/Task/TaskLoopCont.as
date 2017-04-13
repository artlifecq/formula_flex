package com.rpgGame.app.ui.main.Task
{
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;

	public class TaskLoopCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var scroll_Bar :ScrollContainer;
		public function TaskLoopCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			scroll_Bar=_skin.scroll_bar;
			init();
		}
		private function init():void
		{
			scroll_Bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scroll_Bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scroll_Bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skin.scroll_box.y=0;
			scroll_Bar.addChild(_skin.scroll_box);
		
		}
		public function show(key:Boolean):void
		{
			_skin.secondary_box.visible=key;
		}
		
		
	}
}