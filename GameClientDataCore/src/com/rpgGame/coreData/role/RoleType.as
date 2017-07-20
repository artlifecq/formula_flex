package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 角色类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class RoleType
	{
		/**
		 * 英雄 1
		 */
		public static const TYPE_HERO : int = rEnum.ENUM_START(1);
		/**
		 * 怪物 2
		 */
		public static const TYPE_MONSTER : int = rEnum.next;
		/**
		 * NPC 3
		 */
		public static const TYPE_NPC : int = rEnum.next;
		/**
		 * BOSS 4
		 */
		public static const TYPE_BOSS : int = rEnum.next;
		/**
		 * 采集物 5
		 */
		public static const TYPE_COLLECT : int = rEnum.next;
		/**
		 * 镖车 6
		 */
		public static const TYPE_BIAOCHE : int = rEnum.next;
		/**
		 * 掉落物 7
		 */
		public static const TYPE_DROP_GOODS : int = rEnum.next;
		/**
		 * 粮仓 8
		 */
		public static const TYPE_LIANG_CANG : int = rEnum.next;
		/**
		 * 普通传送门 9
		 */
		public static const TYPE_TRANPORT_NORMAL : int = rEnum.next;
		/**
		 * 迷宫传送门 10
		 */
		public static const TYPE_TRANPORT_MAZE : int = rEnum.next;
		/**
		 * 保护NPC 11
		 */
		public static const TYPE_PROTECT_NPC : int = rEnum.next;
		/**
		 * 摊位 12
		 */		
		public static const TYPE_STALL : int = rEnum.next;
		/**
		 * 国战战车 13
		 */
		public static const TYPE_ZHAN_CHE : int = rEnum.next;
		/**
		 * 八阵图怪物石碑 14
		 */		
		public static const TYPE_BA_ZHEN_TU : int = rEnum.next;
		/**
		 * 客户端NPC  15
		 */		
		public static const CLIENT_NPC : int = rEnum.next;
		
		public static const TYPE_FIGHT_SOUL:int = rEnum.next;
		public static const GIRL_PET:int = rEnum.next;
		/**
		 * 跳跃点 18
		 */		
		public static const TYPE_JUMP:int = rEnum.next;
		
		public function RoleType()
		{
		}
	}
}
