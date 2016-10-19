package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.info.item.ItemInfo;
	
	import app.message.CombineDataProto;
	import app.message.CombineDatasProto;
	import app.message.UpgradeProto.UpgradeGoodsInfoProto;

	public class CombineCfgData
	{
		public function CombineCfgData()
		{
		}

		private static var _datas:Array;

		public static function setConfig(cfg:CombineDatasProto):void
		{
			_datas=cfg.datas;
		}

		/**
		 * [itemInfo]
		 */
		public static function getCombineDataProtoByCost(item:ItemInfo,minCount : int):CombineDataProto
		{
			if (!item || !_datas)
				return null;
			var i:int=0;
			var len:int=_datas.length;
			var combine:CombineDataProto;
			for (; i < len; i++)
			{
				combine=_datas[i];
				if (!combine)
					continue;
				if (checkUpgradeItems(item, combine,minCount))
					return combine;
			}
			return null;
		}

		private static function checkUpgradeItems(items:ItemInfo, combine:CombineDataProto,minCount:int):Boolean
		{
			var i:int=0;
			var goods:Array=combine.upgradeData.goodsInfo;
			if (!items || !goods)
				return false;
			var j:int=0;
			var goodsLen:int=goods.length;
			var upgradeGoodsInfo:UpgradeGoodsInfoProto;
			for (; j < goodsLen; j++)
			{
				upgradeGoodsInfo=goods[j];
				if (items.cfgId == upgradeGoodsInfo.upgradeGoods 
					&& items.count >= upgradeGoodsInfo.upgradeGoodsCount 
					&& minCount == upgradeGoodsInfo.upgradeGoodsCount)
					return true;
			}
			return false;
		}
	}
}
