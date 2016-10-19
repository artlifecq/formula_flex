package com.rpgGame.app.manager.cost
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.enum.cost.CostCheckTypeEnum;
	import com.rpgGame.coreData.info.cost.CostInfo;
	import com.rpgGame.coreData.info.cost.CostItem;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeGoodsInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;

	import app.message.AmountType;

	import org.client.mainCore.ds.HashMap;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 消耗检测的工具</br>
	 * 初始化需传入一个检测回调方法(isPass:boolean,cost:costInfo=null,lackNum:int = 0),通过了就不会有costInfo了,未通过会有一个costInfo(缺少的消耗)和lackNum(缺少的数量/正数)</br>
	 * CostCheckTypeEnum中的类型，并且限定是否使用绑定物品)
	 * @author mandragora
	 *
	 */
	public class CostCheckManager
	{
		private var _UseBindItem : Boolean = true;
		private var _useBackPack : Boolean = true;
		public var isUseSilver : Boolean;

		private var _costMap : HashMap;
		private var _haveMap : HashMap;
		private var _costCompleteFun : Function;
		private var _bytes : ByteBuffer;

		public function CostCheckManager(CompleteFun : Function)
		{
			_costCompleteFun = CompleteFun;
			if (!_costCompleteFun)
			{
				trace("CostCheckManager 传一个空的回调函数过来。。。。")
			}
			initCostMap();
			_bytes = new ByteBuffer();
		}

		/**
		 * costs已经被取消了
		 * @param costs
		 *
		 */
		public function initCostMap() : void
		{
			var i : uint = 0;
			if (!_costMap)
				_costMap = new HashMap();
			_costMap.clear();
			if (!_haveMap)
				_haveMap = new HashMap();
			_haveMap.clear();
		}

		/**
		 * @param map
		 * @param type
		 * @param num
		 * @param item
		 *
		 */
		private function setCostInfo(map : HashMap, cost : CostInfo) : void
		{
			var costInfo : CostInfo;
			var costItemMap : HashMap;
			var type : int = cost.type;
			var item : CostItem = cost.costItem;
			if (type == CostCheckTypeEnum.ITEM_AND_BAND) //如果是物品就加入到队列里面,因为物品不止一个
			{
				costItemMap = map.getValue(type);
				if (!costItemMap)
					costItemMap = new HashMap();

				if (!item)
					return;

				costInfo = costItemMap.getValue(item.key);
				if (!costInfo)
					costInfo = new CostInfo();

				costInfo.costItem = item;
				costInfo.type = type;

				costItemMap.add(item.key, costInfo);
				map.add(type, costItemMap);
			}
			else
			{
				map.add(type, cost);
			}
		}

		public function clearItem(index : int) : void
		{
			var costInfo : CostInfo;
			var costItemMap : HashMap;
			costItemMap = _costMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (!costItemMap)
				return;

			costItemMap.remove(index);
		}

		public function addCost(item : CostInfo) : void
		{
			setCostInfo(_costMap, item);
		}

		/**如果是物品,那就是HashMap 其他的是costInfo**/
		public function getCostByType(type : int) : *
		{
			return _costMap.getValue(type);
		}

		public function getCostInfoByKey(key : int) : CostInfo
		{
			var costItemMap : HashMap = _costMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (!costItemMap)
				return null;
			return costItemMap.getValue(key);
		}

		public function removeCostByType(type : int) : void
		{
			_costMap.remove(type);
		}

		/**
		 * @param index
		 * @param num
		 */
		public function setCostNumberByKey(key : int, count : int) : void
		{
			var costItemMap : HashMap = _costMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (!costItemMap)
				return;
			var costInfo : CostInfo = costItemMap.getValue(key);
			if (!costInfo)
				return;

			costInfo.costItem.count = count;
		}

		/**
		 * 物品才用这个，只需要设置物品就好了，钱都是判断背包里面的
		 * @param type
		 * @param num
		 * @param item
		 *
		 */
		public function setHaveItem(item : CostInfo) : void
		{
			setCostInfo(_haveMap, item);
		}

		public function clearHaveItem() : void
		{
			if (!_haveMap)
				_haveMap = new HashMap();
			_haveMap.clear();
		}

		public function getBytes() : ByteBuffer
		{
			_bytes.clear();
			var temp : Array = [];
			var costInfo : CostInfo;
			var maxNum : int;
			var index : int = 0;
			var costItemMap : HashMap = _costMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			var hasMap : HashMap = _haveMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (costItemMap)
			{
				var costLen : int = costItemMap.length;
				var costValues : Array = costItemMap.getValues();
				var costi : int = 0;
				for (; costi < costLen; costi++)
				{
					costInfo = costValues[costi];
					if (!costInfo)
						continue;
					var itemTemp : Array = [];
					index = 0;
					if (_useBackPack)
					{
						if (_UseBindItem) //判断是否能使用绑定物品
							maxNum = BackPackManager.instance.getBagItemsCountById(costInfo.costItem.cfgId);
						else
							maxNum = BackPackManager.instance.getBagItemsCountByIdAndBind(costInfo.costItem.cfgId);
//						if(costInfo.num > maxNum)
//							continue;
						var backPackItems : Vector.<ItemInfo> = BackPackManager.instance.getBagItemsByID(costInfo.costItem.cfgId);
						var itemInfo : ItemInfo;
						var needCount : int = costInfo.costItem.count;
						for each (itemInfo in backPackItems)
						{
							if (itemInfo.count > needCount)
								itemTemp.push({index: itemInfo.index, count: needCount});
							else
							{
								needCount = needCount - itemInfo.count;
								itemTemp.push({index: itemInfo.index, count: itemInfo.count});
							}
							itemTemp.push();
							index++;
						}
						temp.push({count: index, items: itemTemp});
					}
					else
					{
						var i : uint = 0;
						if (!hasMap)
							continue;
						var values : Array = hasMap.getValues();
						var len : uint = values.length;
						var haveCost : CostInfo;
						for (; i < len; i++)
						{
							haveCost = values[i];
							if (!haveCost || !haveCost.costItem)
								continue;
							if (haveCost.costItem.cfgId != costInfo.costItem.cfgId)
								continue;
							if (haveCost.costItem.count >= costInfo.costItem.count)
							{
								itemTemp.push({index: haveCost.costItem.key, count: costInfo.costItem.count});
								index++;
							}
						}
						temp.push({count: index, items: itemTemp});
					}
				}
			}
			_bytes.writeBoolean(isUseSilver);
			_bytes.writeVarint32(0);
			for each (var tempObj : Object in temp) //物品种类
			{
				_bytes.writeVarint32(tempObj.count); //一个物品从背包里面找了多少个格子 
				for each (var obj : Object in tempObj.items)
				{
					_bytes.writeVarint32(obj.index); //每一个格子的位置 
					_bytes.writeVarint32(obj.count); //数量
				}
			}

			return _bytes;
		}

		/**
		 * 检测是否通过的方法,可以根据需求再改进<br/>
		 * 检测后会调用costCompleteFun方法
		 */
		public function checkCost() : void
		{
			var keys : Array = _costMap.keys();
			var key : int;
			var i : uint = 0;
			var len : uint = _costMap.length;
			var costInfo : CostInfo;
			var maxNum : int;
			var amount : AmountInfo = MainRoleManager.actorInfo.amountInfo;
			var costItemMap : HashMap;
			for (; i < len; i++)
			{
				key = keys[i];
				if (key == CostCheckTypeEnum.ITEM_AND_BAND)
				{
					costItemMap = _costMap.getValue(key);
					if (!costItemMap)
						continue;
					var costLen : int = costItemMap.length;
					var costValues : Array = costItemMap.getValues();
					var costIndex : int = 0;
					for (; costIndex < costLen; costIndex++)
					{
						costInfo = costValues[costIndex];
						if (!costInfo)
							continue;
						if (_useBackPack)
						{
							if (_UseBindItem) //判断是否能使用绑定物品
								maxNum = BackPackManager.instance.getBagItemsCountById(costInfo.costItem.cfgId);
							else
								maxNum = BackPackManager.instance.getBagItemsCountByIdAndBind(costInfo.costItem.cfgId);
							if (costInfo.costItem.count > maxNum)
							{
								_costCompleteFun(false, costInfo, maxNum - costInfo.costItem.count);
								return;
							}
						}
						else
						{
							if (!haveItem(costInfo.costItem))
							{
								_costCompleteFun(false, costInfo, maxNum - costInfo.costItem.count);
								return;
							}
						}
					}
				}
				else
				{
					costInfo = _costMap.getValue(key);
					if (!costInfo)
						continue;
					maxNum = amount.getAmountByType(costInfo.type);
					if (costInfo.costMoneyNum > maxNum)
					{
						_costCompleteFun(false, costInfo, maxNum - costInfo.costMoneyNum);
						return;
					}
				}
			}
			_costCompleteFun(true, costInfo, 0);
		}

		private function haveItem(item : CostItem) : Boolean
		{
			if (!_haveMap)
				return false;
			var i : uint = 0;
			var hasMap : HashMap = _haveMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (!hasMap)
				return false;
			var values : Array = hasMap.getValues();
			var len : uint = values.length;
			var costInfo : CostInfo;
			for (; i < len; i++)
			{
				costInfo = values[i];
				if (!costInfo || !costInfo.costItem)
					continue;
				if (costInfo.costItem.cfgId != item.cfgId)
					continue;
				if (costInfo.costItem.count >= item.count)
					return true;
			}
			return false;
		}

		/**
		 * 必须先使用
		 * 验证缺少物品的，如果使用背包里面的物品/没有初始化拥有物品/拥有物品里面没有这个东西，会返回Int.MaxValue;
		 * @param item
		 * @return
		 *
		 */
		private function lackItem(item : CostItem) : int
		{
			if (!_haveMap)
				return int.MAX_VALUE;
			var i : uint = 0;
			var hasMap : HashMap = _haveMap.getValue(CostCheckTypeEnum.ITEM_AND_BAND);
			if (!hasMap)
				return int.MAX_VALUE;
			var values : Array = hasMap.getValues();
			var len : uint = values.length;
			var costInfo : CostInfo;
			for (; i < len; i++)
			{
				costInfo = values[i];
				if (!costInfo || !costInfo.costItem)
					continue;
				if (costInfo.costItem.cfgId != item.cfgId)
					continue;
				if (costInfo.costItem.count < item.count)
					return item.count - costInfo.costItem.count;
			}
			return int.MAX_VALUE;
		}

		/**
		 * 将消耗转换为实际文字 (物品会直接转换成名字)
		 * @param type costInfo.type / CostCheckTypeEnum
		 *
		 */
		public function replaceCostType(costInfo : CostInfo) : String
		{
			switch (costInfo.type)
			{
				case CostCheckTypeEnum.EXP:
					return "经验";
				case CostCheckTypeEnum.BAND_MONEY:
					return "绑银";
				case CostCheckTypeEnum.MONEY:
					return "银子";
				case CostCheckTypeEnum.BAND_JINZI:
					return "绑金";
				case CostCheckTypeEnum.JINZI:
					return "金子";
				case CostCheckTypeEnum.HONOR:
					return "荣誉值";
				case CostCheckTypeEnum.GONGXUN:
					return "功勋";
				case CostCheckTypeEnum.FAMILY_LILIAN:
					return "历练";
				case CostCheckTypeEnum.WUXUN:
					return "武勋";
				case CostCheckTypeEnum.ITEM_AND_BAND:
					return ItemCfgData.getItemName(costInfo.costItem.cfgId);
					break;
			}
			return "";
		}

		public function setUpgradeCost(upgrade : UpgradeProtoInfo) : void
		{
			var len : int = upgrade.goodsInfoVect.length;
			var upgradeGoodsInfo : UpgradeGoodsInfo;
			var costItem : CostItem = new CostItem();
			var costInfo : CostInfo = new CostInfo();
			for (var i : int = 0; i < len; i++)
			{
				upgradeGoodsInfo = upgrade.goodsInfoVect[i];
				costItem.cfgId = upgradeGoodsInfo.cfgId;
				costItem.count = upgradeGoodsInfo.upgradeGoodsCount;
				costItem.key = i;
				costInfo.costItem = costItem;
				costInfo.type = CostCheckTypeEnum.ITEM_AND_BAND;
				setCostInfo(_costMap, costInfo);
			}
		}

		/**
		 * 通过upgrade来检测是否通过消耗验证
		 * @param upgrade
		 *
		 */
		public function costUpgrade(upgrade : UpgradeProtoInfo, needComplete : Boolean = false) : Boolean
		{
			var len : int = upgrade.goodsInfoVect.length;
			var upgradeGoodsInfo : UpgradeGoodsInfo;
			var costItem : CostItem = new CostItem();
			var costInfo : CostInfo = new CostInfo();
			var maxNum : int; //背包里物品最大数量
			for (var i : int = 0; i < len; i++)
			{
				upgradeGoodsInfo = upgrade.goodsInfoVect[i];
				costItem.cfgId = upgradeGoodsInfo.cfgId;
				costItem.count = upgradeGoodsInfo.upgradeGoodsCount;
				costInfo.costItem = costItem;
				if (_useBackPack)
				{
					if (_UseBindItem) //判断是否能使用绑定物品,这里之后可以支持替代物品
						maxNum = BackPackManager.instance.getBagItemsCountById(upgradeGoodsInfo.cfgId);
					else
						maxNum = BackPackManager.instance.getBagItemsCountByIdAndBind(upgradeGoodsInfo.cfgId);
					if (upgradeGoodsInfo.upgradeGoodsCount > maxNum)
					{
						if (needComplete)
							_costCompleteFun(false, costInfo, maxNum - costInfo.costItem.count);
						return false;
					}
				}
				else
				{
					if (!haveItem(costInfo.costItem))
					{
						if (needComplete)
							_costCompleteFun(false, costInfo, lackItem(costItem));
						return false;
					}
				}
			}
			return checkAmount(upgrade.amountInfo, true);
		}

		/**检测AmountInfo**/
		public function checkAmount(amount : AmountInfo, needComplete : Boolean = false) : Boolean
		{
			var amountKeys : Array = amount.getAllTyps();
			var mineAmount : AmountInfo = MainRoleManager.actorInfo.amountInfo;
			var have : int;
			var need : int;
			for (var i : int = 0; i < amountKeys.length; i++)
			{
				if (amountKeys[i] == AmountType.BAND_MONEY)
				{
					if (isUseSilver)
						have = mineAmount.getAmountByType(AmountType.MONEY);
					else
						have = mineAmount.getAmountByType(amountKeys[i]);
				}
				else
					have = mineAmount.getAmountByType(amountKeys[i]);

				need = amount.getAmountByType(amountKeys[i]);
				if (have < need)
				{
					var costInfo : CostInfo = new CostInfo();
					costInfo.type = amountKeys[i];
					costInfo.costMoneyNum = amount.getAmountByType(amountKeys[i]);
					_costCompleteFun(false, costInfo, need - have);
					return false;
				}
			}
			_costCompleteFun(true);
			return true;
		}


		/**
		 * 是否使用绑定物品
		 */
		public function get UseBindItem() : Boolean
		{
			return _UseBindItem;
		}

		/**
		 * @private
		 */
		public function set UseBindItem(value : Boolean) : void
		{
			_UseBindItem = value;
		}

		/**
		 * 是否使用背包中的物品
		 */
		public function get useBackPack() : Boolean
		{
			return _useBackPack;
		}

		/**
		 * @private
		 */
		public function set useBackPack(value : Boolean) : void
		{
			_useBackPack = value;
		}

		/**创建一个物品消耗对象**/
		public static function createCostInfoForItem(cfg : int, index : int, num : int) : CostInfo
		{
			var costItem : CostItem;
			var costInfo : CostInfo;
			costInfo = new CostInfo();
			costInfo.type = CostCheckTypeEnum.ITEM_AND_BAND;
			costItem = new CostItem();
			costInfo.costItem = costItem;
			costItem.cfgId = cfg;
			costItem.count = num;
			costItem.key = index;
			return costInfo;
		}
	}
}
