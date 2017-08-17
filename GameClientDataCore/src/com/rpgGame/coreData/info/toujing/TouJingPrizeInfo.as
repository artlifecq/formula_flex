package com.rpgGame.coreData.info.toujing
{
	import com.rpgGame.coreData.info.task.PrizeInfo;
	
	/**
	 * 偷经任务奖励 
	 * @author 陈鹉光
	 * 
	 */	
	public class TouJingPrizeInfo extends PrizeInfo
	{
		/**等级，玩家等级>=该等级时，显示该奖励，客户端要按照该等级从大往小排序  **/		
		public var level:int;
		/**基础经验奖励**/
		public var baseExp:int;
		/**没在夺经期间，经验加成倍率，数组长度跟品质的数量一样多 **/		
		public var normalExpMulitple:Array = [];
		/**在夺经期间，经验加成倍率，数组长度跟品质的数量一样多 **/		
		public var duoJingExpMulitple:Array = [];
		
		public function TouJingPrizeInfo()
		{
		}
		
		/**
		 * 设置偷经奖励数据 
		 * @param data
		 * 
		 */		
//		public function setTouJingPrizeInfo( data:TouJingPrizeProto ):void
//		{
//			if( data == null )
//				return;
//			
//			level = data.level;
//			baseExp = data.baseExp;
//			normalExpMulitple  = data.normalExpMulitple;
//			duoJingExpMulitple = data.duoJingExpMulitple;
//			createPrizeItemInfo( data.goods );
//		}
	}
}