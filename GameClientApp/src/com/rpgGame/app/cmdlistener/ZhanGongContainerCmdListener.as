package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousInfoListMessage;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	public class ZhanGongContainerCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(125101, onMeritoriousInfoListMessage);
			SocketConnection.addCmdListener(125103, onMeritoriousUpgradeResultMessage);
			
			finish();
		}
		
		private function onMeritoriousInfoListMessage(msg:SCMeritoriousInfoListMessage):void
		{
			ZhanGongManager.sCMeritoriousInfoListMessage(msg);
		}
		
		private function onMeritoriousUpgradeResultMessage(msg:SCMeritoriousUpgradeResultMessage):void
		{
			ZhanGongManager.updateList(msg);			
		}
	}
}