package com.rpgGame.app.cmdlistener.society
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.SocietySender;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.society.SocietyJoinApproveData;
	import com.rpgGame.coreData.info.society.SocietyJoinInviteData;
	import com.rpgGame.coreData.lang.LangSociety;
	
	import flash.utils.ByteArray;
	
	import app.cmd.FamilyModuleMessages;
	import app.message.AllFamilyNewsProto;
	import app.message.ClientFamilyListProto;
	import app.message.FamilyOfficerPos;
	import app.message.FamilyProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.ds.HashMap;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 *
	 * 帮派消息处理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-27 上午10:05:12
	 *
	 */
	public class SocietyCmdListener extends BaseBean
	{
		public function SocietyCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_CREATE_FAMILY_FAIL, onRecCreateFamilyFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_CREATE_FAMILY_SUCCESS, onRecCreateFamilySuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_NEW_FAMILY_CREATED_BROADCAST, onRecNewFamilyCreatedBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_SELF_FAMILY_LIST, onRecReplySelfFamilyList);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_OTHER_FAMILY_LIST, onRecReplyOtherFamilyList);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_GET_SELF_FAMILY_INFO_FAIL, onRecGetSelfFamilyInfoFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_SELF_FAMILY_INFO, onRecGetSelfFamilyInfo);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_CHANGE_ANNOUNCEMENT_FAIL, onRecChangeAnnouncementFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_CHANGE_ANNOUNCEMENT_SUCCESS, onRecChangeAnnouncementSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_ANNOUNCEMENT_CHANGED_BROADCAST, onRecAnnouncementChangedBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_DO_DONATE_FAIL, onRecDoDonateFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_DO_DONATE_SUCCESS, onRecDoDonateSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_DO_DONATE_BROADCAST, onRecOtherDoDonateBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_UPGRADE_BUILDING_FAIL, onFamilyUpgradeBuildingFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_UPGRADE_BUILDING_SUCCESS, onFamilyUpgradeBuildingSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_UPGRADE_BUILDING_BROADCAST, onFamilyUpgradeBuildingBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_IMPEACH_FAMILY_LEADER, onImpeachFamilyLeader);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_IMPEACH_FAMILY_LEADER_FAIL, onImpeachFamilyLeaderFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_LEARN_FAMILY_COLLAGE_SPELL, onLearnFamilyCollageSpell);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_LEARN_FAMILY_COLLAGE_SPELL_FAIL, onLearnFamilyCollageSpellFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_GET_NEWS_FAIL, onGetNewsFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_NEWS, onReplyNews);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_DISMISS_FAMILY_FAIL, onRecDismissFamilyFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_DISMISS_FAMILY_SUCCESS, onRecDismissFamilySuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_LEAVE_FAMILY_FAIL, onRecLeaveFamilyFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_LEAVE_FAMILY_SUCCESS, onRecLeaveFamilySuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_LEAVE_FAMILY_BROADCAST, onRecOtherLeaveFamilyBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_KICK_MEMBER_FAIL, onRecKickMemberFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_KICK_MEMBER_SUCCESS, onRecKickMemberSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_YOU_BEEN_KICKED, onRecYouBeenKicked);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_SOMEONE_BEEN_KICKED_BROADCAST, onRecSomeoneBeenKickEdBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST_FAIL, onRecSetFamilyAutoAcceptJoinRequestFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST_SUCCESS, onRecSetFamilyAutoAcceptJoinRequestSucces);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_DISMISSED_BROADCAST, onRecDismissFamilyBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_DISMISSED_LOW_ACTIVITY, onRecDismissFamilyLowActivity);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_LOW_ACTIVITY_WARNING, onRecLowActivityWarning);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_JOIN_FAMILY_IN_CD, onRecJoinFamilyInCd);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_SET_POSITION_FAIL, onRecSetPositionFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_SET_POSITION_SUCCESS, onRecSetPositionSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_POSITION_CHANGE_BROADCAST, onRecPositionChangeBroadcast);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REQUEST_JOIN_FAIL, onRecRequestJoinFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REQUEST_JOIN_SUCCESS, onRecRequestJoinSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY, onRequestJoinSuccessWaitOtherReply);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_JOIN_FAMILY, onRecOtherJoinFamily);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_YOU_JOIN_FAMILY, onRecYouJoinFamily);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_HAS_REQUEST_JOIN_FAMILYS, onRecRequestJoinFamilys);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_GET_REQUEST_JOIN_DETAIL, onRecGetRequestJoinDetail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_GET_REQUEST_JOIN_DETAIL_FAIL, onRecGetRequestJoinDetailFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_HAS_REQUEST_JOIN, onRecHasRequestJoin);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_JOIN_REQUEST_SUCCESS, onRecReplyJoinRequestSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_JOIN_REQUEST_FAIL, onRecReplyJoinRequestFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_YOUR_JOIN_REQUEST_CANCEL, onRecYourJoinRequestCancel);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_REJECTED_YOUR_JOIN_REQUEST, onRecOtherRejectedYourJoinRequest);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_ACCEPTED_YOUR_JOIN_REQUEST, onRecOtherAcceptedYourJoinRequest);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_INVITE_JOIN_FAIL, onRecInvieJoinFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_INVITE_JOIN_SUCCESS, onRecInvieJoinSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_INVITE_JOIN_SUCCESS_AND_WAIT_OTHER_REPLY, onRecInvieJoinSuccessAndWaitOtherReply);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_RECEIVE_JOIN_INVITE, onRecReceiveJoinInvite);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_JOIN_INVITE_FAIL, onRecReplyJoinInviteFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_REPLY_JOIN_INVITE_SUCCESS, onRecReplyJoinInviteSuccess);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_REJECTED_YOUR_JOIN_INVITE, onRecOtherRefectedYourJoinInvite);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OTHER_ACCEPTED_YOUR_JOIN_INVITE, onRecOtherAcceptedYourJoinInvite);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OPEN_FAMILY_ANIMAL_DUNGEON, onRecOpenFamilyAnimalDungeon);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_OPEN_FAMILY_ANIMAL_DUNGEON_FAIL, onRecOpenFamilyAnimalDungeonFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_ANIMAL_DUNGEON_START, onRecFamilyAnimalDungeonStart);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_FAMILY_ANIMAL_DUNGEON_END, onRecFamilyAnimalDungeonEnd);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN, onRecTryEnterFamilyAnimalDungeon);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN_FAIL, onRecTryEnterFamilyAnimalDungeonFail);
			SocketConnection_protoBuffer.addCmdListener(FamilyModuleMessages.S2C_ENTER_FAMILY_ANIMAL_DUNGEON, onRecEnterFamilyAnimalDungeon);

			/////////////////////////////////////
			finish();
		}

		/**
		 * 创建家族失败, 附带varint32 失败原因
		 *
		 * 1. 你有家族
		 * 2. 钱不够
		 * 3. 家族功能没开启
		 * 4. 家族名字字数不对
		 * 5. 家族名字已经存在
		 * 6. 城战中不能创建家族
		 * 7. 退出家族24小时内不能加入其它家族
		 * 8. 物品不足
		 */
		private function onRecCreateFamilyFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_7;
					break;
				case 8:
					failReason = LangSociety.CREATE_SOCIETY_FAIL_8;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 家族创建成功. 将自己家族设为消息发过来的家族. 不会向创建者发送入族消息了
		 *
		 * 服务器会另外发送扣钱消息, 这条消息不需要处理
		 *
		 * 附带
		 *
		 * bytes 家族名字 (和客户端请求的不一样, 前面加上了区服id)
		 */
		private function onRecCreateFamilySuccess(buffer : ByteBuffer) : void
		{
			var guildName : String = BytesUtil.readRemainUTF(buffer);
			SocietyManager.joinSociety(guildName);
		}

		/**
		 * 大家飘字: 江湖风起云涌，又一个新势力【家族名称】崛起了
		 *
		 * 附带
		 * varint64 族长ID
		 * UTF 族长名字
		 * UTFBytes 家族名字
		 */
		private function onRecNewFamilyCreatedBroadcast(buffer : ByteBuffer) : void
		{
			var headId : Number = buffer.readVarint64();
			var headName : String = buffer.readUTF();
			var familyName : String = BytesUtil.readRemainUTF(buffer);
			SocietyManager.changeHeroFamily(headId, familyName);
		}

		/**
		 * 回复家族列表信息, 已压缩
		 * 附带
		 * ClientFamilyListProto
		 */
		private function onRecReplySelfFamilyList(buffer : ByteBuffer) : void
		{
			var familyProto : ClientFamilyListProto = new ClientFamilyListProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			familyProto.mergeFrom(bytes);
			SocietyManager.setClientFamilyProto(familyProto);
		}

		/**
		 * 回复他国家族列表信息, 已压缩
		 *
		 * 附带
		 *
		 * ClientFamilyListProto
		 */
		private function onRecReplyOtherFamilyList(buffer : ByteBuffer) : void
		{
			var familyProto : ClientFamilyListProto = new ClientFamilyListProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			familyProto.mergeFrom(bytes);
			SocietyManager.setClientOtherFamilyProto(familyProto);
		}

		/**
		 * 请求家族信息失败, 附带varint32 错误码
		 *
		 * 1. 请求太频繁
		 * 2. 你当前没有家族
		 * 3. 服务器内部错误, 不要自动重试
		 */
		private function onRecGetSelfFamilyInfoFail(buffer : ByteBuffer) : void
		{
			SocietySender.unlockReqGetSelfFamilyInfoReference();
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.GET_SELF_FAMILY_INFO_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.GET_SELF_FAMILY_INFO_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.GET_SELF_FAMILY_INFO_FAIL_3;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 回复家族详细信息. 消息已压缩
		 *
		 * 附带
		 *
		 * FamilyProto
		 */
		private function onRecGetSelfFamilyInfo(buffer : ByteBuffer) : void
		{
			SocietySender.unlockReqGetSelfFamilyInfoReference();
			var familyProto : FamilyProto = new FamilyProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			familyProto.mergeFrom(bytes);
			SocietyManager.setSelfSocietyInfo(familyProto);
		}

		/**
		 * 回复别人的入族申请失败. 一定是同意才会收到. 失败不会有返回
		 *
		 * 附带varint32 错误码
		 *
		 * 1. 你当前没有家族
		 * 2. 你不是族长或副族长或堂主
		 * 3. 申请已过期
		 * 4. 对方已经在你家族中了 (可能通过其他途径加入)
		 * 5. 对方已经在其他家族中了
		 * 6. 对方已经不在线
		 * 7. 自己家族人满了
		 * 8. 板块战期间
		 * 9. 对方不在自己国家了
		 * 10. 退出家族24小时内不能加入其它家族
		 */
		private function onRecReplyJoinRequestFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_7;
					break;
				case 8:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_8;
					break;
				case 9:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_9;
					break;
				case 10:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_REQUEST_FAIL_10;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 某个家族取消了你的申请
		 * UTFBytes 家族名字
		 */
		private function onRecYourJoinRequestCancel(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST);
			var familyName : String = BytesUtil.readRemainUTF(buffer);
			SocietyManager.removeJoinFamily(familyName);
		}

		/**
		 * 同意对方入族申请成功, 马上就会收到对方入族的广播.
		 * 解锁 C2S_REPLY_JOIN_REQUEST
		 * 没有附带信息
		 */
		private function onRecReplyJoinRequestSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST);
		}

		/**
		 * 族主/副族主 拒绝了别人的入族申请后, 申请者会收到这条
		 * 收到后删掉对应的家族的申请缓存, 使自己能再次发出入这个族的申请
		 * 显示提示 很抱歉，XXX家族拒绝了您的入族申请
		 * 只有自己当前没有家族时才会收到
		 * 附带
		 * bytes 家族名字
		 */
		private function onRecOtherRejectedYourJoinRequest(buffer : ByteBuffer) : void
		{
			var familyName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			SocietyManager.removeJoinFamily(familyName);
			NoticeManager.showNotify(LangSociety.SOCIETY_REJECTED_YOUR_JOIN, familyName);
		}

		/**
		 * 族主/副族主 同意了别人的入族申请后, 申请者会收到这条
		 * 紧接着会收到 S2C_YOU_JOIN_FAMILY
		 * 提示 恭喜，XXX家族已同意您的入族请求
		 * 附带
		 * bytes 家族名字
		 */
		private function onRecOtherAcceptedYourJoinRequest(buffer : ByteBuffer) : void
		{
			var familyName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			SocietyManager.deleteAllJoinFamily();
			NoticeManager.showNotify(LangSociety.SOCIETY_ACCEPTED_YOUR_JOIN, familyName);
		}

		/**
		 * 邀请失败, 附带varint32 错误码
		 * 1. 你没有家族
		 * 2. 你不是族主或副族主
		 * 3. 家族人已经满了
		 * 4. 对方不在线
		 * 5. 对方已经在你家族里了
		 * 6. 对方在别的家族里
		 * 7. 已经邀请过对方了
		 * 8. 对方等级不够
		 * 9. 对方设置了 禁止被别人邀请加入家族
		 * 10. 板块战期间
		 * 11. 对方是别的联服的
		 * 12. 对方退出家族24小时内不能加入其它家族
		 */
		private function onRecInvieJoinFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_INVITE_JOIN);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_7;
					break;
				case 8:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_8;
					break;
				case 9:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_9;
					break;
				case 10:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_10;
					break;
				case 11:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_11;
					break;
				case 12:
					failReason = LangSociety.SOCIETY_INVITE_JOIN_FAIL_12;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 邀请成功, 对方是自动接受邀请的
		 * 紧接着就会收到 S2C_OTHER_JOIN_FAMILY 对方加入家族的消息
		 * 没有附带信息
		 */
		private function onRecInvieJoinSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_INVITE_JOIN);
			NoticeManager.showNotify("邀请成功，对方自动接受了您的邀请");
		}

		/**
		 * 邀请成功, 对方不是自动接受邀请的, 需要等待对方的回复
		 * 客户端需要自己缓存自己邀请过的人的id, 缓存2分钟, 2分钟后删掉. 过期时, 服务器不会再发消息通知
		 * 没有附带信息
		 */
		private function onRecInvieJoinSuccessAndWaitOtherReply(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_INVITE_JOIN);
			NoticeManager.showNotify("邀请成功，请等待对方的回复");
		}

		/**
		 * 收到别的家族的入族邀请
		 *
		 * 缓存2分钟, 2分钟后删掉
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * UTF 对方玩家名字
		 * varint32 等级
		 *
		 * 后面方法改成通用方法
		 * varint32 后面换装数据的长度
		 * while(buffer.readable()){
		 *      byte 换装资源
		 * }
		 *
		 * varint32 家族等级等级
		 * UTFBytes 家族名字
		 */
		private function onRecReceiveJoinInvite(buffer : ByteBuffer) : void
		{
			var inviteData : SocietyJoinInviteData = new SocietyJoinInviteData();
			inviteData.heroId = buffer.readVarint64();
			inviteData.heroName = buffer.readUTF();
			inviteData.level = buffer.readVarint32();
			var resourcesLen : int = buffer.readVarint32();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes, 0, resourcesLen);
			inviteData.equipmentResources = bytes;
			inviteData.societyLevel = buffer.readVarint32();
			inviteData.societyName = BytesUtil.readRemainUTF(buffer);
			inviteData.outTime = SystemTimeManager.curtTm + SocietyManager.INVITATE_ME_TIMEOUT;

			SocietyManager.addInvitateMe(inviteData);
		}

		/**
		 * 回复入族邀请失败, 只有同意才会收到
		 *
		 * 附带varint32 错误码
		 *
		 * 1. 你已经有家族了
		 * 2. 对方家族已经满了
		 * 3. 邀请过期
		 * 4. 你返回的家族不存在
		 * 5. 板块战期间
		 * 6. 你更改国家了
		 * 7. 你退出家族24小时内不能加入其它家族
		 */
		private function onRecReplyJoinInviteFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.SOCIETY_REPLY_JOIN_INVITE_FAIL_7;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 回复同意进入家族成功, 解锁C2S_REPLY_JOIN_INVITE, 紧接着会收到 S2C_YOU_JOIN_FAMILY
		 * 没有附带信息
		 */
		private function onRecReplyJoinInviteSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REPLY_JOIN_INVITE);
		}

		/**
		 * 发给别人的入族邀请, 被别人拒绝了. 从本地删除自己发送给他的入族邀请缓存, 使自己能再次邀请他
		 *
		 * 可能玩家下线再上, 导致没有邀请过的人的缓存, 多发了个对方名字, 供显示被拒绝提示
		 *
		 * 附带
		 * varint64 对方id
		 * UTFBytes 对方名字
		 */
		private function onRecOtherRefectedYourJoinInvite(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var heroName : String = BytesUtil.readRemainUTF(buffer);

			//SocietyManager.deleteMyInviationOther(heroId);

			NoticeManager.showNotify(heroName + "拒绝了您的入帮邀请");
		}

		/**
		 * 别人同意了你的入族邀请. 发送给主动邀请别人的人
		 * 只需要展示 恭喜, xxx同意了你的家族邀请
		 * 附带
		 * varint64 heroId
		 * UTFBytes 对方名字
		 */
		private function onRecOtherAcceptedYourJoinInvite(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var heroName : String = BytesUtil.readRemainUTF(buffer);
			NoticeManager.showNotify(LangSociety.SOCIETY_ACCEPTED_YOUR_JOIN_INVITE, heroName);
			//SocietyManager.deleteMyInviationOther(heroId);
		}

		/**
		 * 开启帮派神兽副本成功
		 */
		private function onRecOpenFamilyAnimalDungeon(buffer : ByteBuffer) : void
		{
			SocietyManager.openAnimalDungeon();
		}

		/**
		 * 开启帮派神兽副本失败，返回varint32错误码
		 *
		 * 1. 没有帮派
		 * 2. 没有权限开启
		 * 3. 时间没到，无法开启
		 * 4. 今天已经开启了
		 * 5. 服务器bug
		 */
		private function onRecOpenFamilyAnimalDungeonFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_OPEN_ANIMAL_DUNGEON_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_OPEN_ANIMAL_DUNGEON_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_OPEN_ANIMAL_DUNGEON_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_OPEN_ANIMAL_DUNGEON_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_OPEN_ANIMAL_DUNGEON_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 帮派神兽副本开启了
		 *
		 * varint64 开启时间
		 * varint32 开启时兽栏等级
		 */
		private function onRecFamilyAnimalDungeonStart(buffer : ByteBuffer) : void
		{
			var startTime : Number = buffer.readVarint64();
			var bossLevel : Number = buffer.readVarint32();
			SocietyManager.setAnimalDungeonStart(startTime, bossLevel);
		}

		/**
		 * 帮派神兽副本结束了
		 */
		private function onRecFamilyAnimalDungeonEnd(buffer : ByteBuffer) : void
		{
			SocietyManager.setAnimalDungeonEnd();
		}

		/**
		 * 进入帮派神兽副本成功
		 */
		private function onRecTryEnterFamilyAnimalDungeon(buffer : ByteBuffer) : void
		{
		}

		/**
		 * 进入帮派神兽副本失败，返回varint32错误码
		 *
		 * 1. 没有帮派
		 * 2. 活动没有开启
		 * 3. 当前已经死亡了
		 * 4. 没在普通场景中
		 * 5. 战斗状态中
		 */
		private function onRecTryEnterFamilyAnimalDungeonFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_ENTER_ANIMAL_DUNGEON_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_ENTER_ANIMAL_DUNGEON_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_ENTER_ANIMAL_DUNGEON_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_ENTER_ANIMAL_DUNGEON_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_ENTER_ANIMAL_DUNGEON_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 进入了帮派神兽副本
		 *
		 * varint64 副本结束时间
		 */
		private function onRecEnterFamilyAnimalDungeon(buffer : ByteBuffer) : void
		{
			var endTime : Number = buffer.readVarint64();
			SocietyManager.enterAnimalDungeon(endTime);
		}

		/**
		 * 改变家族公告失败, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 * 2. 你不是族长或者副族长
		 * 3. 公告长度非法 必须是0-200字符
		 * 4. 请求频率过快
		 */
		private function onRecChangeAnnouncementFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_CHANGE_ANNOUNCEMENT);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.CHANGE_ANNOUNCEMENT_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.CHANGE_ANNOUNCEMENT_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.CHANGE_ANNOUNCEMENT_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.CHANGE_ANNOUNCEMENT_FAIL_4;
					break;
			}
			NoticeManager.showNotify(failReason, failID);

			SocietyManager.restoreAnnouncement();
		}

		/**
		 * 改变公告成功, 把公告内容改成请求的内容.
		 * 没有附带信息
		 */
		private function onRecChangeAnnouncementSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_CHANGE_ANNOUNCEMENT);
			NoticeManager.showNotify(LangSociety.CHANGE_ANNOUNCEMENT_SUCCESS);
			SocietyManager.submitAnnouncement();
		}

		/**
		 * 家族中其他人收到此广播, 修改者不会收到. 收到后清掉家族信息缓存, 如果当前正打开着家族面板, 则马上刷新
		 * 提示 家族公告更新了，欢迎查看
		 * 没有附带信息
		 */
		private function onRecAnnouncementChangedBroadcast(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangSociety.SOCIETY_ANNOUNCEMENT_CHANGED_BROADCAST);
		}

		/**
		 * 捐献银两失败, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 * 2. 你没有这么多钱
		 * 3. 家族贡献里的钱满了 比如只差1块, 但你要捐2块. 结果就是完全没捐
		 * 4. 发来的银子数量非法
		 * 5. 发来的物品数量非法
		 * 6. 帮派建设令牌不足
		 */
		private function onRecDoDonateFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_DO_DONATE);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.DO_DONATE_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.DO_DONATE_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.DO_DONATE_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.DO_DONATE_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.DO_DONATE_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.DO_DONATE_FAIL_6;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 捐献银两成功, 服务器会另外发送扣钱消息
		 *
		 * 提示 感谢您，捐献了XXX银两，您获得了X点家族贡献和X点江湖历练 (根据自己发的请求自己算)
		 *
		 * 附带
		 */
		private function onRecDoDonateSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_DO_DONATE);
			NoticeManager.showNotify(LangSociety.SOCIETY_DO_DONATE_SUCCESS);
		}

		/**
		 * 族中其他人捐献了银两
		 *
		 * 显示 聊天栏帮派频道发送消息：[帮派]玩家名捐献10个建设令牌，个人贡献+100！ 我要捐献
		 * 或 [帮派]玩家名捐献银子10锭10两，个人贡献+100！ 我要捐献
		 *
		 * 如果当前正打开着家族界面, 修改家族帮派银两数量，修改家族帮派建设令牌数量
		 *
		 * 附带
		 *
		 * bool true(捐钱)/false(捐物)
		 * if(捐钱){
		 *      varint32 捐献多少个基础银两，注意，这个值不是银两，比如100文换10贡献值，这里发送1000，就是花费100000问，获得1000贡献值
		 *      varint64 当前有多少银两
		 * } else {
		 *      varint32 捐献物品的个数
		 *      varint64 当前有多少个建设令牌
		 * }
		 *
		 * varint64 捐献的人的id
		 * bytes 捐献的人名字
		 */
		private function onRecOtherDoDonateBroadcast(buffer : ByteBuffer) : void
		{
			var isMoney : Boolean = buffer.readBoolean();
			if (isMoney)
			{
				var donateMoney : int = buffer.readVarint32();
				var hasMoney : Number = buffer.readVarint64();
				SocietyManager.setBuildMoney(donateMoney, hasMoney);
			}
			else
			{
				var donateGoodsCount : int = buffer.readVarint32();
				var hasGoodsCount : Number = buffer.readVarint64();
				SocietyManager.setBuildToken(donateGoodsCount, hasGoodsCount);
			}
		}

		/**
		 * 家族等级升级失败, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 * 2. 你不是族长
		 * 3. 建筑已经顶级
		 * 4. 升级钱不够
		 * 5. 升级建设令牌不够
		 * 6. 未知的要升级的建筑类型
		 * 7. 大厅等级不够，无法升级
		 */
		private function onFamilyUpgradeBuildingFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.FAMILY_UPGRADE_BUILDING_FAIL_7;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 升级成功, 刷新家族页面
		 *
		 * varint64 当前的帮派仓库银两
		 * varitn64 当前的帮派仓库建设令牌
		 */
		private function onFamilyUpgradeBuildingSuccess(buffer : ByteBuffer) : void
		{
			var hasMoney : Number = buffer.readVarint64();
			var hasGoodsCount : Number = buffer.readVarint64();
			SocietyManager.setBuildAmount(hasMoney, hasGoodsCount);

			NoticeManager.showNotify(LangSociety.SOCIETY_UPGRADE_BUILDING_SUCCESS);
		}

		/**
		 * 家族等级升级成功, 广播给家族里所有人
		 *
		 * 附带
		 *
		 * varint32 建筑类型FamilyBuildingType
		 * varint32 最新家族等级等级
		 */
		private function onFamilyUpgradeBuildingBroadcast(buffer : ByteBuffer) : void
		{
			var type : int = buffer.readVarint32();
			var level : int = buffer.readVarint32();
			SocietyManager.setBuildLevel(type, level);
		}

		/**
		 * 弹劾成功，接下来会收到帮主变更的通知
		 */
		private function onImpeachFamilyLeader(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangSociety.IMPEACH_FAMILY_LEADER_SUCCESS);
		}

		/**
		 * 弹劾失败，返回varint32错误码
		 *
		 * 1. 没有加入帮派
		 * 2. 服务器bug
		 * 3. 你自己是帮主，无法弹劾
		 * 4. 时间没到，不可以弹劾
		 * 5. 没有权限
		 */
		private function onImpeachFamilyLeaderFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.IMPEACH_FAMILY_LEADER_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.IMPEACH_FAMILY_LEADER_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.IMPEACH_FAMILY_LEADER_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.IMPEACH_FAMILY_LEADER_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.IMPEACH_FAMILY_LEADER_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 学习技能成功
		 *
		 * varint32 第几个技能
		 * varint32 技能等级
		 */
		private function onLearnFamilyCollageSpell(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_LEARN_FAMILY_COLLAGE_SPELL);
			var index : int = buffer.readVarint32();
			var level : int = buffer.readVarint32();
			SocietyManager.setSocietySpellLevel(index, level);
		}

		/**
		 * 学习技能失败，返回varint32错误码
		 *
		 * 1. 没有加入帮派
		 * 2. 要学习的技能没找到
		 * 3. 要学习的技能已经满级了
		 * 4. 书院等级不足
		 * 5. 钱不够
		 * 6. 帮贡不够
		 * 7. 物品数量不够
		 */
		private function onLearnFamilyCollageSpellFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_LEARN_FAMILY_COLLAGE_SPELL);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.LEARN_FAMILY_COLLAGE_SPELL_FAIL_7;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 获取家族见闻出错, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 */
		private function onGetNewsFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_GET_NEWS_FAIL_1;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 返回家族见闻, 消息已压缩
		 *
		 * 附带
		 *
		 * AllFamilyNewsProto 这个proto 具体proto内容和读法, 客户端做到再说
		 */
		private function onReplyNews(buffer : ByteBuffer) : void
		{
			var datasProto : AllFamilyNewsProto = new AllFamilyNewsProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			datasProto.mergeFrom(bytes);
			SocietyManager.setClientNewsProto(datasProto);
		}


		/**
		 * 离开家族失败, 附带varint32 错误码
		 *
		 * 1. 你本来就没有家族
		 * 2. 你是族长
		 * 3. 家族战期间（包括板块战，无双城，皇城）
		 * 4. 正在打家族副本
		 */
		private function onRecLeaveFamilyFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_LEAVE_FAMILY);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.LEAVE_FAMILY_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.LEAVE_FAMILY_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.LEAVE_FAMILY_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.LEAVE_FAMILY_FAIL_4;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 离开家族成功, 自己把自己的家族设为空
		 */
		private function onRecLeaveFamilySuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_LEAVE_FAMILY);
			SocietyManager.leaveSociety();
		}

		/**
		 * 解散帮派失败, 附带varint32 错误码
		 *
		 * 1. 你没有帮派
		 * 2. 你不是帮主
		 * 3. 占领王/皇家族无法解散
		 * 4. 人数太多，无法解散，只有帮主一个人时才可以解散
		 */
		private function onRecDismissFamilyFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_DISMISS_FAMILY);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.DISMISS_FAMILY_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.DISMISS_FAMILY_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.DISMISS_FAMILY_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.DISMISS_FAMILY_FAIL_4;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 帮派解散成功, 解锁. 马上全服会收到广播S2C_FAMILY_DISMISSED_BROADCAST
		 *
		 * 没有附带信息
		 */
		private function onRecDismissFamilySuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_DISMISS_FAMILY);
			SocietyManager.leaveSociety();
		}

		/**
		 * 其他人离开了家族, 广播给在家族中的人, 收到后如果当前打开着家族成员列表, 则马上刷新一下
		 *
		 * 附带
		 * UTFBytes
		 */
		private function onRecOtherLeaveFamilyBroadcast(buffer : ByteBuffer) : void
		{
			var heroName : String = BytesUtil.readRemainUTF(buffer);
			SocietySender.setReqGetSelfFamilyInfoChanged();
			NoticeManager.showNotify(LangSociety.SOCIETY_OTHER_LEAVE_FAMILY, heroName);
		}

		/**
		 * 踢人失败, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 * 2. 你没有权限 (族主或副族主才能踢人) (如果要踢有官职的必须是族主) (不能踢自己)
		 * 3. 族中没有你要踢的这个人
		 * 4. 家族战期间（包括板块战，无双城，皇城）
		 * 5. 这个人在打家族副本
		 */
		private function onRecKickMemberFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_KICK_MEMBER);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.KICK_MEMBER_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.KICK_MEMBER_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.KICK_MEMBER_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.KICK_MEMBER_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.KICK_MEMBER_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 踢人成功, 紧接着会收到S2C_SOMEONE_BEEN_KICKED的广播
		 * 没有附带信息
		 */
		private function onRecKickMemberSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_KICK_MEMBER);
		}

		/**
		 * 被踢的人, 收到这条. 将自己的家族设为空, 角色名字上面不要有家族. 如果打开着家族页面, 改为创建家族页面
		 *
		 * 附带
		 *
		 * UTFBytes 踢你的人的名字
		 */
		private function onRecYouBeenKicked(buffer : ByteBuffer) : void
		{
			var heroName : String = BytesUtil.readRemainUTF(buffer);
			SocietyManager.leaveSociety();

			NoticeManager.showNotify(LangSociety.SOCIETY_YOU_BEEN_KICKED, heroName);
		}

		/**
		 * 有人被提出家族了, 家族中所有人收到广播, 被踢的不会收到
		 *
		 * 收到这条时, 如果正打开着家族成员列表, 则刷新.
		 *
		 * 附带
		 *
		 * UTF 主动踢人的人名
		 * UTFBytes 被踢的人名
		 */
		private function onRecSomeoneBeenKickEdBroadcast(buffer : ByteBuffer) : void
		{
			var heroName : String = buffer.readUTF();
			var kickName : String = BytesUtil.readRemainUTF(buffer);
			SocietySender.setReqGetSelfFamilyInfoChanged();

			NoticeManager.showNotify(LangSociety.SOCIETY_SOMEONE_BEEN_KICK, heroName, kickName);
		}

		/**
		 * 设置失败, 附带varint32 错误码
		 *
		 * 1. 你没有家族
		 * 2. 你不是族主
		 */
		private function onRecSetFamilyAutoAcceptJoinRequestFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SET_FAMILY_AUTO_ACCEPT_JOIN_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SET_FAMILY_AUTO_ACCEPT_JOIN_FAIL_2;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 设置成功
		 */
		private function onRecSetFamilyAutoAcceptJoinRequestSucces(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST);
		}

		/**
		 * 广播给全服, 此家族已解散. 把这个家族从自己的盟族和敌对族中删除
		 *
		 * 视野里如果有这个家族的人, 则把他们的家族设为无
		 * 如果解散的家族是自己的族, 把自己的家族设为无. 显示 您所处的家族XXXX，被族长XXX解散了
		 *
		 * 附带
		 * varint64 族长id
		 * UTF 族长名字
		 * UTFBytes 解散的家族的名字
		 */
		private function onRecDismissFamilyBroadcast(buffer : ByteBuffer) : void
		{
			var leadId : Number = buffer.readVarint64();
			var headName : String = buffer.readUTF();
			var familyName : String = BytesUtil.readRemainUTF(buffer);

			NoticeManager.showNotify(LangSociety.SOCIETY_DISMISS_FAMILY_BROADCAST, familyName, headName);
		}

		/**
		 * 广播全服. 因为活跃度不足而解散. 逻辑和上面一样, 只是提示自己家族的人的话不同
		 *
		 * 您所在的家族XXX因活跃玩家不足而自动解散
		 *
		 * 附带
		 *
		 * UTFBytes 解散的家族的名字
		 */
		private function onRecDismissFamilyLowActivity(buffer : ByteBuffer) : void
		{
			var familyName : String = BytesUtil.readRemainUTF(buffer);
			NoticeManager.showNotify(LangSociety.SOCIETY_DISMISS_FAMILY_LOW_ACTIVITY, familyName);
		}

		/**
		 * 上线时, 如果家族活跃度不够, 会收到
		 *
		 * 您所在的家族每日活跃玩家不足，请多招募成员，并鼓励成员每日上线，否则您的家族将会于 x 日内解散
		 *
		 * 附带
		 *
		 * varint32 剩余多少天会被解散
		 */
		private function onRecLowActivityWarning(buffer : ByteBuffer) : void
		{
			var day : int = buffer.readVarint32();
			NoticeManager.showNotify(LangSociety.SOCIETY_LOW_ACTIVEITY_WARNING, day);
		}

		/**
		 * 下次能够加入家族或者创建家族的cd刷新了
		 *
		 * varint64 下一次能够创建/加入家族的时间
		 */
		private function onRecJoinFamilyInCd(buffer : ByteBuffer) : void
		{

		}

		/**
		 * 设置失败, 附带varint32 错误码
		 * 1. 你没有家族
		 * 2. 你不是族主
		 * 3. 对应id的人不在你家族中
		 * 4. 职位非法
		 * 5. 目标已经是那个职位了
		 * 6. 不能改自己的职位
		 * 7. 自己是无双城主
		 * 8. 家族战期间（包括板块战，无双城，皇城）
		 * 9. 自己是皇城城主
		 * 10.长老人数已达上限，无法再任命
		 * 11.执事人数已达上限，无法再任命
		 * 12.当前家族运镖中无法任命族主
		 */
		private function onRecSetPositionFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_SET_POSITION);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_7;
					break;
				case 8:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_8;
					break;
				case 9:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_9;
					break;
				case 10:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_10;
					break;
				case 11:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_11;
					break;
				case 12:
					failReason = LangSociety.SOCIETY_SET_POSTION_FAIL_12;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 设置成功, 解锁. 接下来全家族收到S2C_POSITION_CHANGE_BROADCAST
		 *
		 * 如果给别人的新职位是族长,则提示 您将族长禅让给了：XXXX玩家名
		 */
		private function onRecSetPositionSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_SET_POSITION);

			NoticeManager.showNotify("设置官职成功");
		}

		/**
		 * 族中职位变动, 收到后如果正打开着家族成员列表, 则刷新
		 * 需要根据里面的职位, 和被设置职位的人, 显示对应的提醒.
		 *
		 * 如果职位是族长, 且被设置的人是自己, 显示　恭喜您被提升为【族长】
		 * 不然则显示　本家族族长变更，欢迎新族长：XXXXX
		 *
		 * 其他职位, 如果被设置的人是自己, 则显示 您在族中的职位变更为：XXXX
		 * 不然则显示 本家族XXX被任命为XXX职位
		 *
		 * 附带
		 *
		 * varint64 被改的人id, 用来和自己的id比对
		 * UTFBytes 被改的人名字
		 * bool true(设置为上任)/false(设置为卸任)
		 * varint32 目标职位 OfficerPos
		 *
		 */
		private function onRecPositionChangeBroadcast(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var heroName : String = buffer.readUTF();
			var takeOffice : Boolean = buffer.readBoolean();
			var pos : int = buffer.readVarint32();
			SocietyManager.setMemberOfficer(heroId, pos, takeOffice);

			SocietySender.setReqGetSelfFamilyInfoChanged();

			if (pos > -1)
			{
				switch (pos)
				{
					case FamilyOfficerPos.LEADER:
						NoticeManager.showHint(EnumHintInfo.POSITION_CHANGE_BROADCAST1, [heroName]);
						return;
					case FamilyOfficerPos.VICE_LEADER:
						NoticeManager.showHint(EnumHintInfo.POSITION_CHANGE_BROADCAST2, [heroName]);
						return;
				}
			}
		}

		/**
		 * 要求加入家族失败, 附带varint32 错误码
		 *
		 * 1. 你有家族了
		 * 2. 你请求加入的家族不存在
		 * 3. 你请求加入的家族满人了
		 * 4. 家族不是自动接受入族申请, 且负责人都不在线
		 * 5. 你已经申请过这个家族了
		 * 6. 你的等级不够
		 * 7. 板块战期间, 不能进入
		 * 8. 不能加入别的联服的家族
		 * 9. 你退出家族24小时内不能加入其它家族
		 * 10. 该帮派申请达到上限了
		 * 11. 没有发送过申请
		 */
		private function onRecRequestJoinFail(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REQUEST_JOIN);

			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_4;
					break;
				case 5:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_5;
					break;
				case 6:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_6;
					break;
				case 7:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_7;
					break;
				case 8:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_8;
					break;
				case 9:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_9;
					break;
				case 10:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_10;
					break;
				case 11:
					failReason = LangSociety.SOCIETY_REQUEST_JOIN_FAIL_11;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 请求入族成功, 紧接着会收到S2C_YOU_JOIN_FAMILY消息通知你进入了一个家族
		 *
		 * 仅供解锁C2S_REQUEST_JOIN. 并展示"恭喜，XXX家族已同意您的入族请求"
		 *
		 * boolean true(申请成功)/false(取消申请成功)
		 *
		 * bytes 帮派的名字
		 */
		private function onRecRequestJoinSuccess(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REQUEST_JOIN);

			var isApplyJoin : Boolean = buffer.readBoolean();
			var societyName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			if (isApplyJoin)
			{
				NoticeManager.showHint(EnumHintInfo.REQUEST_JOIN_SUCCESS);
			}
			else
			{
				SocietyManager.removeJoinFamily(societyName);
			}
		}

		/**
		 * 入族申请已经转发给了相关负责人
		 *
		 * 客户端需要缓存自己已经申请过且申请结果是S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY的家族, 保存2分钟.
		 * 2分钟后自动删除, 服务器不会再发消息通知
		 * 如果期间收到了对方明确的回复, 不管是同意还是拒绝, 都删掉这个家族的缓存
		 *
		 * varint64 申请过期时间
		 * byte[] 申请的帮派
		 */
		private function onRequestJoinSuccessWaitOtherReply(buffer : ByteBuffer) : void
		{
//			ReqLockUtil.unlockReq(FamilyModuleMessages.C2S_REQUEST_JOIN);

			var outTime : Number = buffer.readVarint64();
			var societyName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			SocietyManager.addJoinFamily(societyName, outTime);
		}

		/**
		 * 广播给家族所有人, 有人入族了.
		 *
		 * 仅供展示提醒. 欢迎【XXX玩家名】加入本家族，本家族变的更加强大了
		 *
		 * 如果打开着家族成员界面, 则马上重新请求一次成员列表
		 *
		 * 附带
		 *
		 * varint64 heroId
		 * UTFBytes 入族的人的名字
		 */
		private function onRecOtherJoinFamily(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var heroName : String = BytesUtil.readRemainUTF(buffer);

			SocietyManager.removeApprove(heroId);
			SocietySender.setReqGetSelfFamilyInfoChanged();
			NoticeManager.showHint(EnumHintInfo.OTHER_JOIN_FAMILY, [heroName]);
		}

		/**
		 * 加入了家族后 (可能是申请通过, 可能是别人邀请你(可能自动接受邀请, 可能自己手动同意的邀请))
		 * 都会收到这条消息
		 *
		 * 如果此时打开着家族界面, 请求一次成员列表
		 *
		 * 删掉所有邀请加我入他们族的icon
		 *
		 *
		 * 附带
		 *
		 * UTF 新家族的名字 (需要在自己在场景中的角色头上加上家族名)
		 */
		private function onRecYouJoinFamily(buffer : ByteBuffer) : void
		{
			var guildName : String = buffer.readUTF();
			//			MainRoleManager.actor.headFace.addAndUpdateFamilyName();

			SocietySender.setReqGetSelfFamilyInfoChanged();
			SocietyManager.joinSociety(guildName);
		}

		/**
		 * 所有加入帮派的申请
		 *
		 * while(buffer.readable()){
		 *      varint64 申请的过期时间
		 *      varint32 帮派名字长度
		 *      bytes 帮派名字
		 * }
		 */
		private function onRecRequestJoinFamilys(buffer : ByteBuffer) : void
		{
			var datas : HashMap = new HashMap();
			while (buffer.bytesAvailable)
			{
				var outTime : Number = buffer.readVarint64();
				var familyName : String = buffer.readUTF();
				datas.add(familyName, outTime);
			}
			SocietyManager.setJoinFamilies(datas);
		}

		/**
		 * 返回入帮申请
		 *
		 * while(buffer.readable()){
		 *      varint64 id
		 *      UTF 名字
		 *      varint32 level 等级
		 *      varint64 战斗力
		 *      varint64 过期时间
		 * }
		 */
		private function onRecGetRequestJoinDetail(buffer : ByteBuffer) : void
		{
			var datas : Array = [];
			while (buffer.bytesAvailable)
			{
				var approveData : SocietyJoinApproveData = new SocietyJoinApproveData();
				approveData.id = buffer.readVarint64();
				approveData.name = buffer.readUTF();
				approveData.level = buffer.readVarint32();
				approveData.combat = buffer.readVarint64();
				approveData.outTime = buffer.readVarint64();
				datas.push(approveData);
			}
			SocietyManager.setApproves(datas);
		}

		/**
		 * 请求帮派申请失败
		 *
		 * 1. 没有家族
		 * 2. 不是官员
		 * 3. 不能够邀请他人
		 * 4. 服务器内部错误
		 */
		private function onRecGetRequestJoinDetailFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangSociety.SOCIETY_GET_REQUEST_JOIN_DETAIL_FAIL_1;
					break;
				case 2:
					failReason = LangSociety.SOCIETY_GET_REQUEST_JOIN_DETAIL_FAIL_2;
					break;
				case 3:
					failReason = LangSociety.SOCIETY_GET_REQUEST_JOIN_DETAIL_FAIL_3;
					break;
				case 4:
					failReason = LangSociety.SOCIETY_GET_REQUEST_JOIN_DETAIL_FAIL_4;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 帮派申请数量变化了
		 *
		 * bool true(当前还有申请)/false(当前没有申请了)
		 */
		private function onRecHasRequestJoin(buffer : ByteBuffer) : void
		{
			var hasRequestJoin : Boolean = buffer.readBoolean();
			SocietyManager.hasRequestJoin = hasRequestJoin;
			SocietySender.setReqGetRequestJoinDetailChanged();
		}
	}
}
