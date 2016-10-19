package com.rpgGame.core.controller.ui
{
	import utils.TimerServer;
	
	/**
	 * 跑马灯 
	 * @author 
	 * 
	 */	
	public class MarqueeController
	{
		/**间隔数组 结构[[间隔时间,循环次数]]**/
		public var runSpeedArray : Array;
		public var runSpeedIndex : int;
		/**位置数组X**/
		public var posArray_x : Array;
		/**位置数组Y**/
		public var posArray_y : Array;
		/**当前位置**/
		public var posIndex : int = 0;
		/**循环到第几次**/
		public var runIndex : int = 0;
		/**停止位置**/
		public var stopIndex : int = 0;
		/**控制的目标 Sprite**/
		private var target : *;
		/**Function(posIndex)**/
		private var runingComplete : Function;
		/**跑马灯完成回调**/
		private var runComplete:Function;
		
		/**
		 * 跑马灯 
		 * @param speedArray 间隔数组 结构[[间隔时间,循环次数]]
		 * @param posArrayX X位置数组
		 * @param posArrayY Y位置数组
		 * @param runing Function(posIndex)
		 * @param runComplete
		 * 
		 */		
		public function MarqueeController(speedArray : Array,posArrayX:Array, posArrayY:Array, runing:Function=null, runComplete:Function = null)
		{
			this.runSpeedArray = speedArray;
			this.posArray_x = posArrayX;
			this.posArray_y = posArrayY;
			this.runingComplete = runing;
			this.runComplete = runComplete;
		}
		
		/**
		 * 开始跑
		 * @param target 目标
		 * @param stopIndex 跑马灯停止的索引位置
		 * 
		 */		
		public function run(target : *,stopIndex : int):void
		{
			this.target = target;
			posIndex = 0;
			runIndex = 0;
			runSpeedIndex = 0;
			this.stopIndex = stopIndex;
			marqueeRun();
		}
		
		private function marqueeRun():void
		{
			var item : Array;
			item = runSpeedArray[runSpeedIndex];
			if(!item)
			{
				runComplete && runComplete();
				target.x = posArray_x[stopIndex];
				
				if( posArray_y != null && posArray_y.length > 0 )
					target.y = posArray_y[stopIndex];
				return;
			}
			var time : int = item[0] * item[1] * posArray_x.length;//算出需要的毫秒数
			TimerServer.addLoop(runing,item[0],null,time);
		}
		
		/**
		 * 跑马灯停止 
		 * 
		 */		
		public function stop():void
		{
			TimerServer.remove(runing);
		}
		
		private function runing():void
		{
			if(posIndex == posArray_x.length)
			{
				posIndex = 0;
				runIndex++;
				if(runSpeedIndex < runSpeedArray.length && runSpeedArray[runSpeedIndex][1]<=runIndex)
				{
					runIndex = 0;
					marqueeRun();
					runSpeedIndex++;
					return;
				}
			}
			target.x = posArray_x[posIndex];
			if( posArray_y != null && posArray_y.length > 0 )
				target.y = posArray_y[posIndex];
			
			if(runSpeedIndex >= runSpeedArray.length && runIndex >= runSpeedArray[runSpeedArray.length-1][1] && stopIndex == posIndex)
			{
				posIndex++;
				runingComplete && runingComplete(posIndex);
				runComplete && runComplete();
				stop();
				return;
			}
			posIndex++;
			runingComplete && runingComplete(posIndex);
		}
		
	}
}