package com.rpgGame.app.sender
{
	import com.rpgGame.netData.horse.message.CSHorseIllusionToGameMessage;
	import com.rpgGame.netData.horse.message.CSHorseStratumUpToGameMessage;
	import com.rpgGame.netData.horse.message.CSUseHorseAddtionMessage;
	import com.rpgGame.netData.warFlag.message.CSUseWarFlagAddtionMessage;
	import com.rpgGame.netData.warFlag.message.CSWarFlagStratumUpToGameMessage;
	
	import org.game.netCore.connection.SocketConnection;
	

	/**
	 * 发送消息 
	 * @author 陈鹉光
	 * 
	 */	
	public class HorseSender extends BaseSender
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
		public static function horseStratumUp(automatic:Boolean,autoUp:Boolean):void
		{
			var msg:CSHorseStratumUpToGameMessage = new CSHorseStratumUpToGameMessage();
			msg.Automatic = automatic?1:0;
			msg.AutoUp = autoUp?1:0;
			sendMsg(msg);
		}
		
		/**请求使用战旗资质丹或者成长丹消息*/
		public static function onCSUseWarFlagAddtionMessage(type:int):void
		{
			var msg:CSUseWarFlagAddtionMessage = new CSUseWarFlagAddtionMessage();
			msg.type = type;
			msg.num = 1;
			SocketConnection.send(msg);
		}
		
		/**请求升阶战旗*/
		public static function onCSWarFlagStratumUpToGameMessage(automatic:int,autoUp:int):void
		{
			var msg:CSWarFlagStratumUpToGameMessage = new CSWarFlagStratumUpToGameMessage();
			msg.Automatic = automatic;//showdata.isAutoBuyItem?1:0;
			msg.AutoUp = autoUp;//showdata.isAutoing?1:0;
			SocketConnection.send(msg);
		}
	}
}