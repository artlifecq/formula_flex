package com.rpgGame.coreData.info.trade
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 交易的信息 
	 * @author Mandragora
	 * 
	 */	
	public class TradeData
	{
		public var money : Number;
		private var _items:HashMap;
		/**已经向服务器发送的物品，等服务器返回之后，就可以设置了**/
		private var waitItem : GridInfo;
		/**等待移除的物品，等待服务器返回之后就移除这个物品，并且把这个值设置为-1**/
		private var waitRemoveIndex:int = -1;
		/**等待设置的银两数量**/
		private var waitMoney : int;
		public function TradeData(containerId:int)
		{
			dataInit(containerId);
		}
		/**这里初始化所有的格子都是空的**/
		private function dataInit(containerId:int):void
		{
			//TradeCfgData.tradeGoodsLimit
			_items = new HashMap();
			for (var i : int = 0 ; i < 6;i++)
			{
				var grid : GridInfo = new GridInfo(containerId,i);
				grid.realIndex = i;
				_items.add(i,grid);
			}
		}
		
		public function setWaitMoney(money:int):void
		{
			waitMoney = money;
		}
		
		public function getIndexByItem(item:ClientItemInfo):int
		{
			var result : int = -1;
			for (var i : int = 0 ; i < 6;i++)
			{
				var grid : GridInfo = _items.getValue(i);
				if(!grid || !grid.data)
					continue;
				grid.data as ClientItemInfo
			}
			
			return result;
		}
		
		public function setMoneyComplete():void
		{
			this.money = waitMoney;
		}
		/**
		 * 把设置的等待移除的物品真的移除掉 
		 * 
		 */		
		public function setWiteRemoveIndexComplete():void
		{
			removeItemsByIndes(waitRemoveIndex);
			removeWaitIndex();
		}
		
		public function removeWaitIndex():void
		{
			waitRemoveIndex = -1;
		}
		
		public function getWaitRemoveIndex():int
		{
			return waitRemoveIndex;
		}
		/**
		 * 设置一个等待移除的物品位置 
		 * @param index
		 * 
		 */		
		public function setWaitRemoveIndex(index:int):void
		{
			if(waitRemoveIndex!=-1)
				trace("之前有一个等待移除的物品都没有移除掉，现在又要移除了？");
			waitRemoveIndex = index;
		}
		
		public function setItem(item:GridInfo):void
		{
			items.add(item.index,item);
		}
		
		public function setWaitItem(item:GridInfo):void
		{
			waitItem = item;
		}
		
		public function setWaitItemToItems():void
		{
			_items.add(waitItem.index,waitItem);
			waitItem = null;
		}
		
		public function hasWaitItem():Boolean
		{
			return waitItem;
		}
		
		public function removeWaitItem():void
		{
			waitItem = null;
		}
		
		public function getWaitItemInfo():ClientItemInfo
		{
			return waitItem.data as ClientItemInfo;
		}
		
		public function getItemInfoByIndex(index:int):ClientItemInfo
		{
			var grid : GridInfo = _items.getValue(index);
			if(grid)
				return grid.data as ClientItemInfo;
			return null;
		}
		
		public function removeItemsByIndes(index:int):void
		{
			var grid : GridInfo = _items.getValue(index);
			if(grid)
				grid.data = null;
		}
		
		public function getAllItems():Array
		{
			return _items.getValues();
		}

		private function get items():HashMap
		{
			return _items;
		}
		
		public function indexHasItem(index:int):Boolean
		{
			return _items.getValue(index);
		}

	}
}