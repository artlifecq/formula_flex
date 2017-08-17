package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.UpgradeUtil;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import app.message.NpcType;
	
	/**
	 *
	 * npc发送
	 * @author wewell@163.com
	 *
	 */
	public class NpcSender extends BaseSender
	{
		public function NpcSender()
		{
		}
		
		/**
		 * 其他npc用（通用） 
		 * @param npcId
		 * @param dialogIndex
		 * 
		 */		
		public static function clickNpc(npcId:Number, dialogIndex:int) : void
		{
			if(lock)return;
			
			_bytes.clear();
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(dialogIndex);
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC, _bytes);
		}
		
		/**
		 * 边境传送 
		 * @param npcId 
		 * @param dialogIndex 索引
		 * @param itemIndex
		 * 
		 */		
		public static function clickTransNpc(npcId:Number, dialogIndex:int, itemIndex:int) : void
		{
			if(lock)return;
			
			_bytes.clear();
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(dialogIndex);
			_bytes.writeVarint32(itemIndex);
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC, _bytes);
		}
		
		/**
		 * 请求点击npc某个功能，加锁
		 *
		 * varint64 npc在场景中的Id
		 * varint32 npc第几个dialog
		 *
		 * 其他数据根据不同功能带不同数据
		 *
		 * dialog类型是：
		 *
		 * ACCEPT_BIAO{
		 *  附带：
		 *      bool 使用增镖令
		 *      UpgradeProto 使用增镖令，带增镖令的消耗/不使用带不使用增镖令的消耗
		 * }
		 * ACCEPT_INVINCIBLE_BIAO{
		 *  附带：
		 *      UpgradeProto 无敌镖车的消耗
		 * }
		 */
//		public static function clickYunBiaoNpc(npcId:Number, dialogIndex:int, dialogType:int, useAcess:Boolean=false) : void
//		{
//			if(lock)return;
//			
//			_bytes.clear();
//			_bytes.writeVarint64(npcId);
//			_bytes.writeVarint32(dialogIndex);
//			
//			var upgradeProtoInfo:UpgradeProtoInfo;
//			var itemListVo:UpgradeItemListVo;
//			switch( dialogType )
//			{
//				case NpcType.ACCEPT_BIAO://镖车
//				{
//					_bytes.writeBoolean(useAcess);
//					upgradeProtoInfo = BiaoCfgData.getUpgradeInfo(MainRoleManager.actorInfo.totalStat.level, useAcess)
//					itemListVo = UpgradeUtil.getUpgradeItemListVo( upgradeProtoInfo);
//					_bytes.writeBytes(itemListVo.getByte());
//					break;
//				}
//				case NpcType.ACCEPT_INVINCIBLE_BIAO://无敌镖车
//				{
//					upgradeProtoInfo = BiaoCfgData.getUpgradeInfo(MainRoleManager.actorInfo.totalStat.level, false, true)
//					itemListVo = UpgradeUtil.getUpgradeItemListVo( upgradeProtoInfo);
//					_bytes.writeBytes(itemListVo.getByte());
//					break;
//				}
//			}
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC, _bytes);
//		}
		
		/**
		 * 坐骑NPC ( 包括坐骑鉴定、转化、繁育 )
		 * @param npcId npc的id
		 * @param dialogIndex 点击的下标索引
		 * @param dialogType 下标类型
		 * @param idx 坐骑槽(第几个坐骑)
		 * @param backIndex 背包位置(转化后，物品放到背包的第几个空位)
		 * @param isInvite 我是不是被邀请的
		 * 
		 */		
		public static function clickMountNpc( npcId:Number, dialogIndex:int, dialogType:int, idx:int=0, backIndex:int=0, isInvite:Boolean=false ) : void
		{
			if(lock)return;
			
			_bytes.clear();
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(dialogIndex);
			
			switch( dialogType )
			{
				case NpcType.MOUNT_IDENTIFY://坐骑鉴定
					_bytes.writeVarint32(idx);
					break;
				case NpcType.MOUNT_TRANS://坐骑转化
					_bytes.writeVarint32(idx);
					_bytes.writeVarint32(backIndex);
					break;
				case NpcType.MOUNT_BREED://坐骑繁育
					_bytes.writeVarint32(idx);
					_bytes.writeBoolean(isInvite);
					break;
				default:
					break;
			}
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC, _bytes);
		}
		
		/**
		 * 坐骑传承
		 * @param npcId npc的id
		 * @param dialogIndex 点击的下标索引
		 * @param isInHeritMountVitalityExp 是否继承根骨经验
		 * @param isInHeritMountSpell 是否继承技能(是否继承根骨经验以及是否继承技能不能够同时为false)
		 * @param idx 要继承根骨经验或者技能的坐骑槽
		 * @param isBackPack 被继承的坐骑是来自背包中得手牌还是坐骑槽中
		 * @param indexOrMountIdx 背包中的位置（或坐骑槽）
		 * 
		 */		
		public static function mountInherit( npcId:Number, dialogIndex:int, isInHeritMountVitalityExp:Boolean, isInHeritMountSpell:Boolean, idx:int, isBackPack:Boolean, indexOrMountIdx:int ) : void
		{
			if( lock )return;
			
			_bytes.clear();
			_bytes.writeVarint64(npcId);
			_bytes.writeVarint32(dialogIndex);
			_bytes.writeBoolean(isInHeritMountVitalityExp);
			_bytes.writeBoolean(isInHeritMountSpell);
			_bytes.writeVarint32(idx);
			_bytes.writeBoolean(isBackPack);
			_bytes.writeVarint32(indexOrMountIdx);
//			send(NpcModuleMessages.C2S_ON_CLICK_NPC, _bytes);
		}
		
		private static var lock:Boolean=false;
		
		public static function unlockSend():void
		{
			lock = false;
		}
		
		public static function lockSend():void
		{
			lock = true;
		}
	}
}

