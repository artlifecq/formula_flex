package com.rpgGame.coreData.info.shop
{
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.netData.shop.bean.ShopItemInfo;

	public class ShopItemVo
	{
		private var _data:ShopItemInfo;
		public function ShopItemVo()
		{
		}
		public function setData(itemInfo:ShopItemInfo):void
		{
			this._data=itemInfo;
		}
		public function getItemConfig():Q_item
		{
			if (!_data) 
			{
				return null;
			}
			return ItemConfig.getQItemByID(_data.item.mod);
		}

		public function get data():ShopItemInfo
		{
			return _data;
		}
		public function get realPrice():int
		{
			if (_data) 
			{
				if (_data.discountPrice!=0) 
				{
					return _data.discountPrice;
				}
				return _data.price;
			}
			return 0;
		}
	}
}