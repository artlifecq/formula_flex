package com.rpgGame.coreData.info.stall
{
	import com.rpgGame.coreData.cfg.StallCfgData;
	
	import app.message.StallTypeDataProto;

	public class StallTypeData
	{
		public function StallTypeData()
		{
		}
		public var type : int;
		public var leftTime : Number;
		
		public function get stallTypeData():StallTypeDataProto
		{
			return StallCfgData.getStallTypeData(type);
		}
	}
}