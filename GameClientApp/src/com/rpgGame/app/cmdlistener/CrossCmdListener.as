package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.sender.CrossSender;
	import com.rpgGame.netData.cross.message.ResChangeServerGameToClientMessage;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *跨服相关处理
	 *@author dik
	 *2017-5-24下午3:23:42
	 */
	public class CrossCmdListener extends BaseBean
	{
		public function CrossCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(250101, onResChangeServerGameToClient );
			finish();
		}
		
		private function onResChangeServerGameToClient( msg:ResChangeServerGameToClientMessage ):void
		{
			TweenLite.delayedCall(2,function():void{//因为后台处理需要1-2秒时间
				CrossSender.reqEnterCrossFight(msg);
			});
		}
	}
}