package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.ui.main.openActivity.BaseCampSubWithListPanel;
	
	import org.mokylin.skin.app.tequan.TQ_Meirilibao;
	
	public class P37PlatformVipPriveligePanelExt extends BaseCampSubWithListPanel
	{
		private var _skin:TQ_Meirilibao;
		public function P37PlatformVipPriveligePanelExt()
		{
			_skin=new TQ_Meirilibao();
			super(_skin, _skin.listCont, P37PlatformVipPriveligeCellExt);
		}
	}
}