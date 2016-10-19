package com.rpgGame.coreData.cfg.equip
{
	import app.message.EquipmentBuildMaterialProto;
	import app.message.EquipmentBuildProto;
	import app.message.EquipmentBuildRateGroupProto;
	import app.message.EquipmentQualityEvaluateRateDataProto;
	import app.message.Quality;
	
	import org.client.mainCore.utils.ArrayUtil;

	public class EquipMakeCfgData
	{
		public function EquipMakeCfgData()
		{
		}
		private static var buildRateDatas : Array;
		private static var materialProtos : Array;
		private static const quailtyConst : Array = [Quality.BLUE,Quality.YELLOW,Quality.GREEN,Quality.PURPLE];
		public static function setConfig(cfg:EquipmentBuildProto):void
		{
			buildRateDatas = cfg.buildRateDatas;
			materialProtos = cfg.materialProto;
		}
		
		/**
		 * 
		 * @param level
		 * 根据材料等级段获得概率
		 * @return [{rate,quailty}]
		 * 
		 */		
		public static function getRateDatas(level:Array):Array
		{
			var equipMakeGroup : EquipmentBuildRateGroupProto;
			for each(equipMakeGroup in buildRateDatas)
			{
				if(ArrayUtil.arraysAreEqual(equipMakeGroup.level,level))
				{
					return getRealRateDatas(equipMakeGroup.rateDatas);
				}
			}
			return null;
		}
		
		private static function getRealRateDatas(data : Array):Array
		{
			var result : Array = [];
			var len : int = quailtyConst.length;
			var i : int = 0;
			var qualityRate : EquipmentQualityEvaluateRateDataProto;
			var temp : int;
			var tempObj : Object;
			for (;i< len;i++)
			{
				temp = 0;
				for each(qualityRate in data)
				{
					if(qualityRate.quality != quailtyConst[i])
						continue;
					temp += qualityRate.rate;
				}
				tempObj = {rate:temp/100,quality:quailtyConst[i]};
				result.push(tempObj);
			}
			return result;
		}
		
		/**
		 * 
		 * @param equipId
		 * @return EquipmentBuildMaterialProto
		 * 
		 */		
		public static function getMakeEquipMaterial(equipId : int):EquipmentBuildMaterialProto
		{
			var mater : EquipmentBuildMaterialProto;
			for each(mater in materialProtos)
			{
				if(mater.equipId.indexOf(equipId) != -1)
					return mater;
			}
			return null;
		}
	}
}