package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.JunJieManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.fulidating.Fulidating_Skin;
	import org.mokylin.skin.app.fulidating.button.ButtonDengjilibao;
	import org.mokylin.skin.app.fulidating.button.ButtonJihuoma;
	import org.mokylin.skin.app.fulidating.button.ButtonMeiriqiandao;
	import org.mokylin.skin.app.fulidating.button.ButtonZaixianjiangli;
	
	public class FuLiDaTingMainPanelExt extends TabBarPanel
	{
		private var _skin:Fulidating_Skin;
		public function FuLiDaTingMainPanelExt()
		{
			_skin=new Fulidating_Skin();
			super(_skin,false);
//			addRTN();
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonDengjilibao,DengJiLiBaoPanel,EmFunctionID.EM_DENGJI,true,186,88);
			addTabDatas(ButtonMeiriqiandao,MeiRiQianDaoPanel,EmFunctionID.EM_QIANDAO,true,186,88);
			addTabDatas(ButtonZaixianjiangli,ZaiXianJiangLiPanel,EmFunctionID.EM_ZAIXIAN,true,186,88);
			addTabDatas(ButtonJihuoma,JiHuoMaPanel,EmFunctionID.EM_JIHUOMA,true,186,88);
		}
		
		protected function addRTN():void
		{
			addNode(RTNodeID.MAIN_FULI,RTNodeID.FULI_ZAILIAN,_tabBar.getTabDataByTabKey(EmFunctionID.EM_ZAIXIAN).button,140,Mgr.meridianMgr.checkHasNodeCanClick,false,null,true);
			addNode(RTNodeID.MAIN_FULI,RTNodeID.FULI_QIANDAO,_tabBar.getTabDataByTabKey(EmFunctionID.EM_QIANDAO).button,140,Mgr.cheatsMgr.checkHasNodeCanClick,false,null,true);
			addNode(RTNodeID.MAIN_FULI,RTNodeID.FULI_DENGJI,_tabBar.getTabDataByTabKey(EmFunctionID.EM_DENGJI).button,140,JunJieManager.ins.getCanActivation,false,null,true);
		}
	}
}