package com.rpgGame.app.sender
{
	import com.rpgGame.netData.pet.message.ReqEnterNextLevelMessage;
	import com.rpgGame.netData.pet.message.ReqExaBuyMessage;
	import com.rpgGame.netData.pet.message.ReqPetDebutMessage;
	import com.rpgGame.netData.pet.message.ReqPetResOpMessage;
	import com.rpgGame.netData.vip.message.ReqGetVipAwardMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
	
	/**
	 * vip sender
	 * @author EC
	 * ModuleID==15
	 */
	public class PetSender extends BaseSender
	{
		/**美人出战 休战请求*/
		public static function reqPetDebut(petId:int):void
		{
			var msg:ReqPetDebutMessage=new ReqPetDebutMessage();
			msg.modelId=petId;
			SocketConnection.send(msg);
		}
		
		/**美人激活升阶操作*/
		public static function reqPetLevelUp(petId:int,type:int,useGold:int):void
		{
			var msg:ReqPetResOpMessage=new ReqPetResOpMessage();
			msg.modelId=petId;
			msg.type=type;
			msg.useGold=useGold;
			SocketConnection.send(msg);
		}
		
		/**挑战请求*/
		public static function reqEnterNextLevelMessage(zoneId:int):void
		{
			var msg:ReqEnterNextLevelMessage=new ReqEnterNextLevelMessage();
			msg.zoneModelid=zoneId;
			SocketConnection.send(msg);
		}
		
		/**购买战斗BUFF 请求*/
		public static function reqExaBuyMessage(type:int):void
		{
			var msg:ReqExaBuyMessage = new ReqExaBuyMessage();
			msg.type=type;
			SocketConnection.send(msg);
		}
	}
}