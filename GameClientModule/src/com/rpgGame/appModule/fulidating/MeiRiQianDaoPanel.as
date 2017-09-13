package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.fulidating.FLDT_Meiriqiandao;
	
	public class MeiRiQianDaoPanel extends ViewUI
	{
		private var _skin:FLDT_Meiriqiandao;
		/** 日历 显示列		 */		
		public const DATE_COL:int = 7;
		/** 日历 显示行		 */		
		public const DATE_ROW:int = 6;
		public function MeiRiQianDaoPanel()
		{
			_skin=new FLDT_Meiriqiandao();
			super(_skin);
		}
	}
}