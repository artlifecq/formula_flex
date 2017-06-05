package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.UITabBar;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_Skin;
	import org.mokylin.skin.app.zhuangbei.button.ButtonHecheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonJicheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonQianghua;
	import org.mokylin.skin.app.zhuangbei.button.ButtonXilian;
	import org.mokylin.skin.app.zhuangbei.button.ButtonZuomo;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 *装备面板
	 *@author dik
	 *2017-4-6下午3:17:27
	 */
	public class EquipPanel extends SkinUIPanel
	{
		private var _skin:Zhuangbei_Skin;
		private var _tabBar:UITabBar;
		
		public function EquipPanel()
		{
			_skin=new Zhuangbei_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			var _tabClass:Array=[ButtonQianghua,ButtonZuomo,ButtonXilian,ButtonJicheng,ButtonHecheng];
			var _viewClass:Array=[EquipIntensifyUI,EquipPolishUI,EquipSmeltUI,EquipInheritUI,EquipComboUI];
			var funcId:Array=[EmFunctionID.EM_QIANGHUA,EmFunctionID.EM_ZUOMO,EmFunctionID.EM_XILIAN,EmFunctionID.EM_JICHENG,
				EmFunctionID.EM_HECHENG];
			var tabDatas:Vector.<UITabBarData>=new Vector.<UITabBarData>();
			var num:int=_tabClass.length;
			for (var i:int = 0; i <num; i++) 
			{
				var item:UITabBarData=new UITabBarData();
				item.tabClass=_tabClass[i];
				item.viewClass=_viewClass[i];
				item.tabKey=funcId[i];//标签键为功能id
				tabDatas.push(item);
			}
			
			_tabBar=new UITabBar(_skin.tabBar,tabDatas);
			//检查已经开启的功能组装数据，
			//监听新功能开启重组数据；
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
	}
}