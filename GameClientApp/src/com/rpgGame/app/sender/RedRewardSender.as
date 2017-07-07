package com.rpgGame.app.sender
{
	import com.rpgGame.netData.redreward.message.CSGetRedRewardMessage;
	import com.rpgGame.netData.redreward.message.CSGetRedRewardsMessage;
	import com.rpgGame.netData.redreward.message.CSRequestGetRewardLogMessage;
	import com.rpgGame.netData.redreward.message.CSRequestOpenRedRewardMessage;
	import com.rpgGame.netData.redreward.message.CSSendRedRewardMessage;

	public class RedRewardSender extends BaseSender
	{
		/** 请求红包 */
		public static function reqRewardInfo():void
		{
			sendMsg(new CSGetRedRewardMessage());
		}
		/** 请求红包列表 */
		public static function reqRewardInfos():void
		{
			sendMsg(new CSGetRedRewardsMessage());
		}
		
		/** 请求打开红包 */
		public static function openReward(ismore:int):void
		{
			var msg:CSRequestOpenRedRewardMessage = new CSRequestOpenRedRewardMessage();
			msg.isMore = ismore;
			sendMsg(msg);
		}
		
		/** 请求发送红包 */
		public static function sendReward(count:int):void
		{
			var msg:CSSendRedRewardMessage = new CSSendRedRewardMessage();
			msg.count = count;
			sendMsg(msg);
		}
		
		/** 请求红包领取记录 */
		public static function reqGetRedRewardLog():void
		{
			sendMsg(new CSRequestGetRewardLogMessage());
		}
	}
}