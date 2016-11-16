package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.team.TeamJoinTeamInfo;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.lang.LangTeam;
	import com.rpgGame.coreData.type.TeamType;
	
	import app.cmd.TeamModuleMessages;
	import app.message.TeamDropAllocateType;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;
	
	/**
	 * 组队相关ModuleID==15
	 * @author EC
	 */
	public class TeamCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_CREATE_OWN_TEAM_SUCCESS,onCreateTeamSuccess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_CREATE_OWN_TEAM_FAIL,onCreateTeamFail);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_LEAVE_TEAM_SUCCESS,onLeaveTeamSucess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_LEAVE_TEAM_FAIL,onLeaveTeamFail);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_LEAVE_TEAM,onLeaveTeamBrodcast);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_DISMISS,onTeamDissolve);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_INVITE_SUCCESS_OTHER_JOIN_TEAM,onAutoAcceptInventJoinTeam);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_INVITE_SUCCESS_WAIT_OTHER_REPLY,onInventSendSuccessStartTimeOut);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_INVITE_FAIL,onInventJoinTeamFail);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_JOIN_TEAM,onOtherJoinMyTeam);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_YOU_ENTERED_TEAM,onMeJoinOtherTeam);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_RECEIVE_INVITE,onGetJoinTeamInvent);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_REPLY_INVITE_SUCCESS,onAcceptInventSuccess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_REPLY_INVITE_FAIL,onAcceptInventFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_REJECTED_YOUR_INVITE,onOtherRejectInvent);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_REQUEST_SUCCESS_YOU_JOIN_TEAM,onAutoAcceptJoinUnlock);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_REQUEST_SUCCESS_WAIT_OTHER_REPLY,onSendJoinWaitforReply);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SEND_REQUEST_FAIL,onReqJoinTeamFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_RECEIVE_REQUEST,onGetJoinTeamRequest);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_REPLY_REQUEST_SUCCESS,onAgreeJoinSucessReply);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_REPLY_REQUEST_FAIL,onGetAgreeJoinFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_REJECTED_YOUR_REQUEST,onGetRejectYourRqestTeam);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_KICK_SUCCESS,onGetKickParterSuccess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_KICK_FAIL,onGetKickParterFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_YOU_ARE_KICKED,onBeKickOut);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TRANSFER_LEADER_FAIL,onSendChangeCaptionFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_LEADER_CHANGED,onGetNewCaptionAppear);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_OFFLINE,onGetSomeOneOffLine);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_ONLINE,onGetSomeOneOnLine);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_YOU_HAVE_TEAM_BEFORE_OFFLINE,onGetOnLineBackTeam);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_CHANGE_LEVEL,onGetTeamMembLevUp);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_OTHER_CHANGE_SCENE,onGetTeamMembSceneChange);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAMMATE_CHANGE_RES,onGetTeamMembEquipChanged);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAMMATE_DEAD,onGetTeamMembBeKill);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_GET_TEAMMATE_POS_FAIL,onGetSameSceneTeamMembPosFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_REPLY_TEAMMATE_POS,onGetSameSceneTeamMembPosSuccess);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_GET_TEAM_MEMBER_POS,onGetTeamMembPosSuccess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_GET_TEAM_MEMBER_POS_FAIL,onGetTeamMembPosFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_MEMBER_TRANSPORT,onGetTeamMembPosTransportSuccess);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_MEMBER_TRANSPORT_FAIL,onGetTeamMembPosTransportFail);
			
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_BROADCAST_FOLLOW,onTeamBroadcastFollow);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_BROADCAST_FOLLOW_FAIL,onTeamBroadcastFollowFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_LEADER_INVITE_FOLLOW,onTeamLeaderInviteFollow);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_LEADER_DOOR_TRANSPORT,onTeamLeaderDoorTransport);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_MEMBER_FOLLOW,onTeamMemberFollow);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_MEMBER_FOLLOW_FAIL,onTeamMemberFollowFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_TEAM_LEADER_MEMBER_FOLLOW,onTeamLeaderMemberFollow);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SET_TEAM_EXP_ALLOCATE_BROADCAST,onSetTeamExpAllocateBroadcast);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SET_TEAM_EXP_ALLOCATE_FAIL,onSetTeamExpAllocateFail);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SET_TEAM_DROP_ALLOCATE_BROADCAST,onSetTeamDropAllocateBroadcast);
			SocketConnection_protoBuffer.addCmdListener(TeamModuleMessages.S2C_SET_TEAM_DROP_ALLOCATE_FAIL,onSetTeamDropAllocateFail);
			
			finish();
		}
		
		/**
		 * 创建队伍成功, 没有附带信息
		 *
		 * 分配模式：
		 *
		 * 经验：平均分配 (true[伤害分配]/false(平均))
		 * 掉落：轮流拾取 TeamDropAllocateType( 0：KILLER--猎杀者模式、1：TURN--轮流拾取、2：FREE--自由拾取 )
		 */
		private function onCreateTeamSuccess(buffer:ByteBuffer):void
		{
			TeamManager.createTeamComplete();
			TeamManager.sendSetTeamExpAllocate( false );
			TeamManager.sendSetTeamDropAllocate( TeamDropAllocateType.TURN );
		}
		
		/**
		 * 创建队伍失败, 附带varint32 失败原因
		 *
		 * 1. 你已经有队伍了
		 */
		private function onCreateTeamFail(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			if( type == 1 )
			{
				NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP14 );
			}
		}
		
		/**
		 *离开队伍成功
		 * @param buffer
		 * 
		 */
		private function onLeaveTeamSucess(buffer:ByteBuffer):void
		{
			TeamManager.leaveTeamComplete();
//			FriendManager.removeReccommendTeamMember();
		}
		
		/**
		 * 离开队伍失败, 附带varint32 失败原因
		 *
		 * 1. 你没有队伍
		 */
		private function onLeaveTeamFail(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			if( type == 1 )
			{
				NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP10 );
			}
		}
		
		/**
		 * 队伍里其他人离开了队伍
		 *
		 * 附带
		 *
		 * varint64 其他人id
		 */
		private function onLeaveTeamBrodcast(buffer:ByteBuffer):void
		{
			var roleID:Number = buffer.readVarint64();
			TeamManager.teamPlayerLeave(roleID);
//			TeamManager.hideTeamIcon( roleID );
		}
		
		/**
		 * 队伍解散了, 服务器主动推送, 没有附带的信息
		 *
		 * 客户端自动把生成其他人离队的历史记录, 并在最后加上队伍解散历史记录
		 */
		private function onTeamDissolve(buffer:ByteBuffer):void
		{
			TeamManager.onTeamDissolve();
		}
		
		/**
		 * 邀请入队成功, 对方设为了自动接受邀请, 即将加入本队, 收到这条后, 
		 * 解除因为发送C2S_SEND_INVITE加的锁. 后面接着会收到S2C_OTHER_JOIN_TEAM对方加入队伍消息
		 *
		 * 后面没有附带的信息
		 */
		private function onAutoAcceptInventJoinTeam(buffer:ByteBuffer):void
		{
			TeamManager.invitePlayerJionMyTeamComplete();
		}
		
		/**
		 * 消息发送成功，等待对方确认，解锁 开始2分钟倒计时 
		 * 
		 * 邀请入队成功, 对方不是自动接受邀请的, 等待对方回应. 解除C2S_SEND_INVITE的锁
		 *
		 * 后面没有附带的信息
		 */
		private function onInventSendSuccessStartTimeOut(buffer:ByteBuffer):void
		{
			TeamManager.invitePlayerJoinMyTeamWaitComplete();
		}
		
		/**
		 * 邀请入队失败, 附带varint32错误码
		 *
		 * 1. 你不是队长
		 * 2. 你队伍满了
		 * 3. 对方不在线
		 * 4. 对方有队伍
		 * 5. 你已经邀请过对方了
		 * 6. 对方设置了 禁止被邀请加入队伍
		 * 7. 不同国家的玩家不能组队
		 */
		private function onInventJoinTeamFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_COMMON_ERROR_DONT_IS_LEADER;
					break;
				case 2:
					errStr = LangTeam.TEAM_MEMBER_MAX;
					break;
				case 3:
					errStr = LangTeam.TEAM_THE_OTHER_PARTY_NO_ONLINE;
					break;
				case 4:
					errStr = LangTeam.TEAM_THE_OTHER_PARTY_HAVE_TEAM;
					break;
				case 5:
					errStr = LangTeam.TEAM_YOU_ALREADY_INVITED_EACH_OTHER;
					break;
				case 6:
					errStr = LangTeam.TEAM_FORBID_OTHER_INVITE_ME_JOIN;
					break;
				case 7:
					errStr = LangTeam.TEAM_PLAYER_NO_CAN_PLAY_IN_DIFFERENT_COUNTRIES;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 有人加入了我们队伍. 如果收到此消息时, 自己没有队伍, 则创建个队伍, 将自己设为队长
		 *
		 * 附带(队员.writeTo). 以后还有别的消息使用(队员.writeTo), 写成个方法. 以下为队员的writeTo的内容
		 * varint64 id
		 * varint32 国家
		 * UTF 对方名字
		 *
		 * varint32 场景id
		 * varint32 线数 (如果场景id对应的场景是个副本, 不管这里是个什么数字, 都忽略)
		 *
		 * varint32 等级
		 *
		 * 后面方法改成通用方法
		 * varint32 后面换装数据的长度
		 * while(buffer.readable()){
		 *      byte 换装资源
		 * }
		 *
		 * var isOnline = readBoolean(); // 是否在线
		 *
		 * var offlineTime:Number = byteArray.readVarInt64(); // 如果此人不在线, 则是他离队的时间点
		 *
		 * varint32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-5表示某个国家]
		 */
		private function onOtherJoinMyTeam(buffer:ByteBuffer):void
		{
			var memData:TeamUnit = initOneMemData(buffer);
			TeamManager.otherJoinMyTeam(memData);
		}
		
		/**
		 * 根据服务器发来的数据的得到一个队员数据
		 * @param buffer
		 * @return 
		 * 
		 */		
		private function initOneMemData(buffer:ByteBuffer):TeamUnit
		{
			var memData:TeamUnit = new TeamUnit();
			memData.id = buffer.readVarint64();
			memData.countryId = buffer.readVarint32();
			memData.name = buffer.readUTF();
			memData.sceneId = buffer.readVarint32();
			memData.line  = buffer.readVarint32();
			memData.level = buffer.readVarint32();
			memData.setResources(buffer);
			memData.isOnline = buffer.readBoolean();
			memData.leveTime = buffer.readVarint64();
			memData.isInCopy = (MapDataManager.getMapType(memData.sceneId) != EnumMapType.MAP_TYPE_NORMAL);
			memData.mapCountryId = buffer.readVarint32();
			return memData;
		}
		
		/**
		 * 你加入了一个队伍
		 *
		 * 附带
		 *
		 * varint64 队长id
		 * bool 经验分配方式(true[伤害分配]/false(平均))
		 * varint32 物品分配方式TeamDropAllocateType
		 * while(bytes.available){
		 *  队员.writeTo读出每个人的信息
		 * }
		 */
		private function onMeJoinOtherTeam(buffer:ByteBuffer):void
		{
			var teamLeaderId:Number = buffer.readVarint64();
			var isBool:Boolean = buffer.readBoolean();
			var type:int = buffer.readVarint32();
			TeamManager.setExpMode( isBool );
			TeamManager.setPickUpMode( type );
			TeamManager.updatMyHasTeam(true);
			
			var memData:TeamUnit;
			while (buffer.bytesAvailable)
			{
				memData = initOneMemData(buffer);
				TeamManager.addTeamMember(memData);
//				TeamManager.showTeamIco(memData.id);
			}
			TeamManager.addTeamMember(TeamManager.getMyTeamMemData());
			TeamManager.refreshCaptain(teamLeaderId);
			NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP17 );
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
		}
		
		/**
		 * 收到了别人发送的组队邀请. 收到此消息2分钟后, 客户端自己删除此邀请.
		 *
		 * 如果自己加入了一个队伍, 不论是自己建队/别人入队/自己入别人队, 则马上清除所有的组队邀请, 不需要一个个发拒绝
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * varint32 对方等级
		 * UTFBytes 对方名字
		 */
		private function onGetJoinTeamInvent(buffer:ByteBuffer):void
		{
			var joinData:TeamJoinTeamInfo = new TeamJoinTeamInfo();
			joinData.id = buffer.readVarint64();
			joinData.level = buffer.readVarint32();
			joinData.name = BytesUtil.readRemainUTF(buffer);
			joinData.joinType = TeamType.JOININFO_TYPE_INVENT;
			TeamManager.beenInvite(joinData);
		}
		
		/**
		 * 回复邀请成功, 只有回复接受才会收到这条消息. 之后会跟着收到S2C_YOU_ENTERED_TEAM
		 *
		 * 没有附带信息
		 */
		private function onAcceptInventSuccess(buffer:ByteBuffer):void
		{
			TeamManager.clearAllCaptainInventJoinTeamInfo();
			NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP17 );
		}
		
		/**
		 * 回复别人组队邀请失败, 只有在同意别人邀请时才会收到.
		 *
		 * 附带varint32的错误码
		 *
		 * 1. 别人队伍满了
		 * 2. 别人不是队长了
		 * 3. 别人不在线了
		 * 4. 邀请过期了
		 * 5. 你有队伍了
		 * 6. 不同的国家
		 */
		private function onAcceptInventFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_COMMON_ERROR_DONT_IS_LEADER;
					break;
				case 2:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL1;
					break;
				case 3:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL2;
					break;
				case 4:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL3;
					break;
				case 5:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL4;
					break;
				case 6:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL5;
					break;
				case 7:
					errStr = LangTeam.TEAM_REPLY_INVITE_FAIL6;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 别人拒绝了你的组队邀请. 流程是你先发了C2S_SEND_INVITE, 服务器返回了S2C_SEND_INVITE_SUCCESS_WAIT_OTHER_REPLY
		 * 然后别人返回了C2S_REPLY_INVITE, 表示拒绝组队邀请, 然后邀请人就收到了S2C_OTHER_REJECTED_YOUR_INVITE
		 *
		 * 根据消息中附带的id, 删除客户端缓存着的, 自己发出过的邀请. 可能在对方回复前, 自己下线又上线了, 附带的id缓存中没有
		 *
		 * 如果没有缓存, 则以消息中附带的名字提醒.
		 *
		 * 附带
		 * varint64 对方id
		 * UTFBytes 对方名字
		 */
		private function onOtherRejectInvent(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var name:String = BytesUtil.readRemainUTF(buffer);
			TeamManager.otherRejectInvite(id,name);
		}
		
		/**
		 * 对方自动接收请求
		 * 申请加入别人队伍成功, 别人队伍有空位, 而且设置了自动接受申请. 接下来会收到S2C_YOU_ENTERED_TEAM消息
		 *
		 * 没有附带信息, 解锁就行
		 */
		private function onAutoAcceptJoinUnlock(buffer:ByteBuffer):void
		{
			TeamManager.reqJoinOtherTeamComplete();
		}
		
		/**
		 * 请求发送成功，等待对方确认，解锁开始2分钟计时
		 * 申请加入别人队伍成功, 别人队伍有空位, 但是不是自动接受申请.
		 *
		 * 客户端需要自己保存自己的申请, 保留2分钟, 在收到入队/对方拒绝之前, 不能发送针对同一个人的申请
		 *
		 * 2分钟后自动删除申请, 需要提示则客户端自己提示, 服务器不会有消息通知
		 *
		 * 没有附带信息, 解锁
		 */
		private function onSendJoinWaitforReply(buffer:ByteBuffer):void
		{
			TeamManager.onJoinOtherTeamWaitComplete();
		}
		
		/**
		 *请求加入对方队伍失败
		 * @param buffer
		 * 1. 你已经有队伍 
		 * 2. 对方没有队伍 
		 * 3. 对方队伍已满 
		 * 4. 你已经在申请中了, 别重复申请 
		 * 5. 对方不在线
		 * 6. 不同国家的玩家不能组队
		 */
		private function onReqJoinTeamFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_YOU_HAVE_TEAM;
					break;
				case 2:
					errStr = LangTeam.TEAM_THE_OTHER_PARTY_NO_HAVE_TEAM;
					break;
				case 3:
					errStr = LangTeam.TEAM_THE_OTHER_PARTY_TEAM_MEMBER_MAX;
					break;
				case 4:
					errStr = LangTeam.TEAM_JOIN_TEAM_FAIL;
					break;
				case 5:
					errStr = LangTeam.TEAM_THE_OTHER_PARTY_NO_ONLINE;
					break;
				case 6:
					errStr = LangTeam.TEAM_PLAYER_NO_CAN_PLAY_IN_DIFFERENT_COUNTRIES;
					break;
			}
			NoticeManager.showNotify(errStr);
			TeamManager.unLockJoinOtherTeam();
		}
		
		/**
		 * 收到别人的入队申请. 客户端自己保留2分钟, 2分钟后删除, 不要自动发拒绝消息
		 *
		 * 如果退队, 或者队长换人, 或者退伍解散, 则自动删除所有申请, 不要发拒绝消息
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * varint32 对方等级
		 * UTFBytes 对方名字
		 */
		private function onGetJoinTeamRequest(buffer:ByteBuffer):void
		{
			var joinData:TeamJoinTeamInfo = new TeamJoinTeamInfo();
			joinData.id = buffer.readVarint64();
			joinData.level = buffer.readVarint32();
			joinData.name = BytesUtil.readRemainUTF(buffer);
			joinData.joinType = TeamType.JOININFO_TYPE_JOIN;
			
			if(TeamManager.autoAcceptleMemberJoin)
			{
				TeamSender.replyJoinTeamRequest(joinData.id, true);
			}
			else
			{
				TeamManager.addApplyJoinInfo(joinData);
				EventManager.dispatchEvent(TeamEvent.TEAM_APPLY_JOIN_INFO_CHANGE);
			}
		}
		
		/**
		 * 接受对方入队申请成功
		 * 回复申请成功, 解锁. 只有回复接受才会收到这条消息. 之后会跟着收到S2C_OTHER_JOIN_TEAM
		 *
		 * 没有附带信息
		 */
		private function onAgreeJoinSucessReply(buffer:ByteBuffer):void
		{
//			trace("回复别人的申请成功了");
		}
		
		/**
		 * 接受对方入队申请失败
		 * 回复申请失败, 解锁. 只有回复接受才会收到这条消息
		 *
		 * 附带varint32 错误码
		 *
		 * 1. 你不是队长
		 * 2. 你没有队伍
		 * 3. 对方不在线
		 * 4. 对方加入了别的队伍
		 * 5. 你的队伍满了
		 * 6. 申请过期了
		 * 7. 对方不是我们国家的
		 */
		private function onGetAgreeJoinFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_1;
					break;
				case 2:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_2;
					break;
				case 3:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_3;
					break;
				case 4:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_4;
					break;
				case 5:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_5;
					break;
				case 6:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_6;
					break;
				case 7:
					errStr = LangTeam.TEAM_GET_AGREE_JOIN_FAIL_7;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 别人拒绝了你的入队申请
		 *
		 * 根据消息中附带的id, 删除客户端缓存着的, 自己发出过的邀请. 可能在对方回复前, 自己下线又上线了, 附带的id缓存中没有
		 *
		 * 如果没有缓存, 则以消息中附带的名字提醒.
		 *
		 * 附带
		 * varint64 对方id
		 * UTFBytes 对方名字
		 */
		private function onGetRejectYourRqestTeam(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var name:String = BytesUtil.readRemainUTF(buffer);
			NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP18, name );
			TeamManager.unLockJoinOtherTeam();
		}
		
		/**
		 * 踢人成功, 解锁. 后面跟着会收到相应的消息.
		 *
		 * 被踢的会收到S2C_YOU_ARE_KICKED
		 *
		 * 如果队伍中还有其他人, 队中其他人会收到S2C_OTHER_LEAVE_TEAM
		 * 如果队伍中没有其他人, 会收到S2C_TEAM_DISMISS
		 *
		 * 没有附带信息
		 */
		private function onGetKickParterSuccess(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq(TeamModuleMessages.C2S_KICK);
			NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP19 );
		}
		
		/**
		 * 踢人失败, 附带varint32错误码
		 *
		 * 1. 你不是队长
		 * 2. 不能踢自己
		 * 3. 你要踢的id不在你队伍里
		 * 4. 你根本就没队伍
		 */
		private function onGetKickParterFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_GET_KICK_PARTER_FAIL_1;
					break;
				case 2:
					errStr = LangTeam.TEAM_GET_KICK_PARTER_FAIL_2;
					break;
				case 3:
					errStr = LangTeam.TEAM_GET_KICK_PARTER_FAIL_3;
					break;
				case 4:
					errStr = LangTeam.TEAM_GET_KICK_PARTER_FAIL_4;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 你被踢出队伍了（自己被踢了）
		 *
		 * 没有附带的信息
		 */
		private function onBeKickOut(buffer:ByteBuffer):void
		{
			TeamManager.beenKick();
		}
		
		/**
		 * 发送更换队长失败
		 * 请求失败, 附带varint32 失败原因
		 *
		 * 1. 你没有队伍
		 * 2. 你不是队长
		 * 3. 你发的id不在队伍里
		 * 4. 对方不在线
		 */
		private function onSendChangeCaptionFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_SEND_CHANGE_LEADER_FAIL_1;
					break;
				case 2:
					errStr = LangTeam.TEAM_SEND_CHANGE_LEADER_FAIL_2;
					break;
				case 3:
					errStr = LangTeam.TEAM_SEND_CHANGE_LEADER_FAIL_3;
					break;
				case 4:
					errStr = LangTeam.TEAM_SEND_CHANGE_LEADER_FAIL_4;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 队长改变
		 *
		 * 附带
		 * varint64 新的队长id
		 */
		private function onGetNewCaptionAppear(buffer:ByteBuffer):void
		{
			var leaderID:Number = buffer.readVarint64();
			TeamManager.onNewCaption(leaderID);
		}
		
		/**
		 * 队伍中有人下线了. 隐藏对方在线时间, 并且开始显示他自动退队倒计时, 为收到此消息5分钟以后
		 * 队长收到某队员下线，开始倒计时其5min后退队
		 * 
		 * 附带
		 *
		 * varint64 对方id
		 */
		private function onGetSomeOneOffLine(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var membInfo:TeamUnit = TeamManager.setTeamMembOffLine(id);
			if( id == MainRoleManager.actorID )
				TeamManager.sendTeamsMemberFollow( false );
			TeamManager.setTeamPlayerIsFollowing( false, membInfo.name );
//			TeamManager.hideTeamIcon( id );
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_INFO_UPDATE);
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_NOT_ONLINE);
		}
		
		/**
		 * 队伍中之前下线的人, 现在又重新上线了. 隐藏退队倒计时, 把他所在的场景设为消息中附带的场景
		 *
		 * 附带
		 *
		 * varint64 id
		 * varint32 场景id
		 * varint32 线数 (如果上面的场景id代表的是个副本, 无视这个数字)
		 * varint32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-3表示在三个国家]
		 */
		private function onGetSomeOneOnLine(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var mapID:int = buffer.readVarint32();
			var line:int  = buffer.readVarint32();
			var mapCountryId:int = buffer.readVarint32();
			var membInfo:TeamUnit = TeamManager.setTeamMembOnLine(id,mapID,line,mapCountryId);
//			var aotor:SceneRole = SceneManager.getSceneObjByID( id ) as SceneRole;
//			if( aotor != null )
//			{
//				NoticeManager.showNotify( LangTeam.TEAM_CHATA_TIP20, aotor.name );
//			}
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_INFO_UPDATE,membInfo);
		}
		
		/**
		 * 英雄上线时, 如果下线前有队伍, 队伍未解散且保留时间未过, 上线时会收到服务器推送的这条入队消息
		 *
		 * 有别于普通的S2C_YOU_ENTERED_TEAM, 这条应该不需要动画, 然后自己在队伍中所在的位置也不是最后一个
		 *
		 * 附带
		 *
		 * varint64 队长id
		 * bool 经验分配方式(true[伤害分配]/false(平均))
		 * varint32 物品分配方式TeamDropAllocateType
		 * while(byteArray.available){
		 *  var isSelf:Boolean = byteArray.readBoolean();
		 *
		 *  if (isSelf){
		 *      // 把自己插在这个位置
		 *  } else{
		 *      // 不是自己, 读取个队友
		 *
		 *      队员的writeTo
		 *  }
		 * }
		 */
		private function onGetOnLineBackTeam(buffer:ByteBuffer):void
		{
			var leaderID:Number = buffer.readVarint64();
			var isBool:Boolean = buffer.readBoolean();
			var type:int = buffer.readVarint32();
			TeamManager.setExpMode( isBool );
			TeamManager.setPickUpMode( type );
			TeamManager.updatMyHasTeam(true);
			
			var memData:TeamUnit;
			var isMe:Boolean;
			while (buffer.bytesAvailable)
			{
				isMe = buffer.readBoolean();
				if (isMe)
				{
					memData = TeamManager.getMyTeamMemData();
					TeamManager.addTeamMember(memData);
				}
				else
				{
					memData = initOneMemData(buffer);
					TeamManager.addTeamMember(memData);
//					TeamManager.showTeamIco(memData.id);
				}
			}
			TeamManager.refreshCaptain(leaderID);
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
		}
		
		/**
		 * 队友改变了等级, 服务器主动推送
		 *
		 * 附带
		 *
		 * varint64 id
		 * varint32 最新等级
		 */
		private function onGetTeamMembLevUp(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var newLv:int = buffer.readVarint32();
			var membInfo:TeamUnit = TeamManager.getSomeParterLvUp(id,newLv);
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_INFO_UPDATE,membInfo);
		}
		
		/**
		 * 队友改变了场景, 服务器主动推送
		 *
		 * 附带
		 * varint64 id
		 * varint32 场景id
		 * varint32 线数 (场景id是个副本时, 无视)
		 * varitn32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-3表示在三个国家]
		 */
		private function onGetTeamMembSceneChange(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var sceneId:int = buffer.readVarint32();
			var line:int  = buffer.readVarint32();
			var mapCountryId:int = buffer.readVarint32();
			var membInfo:TeamUnit = TeamManager.getPaterSceneChange(id,sceneId,line,mapCountryId);
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_MAP_UPDATE,membInfo);
		}
		
		/**
		 * 队友换装通知. 换 坐骑/套装/神兵等等各种
		 *
		 * 换装的英雄自己不会收到通知, 自己把组队界面里自己的形象变了. 坐骑永远显示最高阶的坐骑
		 *
		 * 附带
		 *
		 * varint64 换装的队友id
		 *
		 * 后面方法改成通用方法
		 * varint32 后面换装数据的长度
		 * while(buffer.readable()){
		 *      byte 换装资源
		 * }
		 */
		private function onGetTeamMembEquipChanged(buffer:ByteBuffer):void
		{
			var id:Number = buffer.readVarint64();
			var membInfo : TeamUnit = TeamManager.findMemberByID(id);
			if(buffer.bytesAvailable)
				membInfo.setResources(buffer);
			
			var race:int = membInfo.raceId;
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_INFO_UPDATE);
		}
		
		/**
		 * 队友被杀了. 和好友/仇人被杀的优先级关系是 好友 > 队友 > 仇人
		 *
		 * 队友死后, 不管怎么样, 都会收到这条消息. 先缓存1秒钟, 如果1秒后没有收到好友被杀消息(一定是同一个人, 别的好友被杀和这个人无关), 则显示这条队友被杀消息
		 * 如果1秒内, 收到了这个人的好友被杀消息, 则马上显示好友被杀消息, 并立刻删除队友被杀缓存
		 * 如果收到了这个人的仇人被杀消息, 则马上显示队友被杀消息 (因为一定不会是好友了), 不需要显示仇人被杀消息
		 *
		 *  附带
		 *
		 *  varint64 队友id // 如果收到这条消息的时候, 这个id已经不在队伍中了, 则忽略这条消息
		 *  varint32 地图id
		 *  varint32 坐标x
		 *  varint32 坐标y
		 *  varint64 杀手id
		 *  varint32 杀手所属国家[0-1-2]
		 *  UTF 杀手家族名
		 *  UTF 杀手名字
		 *  if(buffer.readable()) {
		 *      varint32 场景所属国家[0-1-2]
		 *  }
		 */
		private function onGetTeamMembBeKill(buffer:ByteBuffer):void
		{
			var membId:Number = buffer.readVarint64();//队友id
			var killerMapID:int = buffer.readVarint32();//地图id
			var killerMx:int = buffer.readVarint32();//坐标x
			var killerMy:int = buffer.readVarint32();//坐标y
			var killerId:Number = buffer.readVarint64();//杀手id
			var killerCountryId:int = buffer.readVarint32();//杀手所属国家[0-1-2]
			var killerGuildName:String = buffer.readUTF();//杀手家族名
			var killerName:String = BytesUtil.readRemainUTF(buffer);//杀手名字
			var inCountryId:int = -1;
			if(buffer.bytesAvailable)
			{
				inCountryId = buffer.readUint32();//场景所属国家[0-1-2]
			}
			
			var membInfo:TeamUnit = TeamManager.findMemberByID(membId);
			var mapName:String = MapDataManager.getMapName(killerMapID);
//			NoticeManager.notify(NoticeManager.CENTER_BOTTOM,LanguageConfig.getText(EnumLang_Team.TEAM_GET_TEAM_MEMBER_BE_KILL,[killerName]));
//			if(!ClientSettingManager.getBoolValue(EnumClientBoolSetting.SHIELD_TEAM_MEMBER_DIE_MSG))
//			{
//				var countryName:String = "中立区";
//				if(!MapDataManager.isMiddleScene(killerMapID))
//				{
//					countryName = CountryNameCfgData.getCountryNameById(inCountryId);
//				}
//				if(!MapDataManager.isNormalScene(killerMapID))
//				{
//					countryName = "副本";
//				}
//				//本队成员:【$0】，在$1，被【$2】$3【$4】玩家击败
//				var tranStr:String = SignTextUtil.getChatCountryTranPos(inCountryId,killerMapID, 1, killerMx, killerMy, "【" + countryName + "】" + mapName + "(" + killerMx + "，" + killerMy + ")");
//				tranStr += SignTextUtil.getChatCountryFlyPos(inCountryId,killerMapID, 1, killerMx, killerMy);
//				var zhiYuanStr:String = SignTextUtil.getChatCountryTranPos(inCountryId,killerMapID, 1, killerMx, killerMy, "前往支援");
//				var str:String = LanguageConfig.getText(EnumLang_Team.TEAM_GET_TEAM_MEMBER_BE_KILL_DETAIL,[membInfo.name,tranStr,countryName, killerGuildName,killerName]);
//				str += zhiYuanStr
//				NoticeManager.notify(NoticeManager.SYSTEM_CHAT,str,ChatChannelType.CHAT_CHANNEL_TEAM);
//			}
		}
		
		/**
		 * 请求同场景队友坐标失败 
		 * 获取队友id错误, 附带varint32 错误码
		 *
		 * 收到这条消息后, 不要再无脑请求队友位置了, 等个3秒先
		 *
		 * 1. 你没有队伍
		 * 2. 队伍中没有人和你在同一个场景
		 */
		private function onGetSameSceneTeamMembPosFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readVarint32();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_GET_SAME_SCENE_MEMB_POS_FAIL_1;
					break;
				case 2:
					errStr = LangTeam.TEAM_GET_SAME_SCENE_MEMB_POS_FAIL_2;
					break;
			}
