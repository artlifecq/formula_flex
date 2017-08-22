package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * 邮件
	 * @author lpp
	 */
	public class MailEvent 
	{
		/**收到新邮件*/
		public static const ADD_MAIL_DATA:int = UNIQUEID.NEXT;
		/**邮件已读状态发生了变化，携带参数，邮件ID*/
		public static const MAIL_READ_STATUS_CHANGE:int = UNIQUEID.NEXT;
		/**删除了邮件*/
		public static const DEL_MAIL_DATA:int = UNIQUEID.NEXT;
		public static const MAIL_SEND_SUCCESS:int = UNIQUEID.NEXT;
		/**领取物品发生了变化      参数一个，mailId**/
		public static const MAIL_COLLECT_CHANGE:int = UNIQUEID.NEXT;
		/**所有邮件领取发生了变化*/
		public static const MAIL_ALL_COLLECT_CHANGE:int = UNIQUEID.NEXT;
		/**选取某一封邮件*/
		public static const MAIL_SELECT:int = UNIQUEID.NEXT;
		/**邮件详细信息*/
		public static const MAIL_DETAILED_INFORMATION:int = UNIQUEID.NEXT;
		/**关闭读取详细信息*/
		public static const MAIL_CLOSE_READPANEL:int = UNIQUEID.NEXT;
		/**全选*/
		public static const MAIL_ALL_SELECT:int = UNIQUEID.NEXT;
		/**单选*/
		public static const MAIL_ONE_SELECT:int = UNIQUEID.NEXT;
		/**显示下一封*/
		public static const MAIL_NEXT_SELECT:int = UNIQUEID.NEXT;
	}
}