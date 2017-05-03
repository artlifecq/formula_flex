package com.rpgGame.appModule.xinfa
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.beibao.Xinfa.xinfa_Skin;
	
	public class XinFaMainPanelExt extends SkinUI
	{
		private var _skin:xinfa_Skin;
		private var _view:XinFaView;
		public function XinFaMainPanelExt()
		{
			_skin=new xinfa_Skin();
			super(_skin);
			_view=new XinFaView(_skin);
		}
		override protected function onShow():void
		{
			super.onShow();
			_view.onShow();
		}
		override protected function onHide():void
		{
			super.onHide();
			_view.onHide();
		}
	}
}