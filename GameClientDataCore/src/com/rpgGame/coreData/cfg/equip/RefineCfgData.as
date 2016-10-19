package com.rpgGame.coreData.cfg.equip
{
	import app.message.EquipmentRefineCostDataProto;
	import app.message.EquipmentRefineDatasProto;
	import app.message.UpgradeProto.UpgradeGoodsInfoProto;

	public class RefineCfgData
	{
		public function RefineCfgData()
		{
		}
		
//		private static var _map : HashMap;
		private static var _datas : Array;
		
		public static function setConfig(config : EquipmentRefineDatasProto):void
		{
//			_datas = new HashMap();
//			var cost : Array = config.costDatas.datas;
//			var costData : EquipmentRefineCostDataProto;
//			for each(costData in cost)
//			{
//				_map.add(costData.id,costData);
//			}
			_datas = config.costDatas.datas;
		}
		/**
		 * 
		 * @param refineTimes
		 * @param itemid
		 * @param count
		 * @return 
		 * 
		 */		
		public static function getCostDataByRefineAndItem(refineTimes:int,itemid:int,count:int):EquipmentRefineCostDataProto
		{
			var costData : EquipmentRefineCostDataProto;
			var goods : Array;
			var goodsInfo : UpgradeGoodsInfoProto;
			var costs : Array;
			var i : int = 0 ; 
			var len : int = _datas.length;
			for(;i<len;i++)//costData in _datas)
			{
				costData = _datas[i];
				if(!costData)
					continue;
				if(costData.refineTimes != refineTimes)
					continue;
				if(!costData.upgradeData)
					continue;
				goods = costData.upgradeData.goodsInfo;
				goodsInfo = goods[0];
				if(!goodsInfo)
					continue;
				if(goodsInfo.upgradeGoods == itemid && goodsInfo.upgradeGoodsCount == count)
					return costData;
			}
			return null;
		}
		
	}
}