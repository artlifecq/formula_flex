package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.paihangbang.PaiHangBangTotal_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	public class RankAllPlatformListPanle extends TabBarPanel
	{
		private var _skin:PaiHangBangTotal_Skin;
		public function RankAllPlatformListPanle()
		{
			_skin = new PaiHangBangTotal_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,AllCombatPowerList,EmFunctionID.EM_AllCOMBATPOWERRANK,true,25,50);
			addTabDatas(TabBarSkin_pack,AllDuiJueList,EmFunctionID.EM_ALLDUIJUERANK,true,25,50);
		}

	}
}