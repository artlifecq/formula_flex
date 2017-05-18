package com.rpgGame.appModule
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;

	public class LinkUtil
	{
		public function LinkUtil()
		{
		}
		/** 点击执行*/
		public static function LinkDo( key :String ):void
		{
			if ( key == "" || key == null )
				return;
			if (key=="ShowMall") 
			{
				AppManager.showApp(AppConstant.MALL_PANEL);
			}
			else if (key=="ShowBoss") 
			{
				
			}
		}
	}
}