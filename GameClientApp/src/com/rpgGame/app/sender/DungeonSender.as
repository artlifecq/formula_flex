package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.netData.cross.message.CSCancelTeamMatchMessage;
	import com.rpgGame.netData.cross.message.CSTeamMatchMessage;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	import com.rpgGame.netData.dailyzone.message.CSBuyCountInfoMessage;
	import com.rpgGame.netData.dailyzone.message.CSGetDailyZonePanelMessage;
	import com.rpgGame.netData.lunjian.message.CSLunJianPanelInfosMessage;
	import com.rpgGame.netData.team.message.CSZoneTeamVoteMessage;
	import com.rpgGame.netData.zone.message.CSClientTriggerValiedMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonEnterMessage;
	import com.rpgGame.netData.zone.message.ReqZoneCommonQuitMessage;
	import com.rpgGame.netData.zone.message.ReqZoneOutToGameMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 *副本请求器
	 *@author dik
	 *2017-5-8下午1:39:20
	 */
	public class DungeonSender extends BaseSender
	{
		public function DungeonSender()
		{
			super();
		}
		
		/**
		 *请求进入副本 
		 * 
		 */
		public static function reqEnterDungeon(dungeonid:int,data:int=0):void
		{
			var msg:ReqZoneCommonEnterMessage=new ReqZoneCommonEnterMessage();
			msg.zoneModelid=dungeonid;
			msg.extradata=data;
			SocketConnection.send(msg);
		}
		
		/**
		 *请求退出副本 
		 * 
		 */
		public static function reqQuitDungeon(verityMapId:long):void
		{
			var msg:ReqZoneCommonQuitMessage=new ReqZoneCommonQuitMessage();
			msg.verityMapId=verityMapId;
			SocketConnection.send(msg);
		}
		
		
		/**
		 *请求论剑信息 
		 * 
		 */
		public static function reqLunJianPanelInfos():void
		{
			var msg:CSLunJianPanelInfosMessage=new CSLunJianPanelInfosMessage();
			SocketConnection.send(msg);
		}
		
		
		/**
		 *发送触发信息
		 * 
		 */
		public static function reqTrigger(trid:int):void
		{
			var msg:CSClientTriggerValiedMessage=new CSClientTriggerValiedMessage();
			msg.triggerId=trid;
			SocketConnection.send(msg);
		}
		
		/**
		 *多人副本请求匹配
		 * 
		 */
		public static function reqTeamMatch(zid:int):void
		{
			var msg:CSTeamMatchMessage=new CSTeamMatchMessage();
			msg.zoneModelId=zid;
			msg.matchState=1;
			SocketConnection.send(msg);
		}
		/**
		 *多人副本取消匹配
		 * 
		 */
		public static function reqCancelTeam(zid:int):void
		{
			var msg:CSCancelTeamMatchMessage=new CSCancelTeamMatchMessage();
			msg.zoneModelId=zid;
			SocketConnection.send(msg);
		}
		
		/**
		 *发起投票消息
		 * 
		 */
		public static function reqTeamMatchVote(zid:int,vote:int):void
		{
			var msg:CSZoneTeamVoteMessage=new CSZoneTeamVoteMessage();
			msg.zoneId=zid;
			msg.voteValue=vote;
			SocketConnection.send(msg);
		}
		
		
		/**
		 *日常副本购买次数
		 * 
		 */
		public static function reqBuyCount(zid:int):void
		{
			var msg:CSBuyCountInfoMessage = new CSBuyCountInfoMessage();
			msg.dailyZoneId = zid;
			SocketConnection.send(msg);
		}
		public static function reqCombat(zid:int,qid:int):void
		{
			var msg:ReqZoneCommonEnterMessage = new ReqZoneCommonEnterMessage();
			
			msg.zoneModelid = zid;
			msg.extradata = qid;
			SocketConnection.send(msg);
		}
		public static function reqDailyInfo():void
		{
			SocketConnection.send(new CSGetDailyZonePanelMessage());
		}
	}
}