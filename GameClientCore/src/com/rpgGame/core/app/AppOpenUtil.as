package com.rpgGame.core.app
{
	import com.rpgGame.coreData.cfg.ClientConfig;
	

	/**
	 * app打开过滤策略, 所有对某个app是否可以打开的硬代码判断都放在这里
	 * @author fly
	 * @createDate 2013-10-30 下午5:03:03
	 */	
	public class AppOpenUtil
	{
		
		/**
		 * 判断是否可以打开面板，如：功能未开启
		 * @param appInfo		AppConstant
		 * @param data			打开时给面板传入的参数
		 * @param openTable		要打开面板的哪个标签页
		 * @return 
		 * 
		 */		
		public static function isCanOpenApp( appInfo:String, data:Object, openTable:int ):Boolean
		{
			var isOpen:Boolean = true;
			switch( appInfo )
			{
				case AppConstant.SPELL_PANEL://技能面板
				{
					isOpen =true //!ClientConfig.isBanShu;//版属服
				}
			}
			return isOpen;
		}
	}
}