//			NoticeManager.showNotify(errStr);
//			GameLog.add(LanguageConfig.getText(errStr));
		}
		
		/**
		 * 回复队友坐标
		 *
		 * 附带
		 *
		 * while(byteArray.available){
		 *  // 每个循环是队伍中和我在同一个场景的人的坐标. 没有附带在里面的, 就算你认为他和我在同一个场景, 也不显示坐标
		 *
		 *  varint64 队友id
		 *  varint32 x
		 *  varint32 y
		 * }
		 */
		private function onGetSameSceneTeamMembPosSuccess(buffer:ByteBuffer):void
		{
			while (buffer.bytesAvailable)
			{
				var playerId:Number = buffer.readVarint64();
				var playerPx:Number = buffer.readVarint64();
				var playerPy:Number = buffer.readVarint64();
				TeamManager.updateMyTeammebPos(playerId,playerPx,playerPy);
			}
			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_POS_UPDATE);
		}
		
		/**
		 * 请求队友位置成功
		 * varint32 场景id
		 * varint32 场景线路
		 * varint32 x坐标
		 * varint32 y坐标
		 */
		private function onGetTeamMembPosSuccess(buffer:ByteBuffer):void
		{
			var mapID:int = buffer.readVarint32();
			var line:int = buffer.readVarint32();
			var mx:int = buffer.readVarint32();
			var my:int = buffer.readVarint32();
			TeamManager.autoWalkToPoint( mapID, line, mx, my );
		}
		
		/**
		 * 请求队友位置失败，附带byte错误码
		 * 2、发送的英雄id是你自己
		 * 3、发送的英雄id不是你的队友
		 * 4、发送的英雄id当前不在线
		 * 5、队友不在普通场景（比如在副本中）
		 * 6、英雄等级不足，还不能进入队友所在的场景
		 */
		private function onGetTeamMembPosFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 2:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TO_WALK_FAIL_2;
					break;
				case 3:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TO_WALK_FAIL_3;
					break;
				case 4:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TO_WALK_FAIL_4;
					break;
				case 5:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TO_WALK_FAIL_5;
					break;
				case 6:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TO_WALK_FAIL_6;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 请求传送某队友位置成功  不附带任何信息
		 * @param buffer
		 */
		private function onGetTeamMembPosTransportSuccess(buffer:ByteBuffer):void
		{
		}
		
		/**
		 * 请求传送到队友位置失败，附带byte错误码
		 * 1、英雄不在普通场景中
		 * 2、发送的英雄id是你自己
		 * 3、发送的英雄id不是你的队友
		 * 4、发送的英雄id当前不在线
		 * 5、队友不在普通场景（比如在副本中）
		 * 6、英雄等级不足，还不能进入队友所在的场景
		 * 7、当前是攻城战期间，不能传送
		 * 8、传送物品不足
		 * 9、自己不在自己国家，无法队友传送
		 * 10、队友不在自己国家，无法队友传送
		 * 11、pk中
		 * 12、金子不够
		 */
		private function onGetTeamMembPosTransportFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_1;
					break;
				case 2:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_2;
					break;
				case 3:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_3;
					break;
				case 4:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_4;
					break;
				case 5:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_5;
					break;
				case 6:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_6;
					break;
				case 7:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_7;
					break;
				case 8:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_8;
					break;
				case 9:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_9;
					break;
				case 10:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_10;
					break;
				case 11:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_11;
					break;
				case 12:
					errStr = LangTeam.TEAM_GET_MEMB_POS_TRANSFER_FAIL_12;
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 广播成功
		 *
		 * bool true(大家跟我走啊)/false(大家别跟我走啊)
		 */	
		private function onTeamBroadcastFollow(buffer:ByteBuffer):void
		{
			var isFollowing:Boolean = buffer.readBoolean();
			if( isFollowing )
			{
				NoticeManager.showNotify( LangTeam.TEAM_LEADER_FOLLOW_1 );
			}
			else
			{
				TeamManager.removeALLTeamFollowPlayer();
				NoticeManager.showNotify( LangTeam.TEAM_LEADER_FOLLOW_4 );
				EventManager.dispatchEvent( TeamEvent.TEAM_FOLLOW_LEADER, [null] );
			}
		}
		
		/**
		 * 队长跟随失败
		 *
		 * 1. 你已经死了
		 * 2. 你不是队长
		 */
		private function onTeamBroadcastFollowFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = "你已经死了";
					break;
				case 2:
					errStr = "队伍人数最少需要两个人！";
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 队长邀请跟随,队员弹出二级确认窗口
		 *
		 * bool true(大家跟我走啊)/false(大家别跟我走啊)
		 */
		private function onTeamLeaderInviteFollow(buffer:ByteBuffer):void
		{
			var isFollowing:Boolean = buffer.readBoolean();
			TeamManager.teamLeaderFollwSuccess( isFollowing );
		}
		
		/**
		 * 队长传送门传送
		 *
		 * varint32 传送门id
		 */
		private function onTeamLeaderDoorTransport(buffer:ByteBuffer):void
		{
			var transportId:int = buffer.readVarint32();
		}
		
		/**
		 * 队员跟随成功
		 *
		 * bool true(跟党走)/false(滚一边去)
		 */
		private function onTeamMemberFollow(buffer:ByteBuffer):void
		{
			var isFollowing:Boolean = buffer.readBoolean();
			if( isFollowing )
			{
				TeamManager.addTeamFollowPlayer( isFollowing );
				if( !AppManager.isAppInScene( AppConstant.TEAM_FOLLOW_TEAM_PLAYER_PANEL ) )
					AppManager.showApp( AppConstant.TEAM_FOLLOW_TEAM_PLAYER_PANEL );
			}
			else
			{
				TeamManager.removeTeamFollowPlayer( isFollowing );
				if( AppManager.isAppInScene( AppConstant.TEAM_FOLLOW_TEAM_PLAYER_PANEL ) )
					AppManager.hideApp( AppConstant.TEAM_FOLLOW_TEAM_PLAYER_PANEL );
			}
		}
		
		/**
		 * 队员跟随失败，返回varint32错误码
		 *
		 * 1. 你已经死了
		 * 2. 你是队长
		 */
		private function onTeamMemberFollowFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = "你已经死了";
					break;
				case 2:
					errStr = "你是队长";
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 队长收到队员跟随了
		 *
		 * bool true(跟党走)/false(滚一边去)
		 *
		 * bytes 队员名字
		 */
		private function onTeamLeaderMemberFollow(buffer:ByteBuffer):void
		{
			var isFollowing:Boolean = buffer.readBoolean();
			var name:String = BytesUtil.readRemainUTF( buffer );
			TeamManager.teamMemberFollowSuccess( isFollowing, name );
		}
		
		/**
		 * 队伍经验分配成功
		 *
		 * bool true(伤害分配模式)/false(平均分配模式)
		 */
		private function onSetTeamExpAllocateBroadcast(buffer:ByteBuffer):void
		{
			var isBool:Boolean = buffer.readBoolean();
			TeamManager.setExpMode( isBool );
		}
		
		/**
		 * 队伍经验分配模式失败，返回varint32错误码
		 *
		 * 1. 你不是队长
		 */
		private function onSetTeamExpAllocateFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = "你已经死了";
					break;
			}
			NoticeManager.showNotify(errStr);
		}
		
		/**
		 * 队伍掉落分配方式成功
		 *
		 * varint32 TeamDropAllocateType ( 0：KILLER--猎杀者模式、1：TURN--轮流拾取、2：FREE--自由拾取 )
		 */
		private function onSetTeamDropAllocateBroadcast(buffer:ByteBuffer):void
		{
			var type:int = buffer.readVarint32();
			TeamManager.setPickUpMode( type );
		}
		
		/**
		 * 队伍经验分配模式失败，返回varint32错误码
		 *
		 * 1. 你不是队长
		 */
		private function onSetTeamDropAllocateFail(buffer:ByteBuffer):void
		{
			var errId:int = buffer.readByte();
			var errStr:String = "";
			switch(errId)
			{
				case 1:
					errStr = "你不是队长";
					break;
			}
			NoticeManager.showNotify(errStr);
		}
	}
}