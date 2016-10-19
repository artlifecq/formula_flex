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
	}
}