package org.game.netCore.net
{
	/**
	 * Bean相关的配置记录
	 * @author dik
	 * 
	 */
	public class BeanConfig
	{
		private static var _isInit:Boolean=false;
		
		public function BeanConfig()
		{
		}

		public static function get isInit():Boolean
		{
			return _isInit;
		}

		public static function set isInit(value:Boolean):void
		{
			_isInit = value;
			GameSocketDispatcher.excuteCache();
		}

	}
}