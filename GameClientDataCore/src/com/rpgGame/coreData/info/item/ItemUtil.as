package com.rpgGame.coreData.info.item
{
	import com.game.mainCore.core.utils.TextFormatUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ContainerData;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.lang.LangSociety;
	import com.rpgGame.coreData.type.ShopType;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import app.message.AmountType;
	import app.message.EquipmentProto;
	import app.message.GoodsProto;
	import app.message.GoodsWrapperProto;
	import app.message.MountProto;
	import app.message.PrizeProto;
	import app.message.Quality;
	import app.message.ContainerProto.ContainerType;
	
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 物品栏对象
	 * @author Raizo
	 *
	 */
	public class ItemUtil
	{
		/**
		 * 将GoodsWrapperProto转化为ItemInfo
		 * 某些系统需要将物品展示出来，此时如果只有GoodsData时，部分特殊数据无法展示，
		 * 如装备，物品有效期等，现在将所有需要展示Tip的数据由GoodsWrapperProto表示
		 * 物品个数、是否绑定、过期时间、有效期，几个字段以GoodsWrapperProto中的为准
		 * @param goodsWrapperProto  展示Tip的数据
		 * @param gridId             格子ID
		 * @return itemInfo
		 *
		 */
		public static function wrapperProtoToItemInfo(goodsWrapperProto : GoodsWrapperProto) : ItemInfo
		{
			if (goodsWrapperProto == null)
				return null;

			var expireTime : Number = 0;
			if (goodsWrapperProto.hasExpireTime)
			{
				expireTime = goodsWrapperProto.expireTime.toNumber();
			}

			var itemInfo : ItemInfo = convertGoodsProtoToItemInfo(goodsWrapperProto.goods)
			itemInfo.tab = goodsWrapperProto.tab;
			itemInfo.duration = goodsWrapperProto.duration;
			itemInfo.expireTime = expireTime;
			itemInfo.count = goodsWrapperProto.count;

			return itemInfo;
		}

		public static function convertGoodsProtoToItemInfo(data : GoodsProto) : ItemInfo
		{
			var cfgId : int = data.id;
			var expireTime : Number = data.expireTime ? data.expireTime.toNumber() : 0;
			var count : int = data.count;
			var itemInfo : ItemInfo;
			if (data.hasEquipment)
			{
				itemInfo = createEquipInfo(data);
			}
			else if(data.hasMount)
			{
				itemInfo = createMountInfoData(data);
			}
			else
			{
				itemInfo = createItemInfo(cfgId, expireTime, count);
			}
			itemInfo.binded = data.binded;
			return itemInfo;
		}

		public static function createEquipInfo(data : GoodsProto) : EquipInfo
		{
			if (!data.hasEquipment)
				return null;
			var equipInfo : EquipInfo = new EquipInfo();
			var equipment : EquipmentProto = data.equipment;
			equipInfo.count = data.count;
			equipInfo.cfgId = data.id;
			equipInfo.type = ItemCfgData.getItemType(data.id);
			equipInfo.name = ItemCfgData.getItemName(data.id);
			equipInfo.expireTime = data.expireTime ? data.expireTime.toNumber() : 0;
			equipInfo.evaluate = equipment.evaluate;
			equipInfo.quality = equipment.quality;
			equipInfo.base_stat = equipment.baseStat;
			equipInfo.random_stat = equipment.randomStat;
			equipInfo.durability = equipment.durability;
			equipInfo.used_durability = equipment.usedDurability;
			equipInfo.refined_times = equipment.refinedTimes;
			equipInfo.refined_stat = equipment.refinedStat;
			equipInfo.build_signature = equipment.buildSignature;
			equipInfo.fighting_amount = equipment.fightingAmount.toNumber();
			equipInfo.general_taoz_id = equipment.generalTaozId;
			equipInfo.can_general_taoz = equipment.canGeneralChange;
			equipInfo.general_quality = equipment.generalQuality;
			return equipInfo;
		}

		/**
		 * 创建一个坐骑兽牌
		 * @param data
		 * @return 
		 * 
		 */		
		public static function createMountInfoData( data:GoodsProto ):MountBeastCardInfo
		{
			if( data.mount == null )
				return null;
			var mountBreastCardInfo:MountBeastCardInfo = new MountBeastCardInfo();
			var mountProto:MountProto = data.mount;
			mountBreastCardInfo.count = data.count;
			mountBreastCardInfo.cfgId = data.id;
			mountBreastCardInfo.type = ItemCfgData.getItemType(data.id);
			mountBreastCardInfo.name = ItemCfgData.getItemName(data.id);
			mountBreastCardInfo.expireTime = data.expireTime ? data.expireTime.toNumber() : 0;
			mountBreastCardInfo.setMountBreastCardInfo( mountProto );
			return mountBreastCardInfo;
		}
		public static function createSocietyBuildMoneyItemInfo() : ItemInfo
		{
			var itemInfo : ItemInfo = new ItemInfo();
			itemInfo.name = LanguageConfig.getText(LangSociety.SOCIETY_BUILD_MONEY_ITEM_NAME);
			itemInfo.desc = LanguageConfig.getText(LangSociety.SOCIETY_BUILD_MONEY_ITEM_DESC);
			itemInfo.quality = Quality.YELLOW;
			itemInfo.icoName = "yinzi";
			return itemInfo;
		}

		public static function createItemInfo(cfgId : int, expireTime : Number, count : int) : ItemInfo
		{
			var itemInfo : ItemInfo;
			itemInfo = new ItemInfo(cfgId, ItemCfgData.getItemType(cfgId));
			itemInfo.cfgId = cfgId;
			itemInfo.name = ItemCfgData.getItemName(cfgId);
			itemInfo.expireTime = expireTime;
			itemInfo.count = count;
			return itemInfo;
		}

		/**
		 * 礼包数据转换成vo
		 * @param prizeProto
		 */
		public static function creatPrizeProtoVo(prizeProto : PrizeProto) : PrizeInfo
		{
			return ProtoParseToInfo.decodePrizeProto(prizeProto);
		}

		/**
		 * 转换商城tab下的数据
		 * @param tabList
		 */
		public static function converToShopTabVos(tabList : Array, shopId : int) : Array
		{
			var list : Array = [];
//			var len:int = tabList.length;
//			var index:int = 0;
//			var shopTabProto:ShopTabProto;
//			while(index < len)
//			{
//				var shopTabVo:ShopTabVo = new ShopTabVo();
//				shopTabProto = tabList[index];
//				shopTabVo.name = BytesUtil.bytes2UTF(shopTabProto.name);
//				shopTabVo.index = shopTabProto.index;
//				shopTabVo.list = convertToItemVoList(shopTabProto.goodsList, index,shopId);
//				list.push(shopTabVo);
//				index++;
//			}
			return list;
		}

		/**
		 * 当前分页下的商品数据
		 * @param dataList
		 */
		private static function convertToItemVoList(dataList : Array, tabIndex : int, shopId : int) : Array
		{
			var goodList : Array = [];
//			var len:int = dataList.length;
//			var index:int = 0;
//			var shopItemInfo:ShopItemInfo;
//			var shopGoodsProto:ShopGoodsProto;
//			while(index < len)
//			{
//				shopGoodsProto = dataList[index];
//				shopItemInfo = new ShopItemInfo();
//				shopItemInfo.goodsIndex = index;
//				shopItemInfo.tabIndex = tabIndex;
//				shopItemInfo.shopId = shopId;
//				shopItemInfo.itemInfo = wrapperProtoToItemInfo(shopGoodsProto.goodsWrapper);
//				if(shopGoodsProto.hasPriceType) shopItemInfo.priceType = shopGoodsProto.priceType;
//				if(shopGoodsProto.hasPrice)
//				{
//					shopItemInfo.price = shopGoodsProto.price;
//					//fly 注释，这里不确定是什么售价，如果是物品的静态售价，那就从itemcfgdata里取
////					shopItemInfo.price = shopGoodsProto.price;
//				}
//				if(shopGoodsProto.hasStartTime)shopItemInfo.startTime = shopGoodsProto.startTime.toNumber();
//				if(shopGoodsProto.hasEndTime)shopItemInfo.endTime = shopGoodsProto.endTime.toNumber();
//				if(shopGoodsProto.hasPromotion)shopItemInfo.promotion = shopGoodsProto.promotion;
//				if(shopGoodsProto.hasShowPrice)shopItemInfo.showPrice = shopGoodsProto.showPrice;
//				if(shopGoodsProto.hasDesc)shopItemInfo.goodsDesc = shopGoodsProto.desc;
//				
//				goodList.push(shopItemInfo);
//				ShopCfgData.addShopItemInfo(shopItemInfo);
//				index++;
//			}
			return goodList;
		}


		public static function getPrizeInfoDescript(prizeInfo : PrizeInfo) : String
		{
			var str : String = getPrizeInfoDescriptArr(prizeInfo).join(";");
			return str;
		}

		public static function getPrizeInfoDescriptArr(prizeInfo : PrizeInfo) : Array
		{
			var arr : Array = [];
			if (prizeInfo.moneyAmount.hasSomeType(AmountType.EXP))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.EXP) + prizeInfo.moneyAmount.getAmountByType(AmountType.EXP));
			}

			if (prizeInfo.moneyAmount.hasSomeType(AmountType.MONEY))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.MONEY) + prizeInfo.moneyAmount.getAmountByType(AmountType.MONEY));
			}

			if (prizeInfo.moneyAmount.hasSomeType(AmountType.BAND_JINZI))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.BAND_JINZI) + prizeInfo.moneyAmount.getAmountByType(AmountType.BAND_JINZI));
			}

			if (prizeInfo.moneyAmount.hasSomeType(AmountType.BAND_MONEY))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.BAND_MONEY) + prizeInfo.moneyAmount.getAmountByType(AmountType.BAND_MONEY));
			}

			if (prizeInfo.moneyAmount.hasSomeType(AmountType.GONGXUN))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.GONGXUN) + prizeInfo.moneyAmount.getAmountByType(AmountType.GONGXUN));
			}

			if (prizeInfo.moneyAmount.hasSomeType(AmountType.JINZI))
			{
				arr.push(ShopType.getMoneyStrByType(AmountType.JINZI) + prizeInfo.moneyAmount.getAmountByType(AmountType.JINZI));
			}

			if (prizeInfo.itemInfoList.length)
			{
				for each (var itemInfo : ItemInfo in prizeInfo.itemInfoList)
				{
					var color : int = ItemQualityType.getColorValue(ItemCfgData.getItemQuality(itemInfo.cfgId));
					arr.push(TextFormatUtil.getColorText(itemInfo.name + "*" + itemInfo.count, color));
				}
			}
			return arr;
		}

		/**
		 *容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 *
		 */
		public static function writeContainerToBytes(bytes : ByteBuffer, containerId : int, index : int = 0) : void
		{
			//如果是坐骑装备，other就是槽位，如果是Storage,other就是 NpcId
			if (containerId == ContainerType.MOUNT_EQUIPMENT || containerId == ContainerType.STORAGE)
				bytes.writeVarint32((index << 8) | containerId);
			else
				bytes.writeVarint32(containerId);
		}

		/**
		 * 容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * @param bytes
		 *
		 */
		public static function readContainerBytes(bytes : ByteBuffer) : ContainerData
		{
			var container : ContainerData = new ContainerData();
			container.readBytes(bytes);
			return container;
		}
	}
}
