package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.FuncTabBar;
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
		private var _tabStyles:Array=[ButtonQianghua,ButtonZuomo,ButtonXilian,ButtonJicheng,ButtonHecheng];
		private var _viewStyles:Array=[EquipIntensifyUI,EquipPolishUI,EquipSmeltUI,EquipInheritUI,EquipComboUI];
		private var _funcId:Array=[EmFunctionID.EM_QIANGHUA,EmFunctionID.EM_ZUOMO,EmFunctionID.EM_XILIAN,
			EmFunctionID.EM_JICHENG,EmFunctionID.EM_HECHENG];
		
		private var _skin:Zhuangbei_Skin;
		private var _tabBar:FuncTabBar;
		
		public function EquipPanel()
		{
			_skin=new Zhuangbei_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			var tabDatas:Vector.<UITabBarData>=new Vector.<UITabBarData>();
			var num:int=_tabStyles.length;
			for (var i:int = 0; i <num; i++) 
			{
				var item:UITabBarData=new UITabBarData(_tabStyles[i],_viewStyles[i]);
				item.tabKey=_funcId[i];//标签键为功能id
				tabDatas.push(item);
			}
			
			_tabBar=new FuncTabBar(_skin.tabBar,tabDatas);
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