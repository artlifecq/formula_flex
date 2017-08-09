package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.netData.player.message.SCNoticeMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 * 通知消息管理
	 * @author yt
	 * 
	 */	
	public class NotifyCmdListener  extends BaseBean
	{
		public function NotifyCmdListener()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(103215, onNoticeMessage );
			finish();
		}
		private function onNoticeMessage(msg:SCNoticeMessage):void
		{
			/*var arr:Array = [];
			for(var i:int = 0;i<msg.values.length;i++)
			{
				arr.push(msg.values[i]);
			}*/
//			NoticeManager.showNotifyById(msg.noticeIndex,"",arr);
			NoticeManager.showNotifyByMsg(msg);
		}
	}
}