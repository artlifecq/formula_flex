package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	
	import flash.utils.Dictionary;

	/**
	 * 活动时间解析类，用于解析类似[*][12][w5, w3][10:00, 12:00]的时间格式
	 * @author 康露
	 * 2014年7月7日
	 */
	public class TimeData
	{
		/** 合法的年份 **/
		private var _arrYear:Array = null;
		/** 合法的月份 **/
		private var _arrMonth:Array = null;
		/** 合法的日期 **/
		private var _arrDate:Array = null;
		/** 合法的星期 **/
		private var _arrDay:Array = null;
		/** 合法的时间 **/
		private var _arrTime:Array = null;
		/**
		 * 构造函数，传入需要被解析的时间描述字符串
		 * @param strTime 需要被解析的时间描述字符串，例如[*][12][w5, w3][10:00, 12:00]
		 * @author 康露 2014年7月7日
		 */
		public function TimeData(strTime:String)
		{
			if(!strTime)return;
			// 作弊，为了方便解析偷懒
			strTime = "]" + strTime.replace(/ /g,"") + "[";
			var arrTime:Array = strTime.split("][");
			var strYear:String = arrTime[1];	// 年
			var strMonth:String = arrTime[2];	// 月
			var strDay:String = null;			// 日
			var strDate:String = null;			// 星期
			var str:String = arrTime[3];
			if (str.indexOf("w") == -1)
			{
				strDate = str;
			} else
			{
				strDay = str;
			}
			var strHour:String = arrTime[4];	// 小时:分钟
			parseYear(strYear);
			parseMonth(strMonth);
			parseDate(strDate);
			parseDay(strDay);
			parseTime(strHour);
		}
		
		/** 年份 **/
		private function parseYear(str:String) : void
		{
			if (str.indexOf("*") != -1)
			{// 所有的年份都ok
				return;
			}
			_arrYear = [];
			var arr:Array = str.split("，");
			for (var idx:int=0; idx<arr.length; idx++)
			{
				_arrYear.push(uint(arr[idx]));
			}
			_arrYear.sort();
		}
		
		/** 月份 **/
		private function parseMonth(str:String) : void
		{
			if (str.indexOf("*") != -1)
			{// 所有的月份都ok
				return;
			}
			
			_arrMonth = [];
			var arr:Array = str.split(",");
			for (var idx:int=0; idx<arr.length; idx++)
			{
				_arrMonth.push(uint(arr[idx])-1);
			}
			_arrMonth.sort(Array.NUMERIC);
		}
		
		/** 星期 **/
		private function parseDay(str:String) : void
		{
			if (null==str ||str.indexOf("*") != -1)
			{// 所有的星期都ok
				return;
			}
			
			_arrDay = [];
			str = str.replace(/w/g, "");
			var arr:Array = str.split(",");
			for (var idx:int=0; idx<arr.length; idx++)
			{
				var d:uint = uint(arr[idx])
				_arrDay.push(d==7?0:d);
			}
			_arrDay.sort(Array.NUMERIC);
			
		}
		
		/** 日期 **/
		private function parseDate(str:String) : void
		{
			if (null==str || str.indexOf("*") != -1)
			{// 所有的星期都ok
				return;
			}
			
			_arrDate = [];
			var arr:Array = str.split(",");
			for (var idx:int=0; idx<arr.length; idx++)
			{
				_arrDate.push(uint(arr[idx]));
			}
			_arrDate.sort(Array.NUMERIC);
		}
		
		/** 时间 **/
		private function parseTime(str:String) : void
		{
			if (str.indexOf("*") != -1)
			{// 所有的日期都ok
				return;
			}
			
			_arrTime = [];
			var arr:Array = str.split(",");
			for (var idx:int=0; idx<arr.length; idx++)
			{
				var strTime:String = arr[idx];
				var arrTime:Array = strTime.split(":");
				var time:uint = (uint(arrTime[0])<<16) + uint(arrTime[1]);
				_arrTime.push(time);
			}
			
			_arrTime.sort(Array.NUMERIC);
		}
		
		/**
		 * 获得当前时间段的起点时间
		 * @param lastTime 持续时间长度
		 * @return 返回当前时间段的起点时间
		 * @author 康露 2014年7月7日
		 */
		public function getCurTime(lastTime:uint, curTime:Date=null) : Date
		{
			if (null == curTime)
			{
				curTime = new Date();
				curTime.time = SystemTimeManager.curtTm;
			}
			return curTime;
		}
		
		private function checkMonth(curTime:Date) : Boolean
		{
			if (null == _arrMonth)
				return true;
			for (var idx:int=0; idx<_arrMonth.length; idx++)
			{
				if (curTime.month == _arrMonth[idx])
					return true;
			}
			return false;
		}
		
		private function getTimeWithDate(curTime:Date) : Date
		{
			var curHour:uint = (curTime.hours<<16) + curTime.minutes;
			
			if (null == _arrTime)
				return curTime;
			
			for (var idx:int=0; idx<_arrTime.length; idx++)
			{
				if (_arrTime[idx] >= curHour)
				{
					curTime.hours = _arrTime[idx] >> 16;
					curTime.minutes = _arrTime[idx] & 0xff;
					curTime.seconds = 0;
					curTime.milliseconds = 0;
					return curTime;
				}
			}
			
			return null;
		}
		
		private static var _dicMaxDate:Dictionary = new Dictionary();
		
		private function getMaxDate(curTime:Date) : uint
		{
			var maxDate:uint = _dicMaxDate[(curTime.fullYear<<4) + curTime.month];
			if (0 != maxDate)
				return maxDate;
			
			var date:Date = new Date(curTime.fullYear, curTime.month+1, 1, 0, 0, 0, 0);
			date.time -= 10;
			_dicMaxDate[(curTime.fullYear<<4) + curTime.month] = date.date;
			return date.date;
		}
		
		private function checkDay(curTime:Date) : Boolean
		{
			if (null == _arrDay)
				return true;
			
			for (var idx:int=0; idx<_arrDay.length; idx++)
			{
				if (curTime.day == _arrDay[idx])
					return true;
			}
			return false;
		}
		
		private function getTimeWithMonth(curTime:Date) : Date
		{
			if (!checkMonth(curTime))
				return null;
			
			var idx:int = 0;
			var retTime:Date = null;
			if (null != _arrDate)
			{
				for (idx=0; idx<_arrDate.length; idx++)
				{
					if (_arrDate[idx] < curTime.date)
					{
						cleanHour(curTime);
						continue;
					}
					if (curTime.date != _arrDate[idx])
					{
						cleanHour(curTime);
						curTime.date = _arrDate[idx];
					}
					retTime = getTimeWithDate(curTime);
					if (null != retTime)
						return retTime;
					cleanHour(curTime);
				}
			} else if (null != _arrDay)
			{
				for (idx=curTime.date; idx<=getMaxDate(curTime); idx++)
				{
					curTime.date = idx;
					if (!checkDay(curTime))
					{
						cleanHour(curTime);
						continue;
					}
					retTime = getTimeWithDate(curTime);
					if (null != retTime)
						return retTime;
					cleanHour(curTime);
					
				}
			} else
			{
				for (idx=curTime.date; idx<=getMaxDate(curTime); idx++)
				{
					curTime.date = idx;
					retTime = getTimeWithDate(curTime);
					if (null != retTime)
						return retTime;
					cleanHour(curTime);
				}
			}
			return null;
		}
		
		private function checkYear(curTime:Date) : Boolean
		{
			if (null == _arrYear)
				return true;
			
			for (var idx:int=0; idx<_arrYear.length; idx++)
			{
				if (_arrYear[idx] == curTime.fullYear)
					return true;
			}
			
			return false;
		}
		
		private function getTimeWithYear(curTime:Date) : Date
		{
			if (!checkYear(curTime))
				return null;
			
			var idx:int = 0;
			var retTime:Date = null;
			if (null == _arrMonth)
			{
				for (idx=curTime.month; idx<12; idx++)
				{
					curTime.month = idx;
					retTime = getTimeWithMonth(curTime);
					if (null != retTime)
						return retTime;
					curTime.date = getFirstDate();
					cleanHour(curTime);
				}
			} else
			{
				for (idx=0; idx<_arrMonth.length; idx++)
				{
					if (_arrMonth[idx] < curTime.month)
					{
						curTime.date = getFirstDate();
						cleanHour(curTime);
						continue;
					}
					curTime.month = _arrMonth[idx];
					retTime = getTimeWithMonth(curTime);
					if (null != retTime)
						return retTime;
					curTime.date = getFirstDate();
					cleanHour(curTime);
				}
			}
			return null;
		}
		
		private function getNextYear(curTime:Date) : uint
		{
			var year:uint = curTime.fullYear;
			if (null == _arrYear)
				return year + 1;
			for (var idx:int = 0; idx<_arrYear.length; idx++)
			{
				if (_arrYear[idx] >= year)
					return _arrYear[idx];
			}
			return 0;
		}
		
		private function getFirstMonth() : uint
		{
			if (null == _arrMonth)
				return 0;
			return _arrMonth[0];
		}
		
		private function getFirstDate() : uint
		{
			if (null == _arrDate)
				return 1;
			return _arrDate[0];
		}
		
		private function cleanHour(curTime:Date) : void
		{
			curTime.hours = 0;
			curTime.minutes = 0;
			curTime.seconds = 0;
			curTime.milliseconds = 0;
		}
		
		/**
		 * 获取下一个时间点 
		 * @return 返回下一个时间点
		 * @author 康露 2014年7月7日
		 */
		public function getNextTime(curTime:Date=null) : Date
		{
			if (null == curTime)
			{
				curTime = new Date();
				curTime.time = SystemTimeManager.curtTm;
			}
			
			curTime.time += 60000;
			var retTime:Date = null;
			// 从今年开始搜，最多往后搜十年
			for (var idx:int=0; idx<10; idx++)
			{
				retTime = getTimeWithYear(curTime);
				if (null != retTime)
					break;
				
				curTime.fullYear = getNextYear(curTime);
				curTime.month = getFirstMonth();
				curTime.date = getFirstDate();
				cleanHour(curTime);
			}
			
			return retTime;
		}
		
		/**
		 * 获得活动下次时间毫秒数 （例：为了避免getNextTime方法在17:00活动开启后上线，获取是第二天的17:00时间）
		 * @param duration 活动的持续时间(毫秒数)
		 * @return
		 */
		public function getCheackNextTime( duration:int ):Number
		{
			var curTime:Date = new Date();
			curTime.time = SystemTimeManager.curtTm - duration;
			
			curTime.time += 60000;
			var retTime:Date = null;
			// 从今年开始搜，最多往后搜十年
			for ( var idx:int = 0; idx < 10; idx++ )
			{
				retTime = getTimeWithYear( curTime );
				if ( null != retTime )
					break;
				
				curTime.fullYear = getNextYear( curTime );
				curTime.month = getFirstMonth();
				curTime.date = getFirstDate();
				cleanHour( curTime );
			}
			
			return retTime.time ;
		}
	}
}
