package com.rpgGame.app.ui.main.Task
{
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	public class TaskLoopCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var scroll_Bar :ScrollContainer;
		private var navi1:Label;
		private var navi2:Label;
		private var navi3:Label;
		private var kill1Label:Label;
		private var kill2Label:Label;
		private var kill3Label:Label;
		private var extraLabel:Label;
		public function TaskLoopCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			scroll_Bar=_skin.scroll_bar;
			init();
		}
		private function init():void
		{
			scrollInit();
			navi1=_skin.sec_navi1;
			navi2=_skin.sec_navi2;
			navi3=_skin.sec_navi3;
			kill1Label=Renwu_Item(_skin.sec_killbut1.skin).labelDisplay;
			kill2Label=Renwu_Item(_skin.sec_killbut2.skin).labelDisplay;
			kill3Label=Renwu_Item(_skin.sec_killbut3.skin).labelDisplay;
			extraLabel=_skin.sec_info;
			navi1.htmlText="[主线]第一章 新手村<font color='#8b8d7b'>(未完成)</font>";
			navi2.htmlText="[支线]强化装备<font color='#8b8d7b'>(未完成)</font>";
			navi3.htmlText="[环式]采矿<font color='#ffffff'>(10/20)</font><font color='#8b8d7b'>(未完成)</font>";
			
			kill1Label.htmlText="交谈：<u>项少龙交谈</u><font color='#cfc6ae'>(0/30)</font>";
			kill2Label.htmlText="击杀：<u>击杀强盗</u><font color='#cfc6ae'>(0/10)</font>";
			kill3Label.htmlText="采集：<u>采集铁矿</u><font color='#cfc6ae'>(0/20)</font>";
			extraLabel.htmlText="完成<font color='#ff0000'>38</font>环可获得额外奖励：";
			//_skin.sec_killbut1
			
		}
		
		private function scrollInit():void
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