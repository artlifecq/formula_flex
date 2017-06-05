package com.rpgGame.appModule.equip
{
	import com.rpgGame.app.ui.TabBarPanel;
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