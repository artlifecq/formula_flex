package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.junjie.message.SCJunJieActivateResultMessage;
	import com.rpgGame.netData.junjie.message.SCJunJieInfoListMessage;
	import com.rpgGame.netData.junjie.message.SCJunJieInfoUpdateListMessage;
	import com.rpgGame.netData.junjie.message.SCUpdateRoundMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class JunJieContainerCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(126101, onSCJunJieInfoListMessage);
			SocketConnection.addCmdListener(126103, onSCJunJieActivateResultMessage);
			SocketConnection.addCmdListener(126104, onSCJunJieInfoUpdateListMessage);
			SocketConnection.addCmdListener(126105, onSCUpdateRoundMessage);
			
			finish();
		}
		
		private function onSCJunJieInfoListMessage(msg:SCJunJieInfoListMessage):void
		{
			Mgr.junjieMgr.onSCJunJieInfoListMessage(msg);
		}
		
		private function onSCJunJieActivateResultMessage(msg:SCJunJieActivateResultMessage):void
		{
			Mgr.junjieMgr.onSCJunJieActivateResultMessage(msg);
		}
		
		private function onSCJunJieInfoUpdateListMessage(msg:SCJunJieInfoUpdateListMessage):void
		{
			Mgr.junjieMgr.onSCJunJieInfoUpdateListMessage(msg);
		}
		
		private function onSCUpdateRoundMessage(msg:SCUpdateRoundMessage):void
		{
			Mgr.junjieMgr.onSCUpdateRoundMessage(msg);
		}
	}
}