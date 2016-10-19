package com.rpgGame.coreData.cfg.mount
{
	
	
	/**
	 * 坐骑强化  单元数据
	 * @author 陈鹉光
	 * 
	 */	
	public class MountRefineData
	{
		/** 强化的id **/
		public var id:int;
		/** 银两消耗 **/
		public var moneyCost:int;
		/** 坐骑当前的根骨 **/
		public var curVitality:int;
		/** 需要放上去的坐骑的根骨 **/
		public var targetVitality:int;
		/** 成功几率 **/
		public var successRate:int;
		
		public function MountRefineData()
		{
		}
		
		/**
		 * 设置强化数据 
		 * @param data
		 * 
		 */		
//		public function setData( data:MountRefineDataProto ):void
//		{
//			if( data == null )
//				return;
//			
//			id = data.id;
//			moneyCost = data.moneyCost;
//			curVitality = data.curVitality;
//			targetVitality = data.targetVitality;
//			successRate = data.successRate / 100;
//		}
	}
}