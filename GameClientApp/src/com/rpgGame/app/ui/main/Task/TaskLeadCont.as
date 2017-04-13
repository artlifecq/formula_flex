package com.rpgGame.app.ui.main.Task
{
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * 主线支线环式面板
	 * @author YT
	 * 
	 */	
	public class TaskLeadCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		
		public function TaskLeadCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			
			init();
		}
		private function init():void
		{
			_skin.pri_title.htmlText="第一章:新手村";
			_skin.pri_navi1.htmlText="章节任务";
			_skin.pri_navi2.htmlText="任务描述";
			_skin.pri_navi3.htmlText="任务进度";
			
			var jindu:RenWu_jindu=_skin.pri_probar.skin as RenWu_jindu;
			var killLebel:Renwu_Item=_skin.pri_killbut.skin as Renwu_Item;
			jindu.labelDisplay.text="40%";
			jindu.pro_jindu.maximum=100;
			jindu.pro_jindu.value=40;
			_skin.pri_txt.htmlText="听闻有刺客密谋造反，请速速追捕嫌犯";
			killLebel.labelDisplay.htmlText="击杀：<u>少林杖僧</u><font color='#cfc6ae'>(2/10)</font>";
		}
		
		public function show(key:Boolean):void
		{
			_skin.primary_box.visible=key;
		}
		
	}
}