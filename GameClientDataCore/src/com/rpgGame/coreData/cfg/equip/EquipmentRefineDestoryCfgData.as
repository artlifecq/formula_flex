package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.info.equip.EquipmentDestoryInfo;
	import com.rpgGame.coreData.info.equip.EquipmentDestoryItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
	import app.message.EquipmentDestroyDatasProto;
	import app.message.EquipmentDestroyPrizeDataProto;
	import app.message.EquipmentLevelStageQualityEvaluateDestoryDataProto;
	import app.message.EquipmentRefineDestoryDataProto;

	public class EquipmentRefineDestoryCfgData
	{
		public function EquipmentRefineDestoryCfgData()
		{
		}
		/**
		 *等级段/品质/评价拆解数据 EquipmentLevelStageQualityEvaluateDestoryDatasProto 
		 */		
		private static var destoryDatas : Array;
		
		private static var refineDestoryDatas : Array;
		
		public static function setConfig(cfg:EquipmentDestroyDatasProto):void
		{
			destoryDatas = cfg.destroyDatas.datas;
			refineDestoryDatas = cfg.refineDestroyDatas.datas;
		}
		
		/**
		 * 通过一个装备获得他的拆解能获得的材料和消耗 
		 * @param equip
		 * @return 
		 * 
		 */		
		public static function getEquipmentDestoryItemInfos(equip:EquipInfo):EquipmentDestoryInfo
		{
			if(!equip)
				return null;
			var refineDestoryData : EquipmentRefineDestoryDataProto = getRefineDestoryProto(equip);
			var destoryData : EquipmentLevelStageQualityEvaluateDestoryDataProto = getDestoryProto(equip);
			var equipmentDestoryInfo : EquipmentDestoryInfo;
			var itemInfo : ItemInfo;
			var destoryItemInfo : EquipmentDestoryItemInfo;
			var equipmentDestoryPrize : EquipmentDestroyPrizeDataProto;
			if(refineDestoryData)
			{
				if(!equipmentDestoryInfo)
					equipmentDestoryInfo = new EquipmentDestoryInfo();
				for each ( equipmentDestoryPrize in refineDestoryData.prize)
				{
					if(!equipmentDestoryPrize)
						continue;
					itemInfo = ItemUtil.wrapperProtoToItemInfo(equipmentDestoryPrize.goods);
					if(!itemInfo)
						continue;
					destoryItemInfo = new EquipmentDestoryItemInfo();
					destoryItemInfo.itemInfo = itemInfo;
					destoryItemInfo.lower = equipmentDestoryPrize.lower;
					destoryItemInfo.upper = equipmentDestoryPrize.upper;
					equipmentDestoryInfo.addItem(destoryItemInfo);
				}
				equipmentDestoryInfo.moneyCost+=refineDestoryData.moneyCost;
			}
			if(destoryData)
			{
				if(!equipmentDestoryInfo)
					equipmentDestoryInfo = new EquipmentDestoryInfo();
				for each ( equipmentDestoryPrize in destoryData.prize)
				{
					if(!equipmentDestoryPrize)
						continue;
					itemInfo = ItemUtil.wrapperProtoToItemInfo(equipmentDestoryPrize.goods);
					if(!itemInfo)
						continue;
					destoryItemInfo = new EquipmentDestoryItemInfo();
					destoryItemInfo.itemInfo = itemInfo;
					destoryItemInfo.lower = equipmentDestoryPrize.lower;
					destoryItemInfo.upper = equipmentDestoryPrize.upper;
					equipmentDestoryInfo.addItem(destoryItemInfo);
				}
				equipmentDestoryInfo.moneyCost += destoryData.moneyCost;
			}
			return equipmentDestoryInfo;
		}
		
		private static function getRefineDestoryProto(equip:EquipInfo):EquipmentRefineDestoryDataProto
		{
			if(!equip || equip.refined_times == 0)
				return null;
			var destoryData : EquipmentRefineDestoryDataProto;
			
			for each (destoryData in refineDestoryDatas)
			{
				if(!destoryData)
					continue;
				//验证强化等级
				if(equip.refined_times == destoryData.refineTimes)
					return destoryData;
			}
			return null;
		}
		
		private static function getDestoryProto(equip:EquipInfo):EquipmentLevelStageQualityEvaluateDestoryDataProto
		{
			if(!equip)
				return null;
			var destoryData : EquipmentLevelStageQualityEvaluateDestoryDataProto;
			for each (destoryData in destoryDatas)
			{
				if(!destoryData)
					continue;
				//验证等级段，品质，评价是否一致
				if(equip.levelStage == destoryData.levelStage &&equip.quality == destoryData.quality &&equip.evaluate == destoryData.evaluate)
					return destoryData;
			}
			return null;
		}
	}
}