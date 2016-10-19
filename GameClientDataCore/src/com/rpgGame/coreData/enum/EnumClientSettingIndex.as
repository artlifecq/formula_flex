package com.rpgGame.coreData.enum
{
	/**
	 * 枚举客户端数据存储索引
	 * @author Guodong.Zhang
	 * 
	 */
	public class EnumClientSettingIndex
	{
		//说明：用于枚举把二进制数据存储到server的key，添加常量的时候依次往后加，一旦确定常量值，不可以随意更改，删除某个常量时，也不可以更改后面常量的值
		public static const INDEX_MAIN:int = 0;
		public static const INDEX_CHAT:int = 1;
	}
}