package com.rpgGame.app.sender
{
	import com.rpgGame.netData.specialactivities.message.CSSpecialActivityJoinMessage;

	/**
	 *活动请求器 
	 * @author dik
	 * 
	 */
	public class ActivitySender extends BaseSender
	{
		public function ActivitySender()
		{
			super();
		}
		
		/**
		 *请求加入活动 
		 * @param id
		 * 
		 */
		public static function reqJoinAct(id:int):void
		{
			var msg:CSSpecialActivityJoinMessage=new CSSpecialActivityJoinMessage();
			msg.activityId=id;
			sendMsg(msg);
		}
	}
}