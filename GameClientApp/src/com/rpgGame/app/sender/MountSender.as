package com.rpgGame.app.sender
{
	import com.rpgGame.netData.horse.message.CSHorseIllusionToGameMessage;
	import com.rpgGame.netData.horse.message.CSHorseStratumUpToGameMessage;
	import com.rpgGame.netData.horse.message.CSUseHorseAddtionMessage;
	

	/**
	 * 发送消息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSender extends BaseSender
	{
		/** 请求乘骑或者休息  */
		public static function horseIllusion(houseId:int):void
		{
			var msg:CSHorseIllusionToGameMessage = new CSHorseIllusionToGameMessage();
			msg.horseModelid = houseId;
			sendMsg(msg);
		}
		/** 请求使用坐骑资质丹或者成长丹  */
		public static function useHorseAddtion(type:int,num:int):void
		{
			var msg:CSUseHorseAddtionMessage = new CSUseHorseAddtionMessage();
			msg.type = type;
			msg.num = 1;
			sendMsg(msg);
		}
		/** 请求坐骑升阶  */
		public static function horseStratumUp(automatic:int):void
		{
			var msg:CSHorseStratumUpToGameMessage = new CSHorseStratumUpToGameMessage();
			msg.Automatic = automatic;
			sendMsg(msg);
		}
	}
}