package com.rpgGame.app.sender
{
	import app.cmd.MountModuleMessages;
	
	import org.game.netCore.connection.SocketConnection_protoBuffer;

	/**
	 * 发送消息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSender extends BaseSender
	{
		/**
		 * 坐骑状态设置
		 *
		 * <br/>varint32 坐骑槽(第几个坐骑)
		 * <br/>varint32 状态 MountStatus(0，不出战，不训练，1 训练， 2 出战)
		 */
		public static function requestSetUpMountStatus( index:int, status:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(status);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_STATUS, _bytes);
		}
		
		/**
		 * 上马/下马
		 *
		 * <br/>bool true(上马)/false(下马)
		 */
		public static function requestSetUpMountRide( isRide:Boolean ):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isRide);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_RIDE, _bytes);
		}
		
		/**
		 * 坐骑放生
		 *
		 * <br/>varint32 坐骑槽(第几个坐骑)
		 */
		public static function requestMountRelease( index:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_RELEASE, _bytes);
		}
		
		/**
		 * 坐骑喂养
		 *
		 * <br/>varint32 坐骑槽(第几个坐骑)
		 *
		 * <br/>varint32 背包中的位置
		 * <br/>varint32 喂养个数
		 * <br/>varint32 物品的id，防止喂错了
		 */
		public static function requestMountFeed( index:int, backpackIndex:int, num:int, itemID:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(backpackIndex);
			_bytes.writeVarint32(num);
			_bytes.writeVarint32(itemID);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_FEED, _bytes);
		}
		
		/**
		 * 坐骑强化
		 * <p>
		 * varint32 哪个坐骑
		 * bool 使用背包中的物品
		 * if(使用背包中的物品){
		 * varint32 背包中的位置
		 * } else {
		 * varint32 目标坐骑（坐骑槽）
		 * }
		 */
		public static function requestMountRefine( idx:int, isUse:Boolean, indexOrMountIdx:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(idx);
			_bytes.writeBoolean(isUse);
			_bytes.writeVarint32(indexOrMountIdx);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_REFINE, _bytes);
		}
		
		/**
		 * 坐骑技能学习
		 *
		 * <br/>varint32 哪个坐骑
		 *
		 * <br/>varint32 背包中的位置
		 */
		public static function requestMountLearnSpell( idx:int, backpackIndex:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(idx);
			_bytes.writeVarint32(backpackIndex);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_LEARN_SPELL, _bytes);
		}
		
		/**
		 * 邀请别人繁育
		 *
		 * <br/>varint64 目标的id
		 */
		public static function requestMountInciteOtherBreed( id:Number ):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_INVITE_OTHER_BREED, _bytes);
		}
		
		/**
		 * 拒绝邀请
		 *
		 * <br/>varint64 邀请者的id
		 */
		public static function requestMountRefuseOtherInviteYou( id:Number ):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_REFUSE_OTHER_INVITE_YOU, _bytes);
		}
		
		/**
		 * 锁定
		 */
		public static function requestMountBreedLock():void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_BREED_LOCK, _bytes);
		}
		
		/**
		 * 请求我当前繁育出来的宝宝
		 */
		public static function requestMountGetBreedBabyMount():void
		{
			_bytes.clear();
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_GET_BREED_BABY_MOUNT, _bytes);
		}
		
		/**
		 * 取消繁育，当前状态必须不是MAKE_LOVE，其他的都行，同时领取坐骑回去
		 *
		 * <br/>varint32 空槽位
		 */
		public static function requestMountBreedCancle( idx:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(idx);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_MOUNT_BREED_CANCEL, _bytes);
		}
		
		/**
		 * 领取宝宝坐骑，当前状态必须是MAKE_LOVE，且当前时间必须>=坐骑出生时间
		 *
		 * <br/>varint32 繁育马槽位
		 * <br/>varint32 宝宝马槽位
		 */
		public static function requestCollectBabyMount( breedIndex:int, babyIndex:int ):void
		{
			_bytes.clear();
			_bytes.writeVarint32(breedIndex);
			_bytes.writeVarint32(babyIndex);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_COLLECT_BABY_MOUNT, _bytes);
		}
		
		/**
		 * 开始收集采集物，如果没有发送S2C_COLLECT_MOUNT_COLLECT_OBJ_FAIL，会发送给客户端一个进入读条的消息，
		 * 读条结束，会发送S2C_COLLECT_MOUNT_COLLECT_OBJ
		 *
		 * varint64 id
		 */
		public static function requestCollectMountCollectObj( id:Number ):void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			SocketConnection_protoBuffer.send(MountModuleMessages.C2S_COLLECT_MOUNT_COLLECT_OBJ, _bytes);
		}
		
	}
}