package com.rpgGame.app.sender
{
	import com.rpgGame.netData.marriage.message.CSChallengeZoneMessage;
	import com.rpgGame.netData.marriage.message.CSDivorceMessage;
	import com.rpgGame.netData.marriage.message.CSInteractionMessage;
	import com.rpgGame.netData.marriage.message.CSMarriageInfoMessage;
	import com.rpgGame.netData.marriage.message.CSMarriageLogMessage;
	import com.rpgGame.netData.marriage.message.CSNoticeZoneMessage;
	import com.rpgGame.netData.marriage.message.CSProposalMessage;
	import com.rpgGame.netData.marriage.message.CSTargetProposalResultMessage;
	import com.rpgGame.netData.marriage.message.CSUpGradeMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
	public class HunYinSender extends BaseSender
	{
		public function HunYinSender()
		{
			super();
		}
		
		/**请求挑战副本*/
		public static function upCSChallengeZoneMessage(type:int,zoneModId:int=1):void
		{
			var msg:CSChallengeZoneMessage=new CSChallengeZoneMessage();
			msg.zoneModelId=zoneModId;
			msg.type=type;
			SocketConnection.send(msg);
		}
		
		/**被邀请方是否参与*/
		public static function upCSNoticeZoneMessage(zoneid:long,result:int):void
		{
			var msg:CSNoticeZoneMessage=new CSNoticeZoneMessage();
			msg.zoneId=zoneid;
			msg.result=result;
			SocketConnection.send(msg);
		}
		
		/**请求结婚数据*/
		public static function upCSMarriageInfoMessage():void
		{
			var msg:CSMarriageInfoMessage=new CSMarriageInfoMessage();
			SocketConnection.send(msg);
		}
		
		/**请求离婚*/
		public static function upCSDivorceMessage():void
		{
			var msg:CSDivorceMessage=new CSDivorceMessage();
			SocketConnection.send(msg);
		}
		
		/**夫妻互动*/
		public static function upCSInteractionMessage(type:int):void
		{
			var msg:CSInteractionMessage=new CSInteractionMessage();
			msg.type=type;
			SocketConnection.send(msg);
		}
		
		/**夫妻日志*/
		public static function upCSMarriageLogMessage():void
		{
			var msg:CSMarriageLogMessage=new CSMarriageLogMessage();
			SocketConnection.send(msg);
		}
		
		/**求婚*/
		public static function upCSProposalMessage(name:String):void
		{
			var msg:CSProposalMessage=new CSProposalMessage();
			msg.targetName=name;
			SocketConnection.send(msg);
		}
		
		/**被求婚是的操作请求*/
		public static function upCSTargetProposalResultMessage(result:int,playerId:long):void
		{
			var msg:CSTargetProposalResultMessage=new CSTargetProposalResultMessage();
			msg.result=result;
			msg.targetId=playerId;
			SocketConnection.send(msg);
		}
		
		/**婚戒进阶*/
		public static function upCSUpGradeMessage(type:int,autoBuy:int):void
		{
			var msg:CSUpGradeMessage=new CSUpGradeMessage();
			msg.type=type;
			msg.autoBuy=autoBuy;
			SocketConnection.send(msg);
		}
	}
}