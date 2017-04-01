package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.utils.ReqLockUtil;

	import flash.utils.ByteArray;

	import app.cmd.FamilyModuleMessages;

	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import com.game.engine3D.vo.SenderReferenceSet;


	/**
	 *
	 * 帮派消息发送
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-27 上午10:05:12
	 *
	 */
	public class SocietySender extends BaseSender
	{
		/**
		 * 创建家族. 当前必须没有家族. 客户端需本地判断钱/等级/家族名字合法/家族等级名字合法
		 *
		 * 附带
		 *
		 * bool 家族是否自动同意入帮申请
		 *
		 * varint32 物品在背包中的位置
		 *
		 * UTF 家族名字.2-7字 (客户端需已经前后去空, 且过滤了关键字, 有关键字就本地弹错, 不要发过来)
		 */
		public static function reqCreateFamily(name : String, goodsPos : int, autoAgree : Boolean) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_CREATE_FAMILY))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_CREATE_FAMILY);

			_bytes.clear();
			_bytes.writeBoolean(autoAgree);
			_bytes.writeVarint32(goodsPos);
			_bytes.writeUTF(name);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_CREATE_FAMILY, _bytes);
		}

		/**
		 * 请求本国家族列表. 客户端缓存30秒, 关掉界面再打开, 30秒内还是用上次请求时返回的数据.
		 * 仅在打开界面时判断缓存是否过期, 开着界面的时候不需要自动刷新
		 *
		 * 没有附带信息
		 */
		public static function reqGetFamilyList() : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_GET_SELF_FAMILY_LIST))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_GET_SELF_FAMILY_LIST, 30000);

			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_GET_SELF_FAMILY_LIST, _bytes);
		}

		/**
		 * 请求他国家族列表. 客户端缓存30秒, 关掉界面再打开, 30秒内还是用上次请求时返回的数据.
		 * 仅在打开界面时判断缓存是否过期, 开着界面的时候不需要自动刷新
		 *
		 * 没有附带信息
		 */
		public static function reqGetOtherFamilyList() : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_GET_OTHER_FAMILY_LIST))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_GET_OTHER_FAMILY_LIST, 30000);

			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_GET_OTHER_FAMILY_LIST, _bytes);
		}

		private static const REQ_GET_SELF_FAMILY_INFO_DELAY_TIME : int = 10000;
		private static var _reqGetSelfFamilyInfoReferenceSet : SenderReferenceSet = new SenderReferenceSet("onReqGetSelfFamilyInfo",onReqGetSelfFamilyInfo, REQ_GET_SELF_FAMILY_INFO_DELAY_TIME);

		public static function addReqGetSelfFamilyInfoReference(ref : Object) : void
		{
			_reqGetSelfFamilyInfoReferenceSet.addRef(ref);
		}

		public static function removeReqGetSelfFamilyInfoReference(ref : Object) : void
		{
			_reqGetSelfFamilyInfoReferenceSet.removeRef(ref);
		}

		public static function unlockReqGetSelfFamilyInfoReference() : void
		{
			_reqGetSelfFamilyInfoReferenceSet.unlock();
		}

		public static function setReqGetSelfFamilyInfoChanged() : void
		{
			_reqGetSelfFamilyInfoReferenceSet.dataChanged();
		}

		private static function onReqGetSelfFamilyInfo() : void
		{
			reqGetSelfFamilyInfo();
		}

		/**
		 * 获取自己的家族详细信息, 包括成员列表, 家族等级, 等级, 已捐献物品数量等等
		 *
		 * 请求时当前必须在个家族中.
		 *
		 * 数据缓存10秒, 打开着成员列表这个界面时, 每10秒请求一次
		 *
		 * 从收到返回开始计时, 不是从请求开始
		 * 离开家族后, 计时清零. 防止退出家族/又进入个新的家族后, 打开成员列表没东西. 但在前一个请求没返回前, 不能再请求
		 *
		 * 没有附带信息
		 */
		public static function reqGetSelfFamilyInfo() : void
		{
			if (SocietyManager.hasSociecy())
			{
				_bytes.clear();
				SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_GET_SELF_FAMILY_INFO, _bytes);
				_reqGetSelfFamilyInfoReferenceSet.lock();
			}
		}

		/**
		 * 将人踢出家族. 客户端需要自己判断权限以及对方的职位. 也不能踢自己
		 *
		 * 服务器返回前不能再发送踢人请求
		 *
		 * 附带
		 *
		 * varint64 要踢的人id
		 */
		public static function reqKickMember(heroId : Number) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_KICK_MEMBER))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_KICK_MEMBER, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint64(heroId);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_KICK_MEMBER, _bytes);
		}

		/**
		 * 将自己的是否自动接受入族邀请
		 *
		 * bool true(自动接收)/false(不自动接收)
		 * 没有返回
		 */
		public static function reqSetAutoAcceptInvite(autoAgree : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeBoolean(autoAgree);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_SET_AUTO_ACCEPT_INVITE, _bytes);
		}

		/**
		 * 将  自己的是否禁止他人邀请我加入家族设为  是
		 *
		 * bool true(禁止)/false(不禁止)
		 * 没有返回
		 */
		public static function reqSetForbidOtherInviteMeJoinFamily(forbid : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeBoolean(forbid);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_FAMILY, _bytes);
		}

		/**
		 * 设置家族是否自动同意别人的入族申请. 只有族长才能设置
		 *
		 * 有变化才发过来, 需要等待服务器返回
		 *
		 * 附带
		 *
		 * bool true 自动同意, false 不自动同意,需要手动同意
		 */
		public static function reqSetFamilyAutoAcceptJoinRequest(isYes : Boolean) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST, 5 * 1000);

			_bytes.clear();
			_bytes.writeBoolean(isYes);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST, _bytes);
		}

		/**
		 * 设置别人的职位, 只有族长才能执行这操作. 必须等待服务器返回才能继续设置
		 *
		 * 附带
		 *
		 * varint32 目标职位 FamilyOfficerPos，如果是上任，就是设置将要上任的职位，若要卸任，就是他当前的职位
		 * varint64 要设置的人
		 * bool true(上任)/false(卸任)
		 *
		 */
		public static function reqSetPosition(heroId : Number, pos : int, isJob : Boolean) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_SET_POSITION))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_SET_POSITION, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint32(pos);
			_bytes.writeVarint64(heroId);
			_bytes.writeBoolean(isJob);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_SET_POSITION, _bytes);
		}

		/**
		 * 请求加入别的家族, 返回前不能再请求, 或者回复别的家族的邀请
		 *
		 * 请求时必须自己没有家族, 且要求加入的家族人数没满
		 *
		 * 附带
		 *
		 * bool true(发送申请)/false(取消申请)
		 *
		 * UTFBytes 要求加入的家族名字
		 */
		public static function reqRequestJoin(doApply : Boolean, familyName : String) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_REQUEST_JOIN))
