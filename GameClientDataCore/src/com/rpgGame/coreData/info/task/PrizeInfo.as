package com.rpgGame.coreData.info.task
{
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;

	/**
	 *
	 * 奖励数据
	 * @author zgd
	 * 创建时间：2014-4-11 下午5:45:33
	 * 
	 */
	public class PrizeInfo
	{
		/** 各种数值类型的消耗 **/
		public var moneyAmount:AmountInfo;
		/** 物品数据列表   */
		private var _itemInfoList:Vector.<ClientItemInfo>;
		
		public function PrizeInfo()
		{
			moneyAmount = new AmountInfo();
			_itemInfoList = new Vector.<ClientItemInfo>();
		}

		/** 物品数据列表   */
		public function get itemInfoList() : Vector.<ClientItemInfo>
		{
			return _itemInfoList;
		}
		
		/**
		 *这个函数对 _itemInfoList只拷贝物品id 和 数量
		 * @return 
		 * 
		 */		
		public function clone() : PrizeInfo
		{
			var ret:PrizeInfo = new PrizeInfo();
			ret.moneyAmount = moneyAmount;
			
			ret._itemInfoList = new Vector.<ClientItemInfo>();
			var length:int = _itemInfoList.length;
			for(var i:int = 0; i < length; i++)
			{
				var itemInfo:ClientItemInfo = new ClientItemInfo(_itemInfoList[i].cfgId);
				itemInfo.count = _itemInfoList[i].count;
				ret._itemInfoList.push(itemInfo);
			}
			return ret;
		}
		
		/** 将新的奖励道具加入到奖励道具列表中 **/
		private function addItem($item:ClientItemInfo) : void
		{
			for each (var item:ClientItemInfo in _itemInfoList)
			{
				if (item.isSame($item))
				{
					item.count += $item.count;
					return;
				}
			}
			_itemInfoList.push($item);
		}

//		public function add($prize:PrizeInfo) : void
//		{
//			if( $prize == null )
//				return;
//			
//			exp += $prize.exp;
//			money += $prize.money;
//			bandMoney += $prize.bandMoney;
//			lijin += $prize.lijin;
//			yuanBao += $prize.yuanBao;
//			gongXun += $prize.gongXun;
//			honor += $prize.honor;
//			arenaPoint += $prize.arenaPoint;
//			
//			var items:Vector.<ItemInfo> = new Vector.<ItemInfo>();
//			items.concat($prize._itemInfoList);// 为了不影响$prize中的元素，将这个数组先拷贝出来
//			
//			var len:int = $prize._itemInfoList.length;
//			var idx:int = 0;
//			for (idx=0; idx<len; idx++)
//			{
//				var item:ItemInfo = $prize._itemInfoList[idx];
//				addItem(item);
//			}
//		}

		public function addItemInfo(value:ClientItemInfo):void
		{
			_itemInfoList.push(value);
		}
		
		public function getItemInfoVec():Vector.<ClientItemInfo>
		{
			return _itemInfoList;
		}

//		public function converData(data:PrizeProto):void
//		{
//			if( data == null )
//				return;
//			
//			moneyAmount.setData( data.amounts );
//			
//			createPrizeItemInfo(data.goodsWrapper);
//		}
		
		/**
		 * 解析鸡毛信轮盘奖励 
		 * @param data
		 * 
		 */		
//		public function converRoulettePrizeData(data:RoulettePrizeProto):void
//		{
//			if( data == null )
//				return;
//			
//			if(data.hasGoods)
//			{
//				//物品
//				createPrizeItemInfo([data.goods as GoodsWrapperProto]);
//			}
//			
//			if(data.hasExp)
//			{
//				//百分比
//				moneyAmount.addSomeType(AmountType.EXP, data.exp.per);
//			}
//		}
		
		
		/** 创建物品数据列表  */		
		public function createPrizeItemInfo(items:Array):void
		{
			if( items == null )
				return;
			
			var itemInfo:ClientItemInfo;
			var index:int;
			var len:int = items.length;
			/*while(index < len)
			{
				itemInfo = ItemUtil.wrapperProtoToItemInfo(items[index] as GoodsWrapperProto);
				_itemInfoList.push(itemInfo);
				index++;
			}*/
		}
	}
}
