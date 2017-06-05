package  com.rpgGame.appModule.social
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.social.team.TeamMainPanelExt;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.shejiao.Shejiao_Skin;
	import org.mokylin.skin.app.shejiao.button.ButtonZudui;
	
	
	
	/**
	 *社交面板 
	 * @author dik
	 * 
	 */
	public class SocialMainPanelExt extends TabBarPanel
	{
		protected var _skin : Shejiao_Skin;
		public function SocialMainPanelExt()
		{
			this._skin = new Shejiao_Skin();
			super(_skin);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonZudui,TeamMainPanelExt,EmFunctionID.EM_ZUDUI);
		}
	}
}


