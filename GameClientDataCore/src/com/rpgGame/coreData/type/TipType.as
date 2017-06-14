package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * tip的类型
	 * @author fly.liuyang
	 * 创建时间：2014-8-7 下午3:06:34
	 *
	 */
	public class TipType
	{
		/** 物品信息tip */
		public static const ITEM_TIP : int = rEnum.ENUM_START(1);
		/** 纯文本tip */
		public static const TXT_TIP : int = rEnum.next;
		/** buff tip*/
		public static const BUFF_TIP : int = rEnum.next;
		/** 武器比较tips*/
		public static const EQUIP_COMPAR_TIP : int = rEnum.next;
		/** skill tips*/
		public static const SPELL_TIP : int = rEnum.next;
		/** 帮派技能总tips */
		public static const SOCIETY_SPELL_TOTAL_TIP : int = rEnum.next;
		/** 帮派建设项tips */
		public static const SOCIETY_BUILD_ITEM_TIP : int = rEnum.next;
		/** 地图区域tips */
		public static const MAP_AREA_TIP : int = rEnum.next;
		
		/**
		 *普通
		 */
		public static const NORMAL_TIP : int = rEnum.next;
		/**
		 *装备 
		 */
		public static const EQUIP_TIP : int = rEnum.next;
		
		/**
		 *货币 
		 */
		public static const AMOUNT_TIP : int = rEnum.next;

		/** unlock Gridl tips*/
		public static const OPEN_GRID_TIP : int = rEnum.next;
		/** friend tips*/
		public static const FRIEND_HERO_TIP : int = rEnum.next;
		/** PK模式 tips*/
		public static const PK_MODE_TIP : int = rEnum.next;
		/** 坐骑 tips*/
		public static const MOUNT_TIP : int = rEnum.next;
		/** 坐骑兽牌 tips*/
		public static const MOUNT_BEAST_CARD_TIP : int = rEnum.next;
		/** 坐骑技能 tips*/
		public static const MOUNT_SPELL_TIP : int = rEnum.next;
		/** 属性变化 tips*/
		public static const PROPCHANGE_TIP : int = rEnum.next;
		/** 世界bos奖励 tips*/
		public static const SHIJIEBOSS_REWAD_TIP : int = rEnum.next;
		/** 绝学技能 tips*/
		public static const LOSTSKILL_TIP : int = rEnum.next;
		/**
		 *经脉tip 
		 */		

		public static const MERIDIAN_TIP:int=rEnum.next;

		/**
		 *心法node ip 
		 */		
		public static const CHEATS_NODE_TIP:int=rEnum.next;
		/**
		 *心法 ip 
		 */		
		public static const CHEATS_TIP:int=rEnum.next;
		/**
		 *心法 ip 
		 */		

		public static const CHEATS_INTRADUCTION_TIP:int=rEnum.next;
		/** 被动技能 tips*/
		public static const PASSIVESKILL_TIP : int = rEnum.next;
		/** 丹药 tips*/
		public static const EXTARITEM_TIP : int = rEnum.next;
		/** 队伍list*/
		public static const TEAM_NEAR_TEAM_TIP : int = rEnum.next;
		/** 祝福值 tips*/
		public static const BLESS_TIP : int = rEnum.next;
	}
}
