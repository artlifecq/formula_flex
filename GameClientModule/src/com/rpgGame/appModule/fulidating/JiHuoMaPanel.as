package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.fulidating.FLDT_Jihuomaduihuan;
	
	public class JiHuoMaPanel extends ViewUI
	{
		private var _skin:FLDT_Jihuomaduihuan;
		
		public function JiHuoMaPanel()
		{
			_skin=new FLDT_Jihuomaduihuan();
			super(_skin);
		}
		
		private function initView():void
		{
			
		}
	}
}