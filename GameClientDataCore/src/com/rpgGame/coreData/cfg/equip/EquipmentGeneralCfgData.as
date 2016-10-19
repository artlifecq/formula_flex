package com.rpgGame.coreData.cfg.equip
{
	import app.message.EquipmentGeneralChangeDataProto;
	import app.message.EquipmentGeneralDatasProto;
	import app.message.EquipmentGeneralTaozAddStatProto;
	import app.message.EquipmentGeneralTaozDataProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 名将套装部分 
	 * 评价对应的积分部分等之后需要在做 qqqq
	 * @author Mandragora
	 * 
	 */	
	public class EquipmentGeneralCfgData
	{
		public function EquipmentGeneralCfgData()
		{
		}
		/**
		 * 套装 
		 */		
		private static var taozhuangDatas : HashMap;
		/**
		 * 改造 
		 */		
		private static var generalChangeDatas : HashMap;
		
		public static function setConfig(cfg:EquipmentGeneralDatasProto):void
		{
			taozhuangDatas = new HashMap();
			var taoz : EquipmentGeneralTaozDataProto;
			for each (taoz in cfg.taozDatas.datas)
			{
				if(taoz)
					taozhuangDatas.add(taoz.id,taoz);
			}
			
			generalChangeDatas = new HashMap();
			var general : EquipmentGeneralChangeDataProto;
			for each(general in cfg.changeDatas.datas)
			{
				if(general)
					generalChangeDatas.add(general.id,general);
			}
		}
		/**
		 * 获取套装属性 
		 * @param id
		 * @return 
		 * 
		 */		
		public static function getGeneralTaozData(id:int):EquipmentGeneralTaozDataProto
		{
			return taozhuangDatas.getValue(id);
		}
		/**
		 * 获取套装的数量加成属性 
		 * @param data
		 * @return HashMap,如果没有加成属性长度就是0,key是数量,value是对应的属性
		 * 
		 */		
		public static function getGeneralTaozAddSpriteStats(data:EquipmentGeneralTaozDataProto):HashMap
		{
			if(!data)
				return null;
			var result : HashMap = new HashMap();
			var arr : Array = data.taozAddStats;
			var taozAdd : EquipmentGeneralTaozAddStatProto;
			for each(taozAdd in arr)
			{
				if(taozAdd)
					result.add(taozAdd.taozCount,taozAdd.addStat);
			}
			return result;
		}
		/**
		 * 获取最大套装数量 
		 * @param data
		 * @return 
		 * 
		 */		
		public static function getGeneralTaozAddSpriteStatsLenght(data:EquipmentGeneralTaozDataProto):int
		{
			if(!data)
				return 0;
			var arr : Array = data.taozAddStats;
			var taozAdd : EquipmentGeneralTaozAddStatProto;
			var result : int = 0;
			for each(taozAdd in arr)
			{
				if(taozAdd.taozCount > result)
					result = taozAdd.taozCount;
			}
			return result;
		}
		/**
		 * 获得改造属性 
		 * @param levelStage
		 * @return [EquipmentGeneralChangeDataProto]
		 * 
		 */		
		public static function getGeneralChangeData(levelStage : int):Array
		{
			var result : Array = [];
			var arr : Array = generalChangeDatas.getValues();
			var general : EquipmentGeneralChangeDataProto;
			for each(general in arr)
			{
				if(general.levelStage == levelStage)
					result.push(general);
			}
			return result;
		}
	}
}