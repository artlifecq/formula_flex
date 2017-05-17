package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	import com.rpgGame.netData.dailyzone.message.CSBuyCountInfoMessage;
	import com.rpgGame.netData.dailyzone.message.CSGetDailyZonePanelMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonEnterMessage;
	
	import org.game.netCore.connection.SocketConnection;

	public class DailyZoneDataManager
	{
		private static var _instance:DailyZoneDataManager;
		public static function instance():DailyZoneDataManager
		{
			if(_instance==null)
			{
				_instance = new DailyZoneDataManager();
			}
			return _instance;
		}
		private var _allList:HashMap
		public function requestDailyInfo():void
		{
			SocketConnection.send(new CSGetDailyZonePanelMessage());
		}
		
		public function updataDailyList(list:Vector.<DailyZonePanelInfo>):void
		{
			_allList = new HashMap();
			for each(var info:DailyZonePanelInfo in list)
			{
				_allList.put(info.dailyzoneId,info);
			}
		}
		
		public function getInfoById(id:int):DailyZonePanelInfo
		{
			if(_allList==null)
				return null;
			return _allList.getValue(id) as DailyZonePanelInfo;
		}
		
		public function buyCount(info:DailyZonePanelInfo,isSure:Boolean = false):void
		{
			if(info==null)
				return ;
			
			if(info.canBuyCount<=0)
			{
				NoticeManager.showNotifyById(4002);
				return ;
			}
			if(isSure)
			{
				
			}else{
				srueBuyInfo(true,info);
			}
		}
		
		private function srueBuyInfo(res:Boolean,info:DailyZonePanelInfo):void
		{
			if(!res)
				return;
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			if(info.price<stat.getResData(CharAttributeType.RES_GOLD))
			{
				NoticeManager.showNotifyById(2008);
				return ;
			}
			
			var msg:CSBuyCountInfoMessage = new CSBuyCountInfoMessage();
			msg.dailyZoneId = info.dailyzoneId;
			SocketConnection.send(msg);
		}
		
		public function requestCombat(info:DailyZonePanelInfo):void
		{
			var msg:ReqZoneCommonEnterMessage = new ReqZoneCommonEnterMessage();
			msg.extradata = info.dailyzoneId;
			SocketConnection.send(msg);
		}
	}
}