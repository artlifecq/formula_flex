package com.rpgGame.app.manager
{
	import com.rpgGame.app.sender.RankTopSender;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.netData.top.bean.TopInfo;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class RankListManager
	{
		public static const PageListLength:int = 12;
		public static const PageAllListLength:int = 9;
		public function RankListManager():void
		{
		}
		private static var _instance:RankListManager;
		
		public static function get instance():RankListManager
		{
			if(_instance == null)
			{
				_instance = new RankListManager();
			}
			
			return _instance;
		}
		
		public function getcellLength(type:int):int
		{
			if(type == RankListType.ALL_DIANFENG_TYPE)
				return PageAllListLength;
			else
				return PageListLength;
		}
		
		public function updataToplistMessage(msg:ResToplistToClientMessage):void
		{
			if(msg==null)
				return ;
			if(msg.toptype != _currentrequestType)
				return ;
			updataListAndType(msg.topInfolist,msg.toptype);
			EventManager.dispatchEvent(RankListEvent.UPDATATYPEINFO,msg);
		}
		
		
		private var _rankList:Vector.<TopInfo>;
		public function updataListAndType(list:Vector.<TopInfo>,toptype:int):void
		{
			_rankList = list;
			EventManager.dispatchEvent(RankListEvent.UPDATAEVERYPAGELIST);
		}
		
		public function getRankListInfoByIndex(topType:int,index:int):TopInfo
		{
			if(_rankList == null||_rankList.length<=index)
				return null;
			return _rankList[index];
		}
		
		
		
		
		private var _currentrequestType:int;
		
		public function requestRankTypeInfo(type:int,page:int):void
		{
			_currentrequestType = type;
			var length:int = getcellLength(type);
			RankTopSender.reqRankList(type,page*length,length);
		}
	}
}