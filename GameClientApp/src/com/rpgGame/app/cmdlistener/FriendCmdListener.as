package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FriendEvent;
	import com.rpgGame.coreData.info.friend.EnemyInfo;
	import com.rpgGame.coreData.info.friend.FriendAddedMeInfo;
	import com.rpgGame.coreData.info.friend.FriendBaseInfo;
	import com.rpgGame.coreData.info.friend.FriendInfo;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.type.FriendType;
	
	import flash.utils.ByteArray;
	
	import app.cmd.RelationModuleMessages;
	import app.message.AllClientRelationDetail;
	import app.message.ClientRelation;
	import app.message.EnemyProto;
	import app.message.SingleRelation;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 好友协议处理
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-9 上午10:05:12
	 *
	 */
	public class FriendCmdListener extends BaseBean
	{
		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_BASIC_RELATION, onBasicRelation);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_REPLY_RELATION_DETAIL, onRelationDetail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_REPLY_RELATIONS_ERROR, onRelationFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_SEND_ADD_FRIEND_SUCCESS, onAddFriendSuccess);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_FRIEND_ADD_FAIL, onRecFriendAddFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_ADD_FRIEND_WAIT_REPLY, onRecOtherAddedYouAsFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_REPLY_ADD_FRIEND_FAIL, onRecReplyAddFriendFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_REFUSE_ADD_FRIEND_SUCCESS, onRefuseAddFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_OTHER_REFUSE_ADD_FRIEND, onOtherRefuseAddFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_AGREE_ADD_FRIEND_SUCCESS, onAgreeAddFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_OTHER_AGREE_ADD_FRIEND, onOtherAgreeAddFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_FRIEND_REMOVED, onRecFriendRemoved);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_OTHER_REMOVED_YOU_AS_FRIEND, onRecOtherRemovedYouAsFriend);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_FRIEND_REMOVE_FAIL, onRecFriendRemoveFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_BLACK_ADDED, onRecBlackAdded);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_BLACK_ADD_FAIL, onRecBlackAddFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_BLACK_REMOVED, onRecBlackRemoved);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_BLACK_REMOVE_FAIL, onRecBlackRemoveFail);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_RELATION_DETAIL_CHANGED, onRecRelationDetailChanged);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_RELATION_OFFLINE, onRecRelationOffLine);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_ENEMY_REMOVED, onEnemyRemoved);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_ENEMY_ADD, onEnemyAdd);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_ENEMY_UPDATE, onEnemyUpdate);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_EDITOR_MOOD, editorMood);
			SocketConnection_protoBuffer.addCmdListener(RelationModuleMessages.S2C_EDITOR_MOOD_FAIL, editorMoodFail);

			finish();
		}
		/**
		 *  编辑心情失败
		 *  1  服务器内部错误 稍后再试
		 *  2  长度非法（服务器限制最多100个字节）
		 *
		 */
		private function editorMoodFail(buffer : ByteBuffer):void
		{
			var fail : int = buffer.readVarint32();
			var msg : String;
			switch(fail)
			{
				case 1:
					msg = "服务器内部错误 稍后再试";
					break;
				case 2:
					msg = "长度非法（服务器限制最多100个字节）";
					break;
			}
			NoticeManager.showNotify(msg);
		}
		/**
		 *  编辑心情
		 *
		 * 成功
		 */
		private function editorMood(buffer : ByteBuffer):void
		{
			FriendManager.editorMoodComplete();
		}
		/**
		 * 更新仇人信息
		 *
		 * 附带EnemyProto
		 */	
		private function onEnemyUpdate(buffer : ByteBuffer):void
		{
			var enemy : EnemyProto = new EnemyProto();
			enemy.mergeFrom(buffer);
			FriendManager.setEnemyRelation(enemy);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		/**
		 * 添加仇人
		 * boolean targetIsOnline
		 * var32 len
		 * SingleRelation singleRelation
		 * 附带EnemyProto
		 */
		private function onEnemyAdd(buffer : ByteBuffer):void
		{
			var isOnline : Boolean = buffer.readBoolean();
			var len : int = buffer.readVarint32();
			var byte:ByteBuffer = new ByteBuffer();
			buffer.readBytes(byte,0,len);
			
			var sing : SingleRelation = new SingleRelation();
			sing.mergeFrom(byte);
			
			var enemy : EnemyProto = new EnemyProto();
			enemy.mergeFrom(buffer);
			
			var enemyInfo : EnemyInfo = new EnemyInfo();
			enemyInfo.type = FriendType.RELATION_TYPE_ENEMY;
			enemyInfo.setup(enemy);
			enemyInfo.setupSingleRelation(sing);
			enemyInfo.isOnLine = isOnline;
			FriendManager.addEnemyRelation(enemyInfo);
			
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		/**
		 * 删除仇人
		 *
		 * 附带varint64 的好友id
		 */
		private function onEnemyRemoved(buffer : ByteBuffer):void
		{
			var enemy:Number = buffer.readVarint64();
			FriendManager.removeEnemy(enemy);
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}
		/**
		 * 基本的关系数据
		 *
		 * bytes ClientRelation
		 */
		private function onBasicRelation(buffer : ByteBuffer) : void
		{
			var relation : ClientRelation = new ClientRelation();
			relation.mergeFrom(buffer);
			FriendManager.startTimer();
			FriendManager.setBasicRelation(relation);
		}

		/**
		 * 返回所有关系中每个人的具体信息. 每个人只会存在一次. 附带个ClientRelationDetail的proto
		 * 消息内容已压缩
		 */
		private function onRelationDetail(buffer : ByteBuffer) : void
		{
			FriendManager.requested = true;
			var allClient : AllClientRelationDetail = new AllClientRelationDetail();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			allClient.mergeFrom(bytes);
			FriendManager.setAllRelationDetail(allClient);
		}

		/**
		 * 获取好友关系出错, 附带varint32的错误码
		 *
		 * 1. 服务器错误, 过会再试
		 */
		private function onRelationFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			NoticeManager.showNotify("获取好友信息错误：" + errID);
		}

		private function onAddFriendSuccess(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify("邀请加为好友成功");
		}

		/**
		 * 添加好友失败, 附带varint32的错误码
		 *
		 * 1. id不存在
		 * 2. 好友满
		 * 3. 已经是你的好友了
		 * 4. 不能加自己
		 * 5. 不能加这个人 (跨服啥的)
		 * 6. 服务器出错, 稍后再试
		 * 7. 在你黑名单中, 无法添加
		 * 8. 对方设置了禁止被加好友
		 * 9. 目标不在线
		 * 10. 在目标的黑名单中， 无法添加
		 * 11. 你刚刚才加了对方
		 * 12. 目标好友满
		 */
		private function onRecFriendAddFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			var failReason : String;
			switch (errID)
			{
				case 1:
					failReason = LangNoticeInfo.FriendCmdListener_2;
					break;
				case 2:
					failReason = LangNoticeInfo.FriendCmdListener_3;
					break;
				case 3:
					failReason = LangNoticeInfo.FriendCmdListener_4;
					break;
				case 4:
					failReason = LangNoticeInfo.FriendCmdListener_5;
					break;
				case 5:
					failReason = LangNoticeInfo.FriendCmdListener_6;
					break;
				case 6:
					failReason = LangNoticeInfo.FriendCmdListener_46;
					break;
				case 7:
					failReason = LangNoticeInfo.FriendCmdListener_7;
					break;
				case 8:
					failReason = LangNoticeInfo.FriendCmdListener_8;
					break;
				case 9:
					failReason = LangNoticeInfo.FriendCmdListener_47;
					break;
				case 10:
					failReason = LangNoticeInfo.FriendCmdListener_48;
					break;
				case 11:
					failReason = LangNoticeInfo.FriendCmdListener_49;
					break;
				case 12:
					failReason = LangNoticeInfo.FriendCmdListener_50;
					break;
				default:
					failReason = LangNoticeInfo.FriendCmdListener_51;
					break;
			}
			NoticeManager.showNotify(failReason, errID);
		}

		/**
		 * 回复加好友成功，返回目标的数据
		 *
		 * bool 是否在线
		 * bytes SingleRelation
		 */
		private function onAgreeAddFriend(buffer : ByteBuffer) : void
		{
			var isOnLine : Boolean = buffer.readBoolean();
			var singleRelation : SingleRelation = new SingleRelation();
			singleRelation.mergeFrom(buffer);
			var friendInfo : FriendInfo = new FriendInfo();
			friendInfo.type = FriendType.RELATION_TYPE_FRIEND;
			friendInfo.setupSingleRelation(singleRelation);
			friendInfo.isOnLine = isOnLine;
			FriendManager.addDetailInfo(friendInfo);
			FriendManager.addFriendRemoveBlackAndEnemy(friendInfo.id);
			NoticeManager.showNotify("您同意了" + singleRelation.name + "的请求，并已同时添加对方为好友");
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
			if(AppManager.isAppInScene(AppConstant.TARGET_ADD_ME_TO_FRIEND))
				EventManager.dispatchEvent(FriendEvent.FRIEND_ADDED_COUNT_CHANGED);
		}
		/**
		 * 他人同意加好友，此时该人在线
		 *
		 * bool 是否在线
		 * bytes SingleRelation
		 */
		private function onOtherAgreeAddFriend(buffer : ByteBuffer) : void
		{
			var isOnLine : Boolean = buffer.readBoolean();
			var singleRelation : SingleRelation = new SingleRelation();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			singleRelation.mergeFrom(bytes);
			var friendInfo : FriendInfo = new FriendInfo();
			friendInfo.setupSingleRelation(singleRelation);
			friendInfo.type = FriendType.RELATION_TYPE_FRIEND;
			friendInfo.isOnLine = isOnLine;
			FriendManager.addDetailInfo(friendInfo);
			FriendManager.addFriendRemoveBlackAndEnemy(friendInfo.id);
			NoticeManager.showNotify(singleRelation.name + "同意了您的请求，已经成功添加对方为好友。");
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
		}

		private function onRefuseAddFriend(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify("您拒绝了对方的好友请求。");
			if(AppManager.isAppInScene(AppConstant.TARGET_ADD_ME_TO_FRIEND))
				EventManager.dispatchEvent(FriendEvent.FRIEND_ADDED_COUNT_CHANGED);
		}

		private function onOtherRefuseAddFriend(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			FriendManager.removeTargetAddedMeAsFriend(id);
			FriendManager.reqAddFriendFailPlayer(id);
			NoticeManager.showNotify(name + "拒绝了您的好友请求。");
		}

		/**
		 * 删除好友成功
		 *
		 * 附带varint64 的好友id
		 */
		private function onRecFriendRemoved(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var friendInfo : FriendBaseInfo = FriendManager.removeFriend(id);
			if (friendInfo)
			{
				NoticeManager.showNotify("删除好友" + friendInfo.name + "成功");
			}
		}

		/**
		 * 删除好友错误. 附带个varint32 的错误码
		 *
		 * 1. 这个id不在你的黑名单列表中
		 * 2. 服务器内部错误
		 */
		private function onRecFriendRemoveFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
					NoticeManager.showNotify("这个id不在你的好友列表中");
					break;
				case 2:
					NoticeManager.showNotify("服务器内部错误");
					break;
				default:
					NoticeManager.showNotify("其它错误" + errID);
					break;
			}
		}

		/**
		 * 添加黑名单成功
		 *
		 * bool 是否在线
		 * bytes SingleRelation
		 */
		private function onRecBlackAdded(buffer : ByteBuffer) : void
		{
			var isOnLine : Boolean = buffer.readBoolean();
			var singleRelation : SingleRelation = new SingleRelation();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			singleRelation.mergeFrom(bytes);
			var friendInfo : FriendInfo = new FriendInfo();
			friendInfo.setupSingleRelation(singleRelation);
			friendInfo.type = FriendType.RELATION_TYPE_BLACKLIST;
			friendInfo.isOnLine = isOnLine;
			FriendManager.addDetailInfo(friendInfo);
			NoticeManager.showNotify("你将" + singleRelation.name + "加入了黑名单");
			EventManager.dispatchEvent(FriendEvent.FRIEND_STATE_CHANGE);
			EventManager.dispatchEvent(FriendEvent.BLACK_STATE_CHANGE);
		}

		/**
		 * 添加黑名单失败, 附带varint32的失败原因
		 *
		 * 1. id不存在
		 * 2. 已经在黑名单里了
		 * 3. 不能加自己
		 * 4. 不能加这个人 (跨服啥的)
		 * 5. 服务器出错, 稍后再试
		 * 6. 屏蔽名单已满
		 * 7. 是你好友
		 */
		private function onRecBlackAddFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			var failReason : String;
			switch (errID)
			{
				case 1:
					failReason = LangNoticeInfo.FriendCmdListener_2;
					break;
				case 2:
					failReason = LangNoticeInfo.FriendCmdListener_55;
					break;
				case 3:
					failReason = LangNoticeInfo.FriendCmdListener_20;
					break;
				case 4:
					failReason = LangNoticeInfo.FriendCmdListener_21;
					break;
				case 5:
					failReason = LangNoticeInfo.FriendCmdListener_32;
					break;
				case 6:
					failReason = LangNoticeInfo.FriendCmdListener_61;
					break;
				case 7:
					failReason = LangNoticeInfo.FriendCmdListener_33;
					break;
				default:
					failReason = LangNoticeInfo.FriendCmdListener_62;
					break;
			}
			NoticeManager.showNotify(failReason, errID);
		}

		/**
		 *从黑名单移除成功, 服务器返回 (添加时, 如果屏蔽列表已满, 服务器也会发送这条消息)
		 * @param buffer
		 *
		 */
		private function onRecBlackRemoved(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			 var friendInfo : FriendBaseInfo = FriendManager.removeBlack(id);
			if (friendInfo)
			{
				NoticeManager.showNotify("将" + friendInfo.name + "移除黑名单成功");
			}
		}

		/**
		 * 删除黑名单错误
		 *
		 * 1. id不存在
		 * 2. 服务器内部错误
		 */
		private function onRecBlackRemoveFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			switch (errID)
			{
				case 1:
					NoticeManager.showNotify("这个id不存在");
					break;
				case 2:
					NoticeManager.showNotify("服务器内部错误");
					break;
				default:
					NoticeManager.showNotify("其它错误" + errID);
					break;
			}
		}

		/**
		 * 关系列表中某人的状态发生改变.
		 *
		 * 如果没有收到过好友列表详细信息, 则不需要保存此条信息中附带的状态.
		 *
		 * 如果有收到过：
		 *  如果此人之前不在线, 那在把对方的信息改成消息中附带的信息的同时, 需要弹出提示, 说xxx上线了.
		 *  如果策划有需要弹出提示说好友xxx上线了，客户端自己进行判断提示
		 *
		 * 附带SingleRelation的proto
		 */
		private function onRecRelationDetailChanged(buffer : ByteBuffer) : void
		{
			var singleRelation : SingleRelation = new SingleRelation();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			singleRelation.mergeFrom(bytes);
			FriendManager.changeDetailInfo(singleRelation);
			NoticeManager.showNotify(singleRelation.name + "上线了");
		}

		/**
		 * 不过是否请求过好友面板信息
		 *
		 * 如果没收到好友列表详细信息，不处理
		 *
		 * 如果已经收到了好友列表详细信息(收到, 不是请求), 则需要把此人的状态设为不在线
		 *
		 * 如果关系列表中有人下线, 客户端都会收到这条消息. 需要根据策划需求弹出相应的提示.
		 *
		 * 附带
		 *
		 * varint64 id
		 * bytes 名字
		 */
		private function onRecRelationOffLine(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			FriendManager.detailInfoOffLine(id);
			NoticeManager.showNotify(name + "下线了");
		}

		/**
		 * 你被别人添加好友了，等待你回复，该请求30秒后过期
		 *
		 * varint64 加我的人的id
		 * varint32 level
		 * varint32 country
		 * bytes 加我的人的名字
		 */
		private function onRecOtherAddedYouAsFriend(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var level : int = buffer.readVarint32();
			var country : int = buffer.readVarint32();
			
			var targetInfo : FriendAddedMeInfo = FriendManager.checkInTargetAddedMeAsFriend(id);
			if (!targetInfo)
			{
				targetInfo = new FriendAddedMeInfo();
				targetInfo.id = id;
				targetInfo.level = level;
				targetInfo.country = country;
				targetInfo.name = buffer.readUTFBytes(buffer.bytesAvailable);
				FriendManager.addTargetAddedMeAsFriend(targetInfo);
				NoticeManager.showNotify(targetInfo.name + "请求加你为好友");
			}
		}

		/**
		 * 回复加好友请求失败，附带varint32错误码
		 *
		 * 1. 服务器内部错误
		 * 2. 目标不存在
		 * 3. 目标已经是你的好友了
		 * 4. 目标在我的黑名单
		 * 5. 好友列表已满
		 * 6. 你被目标屏蔽了
		 * 7. 目标好友列表已满
		 * 8. 目标的邀请已经过期
		 */
		private function onRecReplyAddFriendFail(buffer : ByteBuffer) : void
		{
			var errID : int = buffer.readVarint32();
			var failReason : String;
			switch (errID)
			{
				case 1:
					failReason = LangNoticeInfo.FriendCmdListener_52;
					break;
				case 2:
					failReason = LangNoticeInfo.FriendCmdListener_53;
					break;
				case 3:
					failReason = LangNoticeInfo.FriendCmdListener_54;
					break;
				case 4:
					failReason = LangNoticeInfo.FriendCmdListener_55;
					break;
				case 5:
					failReason = LangNoticeInfo.FriendCmdListener_56;
					break;
				case 6:
					failReason = LangNoticeInfo.FriendCmdListener_57;
					break;
				case 7:
					failReason = LangNoticeInfo.FriendCmdListener_58;
					break;
				case 8:
					failReason = LangNoticeInfo.FriendCmdListener_59;
					break;
				default:
					failReason = LangNoticeInfo.FriendCmdListener_60;
					break;
			}
			NoticeManager.showNotify(failReason, errID);
		}

		/**
		 * 有人删除把你从他的好友列表里删除了, 如果已经收到好友信息, 则移除该好友
		 *
		 * varint64 移除你的人，你顺便把他也移除了
		 */

		private function onRecOtherRemovedYouAsFriend(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var friendInfo : FriendBaseInfo = FriendManager.removeFriend(id);
			if (friendInfo && friendInfo.name)
			{
				NoticeManager.showNotify(friendInfo.name + "将你移除好友");
			}
		}
	}
}
