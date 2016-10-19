package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	
	import app.cmd.ChatModuleMessages;
	import app.message.ChatContentProto;
	import app.message.ChatContentProto.PosInfoProto;

	/**
	 * 所有发向服务端的数据和方法都只能通过 在BaseSender的子类sender类里定义，方法参数必须明确，
	 * 可以考略按功能将此类分割，比如按照操作物品，和操作任务的划分
	 * 但需要保持的一个规则也就是要确保同一条命令（CmdId）向服务端发送的地方只能有一个，
	 * 
	 *  @author fly.liuyang
	 * 创建时间：2014-2-25 下午6:21:10
	 * ModuleID==12
	 */
	public class ChatSender extends BaseSender
	{

		/**
		 *发送聊天信息 
		 * 
		 */		
		public static function cs_sendChat(content:String, channel:int, itemList:Array, targetChaterID:Number = 0, _posInfoProto:PosInfoProto = null ):void
		{
			_bytes.clear();
			//喇叭
			if (channel == EnumChatChannelType.CHAT_CHANNEL_LABA)
			{
				var itemInfo:ItemInfo = BackPackManager.instance.getFirstCanUseItemByCfgId( ChatCfgData.paidChatGoodsID );
				if( itemInfo != null )
				{
					//获取喇叭喇叭物品的格子id 写入
					_bytes.writeVarint32( itemInfo.index );
				}
			}
			
			if (channel == EnumChatChannelType.CHAT_CHANNEL_WINDOW || channel == EnumChatChannelType.CHAT_CHANNEL_SILIAO)
			{
				_bytes.writeVarint64(targetChaterID);
			}
			
			//内容
			var chatMsg:ChatContentProto = new ChatContentProto();
			chatMsg.speech = content;
			chatMsg.checkSum = EnumChatChannelType.JUSTICENUM;
			chatMsg.posInfo = _posInfoProto;
			if (itemList != null)
			{
				chatMsg.chatGoods = itemList;
			}
			
			chatMsg.writeTo(_bytes);
			
			switch(channel)
			{
				case EnumChatChannelType.CHAT_CHANNEL_WORLD://世界频道
					send(ChatModuleMessages.C2S_WORLD_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_NORMAL://当前频道
					send(ChatModuleMessages.C2S_SCENE_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_TEAM://队伍频道
					send(ChatModuleMessages.C2S_TEAM_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_FAMILY://家族频道
					send(ChatModuleMessages.C2S_FAMILY_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_LABA://喇叭
					send(ChatModuleMessages.C2S_PAID_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_SILIAO://私聊
					send(ChatModuleMessages.C2S_NORMAL_PRIVATE_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_WINDOW://窗口私聊
					send(ChatModuleMessages.C2S_SEND_WINDOW_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_COUNTRY://国家频道
					send(ChatModuleMessages.C2S_COUNTRY_CHAT,_bytes);
					break;
				case EnumChatChannelType.CHAT_CHANNEL_PARTY://帮会频道
					NoticeManager.mouseFollowNotify("功能暂未开放");
					break;
				case EnumChatChannelType.CHAT_CHANNEL_MENG_GUO://盟国频道
					NoticeManager.mouseFollowNotify("功能暂未开放");
					break;
				case EnumChatChannelType.CHAT_CHANNEL_KUA_FU://跨服频道
					NoticeManager.mouseFollowNotify("功能暂未开放");
					break;
			}
			
		}
		
		/**
		 * 请求物品的静态信息
		 * @param id
		 *
		 */
		public static function sendToGetItmeInfo(id:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			//send(ChatModuleMessages.C2S_GOODS_INFO_QUERY, _bytes);
		}

		/**
		 * 请求窗口聊天对象的聊天记录
		 */
		public static function requestChatRecord(chaterID:Number, cTime:Number = 0):void
		{
			_bytes.clear();
			_bytes.writeVarint64(chaterID);
			_bytes.writeVarint64(cTime);
			send(ChatModuleMessages.C2S_GET_CHAT_HISTORY, _bytes);
		}

		/** 请求聊天对象的在线和心情 */
		public static function requestChaterState(chaterID:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(chaterID);
			send(ChatModuleMessages.C2S_WINDOW_CHAT_OPEN_AND_GET_MOOD, _bytes);
		}

		/** 通知服务器是否打开了与某人的私聊窗口 */
		public static function tellSeverOChatWindowState(chaterID:Number, isOpen:Boolean):void
		{
			_bytes.clear();
			_bytes.writeVarint64(chaterID);
			send(isOpen ? ChatModuleMessages.C2S_WINDOW_CHAT_OPEN_AND_MOOD_ALREADY_KNOWN : ChatModuleMessages.C2S_WINDOW_CHAT_CLOSED, _bytes);
		}


		//-------------------------窗口聊天时输入状态的处理过程---------------------------
		/** 发送窗口聊天时的输入状态 id对方id*/
		public static function sendChatInputState(id:Number, isStart:Boolean):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			send(isStart ? ChatModuleMessages.C2S_I_AM_TYPING : ChatModuleMessages.C2S_I_STOPPED_TYPING, _bytes);
		}
		
		/**
		 * 发送心情
		 * @param moodIndex 心情的index
		 * 
		 */
		public static function broadcastMood(moodIndex:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(moodIndex);
			send(ChatModuleMessages.C2S_BROADCAST_MOOD,_bytes);
		}
	}
}
