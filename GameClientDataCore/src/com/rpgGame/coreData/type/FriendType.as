package com.rpgGame.coreData.type
{
	
	public class FriendType
	{
		/**
		 *配偶 
		 */		
		public static const RELATION_TYPE_SPOUSE:int = 0;
		/**
		 *好友 
		 */		
		public static const RELATION_TYPE_FRIEND:int = 1;
		/**
		 *敌人 
		 */		
		public static const RELATION_TYPE_ENEMY:int = 2;
		/**
		 * 最近联系人
		 */		
		public static const RELATION_TYPE_RECENT:int = 3;
		/**
		 *屏蔽列表 
		 */		
		public static const RELATION_TYPE_BLACKLIST:int = 4;
		
		
		public static const RELATION_TYPE_TEAM:int = 5;
//		public static const CHECK_RED_ENVELOPES:int = 10;
		
		/**
		 *排序 
		 */		
		public static const SORT_TYPE_LEV:int =1;
		public static const SORT_TYPE_RACE:int =2;
		
		/**
		 *不在自动添加状态中 
		 */		
		public static const AUTO_ADD_NO:int =0;
		/**
		 * 自动添加好友中
		 */		
		public static const AUTO_ADD_FRIEND:int =1;
		/**
		 * 自动添加敌人中
		 */		
		public static const AUTO_ADD_ENMEY:int =2;
		
		/**
		 * 自动添加组队好友中
		 */		
		public static const AUTO_ADD_TEAM_FRIEND:int =3;
		
		
		
		public function FriendType()
		{
		}
	}
}