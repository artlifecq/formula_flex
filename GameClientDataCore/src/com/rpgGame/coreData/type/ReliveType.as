package com.rpgGame.coreData.type
{
	public class ReliveType
	{
		//服务器告诉服务器，面板上应该显示按钮的类型
		/**0. 只可以回城复活**/
		public static const RELIVE_TYPE_0:uint = 0;
		/**1. 原地复活**/
		public static const RELIVE_TYPE_1:uint = 1;
		/**2. 原地完美复活**/
		public static const RELIVE_TYPE_2:uint = 2;
		/**3. 信春哥复活**/
		public static const RELIVE_TYPE_3:uint = 3;
		/**4. 伤不起复活**/
		public static const RELIVE_TYPE_4:uint = 4;
		/**5. 跑得快复活**/
		public static const RELIVE_TYPE_5 : uint = 5;
		
		//被什么东西所杀的类型
		/**0: 英雄**/
		public static const HERO_KILL_TYPE:uint = 0;
		/**1: 怪物**/
		public static const MONSTER_KILL_TYPE:uint = 1;
		/**2: 无名氏 (bug?)**/
		public static const NOBODY_KILL_TYPE:uint = 2;
		
	}
}