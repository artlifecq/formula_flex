package com.rpgGame.coreData.enum
{
	public class AlertTypeEnum
	{
		public function AlertTypeEnum()
		{
		}
		
		/**确认取消**/
		public static const ALERT_TYPE_OK_CANCEL : int = 1;
		/**确认**/
		public static const ALERT_TYPE_OK : int = 2;
		/**透明的确认取消**/
		public static const ALERT_TYPE_TRANSPARENT_OK_CANCEL : int = 3;
		/**透明的确认**/
		public static const ALERT_TYPE_TRANSPARENT_OK : int = 4;
	}
}