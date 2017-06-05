package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.app.ui.tab.FuncTabBar;
	import com.rpgGame.appModule.dungeon.equip.EquipDungeon;
	import com.rpgGame.appModule.dungeon.exp.ExpDungeon;
	import com.rpgGame.appModule.dungeon.genuine.GenuineDungeon;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.fuben.FuBen_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	import starling.display.DisplayObject;


	/**
	 * 多人副本弹出面板
	 * @author YT
	 */	
	public class MultyPanel  extends TabBarPanel
	{
		private var _skin :FuBen_Skin;
		private var _tabBar:FuncTabBar;
		public function MultyPanel()
		{
			_skin=new FuBen_Skin();
			super(_skin);
		}
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,MultyView,EmFunctionID.EM_DUORENFUBEN);
			addTabDatas(TabBarSkin_pack,EquipDungeon,EmFunctionID.EM_ZHUANGBEIFUBEN);
			addTabDatas(TabBarSkin_pack,GenuineDungeon,EmFunctionID.EM_ZHENGQIFUBEN);
			addTabDatas(TabBarSkin_pack,ExpDungeon,EmFunctionID.EM_JINGYANFUBEN);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
//			_multyView.onTouchTarget(target);
		}
		
		
		
		
	}
}