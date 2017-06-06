package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.netData.specialactivities.message.SCActivitiesNotifyListMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivitiesListMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityCloseMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityOpenMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class SpecialActivitiesCmdListener extends BaseBean
	{
		public function SpecialActivitiesCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(162101,onSCSpecialActivitiesListMessage);
			SocketConnection.addCmdListener(162102,onSCSpecialActivityOpenMessage);
			SocketConnection.addCmdListener(162103,onSCSpecialActivityCloseMessage);
			SocketConnection.addCmdListener(162104,onSCActivitiesNotifyListMessage);
			finish();
		}
		
		private function onSCActivitiesNotifyListMessage(msg:SCActivitiesNotifyListMessage):void
		{
			
		}
		
		private function onSCSpecialActivitiesListMessage(msg:SCSpecialActivitiesListMessage):void
		{
			
		}
		
		private function onSCSpecialActivityCloseMessage(msg:SCSpecialActivityCloseMessage):void
		{
			
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			
		}
	}
}