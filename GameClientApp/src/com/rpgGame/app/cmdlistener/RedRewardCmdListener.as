package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.netData.redreward.message.SCGetRedRewardInfoMessage;
	import com.rpgGame.netData.redreward.message.SCGetRedRewardInfosMessage;
	import com.rpgGame.netData.redreward.message.SCGetRedRewardLogMessage;
	import com.rpgGame.netData.redreward.message.SCRedRewardListMessage;
	import com.rpgGame.netData.redreward.message.SCSendRedRewardMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	public class RedRewardCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(254101, getSCGetRedRewardInfoMessage);
			SocketConnection.addCmdListener(254102, getSCGetRedRewardInfosMessage);
			SocketConnection.addCmdListener(254103, getSCGetRedRewardLogMessage);
			SocketConnection.addCmdListener(254105, getSCRedRewardListMessage);
			SocketConnection.addCmdListener(254106, getSCSendRedRewardMessage);
			finish();
		}
		
		private function getSCGetRedRewardInfoMessage(msg:SCGetRedRewardInfoMessage):void
		{
			RedRewardManager.instance().updataCountInfo(msg);
		}
		
		private function getSCGetRedRewardInfosMessage(msg:SCGetRedRewardInfosMessage):void
		{
			RedRewardManager.instance().updataRedRewardList(msg.rewardInfoList,msg.seftCount,msg.isMore);
		}
		
		private function getSCGetRedRewardLogMessage(msg:SCGetRedRewardLogMessage):void
		{
			RedRewardManager.instance().updataMouthTotal(msg.monthCount);
			RedRewardManager.instance().updataRedTewardLogLists(msg.loglist);
		}
		
		
		private function getSCRedRewardListMessage(msg:SCRedRewardListMessage):void
		{
			RedRewardManager.instance().updataMouthTotal(msg.monthCount);
			RedRewardManager.instance().updataRedRewardStates(msg.redRewards);
		}
		private function getSCSendRedRewardMessage(msg:SCSendRedRewardMessage):void
		{
			RedRewardManager.instance().updataRedRewardInfo(msg.redReward);
		}
	}
}