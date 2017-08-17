package com.rpgGame.coreData.info.task
{
	

	/**
	 * 密信任务奖励
	 * @author wewell@163.com
	 * 
	 */	
	public class MiXinPrizeInfo extends PrizeInfo
	{
		/**等级，玩家等级>=该等级时，显示该奖励，客户端要按照该等级从大往小排序  **/		
		public var level:int;
		/**基础经验奖励**/
		public var baseExp:int;
		/**没在夺经期间，经验加成倍率，数组长度跟品质的数量一样多 **/		
		public var normalExpMulitple:Array;
		
		public function MiXinPrizeInfo()
		{
			
		}
		
		/**
		 * 设置鸡毛信奖励数据 
		 * @param data
		 * 
		 */		
//		public function converMixinPrizeData(data:MiXinPrizeProto):void
//		{
//			if( data == null )
//				return;
//			
//			level = data.level;
//			baseExp = data.baseExp;
//			normalExpMulitple  = data.normalExpMulitple;
//			createPrizeItemInfo(data.goods);
//		}
	}
}