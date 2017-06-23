package com.rpgGame.app.sender
{
	import com.rpgGame.netData.daysdowngold.message.CSRankInfoMessage;
	import com.rpgGame.netData.daysdowngold.message.CSRewardMessage;
	import com.rpgGame.netData.specialactivities.message.CSSpecialActivityJoinMessage;

	/**
	 *活动请求器 
	 * @author dik
	 * 
	 */
	public class SpecialActivitySender extends BaseSender
	{
		public function SpecialActivitySender()
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
		
		
		/*----------------天降元宝   yt---------------------------------------------*/
		/**
		 * 请求奖励排名
		 * */
		public static function reqLijinRankInfo():void
		{
			var msg:CSRankInfoMessage=new CSRankInfoMessage();
			sendMsg(msg);
		}
		/**
		 * 请求获得奖励
		 * */
		public static function reqLijinReward():void
		{
			var msg:CSRewardMessage=new CSRewardMessage();
			sendMsg(msg);
		}
	}
}