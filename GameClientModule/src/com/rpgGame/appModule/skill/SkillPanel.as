package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.SpellManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Skin;
	import org.mokylin.skin.app.wuxue.button.ButtonJineng;
	import org.mokylin.skin.app.wuxue.button.ButtonJuexue;
	
	/**
	 *武学面板 
	 * @author dik
	 * 
	 */
	public class SkillPanel extends TabBarPanel
	{
		private var _skin:Wuxue_Skin;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
			
			
			addNode(RTNodeID.MAIN_WU_XUE,RTNodeID.WX_SKILL,_tabBar.getTabDataByTabKey(EmFunctionID.EM_JINENG).button,140,SpellManager.hasSkillCanLevelUpOrUpgrade,false,null,true);
			addNode(RTNodeID.MAIN_WU_XUE,RTNodeID.WX_JX,_tabBar.getTabDataByTabKey(EmFunctionID.EM_JUEXUE).button,140,LostSkillManager.instance().hasLostSkillCanLevelUp,false,null,true);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonJineng,SkillStudyView,EmFunctionID.EM_JINENG);
			addTabDatas(ButtonJuexue,LostSkillView,EmFunctionID.EM_JUEXUE);
		}
	}
}