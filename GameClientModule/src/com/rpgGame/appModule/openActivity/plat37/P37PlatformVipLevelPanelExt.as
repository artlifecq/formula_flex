package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.ui.main.openActivity.BaseCampSubWithListPanel;
	
	import org.mokylin.skin.app.tequan.TQ_Tequanlibao;
	
	public class P37PlatformVipLevelPanelExt extends BaseCampSubWithListPanel
	{
		private var _skin:TQ_Tequanlibao;
		public function P37PlatformVipLevelPanelExt()
		{
			_skin=new TQ_Tequanlibao();
			super(_skin, _skin.listCont, P37PlatformVipLevelItemExt);
		}
	}
}