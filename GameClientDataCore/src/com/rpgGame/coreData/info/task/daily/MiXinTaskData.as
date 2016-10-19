package com.rpgGame.coreData.info.task.daily
{
	import app.message.MiXinTaskProto;

	/**
	 * 密信 
	 * @author 陈鹉光
	 * 
	 */	
	public class MiXinTaskData
	{
		/** 接取密信时的等级**/
		public var level:int;
		/** 这是接的第几次的任务**/
		public var acceptTimes:int;
		/** 密信品质**/
		public var quality:int = -1;
		/** 下次能够刷新密信的时间 **/
		public var nextRandomMiXinTime:Number = 0;
		/** 是否交换了密信 **/
		public var isSubmit:Boolean;
		/** 是否在密信活动期间接的任务 **/
		public var isInMiXinActivityTime:Boolean;
		
		public function MiXinTaskData()
		{
			
		}
		
		/**
		 * 设置密信任务数据 
		 * @param miXinProto
		 * 
		 */		
		public function setData( miXinProto:MiXinTaskProto ):void
		{
			acceptTimes = miXinProto.acceptTimes;
			level = miXinProto.level;
			quality = miXinProto.hasQuality ? miXinProto.quality : -1;
			isSubmit = quality >= 0;
			if( miXinProto.nextRandomMiXinTime != null )
				nextRandomMiXinTime = miXinProto.nextRandomMiXinTime.toNumber();
			isInMiXinActivityTime = miXinProto.isInMiXin;
		}
	}
}