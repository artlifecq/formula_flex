package com.rpgGame.app.cmdlistener.mount
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.mount.MountInheritManager;
	import com.rpgGame.app.manager.mount.MountIntensifyManager;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.mount.MountSpellsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.mount.MountConfigData;
	import com.rpgGame.coreData.cfg.mount.MountSpeciesData;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.item.MountBeastCardInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	import com.rpgGame.coreData.info.mount.MountStablesBreedData;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	
	import flash.utils.ByteArray;
	
	import app.cmd.MountModuleMessages;
	import app.message.EquipedMountProto;
	import app.message.GoodsProto;
	import app.message.MountProto;
	import app.message.StablesBreedProto;
	import app.message.StablesBreedType;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;
	
	/**
	 * 坐骑消息监侦听
	 * @author 陈鹉光
	 * 
	 */	
	public class MountCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_STATUS_WHEN_ONLINE, onMountBreedStatusWhenOnline );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_IDENTIFY, onMountIdentify );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_IDENTIFY_FAIL, onMountIdentifyFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_TRANS, onMountTrans );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_TRANS_FAIL, onMountTransFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_SLOT_CHANGED, onMountSlotChanged );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_STATUS, onMountStatus );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_STATUS_FAIL, onMountStatusFail );
			
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_RIDE, onMountRide );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_RIDE_FAIL, onMountRideFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_RELEASE, onMountRelease );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_RELEASE_FAIL, onMountReleaseFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_FEED, onMountFeed );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_FEED_FAIL, onMountFeedFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_HUNGER_DEGREE_CHANGED, onMountHungerDegreeChanged );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_REFINE, onMountRefine );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_REFINE_FAIL, onMountRefineFail );
			
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_LEARN_SPELL, onMountLearnSpell );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_LEARN_SPELL_FAIL, onMountLearnSpellFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_TO_NPC, onMountBreedToNpc );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_TO_NPC_FAIL, onMountBreedToNpcFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_SEND_MOUNT_BREED_TO_NPC_TO_TARGET, onSenderMountBreedToNpcToTarget );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_INVITE_OTHER_BREED, onMountInviteOtherBreed );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_INVITE_OTHER_BREED_FAIL, onMountInviteOtherBreedFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_OTHER_INVITE_YOU, onMountOtherInviteYou );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_REFUSE_OTHER_INVITE_YOU, onMountRefuseOtherInviteYou );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_REFUSE_OTHER_INVITE_YOU_FAIL, onMountRefuseOtherInviteYouFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_TARGET_REFUSE_YOU, onMountTargetRefuseYou );
			
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_LOCK, onMountBreedLock );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_LOCK_FAIL, onMountBreedLockFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_MAKE_LOVE, onMountBreedMakeLove );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_GET_BREED_BABY_MOUNT, onMountGetBreedBabyMount );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_GET_BREED_BABY_MOUNT_FAIL, onMountGetBreedBabyMountFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_CANCEL, onMountGetBreedCancel );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_BREED_CANCEL_FAIL, onMountGetBreedCancelFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_OTHER_BREED_CANCEL, onMountOtherBreedCancel );
			
			SocketConnection.addCmdListener( MountModuleMessages.S2C_COLLECT_BABY_MOUNT, onCollectBabyMount );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_COLLECT_BABY_MOUNT_FAIL, onCollectBabyMountFail );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_ADD_EXP, onMountAddExp );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_DROP_MOUNT_COLLECT_OBJ, onDropMountCollectObj );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_SEE_MOUNT_COLLECT_OBJ, onSeeMountCollectObj );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_COLLECT_MOUNT_COLLECT_OBJ, onCollectMountCollectObj );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_COLLECT_MOUNT_COLLECT_OBJ_FAIL, onCollectMountCollectObjFail );
			
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_INHERIT, onMountInherit );
			SocketConnection.addCmdListener( MountModuleMessages.S2C_MOUNT_INHERIT_FAIL, onMountInheritFail );
			
			super.finish();
		}
		
		/**
		 * 上线的时候发送当前的繁育信息
		 *
		 * bytes StablesBreedProto
		 */
		private function onMountBreedStatusWhenOnline( buffer:ByteBuffer ):void
		{
			var stablesBreedPro:StablesBreedProto = new StablesBreedProto();
			stablesBreedPro.mergeFrom(buffer);
			MountManager.setStablesBreedInfo( stablesBreedPro );
		}
		
		/**
		 * 坐骑鉴定成功
		 *
		 * varint32 坐骑槽(第几个坐骑)
		 *
		 * bytes MountProto 坐骑数据
		 */
		private function onMountIdentify( buffer:ByteBuffer ):void
		{
			//坐骑槽(第几个坐骑)
			var idx:int = buffer.readVarint32();
			var mountProto:MountProto = new MountProto();
			mountProto.mergeFrom( buffer );
			MountManager.setMountIdentify( idx, mountProto );
		}
		
		/**
		 * 鉴定失败，返回varint32错误码
		 *
		 * 1. npc没找到
		 * 2. 距离npc过远
		 * 3. 没有找到坐骑
		 * 4. 坐骑已经被鉴定了
		 * 5. 鉴定费不够
		 */
		private function onMountIdentifyFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_1;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_2;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_3;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_4;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_5;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 坐骑转化成功
		 *
		 * varint32 被移除的坐骑
		 *
		 * varint32 背包中的位置
		 *
		 * bytes GoodsProto 兽牌的proto
		 */
		private function onMountTrans( buffer:ByteBuffer ):void
		{
			//被移除的坐骑
			var idx:int = buffer.readVarint32();
			MountManager.removeMountSlot( idx );
			//背包中的位置
			var index:int = buffer.readVarint32();
			//兽牌的proto
			var goodsPro:GoodsProto = new GoodsProto();
			goodsPro.mergeFrom(buffer);
			//物品信息
			var info:MountBeastCardInfo = ItemUtil.convertGoodsProtoToItemInfo( goodsPro ) as MountBeastCardInfo;
			info.setContainerId(ItemContainerID.BackPack);
			BackPackManager.instance.setItemByIndex( index,info );
			EventManager.dispatchEvent( MountEvent.MOUNT_TRANS_SUCCESS, info );
		}
		
		/**
		 * 转化失败，返回varint32错误码
		 *
		 * 3. 没有找到坐骑
		 * 4. 坐骑未被鉴定了
		 * 5. 玩家等级低于携带等级
		 * 6. 无效的物品放置位置
		 * 7. 服务器bug
		 * 8. 坐骑不能穿装备
		 */
		private function onMountTransFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_3;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_6;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_7;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_8;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_10;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 坐骑槽发生改变了
		 * varint32 坐骑槽(第几个坐骑)
		 *
		 * if(buffer.readable()){
		 *      bytes MountProto
		 * }
		 */
		private function onMountSlotChanged( buffer:ByteBuffer ):void
		{
			//坐骑槽(第几个坐骑)
			var idx:int = buffer.readVarint32();
			var info:MountInfoData = new MountInfoData();
			if( buffer.bytesAvailable )
			{
				var mountPro:MountProto = new MountProto();
				mountPro.mergeFrom(buffer);
				info.setInfoData( mountPro );
				info.idx = idx;
				MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec.push( info );
				MountManager.curSelectData = info;
				EventManager.dispatchEvent( MountEvent.MOUNT_INFO_UPDATE, info );
			}
			else
			{
				MountManager.removeMountSlot( idx );
			}
		}
		
		/**
		 * 坐骑状态设置成功
		 *
		 * varint32 坐骑槽(第几个坐骑)
		 * varint32 状态 MountStatus(0，不出战，不训练，1 训练， 2 出战)
		 *
		 * 如果此前有出战坐骑，客户端调整此前出战的坐骑的状态为0，不出战，不训练
		 *
		 * 将该坐骑槽上的坐骑设置为新的状态
		 */
		private function onMountStatus( buffer:ByteBuffer ):void
		{
			var index:int = buffer.readVarint32();
			var mountStatue:int = buffer.readVarint32();
			MountManager.setMountStatue( index, mountStatue );
		}
		
		/**
		 * 设置坐骑状态失败，返回varint32错误码
		 *
		 * 1. 槽位上面竟然没有坐骑
		 * 2. 坐骑没有鉴定
		 * 3. 等级不够，无法操作
		 * 4. 未知的状态
		 * 5. 要设置的状态跟当前状态是一致的
		 * 6. 当前能够训练的坐骑数量已满
		 * 7. 坐骑等级过低，无法上马
		 * 8. 当前坐骑处于上马状态,请先下马
		 */
		private function onMountStatusFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_11;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_12;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_13;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_14;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_15;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_16;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_17;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_117;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 上马/下马成功
		 *
		 * bool true(上马)/false(下马)
		 */
		private function onMountRide( buffer:ByteBuffer ):void
		{
			var isRide:Boolean = buffer.readBoolean();
			MountManager.setMountRideStatue( isRide );
		}
		
		/**
		 * 上下马失败，返回 varint32 错误码
		 *
		 * 1. 施法中，无法上下马
		 * 2. 击晕或者定身
		 * 3. 没有出战坐骑
		 * 4. 该场景不能上马
		 * 5. 上下马cd没到
		 * 6. 坐骑太饿了
		 */
		private function onMountRideFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_18;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_19;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_20;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_21;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_22;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_23;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 放生成功
		 */
		private function onMountRelease( buffer:ByteBuffer ):void
		{
			NoticeManager.showNotify(LangMount.MOUNT_CMDLISTENER_FAILD_24);
			EventManager.dispatchEvent( MountEvent.MOUNT_RELEASE );
		}
		
		/**
		 * 放生失败，返回varint32错误码
		 *
		 * 1. 要放生的坐骑非法
		 * 2. 该坐骑正在骑乘中，请先下马
		 * 3. 服务器bug
		 */
		private function onMountReleaseFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_25;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_26;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 喂养成功
		 */
		private function onMountFeed( buffer:ByteBuffer ):void
		{
			EventManager.dispatchEvent( MountEvent.MOUNT_FEED_SCCUES );
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_27 );
		}
		
		/**
		 * 喂养失败，返回varint32错误码<br/>
		 *
		 * 1. 没有找到坐骑<br/>
		 * 2. 没有鉴定<br/>
		 * 3. 玩家等级低于坐骑携带等级<br/>
		 * 4. 无效的喂养物品的位置<br/>
		 * 5. 物品正在交易中<br/>
		 * 6. 物品没找到<br/>
		 * 7. 物品已经过期了<br/>
		 * 8. 物品不够<br/>
		 * 9. 要喂养的物品跟你想喂养的物品不同<br/>
		 * 10. 不饿<br/>
		 * 11. 当前等级已经达到能够达到的上限了<br/>
		 * 12. 服务器bug<br/>
		 * 13. 该装备无法喂食<br/>
		 */
		private function onMountFeedFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_3;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_28;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_29;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_30;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_31;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_32;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_33;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_34;
					break;
				case 9:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_35;
					break;
				case 10:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_36;
					break;
				case 11:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_37;
					break;
				case 12:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 13:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_38;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 坐骑饥饿度变化了
		 *
		 * varint32 坐骑槽(第几个坐骑)<br/>
		 * varint32 新的饥饿度<br/>
		 *
		 */
		private function onMountHungerDegreeChanged( buffer:ByteBuffer ):void
		{
			var index:int = buffer.readVarint32();
			var hungerDegrees:int = buffer.readVarint32();
			MountManager.updateMountInfoData( index, hungerDegrees );
		}
		
		/**
		 * 坐骑强化完了
		 * <p>
		 * varint32 哪个坐骑<br/>
		 * varint32 vitality 新的根骨<br/>
		 * varint64 新的根骨经验
		 */
		private function onMountRefine( buffer:ByteBuffer ):void
		{
			var idx:int = buffer.readVarint32();
			var newVitality:int = buffer.readVarint32();
			var newVitalityExp:int = buffer.readVarint32();
			MountIntensifyManager.MountRefine( idx, newVitality, newVitalityExp );
		}
		
		/**
		 * 坐骑强化失败，返回varint32错误码
		 *
		 * 1. 要强化的坐骑没找到
		 * 2. 要强化的坐骑没有鉴定
		 * 3. 玩家等级低于坐骑携带等级
		 * 4. 没有找到坐骑强化的配置数据
		 * 5. 强化非法
		 * 6. 目标坐骑没有找到
		 * 7. 目标坐骑未鉴定
		 * 8. 玩家等级低于目标坐骑携带等级
		 * 9. 目标坐骑根骨条件不满足
		 * 10. 目标坐骑不能是出战坐骑
		 * 11. 服务器bug
		 * 12. 物品没有找到
		 * 13. 兽牌根骨条件不满足
		 * 14. 锻骨丹根骨条件不满足
		 * 15. 该物品不能用来强化坐骑
		 * 16. 银两不足
		 * 17. 成年马不能强化
		 */
		private function onMountRefineFail( buffer:ByteBuffer ):void
		{
			MountIntensifyManager.isIntensify = true;//强化失败也算是强化完了
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_39;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_40;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_29;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_41;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_42;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_43;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_44;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_45;
					break;
				case 9:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_46;
					break;
				case 10:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_47;
					break;
				case 11:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 12:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_48;
					break;
				case 13:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_49;
					break;
				case 14:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_50;
					break;
				case 15:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_51;
					break;
				case 16:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_52;
					break;
				case 17:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_53;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 学习技能成功
		 *
		 * varint32 哪个坐骑
		 * varint32 技能槽
		 * varint32 技能书在背包中的位置下标,客户端将该位置的物品数量减1,如果当前剩余数量<=0,将物品从背包删除
		 * varint32 技能书id
		 */
		private function onMountLearnSpell( buffer:ByteBuffer ):void
		{
			var idx:int = buffer.readVarint32();
			var mountSpellIndex:int = buffer.readVarint32();
			var index:int = buffer.readVarint32();
			var skillBooksId:int = buffer.readVarint32();
			
			var item:ItemInfo = GoodsContainerMamager.getItemInfo( ItemContainerID.BackPack, index );
			if( item != null )
			{
				item.count -= 1;
				if(item.count <= 0)
					GoodsContainerMamager.setItemInfo( ItemContainerID.BackPack, index, null );
				else
					GoodsContainerMamager.setItemInfo( ItemContainerID.BackPack, index, item );
			}
			MountSpellsManager.MountLearnSpellSuccess( idx, mountSpellIndex, skillBooksId );
		}
		
		/**
		 * 学习技能书失败，返回varint32错误码
		 *
		 * 1. 坐骑没找到
		 * 2. 坐骑没鉴定
		 * 3. 玩家等级低于坐骑携带等级
		 * 4. 技能书没找到
		 * 5. 技能书学满了/或者技能书等级过低
		 *
		 */
		private function onMountLearnSpellFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_54;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_55;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_29;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_56;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_57;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 交给npc成功
		 */
		private function onMountBreedToNpc( buffer:ByteBuffer ):void
		{
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_66 );
			EventManager.dispatchEvent( MountEvent.MOUNT_BREED_TO_NPC );
		}
		
		/**
		 * 交给npc失败，返回varint32错误码
		 * <p>
		 * 1. 坐骑有装备,无法繁育
		 * 2. 坐骑没找到
		 * 3. 坐骑未鉴定
		 * 4. 玩家等级过低
		 * 5. 坐骑出战中
		 * 6. 当前有繁育或者邀请
		 * 7. 坐骑已经繁育过了
		 * 8. 坐骑饱食度不够
		 * 9. 没有任何邀请
		 * 10. 邀请过期了
		 * 11. 相同性别无法繁育
		 * 12. 不是宝宝马,无法繁育
		 * 13. 物种不同,无法繁育
		 */
		private function onMountBreedToNpcFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_118;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_54;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_58;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_59;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_60;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_61;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_62;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_63;
					break;
				case 9:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_64;
					break;
				case 10:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_65;
					break;
				case 11:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_97;
					break;
				case 12:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_98;
					break;
				case 13:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_99;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 被邀请的一方，将坐骑交给了npc
		 *
		 * bytes 解析成MountProto
		 */
		private function onSenderMountBreedToNpcToTarget( buffer:ByteBuffer ):void
		{
			var mountPro:MountProto = new MountProto();
			mountPro.mergeFrom(buffer);
			var info:MountInfoData = new MountInfoData();
			info.setInfoData( mountPro );
			
			EventManager.dispatchEvent( MountEvent.MOUNT_SENDER_MOUNT_BREED_TO_NPC_TARGET );
		}
		
		/**
		 * 邀请别人成功，等待别人回复
		 */
		private function onMountInviteOtherBreed( buffer:ByteBuffer ):void
		{
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_67 );
			EventManager.dispatchEvent( MountEvent.MOUNT_INVITE_BREED_SUCCESS );
		}
		
		/**
		 * 邀请失败，返回varint32错误码
		 *
		 * 1. 你无法邀请他人
		 * 2. 目标不在线
		 * 3. 目标不是本国的
		 * 4. 目标不能是本人
		 * 5. 当前已经被邀请了或者当前自己在繁育
		 * 6. 服务器bug
		 * 7. 上次邀请没过期，请等待对方回应
		 * 8. 当前已经无法在设置邀请对象了
		 * 9. 当前没有繁育
		 */
		private function onMountInviteOtherBreedFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_68;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_69;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_70;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_71;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_72;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_73;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_74;
					break;
				case 9:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_75;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 其他人邀请你繁育了
		 *
		 * varint64 过期时间
		 * varint64 邀请者的id
		 * bytes 邀请者的名字
		 */
		private function onMountOtherInviteYou( buffer:ByteBuffer ):void
		{
			var time:Number = buffer.readVarint64();
			var inviteId:Number = buffer.readVarint64();
			var inviteName:String = BytesUtil.readRemainUTF(buffer);
			var data:MountStablesBreedData = new MountStablesBreedData();
			data.inviteExpireTime = time;
			data.inviteTargetId = inviteId;
			data.name = inviteName;
			MountManager.inviteExpireTime = time;
			MountManager.MountBeenInvite( data );
		}
		
		/**
		 * 拒绝成功
		 */
		private function onMountRefuseOtherInviteYou( buffer:ByteBuffer ):void
		{
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_76 );
		}
		
		/**
		 * 拒绝失败，返回varint32错误码
		 *
		 * 1. 没有被邀请
		 * 2. 当前情况下，无法拒绝
		 * 3. 服务器bug
		 */
		private function onMountRefuseOtherInviteYouFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_77;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_78;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 邀请被拒绝
		 *
		 * varint64 目标的id，用于区分
		 * bytes 目标的名字
		 */
		private function onMountTargetRefuseYou( buffer:ByteBuffer ):void
		{
			var targetId:Number = buffer.readVarint64();
			var targetName:String = BytesUtil.readRemainUTF(buffer);
			MountManager.MountBeRejectedInvite( targetId, targetName );
		}
		
		/**
		 * 锁定成功
		 *
		 * varint64 id
		 */
		private function onMountBreedLock( buffer:ByteBuffer ):void
		{
			var id:Number = buffer.readVarint64();
			MountManager.MountBreedLockSuccess( id );
		}
		
		/**
		 * 锁定失败，返回varint32错误码
		 *
		 * 1. 当前没有繁育
		 * 2. 当前无法锁定
		 * 3. 当前已经锁定了
		 */
		private function onMountBreedLockFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_75;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_79;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_80;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 坐骑繁育进入到生宝宝阶段了，客户端将该繁育设置为当前正在生宝宝
		 *
		 * varint64 可以领取宝宝的时间
		 */
		private function onMountBreedMakeLove( buffer:ByteBuffer ):void
		{
			var receiveTime:Number = buffer.readVarint64();
			MountManager.mountBreedTime = receiveTime;
			MountManager.mountStablesBreedType = StablesBreedType.MAKE_LOVE;
			EventManager.dispatchEvent( MountEvent.MOUNT_BREED_TIME );
		}
		
		/**
		 * 返回我繁育出来的宝宝
		 *
		 * bytes MountProto
		 */
		private function onMountGetBreedBabyMount( buffer:ByteBuffer ):void
		{
			var mountPro:MountProto = new MountProto();
			mountPro.mergeFrom(buffer);
			var info:MountInfoData = new MountInfoData();
			info.setInfoData( mountPro );
		}
		
		/**
		 * 请求我当前的宝宝失败，返回varint32错误码
		 *
		 * 1. 没有繁育
		 * 2. 当前没有宝宝产生
		 * 3. 服务器bug
		 * 4. 请求过于频繁
		 */
		private function onMountGetBreedBabyMountFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_81;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_82;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_83;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 取消繁育成功
		 *
		 * varint32 槽位
		 * bytes EquipedMountProto 坐骑
		 */
		private function onMountGetBreedCancel( buffer:ByteBuffer ):void
		{
			var idx:int = buffer.readVarint32();
			var equipMountPro:EquipedMountProto = new EquipedMountProto();
			equipMountPro.mergeFrom(buffer);
			MountManager.onCancelMountBreed( equipMountPro, idx );
		}
		
		/**
		 * 取消繁育失败，返回varint32错误码
		 *
		 * 1. 当前没有繁育
		 * 2. 没有空位置放置你的坐骑
		 * 3. 已经取回去了啊
		 * 4. 当前已经在繁育了，无法取消
		 * 5. 服务器bug
		 */
		private function onMountGetBreedCancelFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_75;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_84;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_85;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_86;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 他人取消繁育了，将本次繁育设置为已经取消，你自己只能够把坐骑领回去了
		 */
		private function onMountOtherBreedCancel( buffer:ByteBuffer ):void
		{
			MountManager.setBreedStatus();
		}
		
		/**
		 * 领取坐骑成功
		 *
		 * varint32 繁育马槽位
		 * varint32 繁育马数据长度
		 * bytes EquipedMountProto 繁育马
		 * varint32 宝宝马槽位
		 * bytes MountProto 宝宝马
		 */
		private function onCollectBabyMount( buffer:ByteBuffer ):void
		{
			//EquipedMountProto 繁育马
			var breedIdx:int = buffer.readVarint32();//繁育马槽位
			var len:int = buffer.readVarint32();//繁育马数据长度
			if( len > 0 )
			{
				var bytes:ByteArray = new ByteArray();
				buffer.readBytes(bytes, 0, len);
				var equipMountPro:EquipedMountProto = new EquipedMountProto();
				equipMountPro.mergeFrom(bytes);
				var breedMountData:MountInfoData = new MountInfoData();
				breedMountData.setInfoData( equipMountPro.mount );
				breedMountData.setMountEquipData( equipMountPro.mountEquipments );
				breedMountData.idx = breedIdx;
				MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec.push( breedMountData );
			}
			
			//MountProto 宝宝马
			var babyIdx:int = buffer.readVarint32();//宝宝马槽位
			var babyMountPro:MountProto = new MountProto();
			babyMountPro.mergeFrom(buffer);
			var babyMountData:MountInfoData = new MountInfoData();
			babyMountData.setInfoData( babyMountPro );
			babyMountData.idx = babyIdx;
			MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec.push( babyMountData );
			MountManager.mountStablesBreedType = -1;
			EventManager.dispatchEvent( MountEvent.MOUNT_INFO_UPDATE );
			EventManager.dispatchEvent( MountEvent.MOUNT_GET_MOUNT );
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_119 );
		}
		
		/**
		 * 领取宝宝马失败，返回varint32错误码
		 *
		 * 1. 没有繁育
		 * 2. 已经领取了
		 * 3. 没有空位放置你的繁育马
		 * 4. 没有空位放置你的宝宝马
		 * 5. 服务器bug
		 * 6. 还没有繁育出宝宝马
		 */
		private function onCollectBabyMountFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_81;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_88;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_89;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_90;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_9;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_91;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 经验变化
		 *
		 * varint32 坐骑槽位
		 * varint32 当前等级
		 * varint64 当前经验
		 */
		private function onMountAddExp( buffer:ByteBuffer ):void
		{
			var idx:int = buffer.readVarint32();
			var curLevel:int = buffer.readVarint32();
			var curExp:Number = buffer.readVarint64();
			MountManager.MountAddExp( idx, curLevel, curExp );
		}
		
		/**
		 * 坐骑采集物出现了
		 *
		 * varint64 id
		 * varint32 x
		 * varint32 y
		 * varint64 保护结束时间(这个时间以后就可以采集了)
		 * varint32 坐骑物种
		 */
		private function onDropMountCollectObj( buffer:ByteBuffer ):void
		{
			var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
			dropGoodsData.readFromIsMountCollect(buffer);
			dropGoodsData.isDroped = true;
			var mountSpeciesId:int = buffer.readVarint32();
			var mountData:MountSpeciesData = MountConfigData.getMountSpecieById( mountSpeciesId );
			if( mountData != null )
				dropGoodsData.name = mountData.name;
			SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
		}
		
		/**
		 * 内容同S2C_DROP_MOUNT_COLLECT_OBJ
		 * 
		 * varint64 id
		 * varint32 x
		 * varint32 y
		 * varint64 保护结束时间(这个时间以后就可以采集了)
		 * varint32 坐骑物种 
		 */
		private function onSeeMountCollectObj( buffer:ByteBuffer ):void
		{
			var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
			dropGoodsData.readFromIsMountCollect(buffer);
			dropGoodsData.isMount = true;
			var mountSpeciesId:int = buffer.readVarint32();
			var mountData:MountSpeciesData = MountConfigData.getMountSpecieById( mountSpeciesId );
			if( mountData != null )
				dropGoodsData.name = mountData.name;
			SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
		}
		
		/**
		 * 采集成功，不附带其他任何参数
		 */
		private function onCollectMountCollectObj( buffer:ByteBuffer ):void
		{
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_92 );
		}
		
		/**
		 * 采集失败，返回varint32错误码
		 *
		 * 1. 没找到可以采集的坐骑
		 * 2. 空位不够
		 * 3. 已经被别人采集了
		 * 4. 当前无法采集
		 * 5. 距离过远
		 */
		private function onCollectMountCollectObjFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_93;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_94;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_5;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_96;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_97;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
		
		/**
		 * 坐骑继承成功
		 *
		 * varint32 继承的坐骑
		 * varint32 继承的坐骑新的根骨
		 * varint64 继承的坐骑新的根骨经验
		 * bool 是否继承根骨经验
		 * bool 是否继承技能
		 *
		 * bool 坐骑是来自背包还是坐骑槽
		 *
		 * if(坐骑是来自背包){
		 *      varint32 背包中的哪个格子
		 * } else {
		 *      varint32 坐骑槽下标
		 * }
		 */
		private function onMountInherit( buffer:ByteBuffer ):void
		{
			var idx:int = buffer.readVarint32();
			var inheritNewVitality:int = buffer.readVarint32();
			var inheritNewVitalityExp:int = buffer.readVarint32();
			var isInheritMountVitalityExp:Boolean = buffer.readBoolean();
			var isInheritMountSpell:Boolean = buffer.readBoolean();
			var isBackPack:Boolean = buffer.readBoolean();
			if( isBackPack )//来自背包
			{
				var index:int = buffer.readVarint32();//背包中的哪个格子
				MountInheritManager.onSetMountInherit( idx, inheritNewVitality, inheritNewVitalityExp, isInheritMountVitalityExp, isInheritMountSpell, index, isBackPack );
			}
			else
			{
				var mountIdx:int = buffer.readVarint32();//坐骑槽下标
				MountInheritManager.onSetMountInherit( idx, inheritNewVitality, inheritNewVitalityExp, isInheritMountVitalityExp, isInheritMountSpell, mountIdx, isBackPack );
			}
		}
		
		/**
		 * 坐骑继承失败,返回varint32错误码
		 * <p>
		 * 1. 要强化的坐骑没找到
		 * 2. 要强化的坐骑没有鉴定
		 * 3. 玩家等级低于坐骑携带等级
		 * 4. 要么继承经验,要么继承技能
		 * 5. 坐骑根骨已满
		 * 6. 目标坐骑没有找到
		 * 7. 目标坐骑未鉴定
		 * 8. 玩家等级低于目标坐骑携带等级
		 * 10. 目标坐骑不能是出战坐骑
		 * 11. 服务器bug
		 * 12. 物品没有找到
		 * 15. 该物品不能用来强化坐骑
		 * 16. 绑银不足
		 */
		private function onMountInheritFail( buffer:ByteBuffer ):void
		{
			var failId:int = buffer.readVarint32();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_104;
					break;
				case 2:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_105;
					break;
				case 3:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_106;
					break;
				case 4:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_107;
					break;
				case 5:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_108;
					break;
				case 6:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_109;
					break;
				case 7:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_110;
					break;
				case 8:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_111;
					break;
				case 9:
					failStr = "";
					break;
				case 10:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_112;
					break;
				case 11:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_113;
					break;
				case 12:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_114;
					break;
				case 13:
					failStr = "";
					break;
				case 14:
					failStr = "";
					break;
				case 15:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_115;
					break;
				case 16:
					failStr = LangMount.MOUNT_CMDLISTENER_FAILD_116;
					break;
			}
			NoticeManager.showNotify(failStr, failId);
		}
	}
}