package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.mainui.fubenzhuizong.LunJian_Skin;

	/**
	 *论剑副本追踪
	 *@author dik
	 *2017-5-9下午4:14:50
	 */
	public class LunJianTrackerUI extends SkinUI
	{
		private var _skin:LunJian_Skin;
		
		public function LunJianTrackerUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
		}
		
		override protected function onShow() : void
		{
			
		}
		
		override protected function onHide():void
		{
			
		}
	}
}