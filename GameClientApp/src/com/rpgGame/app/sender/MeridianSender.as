package com.rpgGame.app.sender
{
	import com.rpgGame.netData.meridian.message.CSMeridianInfosMessage;
	import com.rpgGame.netData.meridian.message.CSSetUpAcuPointsMessage;
	import com.rpgGame.netData.meridian.message.CSlevelUpAcuPointsMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 *经脉sender 
	 * @author Administrator
	 * 
	 */	
	public class MeridianSender extends BaseSender
	{
		public function MeridianSender()
		{
			super();
		}
		
		public static function reqLevelUpPoint(merId:int,pointId:int):void
		{
			var msg:CSlevelUpAcuPointsMessage=new CSlevelUpAcuPointsMessage();
			msg.MeridId=merId;
			msg.acuPointId=pointId;
			SocketConnection.send(msg);
		}
		public static function reqMeridianInfo():void
		{
			var msg:CSMeridianInfosMessage=new CSMeridianInfosMessage();
			SocketConnection.send(msg);
		}
		public static function reqSetUpPoint(merId:int,pointId:int,stoneItem:long):void
		{
			var msg:CSSetUpAcuPointsMessage=new CSSetUpAcuPointsMessage();
			msg.MeridId=merId;
			msg.acuPointId=pointId;
			msg.itemId=stoneItem;
			SocketConnection.send(msg);
		}
	}
}