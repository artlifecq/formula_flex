package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	import com.rpgGame.netData.dailyzone.message.CSBuyCountInfoMessage;
	import com.rpgGame.netData.dailyzone.message.CSGetDailyZonePanelMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonEnterMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

	public class DailyZoneDataManager
	{
		public static var UPDATEDAILYZONEINFO:int = UNIQUEID.NEXT;
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
			EventManager.dispatchEvent(UPDATEDAILYZONEINFO);
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
				NoticeManager.showNotifyById(21000);
				return ;
			}
			if(isSure)
			{
				var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.BuyCombatCount, info.price);
				GameAlert.showAlert(alertSet,alertCb,info);
			}else{
				srueBuyInfo(true,info);
			}
		}
		
		private function alertCb(art:GameAlert,info:DailyZonePanelInfo):void
		{
			if(art.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				srueBuyInfo(true,info);
			}
		}
		
		private function srueBuyInfo(res:Boolean,info:DailyZonePanelInfo):void
		{
			if(!res)
				return;
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			if(info.price>stat.getResData(CharAttributeType.RES_GOLD))
			{
				NoticeManager.showNotifyById(21005);
				return ;
			}
			
			var msg:CSBuyCountInfoMessage = new CSBuyCountInfoMessage();
			msg.dailyZoneId = info.dailyzoneId;
			SocketConnection.send(msg);
		}
		
		public function requestCombat(info:DailyZonePanelInfo):void
		{
			var msg:ReqZoneCommonEnterMessage = new ReqZoneCommonEnterMessage();
			var q_data:Q_daily_zone = DailyZoneCfgData.getZoneCfg(info.dailyzoneId);
			msg.zoneModelid = q_data.q_zone_id;
			msg.extradata = q_data.q_id;
			SocketConnection.send(msg);
		}
	}
}