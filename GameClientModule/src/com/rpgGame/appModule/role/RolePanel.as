package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.jingmai.MeridianMainPanelExt;
	import com.rpgGame.appModule.junjie.JunJiePanelExt;
	import com.rpgGame.appModule.xinfa.XinFaMainPanelExt;
	import com.rpgGame.appModule.zhangong.ZhanGongPanelExt;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.app.beibao.daohang_Skin;
	import org.mokylin.skin.app.beibao.button.ButtonJingmai;
	import org.mokylin.skin.app.beibao.button.ButtonJuese;
	import org.mokylin.skin.app.beibao.button.ButtonJunjie;
	import org.mokylin.skin.app.beibao.button.ButtonXinfa;
	import org.mokylin.skin.app.beibao.button.ButtonZhangong;
	
	
	
	/**
	 *角色面板 
	 * @author dik
	 * 
	 */
	public class RolePanel extends TabBarPanel
	{
		protected var _skin : beibao_Skin;
		
		public function RolePanel()
		{
			this._skin = new beibao_Skin();
			super(_skin);
			addRTN();
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonJuese,SubRolePanel,EmFunctionID.EM_ROLE);
			addTabDatas(ButtonJingmai,MeridianMainPanelExt,EmFunctionID.EM_MERIDIAN);
			addTabDatas(ButtonXinfa,XinFaMainPanelExt,EmFunctionID.EM_XINFA);
			addTabDatas(ButtonZhangong,ZhanGongPanelExt,EmFunctionID.EM_ZHANGONG);
			addTabDatas(ButtonJunjie,JunJiePanelExt,EmFunctionID.Em_JUNJIE);
			
		}
		protected function addRTN():void
		{
			addNode(RTNodeID.MAINROLE,RTNodeID.JM,_tabBar.getTabDataByTabKey(EmFunctionID.EM_MERIDIAN).button,140,Mgr.meridianMgr.checkHasNodeCanClick,false,null,true)
		}
	}
}
