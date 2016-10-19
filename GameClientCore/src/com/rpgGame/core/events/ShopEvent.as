package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	
	/**
	 *
	 * @author lpp
	 */
	public class ShopEvent 
	{
		/**回购物品改变**/
		public static const BUY_BACK_CHANGE:int = UNIQUEID.NEXT;
		
		/** 请求NPC商店物品数据成功*/
		public static const NPC_SHOP_ITEM_DATA:int = UNIQUEID.NEXT;
		
		public static const REPAIR_SUCCESS:int = UNIQUEID.NEXT;
		
		public static const REPAIR_ALL_SUCCESS:int = UNIQUEID.NEXT;
		
		public static const ENTER_SELL_MODE:int = UNIQUEID.NEXT;
		
		public static const EXIT_SELL_MODE:int = UNIQUEID.NEXT;
		
		public static const ENTER_REPAIR_MODE:int = UNIQUEID.NEXT;
		
		public static const EXIT_REPAIR_MODE:int = UNIQUEID.NEXT;
	}
}