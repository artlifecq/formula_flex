package com.rpgGame.coreData.cfg.item
{
	import com.rpgGame.coreData.rEnum;
	
	import app.message.ContainerProto.ContainerType;

	/**
	 * 格子类型 ID
	 * @author
	 * 
	 */	
	public class ItemContainerID
	{
		//--------------------客户端、服务端统一的类型
		/** 背包 **/
		public static const BackPack:int = ContainerType.DEPOT;
		/** 仓库 **/
		public static const Storage:int = ContainerType.STORAGE;
		/** 角色 **/
		public static const Role:int = ContainerType.HERO_EQUIPMENT;
		/** 坐骑 **/
		public static const Mount : int = ContainerType.MOUNT_EQUIPMENT;
		
		
		
		
		//--------------------客户端自有类型,从10开始
		/** 快捷栏 10 **/
		public static const Shortcut:int = rEnum.ENUM_START( 10 );
		/** 技能面板 11 **/
		public static const Spell:int = rEnum.next;
		/** 邮件发件箱 12 **/
		public static const MAIL_SEND:int = rEnum.next;
		/** 邮件收件箱 13 **/
		public static const MAIL_READ:int = rEnum.next;
		/** 装备打造(源材料) 14 **/
		public static const EQUIP_MAKE:int = rEnum.next;
		/** 装备打造材料(使用材料) 15 **/
		public static const EQUIP_MATER:int = rEnum.next;
		/** 装备合成 16 **/
		public static const EQUIP_COMBINE:int = rEnum.next;
		/** 装备打造 17 **/
		public static const EQUIP_REFINE:int = rEnum.next;
		/** 装备拆解 18 **/
		public static const EQUIP_DESTORY:int = rEnum.next;
		/** 装备改造 19 **/
		public static const EQUIP_GENERAL:int = rEnum.next;
		/** 交易 20 **/
		public static const TRADE : int = rEnum.next;
		/** 交易对方的容器 21 **/
		public static const TRADE_TARGET : int = rEnum.next;
		/** 坐骑装备 22 **/
		public static const MOUNT_EQUIP:int = rEnum.next;
		/** 坐骑喂养 23 **/
		public static const MOUNT_FEED:int = rEnum.next;
		/** 坐骑喂养(喂养放置物品的格子)24 **/
		public static const MOUNT_FEED_MATER:int = rEnum.next;
		/** 坐骑强化 25 **/
		public static const MOUNT_INTENSIFY:int = rEnum.next;
		/** 坐骑强化(使用材料) 26 **/
		public static const MOUNT_INTENSIFY_MATER:int = rEnum.next;
		/** 坐骑技能 27 **/
		public static const MOUNT_SPELLS:int = rEnum.next;
		/** 坐骑技能 28(放技能书的格子) **/
		public static const MOUNT_SPELLS_MATER:int = rEnum.next;
		/** 交易 29 **/
		public static const MAIL : int = rEnum.next;
		/** 坐骑槽 30 **/
		public static const MOUNT_SLOT:int = rEnum.next;
		/** 要强化的坐骑 31 **/
		public static const MOUNT_INTENSIFY_MOUNT:int = rEnum.next;
		/** 坐骑鉴定 32 **/
		public static const MOUNT_AUTHENTICATE:int = rEnum.next;
		/** 坐骑传承 33 **/
		public static const MOUNT_INHERTIT:int = rEnum.next;
		/** 摆摊中间的格子 34**/
		public static const STALL : int = rEnum.next;
		/** 摆摊出售物品 35**/
		public static const STALL_SELL : int = rEnum.next;
		
		/**
		 * 强化装备列表
		 */
		public static const INTENSIFY_LIST:int =rEnum.next;
		/**
		 * 强化装备消耗
		 */
		public static const INTENSIFY_USE:int =rEnum.next;
		/**
		 * 强化装备消耗1
		 */
		public static const INTENSIFY_USE1:int =rEnum.next;
		
		/**
		 * 琢磨装备列表
		 */
		public static const POLIST_LIST:int =rEnum.next;
		/**
		 * 琢磨装备消耗
		 */
		public static const POLIST_USE:int =rEnum.next;
		
		/**
		 * 洗炼装备列表
		 */
		public static const SMELT_LIST:int =rEnum.next;
		/**
		 * 洗炼装备消耗
		 */
		public static const SMELT_USE:int =rEnum.next;
		/**
		 * 继承装备列表
		 */
		public static const IHT_LIST:int =rEnum.next;
		/**
		 * 继承装备消耗
		 */
		public static const IHT_USE:int =rEnum.next;
		
		/** 随身商店 **/
		public static const BACKPACK_SHOP : int = rEnum.next;
		
	}
}