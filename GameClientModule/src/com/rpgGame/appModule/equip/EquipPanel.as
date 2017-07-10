package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_Skin;
	import org.mokylin.skin.app.zhuangbei.button.ButtonHecheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonJicheng;
	import org.mokylin.skin.app.zhuangbei.button.ButtonQianghua;
	import org.mokylin.skin.app.zhuangbei.button.ButtonXilian;
	import org.mokylin.skin.app.zhuangbei.button.ButtonZuomo;
	
	/**
	 *装备面板
	 *@author dik
	 *2017-4-6下午3:17:27
	 */
	public class EquipPanel extends TabBarPanel
	{
		private var _skin:Zhuangbei_Skin;
		
		public function EquipPanel()
		{
			_skin=new Zhuangbei_Skin();
			super(_skin);
			
			addNode(RTNodeID.MAIN_EQUIP,RTNodeID.EQUIP_QH,_tabBar.getTabDataByTabKey(EmFunctionID.EM_QIANGHUA).button,140,ItemManager.checkHasEquip2Strengthen,false,null,true);
			addNode(RTNodeID.MAIN_EQUIP,RTNodeID.EQUIP_ZM,_tabBar.getTabDataByTabKey(EmFunctionID.EM_ZUOMO).button,140,ItemManager.checkHasEquip2ZM,false,null,true);
			addNode(RTNodeID.MAIN_EQUIP,RTNodeID.EQUIP_XL,_tabBar.getTabDataByTabKey(EmFunctionID.EM_XILIAN).button,140,ItemManager.checkHasEquip2XILIAN,false,null,true);
			addNode(RTNodeID.MAIN_EQUIP,RTNodeID.EQUIP_JC,_tabBar.getTabDataByTabKey(EmFunctionID.EM_JICHENG).button,140,ItemManager.checkItemCanInheritance,false,null,true);
			addNode(RTNodeID.MAIN_EQUIP,RTNodeID.EQUIP_HC,_tabBar.getTabDataByTabKey(EmFunctionID.EM_HECHENG).button,140,ItemManager.checkHasEquip2HC,false,null,true);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonQianghua,EquipIntensifyUI,EmFunctionID.EM_QIANGHUA);
			addTabDatas(ButtonZuomo,EquipPolishUI,EmFunctionID.EM_ZUOMO);
			addTabDatas(ButtonXilian,EquipSmeltUI,EmFunctionID.EM_XILIAN);
			addTabDatas(ButtonJicheng,EquipInheritUI,EmFunctionID.EM_JICHENG);
			addTabDatas(ButtonHecheng,EquipComboUI,EmFunctionID.EM_HECHENG);
		}
	}
}