package com.rpgGame.app.sender
{
	import com.rpgGame.netData.cheats.message.CSActiveCheatsMessage;
	import com.rpgGame.netData.cheats.message.CSSetUpNodeMessage;
	import com.rpgGame.netData.cheats.message.CSlevelUpNodeMessage;
	import com.rpgGame.netData.meridian.message.CSMeridianInfosMessage;
	import com.rpgGame.netData.meridian.message.CSSetUpAcuPointsMessage;
	import com.rpgGame.netData.meridian.message.CSlevelUpAcuPointsMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 *心法
	 * @author Administrator
	 * 
	 */	
	public class CheatsSender extends BaseSender
	{
		public function CheatsSender()
		{
			super();
		}
		
		public static function reqLevelUpPoint(merId:int,pointId:int):void
		{
			var msg:CSlevelUpNodeMessage=new CSlevelUpNodeMessage();
			msg.cheatsId=merId;
			msg.nodeId=pointId;
			SocketConnection.send(msg);
		}
		public static function reqActiveCheats(cid:int):void
		{
			var msg:CSActiveCheatsMessage=new CSActiveCheatsMessage();
			msg.cheatsId=cid;
			SocketConnection.send(msg);
		}
		public static function reqSetUpPoint(merId:int,pointId:int,stoneItem:long):void
		{
			var msg:CSSetUpNodeMessage=new CSSetUpNodeMessage();
			msg.cheatsId=merId;
			msg.nodeId=pointId;
			msg.itemId=stoneItem;
			SocketConnection.send(msg);
		}
	}
}