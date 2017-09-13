package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.fulidating.FLDT_Zaixianjiangli;
	
	public class ZaiXianJiangLiPanel extends ViewUI
	{
		private var _skin:FLDT_Zaixianjiangli;
		
		public function ZaiXianJiangLiPanel()
		{
			_skin=new FLDT_Zaixianjiangli();
			super(_skin);
		}
		
		
	}
}