package com.rpgGame.coreData.info.chat
{
	import com.rpgGame.coreData.info.chat.ChatInfo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 当前私聊者的聊天内容数据 
	 */	
	public class PrivateChaterVo 
	{
		public static const MAX_LINE_PRIVATE_MAX:int = 1000;
		
		
		//id
		public var id:Number;
		//职业(用来显示头像)
		private var _race:int;
		//等级
		public var level:int = 1;
		//姓名
		private var _name:String = "";
		//头像
		public var head:String = "";
		//心情
		public var mood:String = "";
		//是否在线
		public var isOnLine:Boolean;
		//是否已申请心情
		public var isRquestState:Boolean;
		//说话内容
		private var _chatList:Vector.<ChatInfo>
		//按时间存储的
		private var chatHash:HashMap;
		//是否有更多的聊天内容
		public var hasMoreRecord:Boolean;
		
		//打开窗口的时间秒数
		public var openWindowTime:int;
		//记录时间提醒的消息号id
		private var _timePosList:Vector.<int>;
		//记录时间提醒的时间
		private var _hintTimeList:Vector.<String>;
		
		//离线提示的消息位置
		public var offLineHintPos:int;
		//屏蔽提示的消息位置
		public var blackHintPos:int;
		//历史记录提示的消息位置
		private var _historyPos:int;
		private var _lastChatTime:Number;
		private var _waitMsgNum:int = 0;
		public function PrivateChaterVo() 
		{
			isRquestState = false;
			isOnLine = true;
			chatHash = new HashMap();
			_chatList = new Vector.<ChatInfo>();
			_timePosList = new Vector.<int>();
			_hintTimeList = new Vector.<String>();
			id = 0;
			openWindowTime = 0;
			level = 1;
			race = 1;
		}
		
		public function get waitMsgNum():int
		{
			return _waitMsgNum;
		}
		
		public function clearWaitMsg():void
		{
			_waitMsgNum = 0;
		}

		public function get chatList():Vector.<ChatInfo>
		{
			return _chatList;
		}

		/** 存入信息 */
		public function putMsg(info:ChatInfo, isCach:Boolean = false,isWait:Boolean = false ):void
		{
			if (chatHash.getValue(info.talkTime) != null)
			{
				removeChatInfo(info.talkTime);
			}
			if (isCach)
			{
				//如果是聊天记录
				if (chatList.length < MAX_LINE_PRIVATE_MAX)
				{
					chatList.unshift(info);
				}
			}
			else
			{
				chatList.push(info);
			}
			chatHash.add(info.talkTime, info);
			_lastChatTime = info.talkTime;
			if(isWait)
			{
				_waitMsgNum ++;
			}
		}
		
		/** 当前缓存的私聊记录的最大时间 */
		public function get lastChatTime():Number
		{
			return _lastChatTime;
		}
		
		/** 根据时间删除一条重复的信息记录 */
		private function removeChatInfo(cTime:Number):void
		{
			var len:int = chatList.length;
			var cInfo:ChatInfo;
			for (var i:int = 0; i < len;i++)
			{
				cInfo = chatList[i];
				if (cInfo.talkTime == cTime)
				{
					chatList.splice(i, 1);
					return;
				}
			}
		}
		
		/** 得到信息总条数 */
		public function get chatAmount():int
		{
			return chatList.length;
		}
		
		/** 记录当前消息号为当前时间线位置 */
		public function recordTimeHintPos(timeInfo:String):void
		{
			_hintTimeList.push(timeInfo);
			_timePosList.push(chatList.length - 1);
		}
	
		/** 得到所有时间线编号 切换刷新窗口时使用 */
		public function get timePosList():Vector.<int> 
		{
			return _timePosList;
		}
		/** 得到所有记录的需要提醒的时间*/
		public function get hintTimeList():Vector.<String> 
		{
			return _hintTimeList;
		}
		
		/** 得到当前时间线是否和上一条重合，重合时不创建(暂时不用) */
		public function getEqualTimePos():Boolean
		{
			if (_timePosList.length < 1) return false;
			else return _timePosList[_timePosList.length - 1] == (chatAmount - 1);
		}
		/** 刷新离线提示的位置 */
		public function updateOfflineHintPos():void
		{
			offLineHintPos = chatAmount - 1;
		}
		public function getEqualOfflineHint():Boolean
		{
			if (chatAmount > 0) return offLineHintPos == chatAmount - 1;
			else return true;
		}
		
		/** 刷新被拉黑提示的位置 */
		public function updateBlackHintPos():void
		{
			blackHintPos = chatAmount - 1;
		}
		public function getEqualBlackHint():Boolean
		{
			if (chatAmount > 0) return blackHintPos == chatAmount - 1;
			else return true;
		}
		
		/** 刷新历史记录条的消息位置 */
		public function undateHistoryPos(index:int):void
		{
			(index >= 0)?(_historyPos += index):(_historyPos = 0);
			
			updateHistoryChatInfo();
		}
		
		private function updateHistoryChatInfo():void 
		{
			var len:int = chatList.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (i <= _historyPos) 
				{
					chatList[i].isHistoryTask = true;
				}
			}
		}
		
		public function get historyPos():int 
		{
			return _historyPos;
		}
		
		//自己的职业
		public function get race():int 
		{
			return _race;
		}
		
		public function set race(value:int):void 
		{
			_race = value;
			
			var cInfo:ChatInfo;
			var len:int = chatList.length;
			for (var i:int = 0; i < len; i++) 
			{
				cInfo = chatList[i];
//				if (!cInfo.isMyTalk)
//				{
//					cInfo.race = value;
//				}
			}
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
//			_fullName = PlayerUtil.getUnionName(id, value);
		}
		
		
		private var _fullName:String;
		/** 包含盟号的完整名字 */
		public function get fullName():String
		{
			return _fullName;
		}
		
		/**
		 * 得到20条聊天记录
		 * @param	firstMsg当前窗口显示消息的第一条内容的时间
		 * @return
		 */
		public function getTwentyChats(talkTime:Number):Vector.<ChatInfo>
		{
		
			var index:int = -1;
			var len:int = chatList.length;
			if (len == 0) return null;
			
			for (var i:int = 0; i < len; i++) 
			{
				if (chatList[i].talkTime == talkTime)
				{
					index = i;
					break;
				}
			}
			
			var list:Vector.<ChatInfo> = new Vector.<ChatInfo>();
			var start:int = index - 20;
			var end:int = (index == -1)?len:index;
			if (start < 0) start = 0;
			//窗口是空的，从后往前返回20条
			for (i = start; i < end; i++)
			{
				if (chatList[i] != null) list.push(chatList[i]);
			}
			return list;
		}
		
		private function outPutTimes():void
		{
			var len:int = chatList.length;
			for (var i:int = 0; i < len; i++) 
			{
			}
		}
		
		
		public function clearData():void
		{
			_hintTimeList.length = 0;
			_timePosList.length = 0;
			chatList.length = 0;
			chatHash.clear();
		}
		
		public function putOfflineMsg():void
		{
			_waitMsgNum ++;
		}
	}

}