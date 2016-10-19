package com.rpgGame.app.manager.chat
{
	import com.rpgGame.coreData.info.chat.ChatData;
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.coreData.type.chat.EnumChatTabsType;
	
	import flash.utils.Dictionary;
	
	
	/**
	 * 聊天消息数据 
	 * @author luguozheng
	 * 
	 */	
	public class ChatDataManager
	{
		private var _chatDataDic:Dictionary;
		
		private var _allChanel:ChatData;	    //综合
		private var _laBaChanel:ChatData;		//喇叭
		private var _sheHuiChanel:ChatData;     //社会
		private var _geRenChanel:ChatData;      //个人
		private var _ziDingYiOneChanel:ChatData;   //自定义1
		private var _ziDingYiTwoChanel:ChatData;   //自定义2
		
		/**
		 * 显示频道 
		 */		
		public function ChatDataManager()
		{
			init();
		}
		
		private static var _instance:ChatDataManager;
		public static function GetInstance():ChatDataManager
		{
			if( _instance == null )
				_instance = new ChatDataManager();
			return _instance;
		}
		
		private function init():void
		{
			_allChanel = new ChatData(100);
			_sheHuiChanel = new ChatData(100);
			_geRenChanel = new ChatData(100);
			_laBaChanel = new ChatData(100);
			_ziDingYiOneChanel = new ChatData(100);
			_ziDingYiTwoChanel = new ChatData(100);
			_chatDataDic = new Dictionary();
			_chatDataDic[EnumChatTabsType.TABS_ALL] = _allChanel;
			_chatDataDic[EnumChatTabsType.TABS_SHEHUI] = _sheHuiChanel;
			_chatDataDic[EnumChatTabsType.TABS_GEREN] = _geRenChanel;
			_chatDataDic[EnumChatTabsType.TABS_LABA] = _laBaChanel;
			_chatDataDic[EnumChatTabsType.TABS_ZIDINGYIONE] = _ziDingYiOneChanel;
			_chatDataDic[EnumChatTabsType.TABS_ZIDINGYITWO] = _ziDingYiTwoChanel;
		}		
		
		/**
		 * 得到某个频道里的所有聊天消息
		 * @param channel
		 * @return 
		 * 
		 */		
		public function getChatData( channel:int ):ChatData
		{
			return _chatDataDic[ channel ];
		}
		
		/**
		 * 存入消息到某频道里
		 * @param info
		 * 
		 */		
		public function putChatData( info:ChatInfo ):void
		{
			if( ChatManager.isShowInAll(info.channel) )
			{
				_allChanel.push(info);
			}
			if( ChatManager.isShowInSheHui(info.channel) )
			{
				_sheHuiChanel.push(info);
			}
			if( ChatManager.isShowInGeRen(info.channel) )
			{
				_geRenChanel.push(info);
			}
			if( ChatManager.isShowInLaba(info.channel) )
			{
				_laBaChanel.push(info);
			}
			if( ChatManager.isShowInZiDingYiOne(info.channel) )
			{
				_ziDingYiOneChanel.push(info);
			}
			if( ChatManager.isShowInZiDingYiTwo(info.channel) )
			{
				_ziDingYiTwoChanel.push(info);
			}
		}
		
	}
}