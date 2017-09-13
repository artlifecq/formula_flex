package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.ui.main.openActivity.GeneralActivityPanel;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;

	/**
	 *37游戏特权 
	 * @author yfl
	 * 
	 */	
	public class P37PlatformTokenPanelExt extends GeneralActivityPanel
	{
		public function P37PlatformTokenPanelExt()
		{
			super(EnumCampPanelType.M_PLATFORM_37);
		}
		override protected function initSubClass():void
		{
			addSubClass(EnumCampPanelType.SP_37_TOKEN,P37TokenPanelExt);
			addSubClass(EnumCampPanelType.SP_37_TQ,P37PlatformVipPriveligePanelExt);
			addSubClass(EnumCampPanelType.SP_37_VIP,P37PlatformVipLevelPanelExt);
		}
	}
}