package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class ChatEvent
	{
		 
		public static const SEND_SUCCESS:int = UNIQUEID.NEXT;;
		
		public static const GET_NEW_NORMAL_DATA:int = UNIQUEID.NEXT;
		public static const GET_NEW_WHISPER_DATA:int = UNIQUEID.NEXT;
		//		public static const CHAT_EMOTION_RESET:String = "chat_emotion_reset";
		
		/**  窗口私聊发送成**/
		public static const WINDW_CHAT_SEND_SUCCESS:int = UNIQUEID.NEXT;
		/**  窗口私聊发送成**/
		public static const CLOSE_WIND_CHAT_TABLE:int = UNIQUEID.NEXT;
		
		/**  关闭聊天设置**/
		public static const CLOSE_CHAT_SETTING_PANEL:int = UNIQUEID.NEXT;
		/**  私聊信息发布失败,因为被对方加入了屏蔽列表 **/
		public static const PRIVATE_CHAT_SEND_FAIL_IN_BLACK_LIST:int = UNIQUEID.NEXT;
		/** 聊天框发送位置信息*/
		public static const INSERT_LOCATION:int = UNIQUEID.NEXT;
		/** 自定义频道设置*/
		public static const CHAT_TABS_SETING:int = UNIQUEID.NEXT;
		/**切换到私聊窗口，携带私聊对象的ID和名称*/
		public static const SWITCH_PRIVATE_CHANNEL:int = UNIQUEID.NEXT;
		/**展示物品*/
		public static const SHOW_GOODS:int = UNIQUEID.NEXT;
	}
}