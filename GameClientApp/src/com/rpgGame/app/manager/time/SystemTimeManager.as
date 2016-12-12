package com.rpgGame.app.manager.time
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.sender.MiscSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.SystemEvent;
	
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	public class SystemTimeManager
	{
		/**一天的毫秒数*/
		public static const ONE_DAY_TIME:Number = 1000*60*60*24;
		private static var _date:Date;
		
		/** 开服时间 (毫秒)*/
		public static var startServiceTm:Number = 0;
		/**连服时间，单位秒*/
		public static var serviceConnectedTime:int;
		
		private static const DISPATCH_GAP_TM:Number = 1000;
		
		private static var _timeOffset:int;
		
		private static var _receiveTm:Number = 0;
		private static var _serverTm:Number = 0;
		private static var _firstServerTm:Number = 0;//第一次获取的服务器时间。
		private static var _repeatCnt:uint = 0;
		
		private static var _syncCount:uint =0;//同步次数；
		
		private static var _lastDispatchTm:Number = 0;
		
		//		private static var txt:TextField;
		
		private static var _gTimer:GameTimer;
		
		setup();
		private static function setup():void
		{
			//			Tick.addCallback(onTmTick);
			//
			//			txt = new TextField();
			//			txt.cacheAsBitmap = true;
			//			LayerManager.stage.addChild(txt);
			//			txt.textColor = 0x00ff00;
			//			txt.x = 20;
			//			txt.y = 10;
			
			if(!_gTimer)
			{
				_gTimer = new GameTimer("SystemTimeManager",1000,0,onTmTick);
				_gTimer.start();
			}
		}
		
		private static function onTmTick(/*inv:uint*/):void
		{
			//			var tm:Number = curtTm;
			//			if(_firstServerTm)
			//			{
			//				var cnt:int = ((curtTm - _firstServerTm)-_repeatCnt*DISPATCH_GAP_TM)/DISPATCH_GAP_TM;
			//				for(var i:uint=0;i<cnt;i++)
			//				{
			//					_repeatCnt++;
			//					_lastDispatchTm = tm;
			//					EventManager.dispatchEvent(SystemEvent.SYS_TIME,curtTm);
			//				}
			//			}
			//			EventManager.dispatchEvent(SystemEvent.SYS_TIME,curtTm);
		}
		
		public static function get eventsCnt():uint
		{
			return EventManager.getTypeEventsNum(SystemEvent.SYS_TIME);
		}
		
		public static function get sysDateTimeStr():String
		{
			return sysDateTime.toString().replace("GMT+0800","");
		}
		
		public static function get sysDateTime():Date
		{
			if(!_date)
			{
				_date = new Date();
			}
			_date.time = curtTm;
			return _date;
		}
		
		//		/**
		//		 * 处理过后 ,做为当前服务器时间
		//		 * @return 
		//		 * 
		//		 */
		//		public static function get curtTm():Number
		//		{
		//			return _serverTm + getTimer() - _receiveTm;
		//		}
		//		
		//		private static function syncSystemTm():void
		//		{
		//			TweenLite.delayedCall(2,MiscSender.reqServerTime);
		//		}
		//		
		//		/**
		//		 * 仅可被 MiscCmdListener 调用 
		//		 * @param _serverTmime
		//		 */
		//		public static function setServerTime($serverTmime:Number):void
		//		{
		//			_firstServerTm = _firstServerTm || $serverTmime;
		//			_receiveTm = getTimer();
		//			_serverTm = $serverTmime;
		//			syncSystemTm();
		//		}
		
		/**
		 * 是否已连服
		 * @return 
		 */
		public static function get isServiceConnected():Boolean
		{
			return (curtTm/1000 - serviceConnectedTime) > 0;
		}
		
		//------------------------------------------------------风云服务器系统时间同步方法------------------------------------------------------
		private static var reqT:Number = 0;
		private static var recT:Number = 0;
		private static var serverT:Number = 0;
		private static var deltaT:Number = 0;//服务器时间与游戏运行时间的差
		private static var dT:Number = Number.MAX_VALUE;//一次请求到接收消息的最短时间，即延迟最小时的消息往返时间
		
		private static var _syncCountI:uint =0;//同步次数；
		
		public static function startTimeSync():void
		{
			reqServerTime();//第一次同步
		}
		
		public static function reqServerTime():void
		{
			reqT = getTimer();
			MiscSender.reqServerTime();
		}
		
		
		/**
		 * 每次同步，先销毁原来的计时器，并创建一个新计时器 
		 * @return 
		 * 
		 */
		private static function startNewTimer():void
		{
			if(_syncCountI < 9)
			{
				//前十次，延迟短时间再次请求，间隔依次增加 
				//				_curTimer = new GameTimer("SystemTimeManager",2*(_syncCountI+1)*1000,1,null,reqServerTime);
				TweenLite.delayedCall(2*(_syncCountI+1),reqServerTime);
			}
			else
			{
				//延迟2分钟再次请求
				//				_curTimer = new GameTimer("SystemTimeManager",120*1000,1,null,reqServerTime);
				TweenLite.delayedCall(120,reqServerTime);
			}
		}
		
		/**
		 * 是否至少有过一次同步 
		 * @return 
		 * 
		 */
		public static function hadSynced():Boolean
		{
			if(_syncCountI == 0)
			{
				trace("ServerTime还未同步！");
			}
			return _syncCountI >0;
		}
		
		/**
		 * 仅可被 MiscModule 调用 
		 * @param serverTime
		 * 
		 */
		public static function setServerTime(serverTime:Number):void
		{
			_firstServerTm = _firstServerTm || serverTime;
			
			recT = getTimer();
			serverT = serverTime;
			var d :Number = recT - reqT;
			if(dT > d)
			{
				dT = d;
				deltaT = Math.floor(serverT - (recT +reqT) * 0.5);
			}
			startNewTimer();
			_syncCountI ++;
			if(_syncCountI > 10)
			{
				dT += 5;//10次矫正后，每次矫正把原有的最短时间加5ms，以保证新的数据有较高权重，老的数据在几次矫正后，必然将被弃用
			}
		}
		
		/**
		 * 处理过后 ,做为当前服务器时间
		 */
		public static function get curtTm():Number
		{
			var tm:Number = getTimer() + deltaT + _timeOffset;
			return tm;
		}
		
		public static function setTimeOffset(value:int):void
		{
			_timeOffset = value;
		}
		/**
		 *网络延时 
		 * @return 
		 * 
		 */		
		public static function getDT():int
		{
			return dT;
		}
		
		/**
		 * 去除一个差值过后的服务器时间
		 */
		public static function getTm(startTm:Number):Number
		{
			var tm:Number = getTimer() + deltaT;
			return tm;
		}
		
		/**
		 * 是否是开服首日 
		 */		
		public static function isOpenSeverFirstDay():Boolean
		{
			return TimeUtil.getDay(curtTm) == TimeUtil.getDay(startServiceTm);
		}
		
		/**
		 * 获取今天的开始时间，自 1970 年 1 月 1 日午夜以来的毫秒
		 * @return 
		 * 
		 */
		public static function getStartTimeToday():Number
		{
			var date:Date = new Date();
			date.setTime(curtTm);
			date.setHours(0,0,0,0);
			return date.time;
		}
		
	}
}