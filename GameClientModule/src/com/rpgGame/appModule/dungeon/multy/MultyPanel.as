package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.UITableGroup;
	import com.rpgGame.app.ui.tab.FuncTabBar;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.appModule.dungeon.equip.EquipDungeon;
	import com.rpgGame.appModule.dungeon.exp.ExpDungeon;
	import com.rpgGame.appModule.dungeon.genuine.GenuineDungeon;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.fuben.FuBen_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;


	/**
	 * 多人副本弹出面板
	 * @author YT
	 */	
	public class MultyPanel  extends SkinUIPanel
	{
		private var _skin :FuBen_Skin;
		private var _tabBar:FuncTabBar;
		public function MultyPanel()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			
			var tabDatas:Vector.<UITabBarData>=new Vector.<UITabBarData>();
			var item:UITabBarData=new UITabBarData(TabBarSkin_pack,MultyView);
			item.tabKey= EmFunctionID.EM_DUORENFUBEN;
			tabDatas.push(item);
			
			item=new UITabBarData(TabBarSkin_pack,EquipDungeon);
			item.tabKey= EmFunctionID.EM_ZHUANGBEIFUBEN;
			tabDatas.push(item);
			
			item=new UITabBarData(TabBarSkin_pack,GenuineDungeon);
			item.tabKey= EmFunctionID.EM_ZHENGQIFUBEN;
			tabDatas.push(item);
			
			item=new UITabBarData(TabBarSkin_pack,ExpDungeon);
			item.tabKey= EmFunctionID.EM_JINGYANFUBEN;
			tabDatas.push(item);
			
			_tabBar=new FuncTabBar(_skin.tab_fuben,tabDatas);
			
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_tabBar.show(data,openTable);
		}
		
		override public function hide():void 
		{
			super.hide();
			_tabBar.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
//			_multyView.onTouchTarget(target);
		}
		
		
		
		
	}
}