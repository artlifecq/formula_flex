package com.rpgGame.appModule.xinfa
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.beibao.Xinfa.xinfa_Skin;
	
	public class XinFaMainPanelExt extends ViewUI
	{
		private var _skin:xinfa_Skin;
		private var _view:XinFaView;
		public function XinFaMainPanelExt()
		{
			_skin=new xinfa_Skin();
			super(_skin);
			_view=new XinFaView(_skin);
		}
		override public function show(data:Object=null):void
		{
			_view.onShow();
		}
		override public function hide():void
		{
			_view.onHide();
		}
	}
}