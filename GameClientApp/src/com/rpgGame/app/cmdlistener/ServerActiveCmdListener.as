package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.goods.SevendayManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.netData.gameactivities.message.ResGotSuccessMessage;
	import com.rpgGame.netData.gameactivities.message.ResGrownInfoMessage;
	import com.rpgGame.netData.gameactivities.message.SCRewardSuccessMessage;
	import com.rpgGame.netData.gameactivities.message.SCSevenDayGiftinfoMessage;
	
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
			
			finish();
		}
		/**7日豪礼*/
		private function onSCSevenDayGiftinfoMessage(msg:SCSevenDayGiftinfoMessage):void
		{
			SevendayManager.setSevenData(msg.loginDay,msg.info);
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SEVENDAY_UPDATE);
		}
		/**7日豪礼领奖成功*/
		private function onSCRewardSuccessMessage(msg:SCRewardSuccessMessage):void
		{
			SevendayManager.setRewardSeccessData(msg.success);
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SEVENDAY_REWARD);
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
	}
	
}