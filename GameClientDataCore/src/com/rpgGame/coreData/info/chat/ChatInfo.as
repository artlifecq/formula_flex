package com.rpgGame.coreData.info.chat
{
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	

	public class ChatInfo
	{
		/**频道**/
		public var channel:int;
		/**名字（职位，VIP） 这是赋值给富文本上用的，把数据表情代码**/
		public var realShowName:String = "";
		/**说话的内容 这是赋值给富文本上用的，把数据表情代码**/
		public var realShowMsg:String;
		//---------------------------
		/** 用于私聊， 私聊指向人id   */		
		public var targetID:Number = 0;
		/** 用于私聊， 私聊指向人昵称  */		
		public var targetName:String;
		
		public var talkTime:Number;
		//------------------------------------
		/** 发送的聊天内容 这是真正玩家说的内容，有物品之时不能直接显示的 */		
		public var speech:String;
		
		public var chatGoods:Array;
		
		/** 检查是否被篡改 **/		
		public var checkSum:int;
		
		/** 发送者id  */		
		public var id:Number;
		/** 发送人昵称  */		
		public var name:String;
		/** 发送者的国家id*/
		public var countryId:int;
		//发送等级
		public var level:int;
		//发送的位置数据
//		public var posInfo:PosInfoProto;
		
		/** 是否国王帮会 **/
		public var isKingGuild:Boolean = false;
		/** 是皇帝帮会 **/
		public var isEmperorGuild:Boolean = false;
		/** 0-无特殊职位，1-皇城城主 2-王城城主 3-国师 4-将军 **/
		public var cityMasterType:int = 0; 
		public var isGM:Boolean;
		
		/**是否是百度金钻会员**/
		public var isBaiduVip:Boolean =  false; 
		/** 是否是vip*/
		public var vipLevel:int;
		
		private var _sign:int;//轮询打点
		private static const TIME_GRADUAL:int = 2;
		private static const TIME_HIDE:int = 3;
		
		public function ChatInfo()
		{
		}
		
		public function sign():int
		{
			if(id == EnumChatChannelType.CHAT_CHANNEL_SYSTEM)
			{
				_sign++;
			}
			return _sign>0?1:0;
		}
		
		public function isGradual():Boolean
		{
			if(_sign >= TIME_GRADUAL)
			{
				return true;
			}
			return false;
		}
		
		public function isTimeOut():Boolean
		{
			if(_sign >= TIME_HIDE)
			{
				return true;
			}
			return false;
		}
	}
}