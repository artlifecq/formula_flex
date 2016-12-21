package com.rpgGame.app.manager.time
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.sender.MiscSender;
	import com.rpgGame.netData.login.message.ResHeartMessage;
	
	import flash.utils.getTimer;
	
	public class SystemTimeManager
	{
		
		//------------------------------------------------------寻秦记服务器系统时间同步方法------------------------------------------------------
		/** 当日结束时间戳		 */		
		private static var todayOverTime:Number = 0;   //第2天的开始时间
		private static var _serverTimeCheck:int = 0;//上一次服务器的启动时间
		private static var _clientTimeCheck:int = 0;//从上一次同步服务器时间，到再一次请求同步服务器时间，客户端这里总共过去了多长时间
		private static var _clientTimePass:Number = 0;//
		// 服务器时间毫秒
		private static var _serverTime:Number;
		private static var _gTimer:GameTimer;
		/**
		 * 心跳信息 
		 * @param event
		 * 
		 */
		public static function reqServerTimeAndHeart():void
		{
			/*var time:Number;
			
			if (_serverTimeCheck != 0)
			{
				time = _serverTimeCheck + _clientTimeCheck;
			}*/
			MiscSender.reqHeartAndServerTime(getTimer());
			
			if(!_gTimer)
			{
				_gTimer = new GameTimer("SystemTimeManager",10000,0,onTmTick);
				_gTimer.start();
			}
		}
		
		private static function onTmTick(/*inv:uint*/):void
		{
			_clientTimeCheck = (new Date()).getTime() - _clientTimePass;
			
			var time:Number;
			
			if (_serverTimeCheck != 0)
			{
				time = _serverTimeCheck + _clientTimeCheck;
			}
			MiscSender.reqHeartAndServerTime(time);
		}
		
		public static function RecvHeartMessage(msg:ResHeartMessage):void
		{
			_serverTime = msg.time*1000 - getTimer();//服务器当前时间的秒数，从1970年到现在的时间差
			
			if(todayOverTime == 0)
			{
				SetNextDayTime( msg.time * 1000);
			}else if(msg.time * 1000 >= todayOverTime)
			{
				CheckTodayIsOver();
			}
			
			var needReset:Boolean = ( msg.reset == 1 || ( msg.reset == 0 && msg.time2 >= serverTimeCheck ) )
			if (msg.time2 != 0 && needReset )
			{
				_serverTimeCheck = msg.time2;//当前服务器启动多长时间  --- 毫秒
				_clientTimeCheck = 1;

				_clientTimePass = ( new Date() ).getTime();
			}
		}
		
		public static function get serverTimeCheck():int
		{
			var ret:int = 0;
			if ( _serverTimeCheck != 0 )
				ret = _serverTimeCheck + _clientTimeCheck;
			return ret;
		}
		
		private static function CheckTodayIsOver():void
		{
			if(_serverTime >= todayOverTime)
			{
				SetNextDayTime(_serverTime);
//				dispatchEvent( new LoginEvent( LoginEvent.START_NEW_DAY ));
			}
		}
		
		private static function SetNextDayTime(time:int):void
		{
			var date:Date = new Date(time);
			date = new Date( date.fullYear , date.month , date.date + 1 , 0, 0 ,0 ,0);
			todayOverTime = int(date.time);
		}
		
		/** 服务器时间（毫秒）*/
		public static function get curtTm():Number
		{
			return _serverTime + getTimer();
		}
		
		public static function get sysDateTimeStr():String
		{
			return sysDateTime.toString().replace("GMT+0800","");
		}
		
		private static var _date:Date;
		public static function get sysDateTime():Date
		{
			if(!_date)
			{
				_date = new Date();
			}
			_date.time = curtTm;
			return _date;
		}
	}
}