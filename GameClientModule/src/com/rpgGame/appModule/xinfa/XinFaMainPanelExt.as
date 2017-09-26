package com.rpgGame.appModule.xinfa
{
	import com.rpgGame.app.ui.AttChangeView;
	import com.rpgGame.coreData.enum.AttChangeEnum;
	
	import org.mokylin.skin.app.beibao.Xinfa.xinfa_Skin;
	
	public class XinFaMainPanelExt extends AttChangeView
	{
		private var _skin:xinfa_Skin;
		private var _view:XinFaView;
		public function XinFaMainPanelExt()
		{
			attChangeTypes=[AttChangeEnum.CHEATS];
			_skin=new xinfa_Skin();
			super(_skin);
			_view=new XinFaView(_skin);
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			_view.onShow();
		}
		override public function hideView():void
		{
			super.hideView();
			_view.onHide();
		}
	}
}