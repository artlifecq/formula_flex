package com.rpgGame.appModule.battle
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.battle.jjzb.JJBattlePanelExt;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.zhanchang.ZhanChang_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	public class BattleMainPanelExt extends TabBarPanel
	{
	
		private var _skin :ZhanChang_Skin;
		
		public function BattleMainPanelExt()
		{
			_skin=new ZhanChang_Skin();
			super(_skin);
		}
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,JJBattlePanelExt,EmFunctionID.EM_JINGJIZHENGBA);
		
		}
	}
}