package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.goods.SevendayManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.coreData.enum.EmMainBtnID;
	import com.rpgGame.netData.gameactivities.message.ResGotSuccessMessage;
	import com.rpgGame.netData.gameactivities.message.ResGrownInfoMessage;
	import com.rpgGame.netData.gameactivities.message.SCOnlineInfoMessage;
	import com.rpgGame.netData.gameactivities.message.SCOnlineRewardMessage;
	import com.rpgGame.netData.gameactivities.message.SCRewardSuccessMessage;
	import com.rpgGame.netData.gameactivities.message.SCSevenDayGiftinfoMessage;
	import com.rpgGame.netData.sign.message.ResSendSignInfoToClientMessage;
	import com.rpgGame.netData.sign.message.ResSendSignResultToClientMessage;
	import com.rpgGame.netData.sign.message.ResSignObtainAwardMessage;
	import com.rpgGame.netData.sign.message.ResSignSumAwardResultToClientMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 * 服务器活动消息处理
	 * @author YT
	 */
	public class ServerActiveCmdListener extends BaseBean
	{
		public function ServerActiveCmdListener()
		{
			super();
		}
		override public function start():void
		{
			/*——————————————————————————7日豪礼————————————————————————————————————————————*/
			SocketConnection.addCmdListener(410101, onSCSevenDayGiftinfoMessage);//7日豪礼
			SocketConnection.addCmdListener(410102, onSCRewardSuccessMessage);//7日豪礼领奖成功
			
			/*等级礼包*/
			SocketConnection.addCmdListener(192101, onResGrownInfoMessage);
			SocketConnection.addCmdListener(192102, onResGotSuccessMessage);
			/*在线奖励*/
			SocketConnection.addCmdListener(411101, onSCOnlineInfoMessage);
			SocketConnection.addCmdListener(411102, onSCOnlineRewardMessage);
			/*每日签到*/
			SocketConnection.addCmdListener(154101, onResSendSignInfoToClientMessage);
			SocketConnection.addCmdListener(154102, onResSendSignResultToClientMessage);
			SocketConnection.addCmdListener(154104, onResSignObtainAwardMessage);
			SocketConnection.addCmdListener(154103, onResSignSumAwardResultToClientMessage);
			
			finish();
		}
		/**7日豪礼*/
		private function onSCSevenDayGiftinfoMessage(msg:SCSevenDayGiftinfoMessage):void
		{
			SevendayManager.setSevenData(msg.loginDay,msg.info);
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SEVENDAY_UPDATE);
			MainButtonManager.openActivityButton(EmMainBtnID.QIRIHAOLI);
			MainButtonManager.setActivityPointNumButton(EmMainBtnID.QIRIHAOLI,SevendayManager.getRewardNum(1));
		}
		/**7日豪礼领奖成功*/
		private function onSCRewardSuccessMessage(msg:SCRewardSuccessMessage):void
		{
			SevendayManager.setRewardSeccessData(msg.success);
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SEVENDAY_REWARD);
			if(SevendayManager.getRewardNum(2)==SevendayManager.rewardSuccess.length)
			{
				MainButtonManager.closeActivityButton(EmMainBtnID.QIRIHAOLI);
			}
			else
			{
				MainButtonManager.setActivityPointNumButton(EmMainBtnID.QIRIHAOLI,SevendayManager.getRewardNum(1));
			}
			
		}
		
		/**等级礼包领取反馈数据*/
		private function onResGotSuccessMessage(msg:ResGotSuccessMessage):void
		{
			Mgr.dengjiMgr.onResGotSuccessMessage(msg);
		}
		
		/**等级礼包数据*/		
		private function onResGrownInfoMessage(msg:ResGrownInfoMessage):void
		{
			Mgr.dengjiMgr.onResGrownInfoMessage(msg);
		}
		
		/**在线信息数据*/
		private function onSCOnlineInfoMessage(msg:SCOnlineInfoMessage):void
		{
			Mgr.zaiXianMgr.onSCOnlineInfoMessage(msg);
		}
		
		/**在线奖励领取反馈*/		
		private function onSCOnlineRewardMessage(msg:SCOnlineRewardMessage):void
		{
			Mgr.zaiXianMgr.onSCOnlineRewardMessage(msg);
		}
		
		/**签到信息数据*/
		private function onResSendSignInfoToClientMessage(msg:ResSendSignInfoToClientMessage):void
		{
			Mgr.signMgr.onResSendSignInfoToClientMessage(msg);
		}
		
		/**签到结果反馈*/		
		private function onResSendSignResultToClientMessage(msg:ResSendSignResultToClientMessage):void
		{
			Mgr.signMgr.onResSendSignResultToClientMessage(msg);
		}
		
		/**VIP额外签到领取反馈*/
		private function onResSignObtainAwardMessage(msg:ResSignObtainAwardMessage):void
		{
			Mgr.signMgr.onResSignObtainAwardMessage(msg);
		}
		
		/**在线奖励领取反馈*/		
		private function onResSignSumAwardResultToClientMessage(msg:ResSignSumAwardResultToClientMessage):void
		{
			Mgr.signMgr.onResSignSumAwardResultToClientMessage(msg);
		}
	}
	
}