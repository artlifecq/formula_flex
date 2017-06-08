package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.D1v1BattleSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.info.DRankWeekReward;
	import com.rpgGame.netData.pvp.bean.DianFengDataInfo;
	import com.rpgGame.netData.pvp.message.SCDrawDianFengAwardMessage;
	import com.rpgGame.netData.pvp.message.SCMatchingResultMessage;
	import com.rpgGame.netData.pvp.message.SCOpenDianFengPanelMessage;
	import com.rpgGame.netData.pvp.message.SCOpenDianFengRankMessage;
	import com.rpgGame.netData.pvp.message.SCQuitRaceResultMessage;
	import com.rpgGame.netData.pvp.message.SCRaceResultMessage;
	import com.rpgGame.netData.pvp.message.SCReadyToLoadMessage;
	import com.rpgGame.netData.pvp.message.SCReadyToStartMessage;
	import com.rpgGame.netData.pvp.message.SCStartRaceMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class D1v1Manager
	{
		public static var ins:D1v1Manager=new D1v1Manager();
		private var _weekRanks:Vector.<DRankWeekReward>;
		private var _data:DianFengDataInfo;
		public function D1v1Manager()
		{
		}
		public function getRankReward():Vector.<DRankWeekReward>
		{
			if (_weekRanks==null) 
			{
				_weekRanks=new Vector.<DRankWeekReward>();
				var tmp:DRankWeekReward;
				var len:int=GlobalSheetData.getIntValue(810);
				for (var i:int = 0; i < len; i++) 
				{
					var obj:Object=JSONUtil.decode(GlobalSheetData.getStrValue(811+i));
					//var 
					tmp=new DRankWeekReward();
					tmp.minRank=obj.rank[0];
					tmp.maxRank=obj.rank[1];
					tmp.reward=obj.reward;
				}
				
			}
			return _weekRanks;
		}
		public  function reqDFMatch():void
		{
			D1v1BattleSender.reqDFMatch();
		}
		public  function reqGetReward():void
		{
			D1v1BattleSender. reqGetReward();
			
		}
		public  function reqPanelData():void
		{
			D1v1BattleSender.reqPanelData();
		
		}
		public  function reqDFRankData(page:int):void
		{
			D1v1BattleSender.reqDFRankData(page);
			
		}
		public  function reqQuitRaceGame():void
		{
			D1v1BattleSender.reqQuitRaceGame();
			
		}
		public function CSMatchingResultHandler(msg:SCMatchingResultMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.result==1) 
			{
				AppManager.showApp(AppConstant.BATTLE_D1V1_MATCH_PANEL,msg.delayTime);
			}
		}
		public function SCReadyToLoadHandler(msg:SCReadyToLoadMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		public function SCReadyToStartHandler(msg:SCReadyToStartMessage):void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_D1V1_READY_PANEL,msg.delayTime);
			AppManager.showApp(AppConstant.BATTLE_D1V1_HEAD_PANEL);
		}
		public function SCStartRaceHandler(msg:SCStartRaceMessage):void
		{
			// TODO Auto Generated method stub
			//开始了要走倒计时了
			EventManager.dispatchEvent(D1v1Event.ACTIVITY_FIGHT_START);
			
		}
		public function SCRaceResultHandler(msg:SCRaceResultMessage):void
		{
			// TODO Auto Generated method stub
			//战斗结束
			AppManager.hideApp(AppConstant.BATTLE_D1V1_HEAD_PANEL);
		}
		public function SCQuitRaceResultHandler(msg:SCQuitRaceResultMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		public function SCOpenDianFengPanelHandler(msg:SCOpenDianFengPanelMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.dianFengDataInfo;
			EventManager.dispatchEvent(D1v1Event.GET_PANEL_DATA);
		}
		public function SCOpenDianFengRankHandler(msg:SCOpenDianFengRankMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(D1v1Event.GET_RANK_DATA,msg);
		}
		public function SCDrawDianFengAwardHandler(msg:SCDrawDianFengAwardMessage):void
		{
			// TODO Auto Generated method stub
			
		}

		public function get data():DianFengDataInfo
		{
			return _data;
		}

	}
}
