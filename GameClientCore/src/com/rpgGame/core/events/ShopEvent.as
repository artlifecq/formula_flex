package com.rpgGame.core.events
{
	import flash.events.Event;
	/**
	 *
	 * @author lpp
	 */
	public class ShopEvent  extends Event
	{
		/**回购物品改变**/
		public static const BUY_BACK_CHANGE:String= "buy_back_item_change";
		/**
		 *获取到商城商品信息 
		 */		
		public static const SHOP_ITEM_DATA:String="get_shop_items_data";
		/**
		 *单个商品信息数量改变 
		 */		
		public static const SHOP_ITEM_DATA_CHANGE:String="shop_item_change";
		public var data:*;
		public function ShopEvent(type:String, tdata:*=null,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data=tdata;
		}
	}
}