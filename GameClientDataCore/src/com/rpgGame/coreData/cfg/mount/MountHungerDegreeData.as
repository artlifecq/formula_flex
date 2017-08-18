package com.rpgGame.coreData.cfg.mount
{
	/**
	 * 坐骑饥饿度导致移动速度变化 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountHungerDegreeData
	{
		/** 最大饥饿度 **/
		public var max_hunger_degree:int;
		/** 小于等于该饥饿度,速度要乘以该百分比 **/
		public var speed_percent:int;
		
		public function MountHungerDegreeData()
		{
			
		}
		
		/**
		 * 设置坐骑饥饿度导致移动速度变化的数据 
		 * @param data
		 * 
		 */		
//		public function setData( data:MountHungerDegreeDataProto ):void
//		{
//			if( data == null )
//				return;
//			
//			max_hunger_degree = data.maxHungerDegree;
//			speed_percent = data.speedPercent;
//		}
	}
}