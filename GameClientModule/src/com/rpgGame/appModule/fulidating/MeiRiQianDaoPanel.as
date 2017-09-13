package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.fulidating.FLDT_Meiriqiandao;
	
	public class MeiRiQianDaoPanel extends ViewUI
	{
		private var _skin:FLDT_Meiriqiandao;
		public function MeiRiQianDaoPanel()
		{
			_skin=new FLDT_Meiriqiandao();
			super(_skin);
		}
	}
}