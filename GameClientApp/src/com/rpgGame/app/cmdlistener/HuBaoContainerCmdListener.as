package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.netData.convoy.message.SCConvoyFailureMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyInfoMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyNumMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyToClientMessage;
	import com.rpgGame.netData.convoy.message.SCRefreshGirlMessage;
	import com.rpgGame.netData.convoy.message.SCSuccessInfoMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class HuBaoContainerCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(230101, onSCConvoyNumMessage);
			SocketConnection.addCmdListener(230102, onSCConvoyInfoMessage);		
			SocketConnection.addCmdListener(230105, onSCSuccessInfoMessage);
			SocketConnection.addCmdListener(230106, onSCRefreshGirlMessage);
			SocketConnection.addCmdListener(230107, onSCConvoyFailureMessage);
			SocketConnection.addCmdListener(230108, onSCConvoyToClientMessage);
			finish();
		}
		
		private function onSCConvoyInfoMessage(msg:SCConvoyInfoMessage):void
		{
			HuBaoManager.instance().onSCConvoyInfoMessage(msg);
		}
		
		private function onSCConvoyNumMessage(msg:SCConvoyNumMessage):void
		{
			HuBaoManager.instance().onSCConvoyNumMessage(msg);
		}
		
		private function onSCRefreshGirlMessage(msg:SCRefreshGirlMessage):void
		{
			HuBaoManager.instance().onSCRefreshGirlMessage(msg);
		}
		
		private function onSCSuccessInfoMessage(msg:SCSuccessInfoMessage):void
		{
			HuBaoManager.instance().onSCSuccessInfoMessage(msg);
		}
		
		private function onSCConvoyToClientMessage(msg:SCConvoyToClientMessage):void
		{
			HuBaoManager.instance().onSCConvoyToClientMessage(msg);
		}
		
		private function onSCConvoyFailureMessage(msg:SCConvoyFailureMessage):void
		{
			HuBaoManager.instance().onSCConvoyFailureMessage(msg);
		}
	}
}