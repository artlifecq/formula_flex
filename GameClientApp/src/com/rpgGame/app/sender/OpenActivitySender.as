package com.rpgGame.app.sender
{
	import com.rpgGame.netData.activities.message.ReqActivitiesInfoMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import com.rpgGame.netData.activities.message.ReqActivitiesGetRewardMessage;

	public class OpenActivitySender extends BaseSender
	{
		public function OpenActivitySender()
		{
			super();
		}
		/**请求活动信息*/
		public static function reqActivitiesInfoMsg(type:int=0):void
		{
			var msg:ReqActivitiesInfoMessage = new ReqActivitiesInfoMessage();
			msg.mainPanelType=type;
			SocketConnection.send(msg);
		}
		
		/**请求领取奖励*/
		public static function reqActivitiesGetRewardMsg(id:int, times:int = 1):void
		{
			var msg:ReqActivitiesGetRewardMessage = new ReqActivitiesGetRewardMessage();
			msg.activityId = id;
			msg.times = times;
			SocketConnection.send(msg);
		}
	}
}