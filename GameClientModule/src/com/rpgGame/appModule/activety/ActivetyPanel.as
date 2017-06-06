package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.activety.Activety_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
	/**
	 *活动面板 
	 * @author dik
	 * 
	 */
	public class ActivetyPanel extends TabBarPanel
	{
		private var _skin:Activety_Skin;
		
		public function ActivetyPanel()
		{
			_skin=new Activety_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,ActivetyInfoView,EmFunctionID.EM_ROLE);
		}
	}
}