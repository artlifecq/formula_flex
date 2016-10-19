package com.rpgGame.coreData.enum.cost
{
	import app.message.AmountType;

	/**
	 * 消耗类型枚举 (在身上物品/钱不足时会抛出这样一个回调类型出来)
	 *	同步AmountType,如果AmountType有改变的时候需要同步过来，并且改变CostCheckManager中的方法
	 *  @author mandragora
	 * 
	 */	
	public class CostCheckTypeEnum
	{
		/**这部分对应AmountType里面的枚举**/
		public static const EXP:int = AmountType.EXP;
		public static const BAND_MONEY:int = AmountType.BAND_MONEY;
		public static const MONEY:int = AmountType.MONEY;
		public static const BAND_JINZI:int = AmountType.BAND_JINZI;
		public static const JINZI:int = AmountType.JINZI;
		public static const HONOR:int = AmountType.HONOR;
		public static const GONGXUN:int = AmountType.GONGXUN;
		public static const FAMILY_LILIAN:int = AmountType.FAMILY_LILIAN;
		public static const WUXUN:int = AmountType.WUXUN;
		/**
		 * 物品 
		 */		
		public static const ITEM_AND_BAND : uint = 11;
	}
}