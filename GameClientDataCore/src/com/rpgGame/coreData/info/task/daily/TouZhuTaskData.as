package com.rpgGame.coreData.info.task.daily
{
	
	
	/**
	 * 偷猪
	 * @author luguozheng
	 * 
	 */	
	public class TouZhuTaskData
	{
		/** 偷到的猪的id[怪物id]，为0表示没偷到**/
		public var zhuId:int = 0;
		/** 任务失败时间戳，用于客户端任务倒计时 **/
		public var failTime:Number = 0;
		
		public function TouZhuTaskData()
		{
		}
		
		
//		public function setData( taskProto:TouZhuTaskProto):void
//		{
//			zhuId = taskProto.zhuId;
//			
//			if( taskProto.failTime != null )
//				failTime = taskProto.failTime.toNumber();
//		}
		
	}
}