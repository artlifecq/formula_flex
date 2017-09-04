package com.rpgGame.appModule
{
	import com.rpgGame.app.manager.FunctionOpenManager;

	public class LinkUtil
	{
		public function LinkUtil()
		{
		}
		/** 点击执行*/
		public static function LinkDo( key :String ):void
		{
			FunctionOpenManager.openAppPaneById(int(key));
		}
	}
}