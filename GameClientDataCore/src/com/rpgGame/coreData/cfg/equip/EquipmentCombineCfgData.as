package com.rpgGame.coreData.cfg.equip
{
	import com.rpgGame.coreData.info.item.EquipInfo;
	
	import app.message.EquipmentCombineCostDataProto;
	import app.message.EquipmentCombineDatasProto;
	import app.message.EquipmentCombineRateDataProto;
	import app.message.EquipmentQualityEvaluateRateDataProto;

	public class EquipmentCombineCfgData
	{
		public function EquipmentCombineCfgData()
		{
		}
		/**
		 * 中间装备跟四周的装备的等级段差,中间装备EquipmentDataProto.level_stage - 
		 * 四周装备EquipmentDataProto.level_stage > 该值，不允许放上去
		 */		
		public static var combineLevelStageGap : int ;
		/**
		 * // 合成装备需要四周放几间装备
		 */		
		public static var combineNeedEquipCount : int ;
		private static var costDatas : Array;
		private static var combineRateDatas : Array;
		private static var combinePoint: Array;
		private static var centerEquipPointMultiple : int;
		public static function setConfig(cfg:EquipmentCombineDatasProto):void
		{
			combineLevelStageGap = cfg.combineLevelStageGap;
			combineNeedEquipCount = cfg.combineNeedEquipCount;
			centerEquipPointMultiple = cfg.centerEquipPointMultiple;
			combinePoint = cfg.pointData.points;
			combineRateDatas = cfg.rateDatas.datas;
			costDatas = cfg.costDatas.datas;
		}
		
//		public static function getRateData
		
		public static function getRateDataByEquip(equip:EquipInfo):EquipmentCombineCostDataProto 
		{
			var proto : EquipmentCombineCostDataProto;
			for each (proto in costDatas)
			{
				if(proto.levelStage == equip.levelStage && proto.quality ==  equip.quality)
					return proto;
			}
			return null;
		}
		
		public static function getRefleshRateByEquip(equip:EquipInfo):int
		{
			if(!equip)
				return 0;
			var result : int = 0;
			var rate : EquipmentQualityEvaluateRateDataProto;
		 	var combineData : EquipmentCombineRateDataProto;
			var point : int = combinePoint[equip.evaluate] * centerEquipPointMultiple;
			for each(combineData in combineRateDatas)
			{
				if(combineData.quality != equip.quality || combineData.pointLower>point || combineData.pointUpper<point)
					continue;
				for each(rate in combineData.rateDatas)
				{
					if(rate.quality == equip.quality)
						result += rate.rate;
				}
			}
			return result;
		}
	}
}