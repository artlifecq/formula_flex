package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.TabBarPanel;
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
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonJineng,SkillStudyView,EmFunctionID.EM_JINENG);
			addTabDatas(ButtonJuexue,LostSkillView,EmFunctionID.EM_JUEXUE);
		}
	}
}