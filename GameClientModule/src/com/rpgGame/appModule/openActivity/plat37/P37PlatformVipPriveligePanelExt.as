package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.ui.main.openActivity.BaseCampSubWithListPanel;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.tequan.TQ_Meirilibao;
	
	public class P37PlatformVipPriveligePanelExt extends BaseCampSubWithListPanel
	{
		private var _skin:TQ_Meirilibao;
		public function P37PlatformVipPriveligePanelExt(skin:StateSkin)
		{
			_skin=new TQ_Meirilibao();
			super(_skin, _skin.listCont, P37PlatformVipPriveligeCellExt);
		}
	}
}