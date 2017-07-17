package com.rpgGame.app.sender
{
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
		public static function reqPetDebut(petId:int):void
		{
			var msg:ReqPetDebutMessage=new ReqPetDebutMessage();
			msg.modelId=petId;
			SocketConnection.send(msg);
		}
		public static function reqPetLevelUp(petId:int,type:int,useGold:int):void
		{
			var msg:ReqPetResOpMessage=new ReqPetResOpMessage();
			msg.modelId=petId;
			msg.type=type;
			msg.useGold=useGold;
			SocketConnection.send(msg);
		}
	}
}