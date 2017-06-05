package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.netData.drop.message.ResDropRollItemInfoMessage;
	import com.rpgGame.netData.drop.message.ResDropRollResultInfoMessage;
	import com.rpgGame.netData.drop.message.ResGetRollItemMessage;
	import com.rpgGame.netData.drop.message.SCChangeMasterMessage;
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	public class RollCmdListener extends BaseBean
	{
		public function RollCmdListener()
		{
			super();
		}
		override public function start() : void
		{
			SocketConnection.addCmdListener(210101,getResDropRollItemInfoMessage);
			SocketConnection.addCmdListener(210102,getResDropRollResultInfoMessage);
			SocketConnection.addCmdListener(210103,getResGetRollItemMessage);
			SocketConnection.addCmdListener(210104,SCChangeMasterHandlerM);
			finish();
		}
		
		private function SCChangeMasterHandlerM(msg:SCChangeMasterMessage):void
		{
			// TODO Auto Generated method stub
			DropGoodsManager.getInstance().changeSceneItemMaster(msg.uniqueId,msg.ownerId);
		}
		
		private function getResDropRollItemInfoMessage(msg:ResDropRollItemInfoMessage):void
		{
			DropGoodsManager.getInstance().addRollGoods(msg.rollInfo);
		}
		private function getResDropRollResultInfoMessage(msg:ResDropRollResultInfoMessage):void
		{
			DropGoodsManager.getInstance().refashRollGoods(msg);
		}
		private function getResGetRollItemMessage(msg:ResGetRollItemMessage):void
		{
			DropGoodsManager.getInstance().resultRollGoods(msg);
		}
	}
}