package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	
	import app.message.StallBuyGoodsDataProto;
	import app.message.StallConfig;
	import app.message.StallMiscProto;
	import app.message.StallTypeDataProto;
	
	import org.client.mainCore.ds.HashMap;

	public class StallCfgData
	{
		public function StallCfgData()
		{
		}
		
		public static var misc : StallMiscProto;
		public static var typeHash : HashMap;
		public static var tax : Number;
		public static var stallBuyGoods : Array;
		public static function setup(data:StallConfig):void
		{
			misc = data.miscData;
			tax = misc.stallTaxPercent/100;
			typeHash = new HashMap();
			stallBuyGoods = data.buyGoodsDatas.datas;
			for each(var stallType : StallTypeDataProto in data.typeDatas.datas)
			{
				typeHash.add(stallType.type,stallType);
			}
		}
		
		public static function getStallBuyGoodsByName(name:String=""):Array
		{
			if(name =="")
				return stallBuyGoods;
			var result : Array = [];
			for each(var proto : StallBuyGoodsDataProto in stallBuyGoods)
			{
				if(proto.name.indexOf(name)!=-1)
					result.push(proto);
			}
			return result;
		}
		
		public static function getStallTypeData(type:int):StallTypeDataProto
		{
			return typeHash?typeHash.getValue(type):null;
		}
		
		public static function getFristStallType():StallTypeDataProto
		{
			var boo : Boolean = typeHash&&typeHash.getValues().length!=0
			return boo?typeHash.getValues()[0]:null;
		}
	}
}