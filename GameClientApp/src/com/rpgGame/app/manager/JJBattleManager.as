package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.JJBattleSender;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	import com.rpgGame.netData.zhengba.message.SCChallengeDataMessage;
	import com.rpgGame.netData.zhengba.message.SCChallengeResultMessage;
	import com.rpgGame.netData.zhengba.message.SCDrawAwardResultMessage;
	import com.rpgGame.netData.zhengba.message.SCOpenArardPanelMessage;
	import com.rpgGame.netData.zhengba.message.SCUpdateZhengBaDataMessage;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;

	public class JJBattleManager
	{
		public static var  ins:JJBattleManager=new   JJBattleManager();
		private var _data:ZhengBaData;
		private var _max:int=-1;
		public function getMaxRankLv():int
		{
			if (_max==-1) 
			{
				
				var num:int=GlobalSheetData.getIntValue(800);
				var gmax:String=GlobalSheetData.getStrValue(800+num);
				var obj:Object=JSONUtil.decode(gmax);
				_max=obj[0].rank[0];
			}
		
			return _max;
		}
		public function JJBattleManager()
		{
		}
		public function reqBuyTimesOrPower(type:int):void
		{
			JJBattleSender.reqBuyTimeOrPower(type);
		}
		public  function reqChallegeRankData(type:int):void
		{
			JJBattleSender.reqChallegeRankData(type);
		}
		public  function reqGetReward():void
		{
			JJBattleSender.reqGetReward();
		}
		private var lastTime:int;
		public  function reqStartFight(player:long,type:int):void
		{
			if (getTimer()-lastTime<1000) 
			{
				return;
			}
			lastTime=getTimer();
			JJBattleSender.reqStartFight(player,type);
		}
		public  function reqRewardPanelData():void
		{
			JJBattleSender.reqRewardPanelData();
		}
		public function SCOpenArardPanelHandler(msg:SCOpenArardPanelMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(JJBattleEvent.GET_REWARD_PANEL_DATA,msg.win,msg.defeat,msg.reputation);
		}
		
		public function SCUpdateZhengBaDataHandler(msg:SCUpdateZhengBaDataMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.zhengBaData;
			EventManager.dispatchEvent(JJBattleEvent.GET_PANEL_DATA);
		}
		
		public function SCDrawAwardResultHandler( msg:SCDrawAwardResultMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.result==1) 
			{
				data.drawAward=1;
			}
			EventManager.dispatchEvent(JJBattleEvent.GET_REWARD_RESULT,msg.result);
		}
		
		public function SCChallengeResultHandler(msg:SCChallengeResultMessage):void
		{
			// TODO Auto Generated method stub
			EventManager.dispatchEvent(JJBattleEvent.GET_FIGHT_RESULT,msg);
		}
		
		public function SCChallengeDataHandler(msg:SCChallengeDataMessage):void
		{
			// TODO Auto Generated method stub
			_data=msg.zhengBaData;
			EventManager.dispatchEvent(JJBattleEvent.GET_PANEL_DATA);
			EventManager.dispatchEvent(JJBattleEvent.GET_FIGHTERS_DATA,msg.type,msg.zhengBaBriefInfo);
		}

		public function get data():ZhengBaData
		{
			return _data;
		}

	}
}