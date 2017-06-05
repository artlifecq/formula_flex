package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.app.ui.tab.FuncTabBar;
	import com.rpgGame.app.ui.tab.UITabBarData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Skin;
	import org.mokylin.skin.app.wuxue.button.ButtonJineng;
	import org.mokylin.skin.app.wuxue.button.ButtonJuexue;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *武学面板 
	 * @author dik
	 * 
	 */
	public class SkillPanel extends TabBarPanel
	{
		private var _skin:Wuxue_Skin;
		
		private var _tabStyles:Array=[ButtonJineng,ButtonJuexue];
		private var _viewStyles:Array=[SkillStudyView,LostSkillView];
		private var _funcId:Array=[EmFunctionID.EM_JINENG,EmFunctionID.EM_JUEXUE];
		private var _tabBar:FuncTabBar;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonJineng,SkillStudyView,EmFunctionID.EM_JINENG);
			addTabDatas(ButtonJuexue,LostSkillView,EmFunctionID.EM_JUEXUE);
		}
	}
}