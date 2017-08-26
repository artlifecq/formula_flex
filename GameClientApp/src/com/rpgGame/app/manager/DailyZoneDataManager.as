package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.DungeonEvent;
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
//		public function requestDailyInfo():void
//		{
//			SocketConnection.send(new CSGetDailyZonePanelMessage());
//		}
		
		public function updataDailyList(list:Vector.<DailyZonePanelInfo>):void
		{
			_allList = new HashMap();
			for each(var info:DailyZonePanelInfo in list)
			{
				_allList.put(info.dailyzoneId,info);
			}
			EventManager.dispatchEvent(DungeonEvent.EQUIP_UPDATE_DAILYZONE_INFO);
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
			DungeonSender.reqBuyCount(info.dailyzoneId);
		}
		
		
		
		/**返回适合等级的副本id*/
		public function getFitLevelIdbyType(type:int,level:int):int
		{
			var list:Array=_allList.keys();
			var id:int=0;
			var maxlevel:int=0;
			for(var i:int=0;i<list.length;i++)
			{
				var info:DailyZonePanelInfo=getInfoById(list[i]);
				var q_mod:Q_daily_zone=DailyZoneCfgData.getZoneCfg(info.dailyzoneId);
				if(q_mod&&q_mod.q_combat_type==type&&q_mod.q_limit_level<=level&&maxlevel<q_mod.q_limit_level&&(info.remainCount!=0||info.canBuyCount!=0))
				{
					id=q_mod.q_id;
					maxlevel=q_mod.q_limit_level;
				}
			}
			return id;
		}
		
	}
}