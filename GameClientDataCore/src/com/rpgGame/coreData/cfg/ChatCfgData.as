package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import app.message.ChatConfig;
	
	import org.client.mainCore.ds.HashMap;

	public class ChatCfgData
	{
		public static const MAX_CHAR_LENGTH:int = 50;
		/**付费喇叭所需的物品id**/
		public static var paidChatGoodsID:int = 0;
		private static var chatLevelVect:HashMap = new HashMap();
		private static var durationVect:HashMap = new HashMap();
		/**心情广播时间间隔*/
		public static var broadcast_mood_duration:Number = 0;
		/**聊天时间间隔内最多聊几次*/
		public static var maxChatTimesPerCD:int;
		
		public static function setChatConfig( chatConfig:ChatConfig, paidChatGoodsId:int ):void
		{
			paidChatGoodsID = paidChatGoodsId;
			maxChatTimesPerCD = chatConfig.chatFrequencyTimes;
			if( chatConfig == null )
				return;
			var channelArr:Array = [
									EnumChatChannelType.CHAT_CHANNEL_WORLD,
									EnumChatChannelType.CHAT_CHANNEL_COUNTRY,
									EnumChatChannelType.CHAT_CHANNEL_NORMAL,
									EnumChatChannelType.CHAT_CHANNEL_LABA,
									EnumChatChannelType.CHAT_CHANNEL_SILIAO,
									EnumChatChannelType.CHAT_CHANNEL_TEAM,
									EnumChatChannelType.CHAT_CHANNEL_FAMILY
									];
			var len:int = channelArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var channel:int = channelArr[i];
				chatLevelVect.add(channel,chatConfig.chatLevel[i]);
				durationVect.add(channel,chatConfig.chatFrequencyPerChat[i]);
			}
		}
		
		/**
		 * 返回CD时间长，单位：毫秒
		 * @param channel
		 * @return 
		 * 
		 */
		public static function getChatCDTime(channel:int):int
		{
			return durationVect.getValue(channel);
		}
		
		/**
		 * 返回聊天最低等级
		 * @param channel
		 * @return 
		 * 
		 */
		public static function getChatLevel(channel:int):int
		{
			return chatLevelVect.getValue(channel);
		}
	}
}