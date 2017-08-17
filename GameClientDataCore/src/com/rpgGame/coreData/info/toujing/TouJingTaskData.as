package com.rpgGame.coreData.info.toujing
{
	

	/**
	 * 偷经任务data 
	 * @author 陈鹉光
	 * 
	 */	
	public class TouJingTaskData
	{
		/** 接取经书时的等级 **/
		public var level:int;
		/** 经书品质 -1表示无经书 【5：灰色品质，是特殊品质，灰色经书】**/
		public var quality:int = -1;
		/** 是否偷到了经书，导致我们国家经书数量+1了 **/
		public var isTouSuccess:Boolean;
		/** 在哪个国家偷的 **/
		public var countryID:int;
		/** 是否在偷经活动期间领取的任务 **/
		public var isInTouJingActivityTime:Boolean;

		public function TouJingTaskData()
		{
		}
		
		/**
		 * 设置偷经任务数据 
		 * @param touJingTask
		 * 
		 */		
//		public function setData( touJingTask:TouJingTaskProto ):void
//		{
//			if( touJingTask == null )
//				return;
//			
//			level = touJingTask.level;
//			quality = touJingTask.quality;
//			isTouSuccess = touJingTask.isTouSuccess;
//			countryID = touJingTask.countrySequence;
//			isInTouJingActivityTime = touJingTask.isInTouJing;
//		}
	}
}