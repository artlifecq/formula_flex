package com.rpgGame.app.sender
{
	import app.cmd.TeamModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 组队sender
	 * @author EC
	 * ModuleID==15
	 */
	public class TeamSender extends BaseSender
	{
		/** 请求创建个自己一个人的队伍 */
		public static function requestCreateMyTeam():void
		{
			_bytes.clear();
			SocketConnection.send(TeamModuleMessages.C2S_CREATE_OWN_TEAM, _bytes);
		}
		
		/** 请求离开队伍 */
		public static function requestLeaveTeam():void
		{
			_bytes.clear();
			SocketConnection.send(TeamModuleMessages.C2S_LEAVE_TEAM, _bytes);
		}
		
		/** 回复组队邀请 */
		public static function requestBeInventJoinTeam(id:Number,isAccept:Boolean):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			_bytes.writeBoolean(isAccept);
			SocketConnection.send(TeamModuleMessages.C2S_REPLY_INVITE,_bytes);
		}
		
		/** 一次性拒绝所有的入队申请 */
		public static function refuseAllJoinRequest():void
		{
			var by:ByteBuffer = new ByteBuffer();
			SocketConnection.send(TeamModuleMessages.C2S_REJECT_ALL_REQUESTS,_bytes);
		}
		
		/** 一次性拒绝所有的组队邀请*/
		public static function refuseAllInventRequest():void
		{
			_bytes.clear();
			SocketConnection.send(TeamModuleMessages.C2S_REJECT_ALL_INVITATIONS, _bytes);
		}
		
		/** 请求加入对方的队伍 */
		public static function requestJoinOtherTeam(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_SEND_REQUEST, _bytes);
		}
		
		/** 回复别人的入队申请 */
		public static function replyJoinTeamRequest(id:Number,isAgree:Boolean):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			_bytes.writeBoolean(isAgree);
			SocketConnection.send(TeamModuleMessages.C2S_REPLY_REQUEST, _bytes);
		}
		
		/**
		 * 踢出一个队员
		 * @param	id
		 */
		public static function kickParter(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_KICK, _bytes);
		}
		
		/**
		 * 更换队长
		 * @param	id
		 */
		public static function changeCaption(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_TRANSFER_LEADER, _bytes);
		}
		
		/** 
		 * 每个一秒询问一下.队伍中和我同场景,同一条线的人的坐标
		 * 打开小地图时,如果有人和场景id相同,线数相同,则请求,如果没有,则不管
		 * 请求队伍中同场景队友坐标 
		 * */
		public static function requestSameSceneTeamMembPos():void
		{
			_bytes.clear();
			SocketConnection.send(TeamModuleMessages.C2S_GET_TEAMMATE_POS, _bytes);
		}
		
		/** 是否禁止被邀请加入队伍 */
		public static function reqFobidTobeInventJoinTeam(agree:Boolean):void
		{
			_bytes.clear();
//			if (agree)
//			SocketConnection.send(TeamModuleMessages.C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_TEAM_TRUE, _bytes);
//			else 
//			SocketConnection.send(TeamModuleMessages.C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_TEAM_FLASE, _bytes);
		}
		
		/** 自动接受别人邀请的勾选 */
		public static function requestAutoAcceptInvent(isagree:Boolean):void
		{
			_bytes.clear();
			if(isagree)
			{
				SocketConnection.send(TeamModuleMessages.C2S_SET_AUTO_ACCEPT_INVITE, _bytes);
			}
			else
			{
				SocketConnection.send(TeamModuleMessages.C2S_SET_NOT_AUTO_ACCEPT_INVITE, _bytes);
			}
		}
		
		/** 自动接受别人的入队的勾选 */
		public static function requestAutoAcceptJoin(isagree:Boolean):void
		{
			_bytes.clear();
			if(isagree)
			{
				SocketConnection.send(TeamModuleMessages.C2S_SET_AUTO_ACCEPT_REQUEST, _bytes);
			}
			else
			{
				SocketConnection.send(TeamModuleMessages.C2S_SET_NOT_AUTO_ACCEPT_REQUEST, _bytes);
			}
		}
		/**设置是否允许邀请我加入队伍**/
		public static function requestForbidOtherInviteMeJoinTeam(isAgree:Boolean):void
		{
			_bytes.clear();
			if(isAgree)
				SocketConnection.send(TeamModuleMessages.C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_TEAM, _bytes);
			else
				SocketConnection.send(TeamModuleMessages.C2S_SET_NOT_FORBID_OTHER_INVITE_ME_JOIN_TEAM, _bytes);
		}
		
		/** 邀请对方入队 */
		public static function requestInventJoinTeam(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_SEND_INVITE, _bytes);
		}
		
		/**
		 * 通过ID请求队友位置，用于寻路到队友位置时请求
		 * @param id 
		 */
		public static function requestTeamMembPosById(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_GET_TEAM_MEMBER_POS,_bytes);
		}
		
		/**
		 * 通过ID请求队友传送到队友位置，需要客户端自己找好传送物品 vip免费传0
		 * @param id 
		 * @param itemid
		 */
		public static function requestTransportToTeamMemb(id:Number):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection.send(TeamModuleMessages.C2S_TEAM_MEMBER_TRANSPORT,_bytes);
		}

		/**
		 * 队长广播请跟随，限定频率，最多1S一次
		 *
		 * bool true(大家跟我走啊)/false(大家别跟我走啊)
		 */
		public static function requestTeamsBroadcastFollow(isFollowing:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isFollowing);
			SocketConnection.send(TeamModuleMessages.C2S_TEAM_BROADCAST_FOLLOW, _bytes);
		}
		
		/**
		 * 队员跟随，限定频率，最多1S一次
		 *
		 * bool true(跟党走)/false(滚一边去)
		 */
		public static function requestTeamsMemberFollow(isFollowing:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isFollowing);
			SocketConnection.send(TeamModuleMessages.C2S_TEAM_MEMBER_FOLLOW, _bytes);
		}
		
		/**
		 * 设置队伍经验分配方式
		 *
		 * bool true(伤害分配模式)/false(平均分配模式)
		 */
		public static function requestSetTeamExpAllocate(isBool:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isBool);
			SocketConnection.send(TeamModuleMessages.C2S_SET_TEAM_EXP_ALLOCATE, _bytes);
		}
		
		/**
		 * 设置队伍掉落分配方式
		 *
		 * varint32 TeamDropAllocateType
		 */
		public static function requestSetTeamDropAllocate(type:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(type);
			SocketConnection.send(TeamModuleMessages.C2S_SET_TEAM_DROP_ALLOCATE, _bytes);
		}
	}
}