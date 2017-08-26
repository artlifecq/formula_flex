package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.hint.FloatingText;
	import com.rpgGame.app.sender.D1v1BattleSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.info.DRankWeekReward;
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	import com.rpgGame.netData.dianfeng.message.SCDrawDianFengAwardMessage;
	import com.rpgGame.netData.dianfeng.message.SCMatchingResultMessage;
	import com.rpgGame.netData.dianfeng.message.SCOpenDianFengPanelMessage;
	import com.rpgGame.netData.dianfeng.message.SCOpenDianFengRankMessage;
	import com.rpgGame.netData.dianfeng.message.SCQuitRaceResultMessage;
	import com.rpgGame.netData.dianfeng.message.SCQuitZoneResultMessage;
	import com.rpgGame.netData.dianfeng.message.SCRaceResultMessage;
	import com.rpgGame.netData.dianfeng.message.SCReadyToLoadMessage;
	import com.rpgGame.netData.dianfeng.message.SCReadyToStartMessage;
	import com.rpgGame.netData.dianfeng.message.SCStartRaceMessage;
	
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
					_weekRanks.push(tmp);
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
			if (_data&&_data.drawAward==0) 
			{
				D1v1BattleSender. reqGetReward();
			}
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
				AppManager.showApp(AppConstant.BATTLE_D1V1_MATCH_PANEL,[0,msg.delayTime]);
			}
		}
		public function SCReadyToLoadHandler(msg:SCReadyToLoadMessage):void
		{
			// TODO Auto Generated method stub
			//AppManager.hideApp(AppConstant.BATTLE_D1V1_MATCH_PANEL);
			EventManager.dispatchEvent(D1v1Event.MATCH_OK,msg.delayTime);
		}
		public function SCReadyToStartHandler(msg:SCReadyToStartMessage):void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_D1V1_READY_PANEL,msg.delayTime);
			AppManager.showApp(AppConstant.BATTLE_D1V1_HEAD_PANEL,msg);
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
			AppManager.showApp(AppConstant.BATTLE_D1V1_RESULT_PANEL,msg);
		}
		public function SCQuitRaceResultHandler(msg:SCQuitRaceResultMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		public function SCOpenDianFengPanelHandler(msg:SCOpenDianFengPanelMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.dianFengDataInfo;
			EventManager.dispatchEvent(D1v1Event.GET_PANEL_DATA,msg.state);
		}
		public function SCOpenDianFengRankHandler(msg:SCOpenDianFengRankMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(D1v1Event.GET_RANK_DATA,msg);
		}
		public function SCDrawDianFengAwardHandler(msg:SCDrawDianFengAwardMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.result==1) 
			{
				_data.drawAward=1;
				EventManager.dispatchEvent(D1v1Event.GET_REWARD_RESULT);
			}
		}
		public function SCQuitZoneResultHandler(msg:SCQuitZoneResultMessage):void
		{
			if (msg.result==1) 
			{
				EventManager.dispatchEvent(D1v1Event.QUIT_FB_RESULT);
			}
			
		}
		public function get data():DianFengDataInfo
		{
			return _data;
		}
		/**
		 *等阶icon 
		 * @param ranklv
		 * @param size 0最大1，次之2最小
		 * @return 
		 * 
		 */		
		public function getRankIconUrl(ranklv:int,size:int):String
		{
			var qRank:Q_battle_rank=BattleRankCfg.getRank(ranklv);
			if (qRank) 
			{
				var resId:int=1000+qRank.q_rank/1000;
				if (0==size) 
				{
					return "ui/app/zhanchang/icon/"+resId+"_max.png"
				}
				else if (1==size) 
				{
					return "ui/app/zhanchang/icon/"+resId+"_min.png"
				}
				return "ui/app/zhanchang/icon/"+resId+"_24.png"
			}
			return "";
		}
		
		public function getRankName(ranklv:int,isSmall:Boolean):String
		{
			if (isSmall) 
			{
				return "ui/app/zhanchang/icon/name2/"+ranklv+".png";
			}
			return "ui/app/zhanchang/icon/name/"+ranklv+".png";
		}
		public function autoJoin():void
		{
			if (FunctionOpenManager.functionIsOpen(EmFunctionID.EM_DIANFENGDUIJUE)) 
			{
				reqDFMatch();
				FunctionOpenManager.openAppPaneById(EmFunctionID.EM_DIANFENGDUIJUE);
			}
			else
			{
				FloatingText.showUp(NotifyCfgData.getNotifyTextByID(61040));
			}
		}
	}
}
