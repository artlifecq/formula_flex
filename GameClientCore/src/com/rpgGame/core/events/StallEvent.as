package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class StallEvent
	{
		public function StallEvent()
		{
		}
		/**摆摊信息改变了**/
		public static const STALL_UPDATE : int = UNIQUEID.NEXT;
		/**
		 * 摆摊类型改变了 
		 */		
		public static const STALL_TYPE_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 喊话类型改变了 
		 */		
		public static const STALL_AUTO_AD_CHANGE : int = UNIQUEID.NEXT;
	}
}