//				return;
//
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_REQUEST_JOIN, 500);
			_bytes.clear();
			_bytes.writeBoolean(doApply);
			_bytes.writeUTFBytes(familyName);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_REQUEST_JOIN, _bytes);
		}

		/**
		 * 回复别人的入族申请, 必须等待服务器返回, 才能再回复其他的入族申请(包括全部同意)
		 * 不管服务器有没有返回, 客户端自己删掉这个申请, 就算服务器返回失败, 也不可能再回复一次
		 * 如果是拒绝, 则服务器没有返回,
		 * 附带
		 * varint64 对方的id
		 * bool 是否同意
		 */
		public static function reqReplyJoinRequest(heroId : Number, isYes : Boolean) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST))
//				return;
//
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint64(heroId);
			_bytes.writeBoolean(isYes);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_REPLY_JOIN_REQUEST, _bytes);
		}

		/**
		 * 邀请别人加入家族, 只有当前有家族且是族主或副族主时才能发送.
		 * 必须要等服务器返回才能再发送别的邀请
		 * 附带
		 * varint64 对方id
		 */
		public static function reqInviteJoin(heroId : Number) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_INVITE_JOIN))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_INVITE_JOIN, 5 * 1000);

			//SocietyManager.putMyInviationOther(heroId);

			_bytes.clear();
			_bytes.writeVarint64(heroId);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_INVITE_JOIN, _bytes);
		}

		/**
		 * 回复收到的入族邀请, 在收到返回前不能再回复邀请
		 * 不管结果如何, 客户端在本地删掉这个邀请
		 * 如果是拒绝, 则没有返回
		 * 附带
		 * bool 是否同意
		 * UTFBytes 对方家族名字
		 */
		public static function reqReplyJoinInvite(isYes : Boolean, familyName : String) : void
		{
			SocietyManager.deleteInvitateMe(familyName);

			_bytes.clear();
			_bytes.writeBoolean(isYes);
			_bytes.writeUTFBytes(familyName);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_REPLY_JOIN_INVITE, _bytes);
		}

		/**
		 * 拒绝所有邀请我入他们族的邀请, 没有附带信息, 服务器没有返回. 发送后从自己这里删除所有的邀请
		 *
		 * 如果只有一条邀请, 则转化为针对他们家族的拒绝消息 C2S_REPLY_JOIN_INVITE
		 */
		public static function reqRejectAllJoinInvite() : void
		{
			SocietyManager.deleteAllInvitateMe();

			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_REJECT_ALL_JOIN_INVITE, _bytes);
		}

		/**
		 * 捐献银两. 需要等服务器返回之后才能再次捐献. 发过来的捐献数必须<=包里有的银两数
		 *
		 * 附带
		 *
		 * bool true(捐钱)/false(捐物)
		 * if(捐钱){
		 *      varint32 捐献多少个基础银两，注意，这个值不是银两，比如100文换10贡献值，这里发送1000，就是花费100000问，获得1000贡献值
		 * } else {
		 *      varint32 捐献物品的个数
		 *      UpgradeProto 捐献物品的proto
		 * }
		 */
		public static function reqDoDonate(isMoney : Boolean, moneyCount : int = 0, goodsCount : int = 0, goodsBytes : ByteBuffer = null) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_DO_DONATE))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_DO_DONATE, 5 * 1000);

			_bytes.clear();
			_bytes.writeBoolean(isMoney);
			if (isMoney)
			{
				_bytes.writeVarint32(moneyCount);
			}
			else
			{
				_bytes.writeVarint32(goodsCount);
				_bytes.writeBytes(goodsBytes);
			}
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_DO_DONATE, _bytes);
		}

		/**
		 * 升级家族建筑
		 *
		 * varint32 建筑类型
		 */
		public static function reqFamilyUpgradeBuilding(buildType : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(buildType);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_FAMILY_UPGRADE_BUILDING, _bytes);
		}

		/**
		 * 请求弹劾帮主，客户端判断帮主离线时长
		 *
		 * 不需要附带别的信息
		 */
		public static function reqImpeachFamilyLeader() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_IMPEACH_FAMILY_LEADER, _bytes);
		}

		/**
		 * 请求学习技能，必须等上次的请求返回以后才可以升级
		 *
		 * varint32 第几个技能
		 *
		 * UpgradeProto 学习的消耗
		 */
		public static function reqLearnFamilyCollageSpell(spellIndex : int, upgradeBytes : ByteArray) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_LEARN_FAMILY_COLLAGE_SPELL))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_LEARN_FAMILY_COLLAGE_SPELL, 5 * 1000);

			_bytes.clear();
			_bytes.writeVarint32(spellIndex);
			_bytes.writeBytes(upgradeBytes);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_LEARN_FAMILY_COLLAGE_SPELL, _bytes);
		}

		private static const REQ_GET_NEWS_DELAY_TIME : int = 30000;
		private static var _reqGetNewsRefSet : SenderReferenceSet = new SenderReferenceSet("onReqGetNews",onReqGetNews, REQ_GET_NEWS_DELAY_TIME);

		public static function addReqGetNewsRef(ref : Object) : void
		{
			_reqGetNewsRefSet.addRef(ref);
		}

		public static function removeReqGetNews(ref : Object) : void
		{
			_reqGetNewsRefSet.removeRef(ref);
		}

		private static function onReqGetNews() : void
		{
			reqGetNews();
		}

		/**
		 * 获取最新家族见闻, 不要自动刷新, 且将数据保存30秒, 30秒内再看家族见闻就用缓存着的数据
		 *
		 * 离开家族后删除数据. 防止30秒内进到个新家族, 会看到老家族的见闻
		 *
		 * 没有附带信息
		 */
		private static function reqGetNews() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_GET_NEWS, _bytes);
		}

		private static const REQ_GET_REQUEST_JOIN_DETAIL_TIME : int = 30000;
		private static var _reqGetRequestJoinDetailRefSet : SenderReferenceSet = new SenderReferenceSet("onReqGetRequestJoinDetail",onReqGetRequestJoinDetail, REQ_GET_REQUEST_JOIN_DETAIL_TIME);

		public static function addReqGetRequestJoinDetail(ref : Object) : void
		{
			_reqGetRequestJoinDetailRefSet.addRef(ref);
		}

		public static function removeReqGetRequestJoinDetail(ref : Object) : void
		{
			_reqGetRequestJoinDetailRefSet.removeRef(ref);
		}

		public static function setReqGetRequestJoinDetailChanged() : void
		{
			_reqGetRequestJoinDetailRefSet.dataChanged();
		}

		private static function onReqGetRequestJoinDetail() : void
		{
			reqGetRequestJoinDetail();
		}

		/**
		 * 申请查看所有帮派申请
		 *
		 * 申请间隔，30S
		 */
		private static function reqGetRequestJoinDetail() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_GET_REQUEST_JOIN_DETAIL, _bytes);
		}

		/**
		 * 要离开家族, 没有附带消息
		 */
		public static function reqLeaveFamily() : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_LEAVE_FAMILY))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_LEAVE_FAMILY, 5 * 1000);

			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_LEAVE_FAMILY, _bytes);
		}

		/**
		 * 手动解散帮派, 只有帮主才能发送. 必须等待服务器返回, 且发送前已经2次确认过
		 *
		 * 没有附带信息
		 */
		public static function reqDismissFamily() : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_DISMISS_FAMILY))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_DISMISS_FAMILY, 5 * 1000);

			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_DISMISS_FAMILY, _bytes);
		}

		/**
		 * 改变家族公告, 必须等待服务器返回才能再更改
		 *
		 * 客户端需要过滤敏感字, 且需要检查字数在70汉字(140字节)以下
		 *
		 * 去掉后面的空格, 不需要去前面的
		 *
		 * 有改变才发过来. 没有不要发
		 *
		 * 设置频率为上次修改时间+设置公告的周期
		 *
		 * 附带
		 *
		 * UTFBytes 新的家族公告
		 */
		public static function reqChangeAnnouncement(info : String) : void
		{
//			if (ReqLockUtil.isReqLocked(FamilyModuleMessages.C2S_CHANGE_ANNOUNCEMENT))
//				return;
//			ReqLockUtil.lockReq(FamilyModuleMessages.C2S_CHANGE_ANNOUNCEMENT, 5000);

			SocietyManager.cacheAnnouncement(info);
			_bytes.clear();
			_bytes.writeUTF(info);
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_CHANGE_ANNOUNCEMENT, _bytes);
		}

		/**
		 * 开启帮派神兽副本
		 */
		public static function reqOpenFamilyAnimalDungeon() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_OPEN_FAMILY_ANIMAL_DUNGEON, _bytes);
		}

		/**
		 * 请求进入帮派神兽副本
		 */
		public static function reqTryEnterFamilyAnimalDungeon() : void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(FamilyModuleMessages.C2S_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN, _bytes);
		}
	}
}
