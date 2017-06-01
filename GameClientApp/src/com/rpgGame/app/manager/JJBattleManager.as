package com.rpgGame.app.manager
{
	import com.rpgGame.app.sender.JJBattleSender;
	import com.rpgGame.netData.zhengba.message.SCChallengeDataMessage;
	import com.rpgGame.netData.zhengba.message.SCChallengeResultMessage;
	import com.rpgGame.netData.zhengba.message.SCDrawAwardResultMessage;
	import com.rpgGame.netData.zhengba.message.SCOpenArardPanelMessage;
	import com.rpgGame.netData.zhengba.message.SCUpdateZhengBaDataMessage;
	
	import org.game.netCore.data.long;

	public class JJBattleManager
	{
		public static var  ins:JJBattleManager=new   JJBattleManager();
		public function JJBattleManager()
		{
		}
		public  function reqChallegeRankData(type:int):void
		{
			JJBattleSender.reqChallegeRankData(type);
		}
		public  function reqGetReward():void
		{
			JJBattleSender.reqGetReward();
		}
		public  function reqStartFight(player:long):void
		{
			JJBattleSender.reqStartFight(player);
		}
		public  function reqRewardPanelData():void
		{
			JJBattleSender.reqRewardPanelData();
		}
		public function SCOpenArardPanelHandler(msg:SCOpenArardPanelMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function SCUpdateZhengBaDataHandler(msg:SCUpdateZhengBaDataMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function SCDrawAwardResultHandler( msg:SCDrawAwardResultMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function SCChallengeResultHandler(msg:SCChallengeResultMessage):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function SCChallengeDataHandler(msg:SCChallengeDataMessage):void
		{
			// TODO Auto Generated method stub
			
		}
	}
}