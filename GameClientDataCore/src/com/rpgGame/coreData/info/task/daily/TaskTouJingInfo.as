package com.rpgGame.coreData.info.task.daily
{
	import app.message.TouJingTaskProto;

	public class TaskTouJingInfo
	{
		
		/** 经书品质 **/
		public var quality:int = -1;
		/** 经书是否偷到了 **/
		public var isCollect:Boolean;
		/**
		 * 接取经书时的等级 
		 */		
		public var level : int;
		
		public var country : int;
		public function TaskTouJingInfo()
		{
		}
		
		public function setData( touJingTask:TouJingTaskProto ):void
		{
			if( touJingTask == null )
				return;
			
			quality = touJingTask.quality;
			isCollect = touJingTask.isTouSuccess;
			level = touJingTask.level;
			country = touJingTask.countrySequence;
			
		}
	}
}