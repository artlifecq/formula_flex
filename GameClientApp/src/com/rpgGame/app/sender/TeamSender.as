package com.rpgGame.app.sender
{
	import com.rpgGame.app.ctrl.ControlCoolDown;
	import com.rpgGame.app.ctrl.EnumCustomCoolDown;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.netData.team.message.ReqApplyGameSelectMessage;
	import com.rpgGame.netData.team.message.ReqAppointGameMessage;
	import com.rpgGame.netData.team.message.ReqAppointGameSelectMessage;
	import com.rpgGame.netData.team.message.ReqCreateTeamMessage;
	import com.rpgGame.netData.team.message.ReqGenericSearchToGameMessage;
	import com.rpgGame.netData.team.message.ReqInviteTeamMessage;
	import com.rpgGame.netData.team.message.ReqInviteTeamSelectMessage;
	import com.rpgGame.netData.team.message.ReqJoinTeamMessage;
	import com.rpgGame.netData.team.message.ReqKickTeamMessage;
	import com.rpgGame.netData.team.message.ReqLeaveTeamMessage;
	import com.rpgGame.netData.team.message.ReqMapSearchPlayerInfoGameMessage;
	import com.rpgGame.netData.team.message.ReqMapSearchTeamInfoGameMessage;
	import com.rpgGame.netData.team.message.ReqSetTeamOptionsGameMessage;
	import com.rpgGame.netData.team.message.ReqTeamInfoToGameMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 * 组队sender
	 * @author EC
	 * ModuleID==15
	 */
	public class TeamSender extends BaseSender
	{
		//====================== 请求消息 =============================
		
		public static function reqCreateTeamWithPlayer(player:long):void
		{
			ReqInviteJoinTeam(player);
		}
		/**
		 * 任命新队长
		 * @param teamId
		 * @param playerId
		 */		
		public static function ReqAppointNewCaptain(teamId:long , playerId:long):void
		{
			var msg:ReqAppointGameMessage = new ReqAppointGameMessage();
			msg.teamid = teamId;
			msg.playerid = playerId;
				SocketConnection.send(msg);
		}
		/**
		 * 玩家是否同意接受队长任命
		 * @param teamId
		 * @param select
		 */		
		public static function ReqAcceptAppointNewCaptain( teamId:long , select:int ):void
		{
			var msg:ReqAppointGameSelectMessage = new ReqAppointGameSelectMessage();
			msg.teamid = teamId;
			msg.select = select;
			SocketConnection.send(msg);
		}
		/**
		 * 创建队伍
		 */		
		public static function ReqCreateTeam():void
		{
			var msg:ReqCreateTeamMessage = new ReqCreateTeamMessage();
			SocketConnection.send(msg);
		}
		/**
		 * 邀请玩家加入队伍
		 * @param playerId
		 */		
		public static function ReqInviteJoinTeam( playerId:long ):void
		{
			var msg:ReqInviteTeamMessage = new ReqInviteTeamMessage();
			msg.playerid = playerId;
			SocketConnection.send(msg);
		}
		/**
		 * 玩家是否同意被邀请加入到该队伍
		 * @param teamId
		 * @param select
		 */		
		public static function ReqAcceptInviteJoin( teamId:long , select:int ):void
		{
			var msg:ReqInviteTeamSelectMessage = new ReqInviteTeamSelectMessage();
			msg.teamid = teamId;
			msg.select = select;
			SocketConnection.send(msg);
		}
		/**
		 * 玩家申请加入队伍
		 * @param teamId
		 */		
		public static function ReqApplyJoinTeam( teamId:long ):void
		{
			var msg:ReqJoinTeamMessage = new ReqJoinTeamMessage();
			msg.teamid = teamId;
			SocketConnection.send(msg);
		}
		/**
		 * 队长处理 入队申请
		 * @param teamId
		 * @param playerId
		 * @param select
		 */
		public static function ReqAcceptJionTeam( teamId:long , playerId:long , select:int ):void
		{
			var msg:ReqApplyGameSelectMessage = new ReqApplyGameSelectMessage();
			msg.teamid = teamId;
			msg.playerid = playerId;
			msg.select = select;
			SocketConnection.send(msg);
		}
		/**
		 * 开除队友
		 * @param playerId
		 */		
		public static function ReqKickTeam( playerId:long ):void
		{
			var msg:ReqKickTeamMessage = new ReqKickTeamMessage();
			msg.playerid = playerId;
			SocketConnection.send(msg);
		}
		/**
		 * 离开队伍
		 * @param type 1 自己离开 ，2下线
		 */		
		public static function ReqLeaveTeam( type:int ):void
		{
			var msg:ReqLeaveTeamMessage = new ReqLeaveTeamMessage();
			msg.type = type;
			SocketConnection.send(msg);
		}
		/**
		 * 组队设置
		 * @param autoIntoTeamApply 自动允许加入
		 * @param autoJoinTeam 自动接受邀请
		 */		
		public static function ReqSetTeamOpation( autoIntoTeamApply:int , autoJoinTeam:int ):void
		{
			var msg:ReqSetTeamOptionsGameMessage = new ReqSetTeamOptionsGameMessage();
			msg.autoIntoTeamApply = autoIntoTeamApply;
			msg.autoJoinTeam = autoJoinTeam;
			SocketConnection.send(msg);
		}
		/**
		 * 请求队伍信息
		 * @param teamId
		 */		
		public static function ReqTeamInfo( teamId:long ):void
		{
			var msg:ReqTeamInfoToGameMessage = new ReqTeamInfoToGameMessage();
			msg.teamid = teamId;
			SocketConnection.send(msg);
		}
		/**
		 * 搜索全服玩家
		 * @param content
		 * @type 1 好友 2组队
		 */		
		public static function ReqSearchPlayerByServer( type:int,content:String ):void
		{
			var msg:ReqGenericSearchToGameMessage = new ReqGenericSearchToGameMessage();
			msg.searchcontent = content;
			msg.searType = type;
			SocketConnection.send(msg);
		}
		/**
		 * 搜索附近玩家
		 * @param content
		 */		
		public static function ReqSearchNearPlayer( content:String,isAuto:Boolean):void
		{
			var msg:ReqMapSearchPlayerInfoGameMessage = new ReqMapSearchPlayerInfoGameMessage();
			msg.searchcontent = content;
			SocketConnection.send(msg);
			if (!isAuto) 
			{
				ControlCoolDown.AddCustomCoolDownTime( EnumCustomCoolDown.TEAM_SEARCH_PLAYER , 30000);
			}
			
		}
		/**
		 * 搜索附近队伍
		 * @param content
		 */		
		public static  function ReqSearchNearTeam( content:String,isAuto:Boolean ):void
		{
			var msg:ReqMapSearchTeamInfoGameMessage = new ReqMapSearchTeamInfoGameMessage();
			msg.searchcontent = content;
			SocketConnection.send(msg);
			if (!isAuto) 
			{
				ControlCoolDown.AddCustomCoolDownTime( EnumCustomCoolDown.TEAM_SEARCH_TEAM , 30000);
			}
			
		}
	}
}