package com.rpgGame.app.cmdlistener.enum
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 帮会成员
	 * @author dik
	 * 
	 */
	public class EGuildMemberType
	{
		public static const CHIEF:int=rEnum.ENUM_START(1);//帮主
		public static const PROXY_CHIEF:int=rEnum.next;//代理帮主
		public static const DEPUTY_CHIEF:int=rEnum.next;//副帮主
		public static const ELDER:int=rEnum.next;//长老
		public static const NORMAL:int=rEnum.next;//帮众
		public static const LEADER:int=rEnum.next;//统帅
		
		public function EGuildMemberType()
		{
		}
	}
}