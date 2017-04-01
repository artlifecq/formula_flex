package com.rpgGame.coreData.info.stat
{
	
	
	public class StatData
	{
		public var type:int = -1;
		public var percent:int = 0;
		public var value:Number = 0;
		
		//		public function StatData()
		//		{
		//		}
		//		
		//		public function setSingle(single:SingleStatProto):void
		//		{
		//			if( single == null )
		//				return;
		//			
		//			type = single.statType;
		//			percent = single.percent;
		//			
		//			if( single.value != null )
		//				value = single.value.toNumber();
		//			else
		//				value = 0;
		//		}
		/**
		 * 是否是有效属性 
		 * @return 
		 * 
		 */		
		public function hasPercentOrValue():Boolean
		{
			return /*percent != 0 ||*/ value!= 0 ?true:false;
		}
	}
}