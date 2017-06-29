package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.ui.alert.GameAlertExt;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	import com.rpgGame.netData.team.message.ResApplyClientMessage;
	import com.rpgGame.netData.team.message.ResAppointClientMessage;
	import com.rpgGame.netData.team.message.ResGenericSearchToClientMessage;
	import com.rpgGame.netData.team.message.ResInviteTeamMessage;
	import com.rpgGame.netData.team.message.ResLeaveTeamMessage;
	import com.rpgGame.netData.team.message.ResMapSearchPlayerInfoClientMessage;
	import com.rpgGame.netData.team.message.ResMapSearchTeamInfoClientMessage;
	import com.rpgGame.netData.team.message.ResSetTeamOptionsClientMessage;
	import com.rpgGame.netData.team.message.ResTeamExteriorClientMessage;
	import com.rpgGame.netData.team.message.ResTeamInfoMessage;
	import com.rpgGame.netData.team.message.ResTeamSynMemberinfoClientMessage;
	import com.rpgGame.netData.team.message.ResTeamSynPosClientMessage;
	import com.rpgGame.netData.team.message.SCHaveTeamMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *心法的 
	 * @author Administrator
	 * 
	 */	
	public class TeamCmdListerner extends BaseBean
	{
		public function TeamCmdListerner()
		{
			super();
		}
		override public function start():void
		{
			
			SocketConnection.addCmdListener(109101, RecTeamInfo);
			SocketConnection.addCmdListener(109102,RecApplyNotice);
			SocketConnection.addCmdListener(109103, RecLeaveTeamNotice);
			SocketConnection.addCmdListener(109104, RecInviteJoinTeamNotice);
			SocketConnection.addCmdListener(109105, RecUpdateTeamInfo);
			SocketConnection.addCmdListener(109106, RecAppointNotice);
			SocketConnection.addCmdListener(109111, RecMapSearchNearTeam);
			SocketConnection.addCmdListener(109112, RecMapSearchNearPlayer);
			SocketConnection.addCmdListener(109113, RecSynMemberPosInfo);
			SocketConnection.addCmdListener(109114, RecSynMemberInfo);
			SocketConnection.addCmdListener(109115, RecSetTeamOptions);
			SocketConnection.addCmdListener(109116, RecSearchPlayerByServer);
			SocketConnection.addCmdListener(109117, RecHaveTeam);
			finish();
		}
		
		private function RecHaveTeam(msg:SCHaveTeamMessage):void
		{
			// TODO Auto Generated method stub
			GameAlertExt.show(msg.content,TeamSender.ReqConfirm2QuitTeam,[msg.type]);
		}
		
		//============================ 返回消息 ==================================
		/**
		 * 入队申请通知
		 * @param msg
		 */		
		public function RecApplyNotice( msg:ResApplyClientMessage ):void
		{
			Mgr.teamMgr.AddApplyPrompt( msg.teamid , msg.newmemberinfo );
		}
		/**
		 * 任命队长通知玩家
		 * @param msg
		 */		
		public function RecAppointNotice( msg:ResAppointClientMessage ):void
		{
			Mgr.teamMgr.AppointCaptain( msg.teamid , msg.captaininfo );
		}
		/**
		 * 邀请加入该队伍
		 * @param msg
		 */		
		public function RecInviteJoinTeamNotice( msg:ResInviteTeamMessage ):void
		{
			Mgr.teamMgr.AddInvitePrompt( msg.teamId , msg.invitePlayerInfo );
		}
		/**
		 * 离开队伍通知
		 * @param msg
		 */		
		public function RecLeaveTeamNotice( msg:ResLeaveTeamMessage ):void
		{
			Mgr.teamMgr.PlayerLeaveTeam( msg.leaveplayerId );
		}
		/**
		 * 队伍设置改变
		 * @param msg
		 */		
		public function RecSetTeamOptions( msg:ResSetTeamOptionsClientMessage ):void
		{
			Mgr.teamMgr.autoAcceptInvite = msg.autoJoinTeam == 1;
			Mgr.teamMgr.autoAllowApply = msg.autoIntoTeamApply == 1;
		}
		/**
		 * 更新组队信息
		 * @param msg
		 */		
		public function RecUpdateTeamInfo( msg:ResTeamExteriorClientMessage ):void
		{
			Mgr.teamMgr.UpdatePlayerTeamInfo( msg.teamid , msg.playerid );
		}
		/**
		 * 更新组队信息
		 * @param msg
		 */		
		public function RecTeamInfo( msg:ResTeamInfoMessage ):void
		{
			var isCreated:Boolean = true;
			if(msg.teamInfo.memberinfo.length > 0)
			{
				var member:TeamMemberInfo = msg.teamInfo.memberinfo[0];
				if(Mgr.teamMgr.teamInfo != null && !Mgr.teamMgr.teamInfo.teamId.IsZero() 
					&& Mgr.teamMgr.captain != null )
				{
					isCreated  = false;
				}
				Mgr.teamMgr.captain = member;
			}
			Mgr.teamMgr.TeamInfoChange( msg.teamInfo , isCreated);
		}
		/**
		 * 同步成员信息
		 * @param msg
		 */		
		public function RecSynMemberInfo( msg:ResTeamSynMemberinfoClientMessage ):void
		{
			Mgr.teamMgr.SynMemberInfo( msg.teamMemberBriefInfolist );
		}
		/**
		 * 同步成员信息位置
		 * @param msg
		 */	
		public function RecSynMemberPosInfo( msg:ResTeamSynPosClientMessage ):void
		{
			Mgr.teamMgr.SynMemberPositionInfo( msg.memberid , msg.x , msg.y);
		}
		/**
		 * 返回搜索全服玩家
		 * @param msg
		 */		
		public function RecSearchPlayerByServer( msg:ResGenericSearchToClientMessage ):void
		{
			Mgr.teamMgr.DispatchEvent( TeamEvent.SEARCH_PLAYER_BY_SERVER , msg.mapplayerinfo );
			
//			if ( msg.searType == 3 )
//				Mgr.guildMgr.RecSearchPlayerByServerMsg( msg );
		}
		/**
		 * 搜索当前地图附近玩家
		 * @param msg
		 */		
		public function RecMapSearchNearPlayer( msg:ResMapSearchPlayerInfoClientMessage ):void
		{
			Mgr.teamMgr.DispatchEvent( TeamEvent.GET_MAP_PLAYERS , msg.mapplayerinfo );
		}
		/**
		 * 搜索当前地图附近队伍
		 * @param msg
		 */		
		public function RecMapSearchNearTeam( msg:ResMapSearchTeamInfoClientMessage ):void
		{
			Mgr.teamMgr.DispatchEvent( TeamEvent.GET_MAP_TEAMS , msg.mapteaminfo );
		}
		
		private function DispatchEvent( type:String , data:* ):void
		{
			Mgr.teamMgr.DispatchEvent( type , data );
		}
	}
}