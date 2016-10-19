package com.rpgGame.coreData.enum.guild
{
	/**
	 * 帮派事件枚举 
	 * @author Mandragora
	 * 
	 */	
	public class GuildEventType
	{
		public function GuildEventType()
		{
		}
		
		public static const TYPE_ALL : uint = 0;
		/**
		 *成员变更 
		 */		
		public static const TYPE_1 : uint = 1;
		/**
		 *职位变更 
		 */		
		public static const TYPE_2 : uint = 2;
		/**
		 *重大捐款 
		 */		
		public static const TYPE_3 : uint = 3;
		/**
		 *日常维护 
		 */		
		public static const TYPE_4 : uint = 4;
		/**
		 *帮派活动 
		 */		
		public static const TYPE_5 : uint = 5;
	}
}