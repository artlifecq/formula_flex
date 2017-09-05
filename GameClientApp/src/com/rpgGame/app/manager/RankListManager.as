package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.RankTopSender;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.SculptureData;
	import com.rpgGame.netData.top.bean.TopInfo;
	import com.rpgGame.netData.top.message.ResToplistToClientMessage;
	import com.rpgGame.netData.top.message.SCUpdateTopLeaderTitleMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class RankListManager
	{
		public static const PageListLength:int = 12;
		public static const PageAllListLength:int = 9;
		public function RankListManager():void
		{
			init();
		}

		

		private function init():void
		{
			var itemInfos:Object = JSONUtil.decode( GlobalSheetData.getSettingInfo(839).q_string_value);
			_addExp = itemInfos[0]["num"] ;
			itemInfos = JSONUtil.decode( GlobalSheetData.getSettingInfo(840).q_string_value);
			_glodExp = itemInfos[0]["num"] ;
			_glodAddPercent = 0;
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
		public function requestworshop(scene:SceneRole):void
		{
			var role :SculptureData = scene.data as SculptureData;
			if(role==null)
				return ;
			if(role.topType != RankListType.All_COMBATPOWER_TYPE)
				return ;
			RankTopSender.reqRankListTopInfo(RankListType.All_COMBATPOWER_TYPE);
		}
		
		private var _worshTopInfo:TopInfo;
		public function refeashWorshipInfo(topInfo:TopInfo):void
		{
			_worshTopInfo = topInfo;
			FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_WORSHIP,topInfo);
		}
		
		private var _addExp:int;
		public function get getExp():int
		{
			return _addExp;
		}
		
		private var _glodExp:int;
		public function get glodExp():int
		{
			return _glodExp*(1+_glodAddPercent);
		}
		
		private var _glodAddPercent:Number;
		
		public function get glodAddPercent():Number
		{
			return _glodAddPercent;
		}
		
		public function get glodAddExp():int
		{
			return _glodExp*_glodAddPercent;
		}
		
		private var _worshipCount:int;
		private var _worshipGlodCount:int;
		public function refeashWorshipCount(count:int,glodCount:int,percentage:int):void
		{
			_worshipCount = count;
			_worshipGlodCount = glodCount;
			_glodAddPercent = percentage/100;
			EventManager.dispatchEvent(RankListEvent.UPDATAEVERYPAGELIST);
		}
		public function requesWorship(type:int):void
		{
			var count:int = _worshipGlodCount;
			if(type == 1)
				count = _worshipCount;
			if(count == 0)
			{
				NoticeManager.showNotifyById(90201);
				return  ;
			}
			RankTopSender.reqWorship(_worshTopInfo.playerid,type);
		}
		
		public function playerRankTileChange(msg:SCUpdateTopLeaderTitleMessage):void
		{
			// TODO Auto Generated method stub
			var player:SceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if (player) 
			{
				(player.data as HeroData).topLeaderTypes=msg.topLeaderTypes;
				(player.headFace as HeadFace).addAndUpdataRankTitle(msg.topLeaderTypes);
			}
		}
	}
}