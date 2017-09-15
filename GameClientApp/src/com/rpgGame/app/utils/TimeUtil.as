package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.utils.NumberFormatter;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangText;
	
	public class TimeUtil
	{
		private static var _tmpDate : Date = new Date();
		/** 一天的毫秒数 **/
		public static var DAY_MICRO_SECONDS : uint = 24 * 3600 * 1000;
		/** 一周的毫秒数 **/
		public static var WEEK_MICRO_SECONDS : uint = 7 * DAY_MICRO_SECONDS;
		/** 一月的毫秒数 **/
		public static var MONTH_MICRO_SECONDS : uint = 31 * DAY_MICRO_SECONDS;
		/** 一小时的毫秒数 **/
		public static var HOUR_MICRO_SECONDS : uint = 3600 * 1000;
		/** 一分钟的毫秒数 **/
		public static var MINUTE_MICRO_SECONDS : uint = 60 * 1000;
		/** 一秒钟的毫秒数 **/
		public static var SECOND_MICRO_SECONDS : uint = 1000;
		
		/** 获取当天零点毫秒数 */
		public static function getTodayZeroTime() : Number
		{
			return getTodayTime(SystemTimeManager.curtTm);
		}
		
		/** 检测是否在同一天 */
		public static function getIsInSameDay(time : Number) : Boolean
		{
			var passTime : int = time - TimeUtil.getTodayZeroTime();
			return (passTime > 0 && passTime < TimeUtil.DAY_MICRO_SECONDS);
		}
		
		
		/**
		 *将整型时间2300转换未23:00格式类型 
		 * @param time
		 * @return 
		 * 
		 */
		public static function changeIntHM2Str(time:int):String
		{
			var timeStr:String=time.toString();
			var result:String=timeStr.slice(0,2)+":"+timeStr.slice(2);
			return result;
		}
		
		/***
		 * 把毫秒转换为指定格式的字符串
		 * 可以更换间隔符号 2015-01-26 21:26
		 *
		 * EC
		 *
		 * Y 4位年 M 2位月 D 2位日
		 * y 2位年 m 1位月 d 1位日
		 * H 2位时 I 2位分 S 2位秒
		 * h 1位时 i 1位分 1 1位秒
		 *
		 * @param time
		 * @param format 格式
		 *
		 ***/
		public static function formatTimeToSpecString(time : Number, format : String = "Y-M-D H:I:S") : String
		{
			var str : String = format;
			_tmpDate.setTime(time);
			str = str.split("Y").join(_tmpDate.getFullYear());
			str = str.split("y").join(String(_tmpDate.getFullYear()).substr(2));
			str = str.split("M").join(formatNum(_tmpDate.getMonth() + 1));
			str = str.split("m").join(_tmpDate.getMonth() + 1);
			str = str.split("D").join(formatNum(_tmpDate.getDate()));
			str = str.split("d").join(_tmpDate.getDate());
			str = str.split("H").join(formatNum(_tmpDate.getHours()));
			str = str.split("h").join(_tmpDate.getHours());
			str = str.split("I").join(formatNum(_tmpDate.getMinutes()));
			str = str.split("i").join(_tmpDate.getMinutes());
			str = str.split("S").join(formatNum(_tmpDate.getSeconds()));
			str = str.split("s").join(_tmpDate.getSeconds());
			return str;
		}
		
		
		/**
		 * 将秒数转化为日期
		 * @param _second
		 * @param index
		 * @param isLineMode日期是否用短线连接
		 * @param isOnlyDay只显示到天，不显示时分秒
		 * @return
		 *
		 */
		public static function changeTimeStampToDateStr(_second : Number, index : int = 0, isLineMode : Boolean = false, isOnlyDay : Boolean = false, isOnMinue : Boolean = false) : String
		{
			_tmpDate.setTime(_second);
			if (!isLineMode)
				return changeDateToDateStr(_tmpDate, index, isOnlyDay, isOnMinue);
			return changeDateToSpecStr(_tmpDate, index, isOnlyDay);
		}
		
		/**
		 * 将日期转化为中文
		 * @param _date
		 * @param index
		 * @return
		 *
		 */
		public static function changeDateToDateStr($date : Date, $index : int = 0, $isOnlyDay : Boolean = false, $isOnMinue : Boolean = false) : String
		{
			var _dateStr : String = "";
			var minite : Number = 0;
			var seconds : int = 0;
			if ($index < 1)
			{
				_dateStr = _dateStr + $date.getFullYear() + LanguageConfig.getText(LangText.TIME_YEAR);
			}
			;
			if ($index < 2)
			{
				_dateStr = _dateStr + ($date.getMonth() + 1) + LanguageConfig.getText(LangText.TIME_MONTH);
			}
			;
			if ($index < 3)
			{
				_dateStr = _dateStr + $date.getDate() + LanguageConfig.getText(LangText.TIME_DAY);
			}
			;
			
			//只显示到日期
			if ($isOnlyDay)
				return _dateStr;
			
			_dateStr += " ";
			
			_dateStr = _dateStr + $date.getHours();
			minite = $date.getMinutes();
			if (minite < 10)
			{
				_dateStr += ":" + "0" + minite;
			}
			else
			{
				_dateStr += ":" + minite;
			}
			if ($isOnMinue)
				return _dateStr;
			if ($index != 4)
			{
				seconds = $date.getSeconds();
				if (seconds < 10)
				{
					_dateStr += ":" + "0" + seconds;
				}
				else
				{
					_dateStr += ":" + seconds;
				}
			}
			;
			return _dateStr;
		}
		
		/**
		 * 将日期转换成短线连接:2013-08-26 14:30
		 * @param	time
		 * @param	index
		 * @return
		 */
		public static function changeTimeToSpecStr(time : Number, index : int = 0, isOnlyDay : Boolean = false) : String
		{
			_tmpDate.setTime(time);
			return changeDateToSpecStr(_tmpDate, index, isOnlyDay);
		}
		
		/**
		 * 将日期转换成短线连接:2013-08-26 14:30
		 * @param	_date
		 * @param	index
		 * @return
		 */
		public static function changeDateToSpecStr(_date : Date, index : int = 0, isOnlyDay : Boolean = false) : String
		{
			var _dateStr : String = "";
			var minite : Number = 0;
			var seconds : int = 0;
			if (index < 1)
			{
				_dateStr = _dateStr + _date.getFullYear() + "-";
			}
			;
			if (index < 2)
			{
				_dateStr = _dateStr + (_date.getMonth() + 1) + "-";
			}
			;
			if (index < 3)
			{
				_dateStr = _dateStr + _date.getDate() + " ";
			}
			;
			
			//只显示到日期
			if (isOnlyDay)
				return _dateStr;
			
			_dateStr = _dateStr + _date.getHours();
			
			minite = _date.getMinutes();
			if (minite < 10)
			{
				_dateStr += ":" + "0" + minite;
			}
			else
			{
				_dateStr += ":" + minite;
			}
			if (index != 4)
			{
				seconds = _date.getSeconds();
				if (seconds < 10)
				{
					_dateStr += ":" + "0" + seconds;
				}
				else
				{
					_dateStr += ":" + seconds;
				}
			}
			;
			return _dateStr;
		}
		
		/**
		 * 把一秒数转换成。**:**:**
		 *
		 * @param time 注意是秒不是毫秒
		 * @return
		 *
		 */
		public static function intTime2String(time : int) : String
		{
			var ret : String = "";
			var temp : String;
			if (time > 3600)
			{
				ret = (int(time / 3600)).toString() + "：";
			}
			if (time > 60)
			{
				temp = (int((time % 3600) / 60)).toString();
				if (temp.length < 2)
				{
					ret += "0";
				}
				ret += (temp + "：");
			}
			temp = (time % 60).toString();
			if (temp.length < 2)
			{
				ret += "0";
			}
			ret += temp;
			return ret;
		}
		
		public static function intTime3String(time:int):String
		{
			var secondStr:String = intTime2String(time);
			if (secondStr.length == 2)
			{
				secondStr = secondStr + "秒";
			}
			return secondStr;
		}
		
		/**
		 * 把秒数转换成。2h:2m:2s
		 * @param time 注意是秒不是毫秒
		 * @return
		 *
		 */
		public static function time2HMSString(time : int) : String
		{
			var ret : String = "";
			var temp : String;
			if (time > 3600)
			{
				ret = (int(time / 3600)).toString() + "h：";
			}
			if (time > 60)
			{
				temp = (int((time % 3600) / 60)).toString();
				ret += (temp + "m：");
			}
			temp = (time % 60).toString();
			ret += temp + "s";
			return ret;
		}
		
		/**
		 * 将指定的时间长度格式化为一个字符串<br/>
		 * 举例：<br/>
		 * GameLog.add(TimeUtil.timeFormat(3600, ["天", "小时", "分", "秒"], [24*3600, 3600, 60, 1]));	// "01小时00分" <br/>
		 * TimeUtil.timeFormat(12345, ["-", ":", ":", ":"], [24*3600, 3600, 60, 1], [0, 2, 2, 2], 2)<br/>
		 * @param seconds 时间长度，以秒为单位
		 * @param arrUnit "天","时","分","秒" 对应的显示文本
		 * @param arrPos arrUnit每个单位对应的时间长度
		 * @param arrFill arrUnit对应的每个单位，如果长度不够，补位的数量
		 * @param showCount 最多显示多少个单位
		 * @return 返回格式化后的字符串
		 * @author 康露 2014年7月18日
		 */
		public static function timeFormat(seconds : int, arrUnit : Array, arrPos : Array, arrFill : Array, showCount : int = 2) : String
		{
			return NumberFormatter.format(seconds, arrUnit, arrPos, 0, true, arrFill, showCount);
		}
		
		/**
		 * 将指定时间长度格式化为一个字符串，例如：2天18小时
		 * @param seconds 时间长度，以秒为单位
		 * @param showCount 最多显示单位的数量
		 * @return 返回格式化后的字符串
		 * @author 康露 2014年7月18日
		 */
		public static function timeFormatCH(seconds : int, showCount : int = 2, isFloor : Boolean = true) : String
		{
			return NumberFormatter.format(seconds, ["天", "小时", "分", "秒"], [24 * 3600, 3600, 60, 1], 0, isFloor, [0, 0, 0, 0], showCount);
		}
		
		public static function offlineTimeCH(offlineSeconds : int) : String
		{
			var dayStr : String = "";
			if (offlineSeconds > TimeUtil.WEEK_MICRO_SECONDS * 0.001)
			{
				dayStr = "超过7天";
			}
			else if (offlineSeconds > TimeUtil.DAY_MICRO_SECONDS * 0.001)
			{
				dayStr = timeFormatCH(offlineSeconds, 1);
			}
			return "离线" + dayStr;
		}
		
		private static function formatNum(num : int, digi : uint = 2) : String
		{
			var nums : String = String(num);
			while (nums.length < digi)
			{
				nums = "0" + nums;
			}
			return nums;
		}
		
		/**通过秒数获得格式为00:00的字符串*/
		public static function formatTimeToTimeString(time : int) : String
		{
			if (time < 0)
				time = 0;
			if (int(time / 3600) > 0)
			{
				return formatNum(int(time / 3600)) + ":" + formatNum(int((time % 3600) / 60)) + ":" + formatNum(time % 60);
			}
			else
			{
				return formatNum(int((time % 3600) / 60)) + ":" + formatNum(time % 60);
			}
		}
		
		/**通过秒数获得格式为00:00:00的字符串*/
		public static function format3TimeType(time : int) : String
		{
			if (time < 0)
				time = 0;
			return formatNum(int(time / 3600)) + ":" + formatNum(int((time % 3600) / 60)) + ":" + formatNum(time % 60);
		}
		
		/**通过秒数获得格式为00x00x00的字符串*/
		public static function format3TimeToString(time : int) : String
		{
			if (time < 0)
				time = 0;
			return formatNum(int(time / 3600)) + "x" + formatNum(int((time % 3600) / 60)) + "x" + formatNum(time % 60);
		}
		
		/**
		 * 转换时间为文字描述
		 *
		 * ***小时**分**秒
		 *
		 * @param totalTime			注意——————毫秒
		 * @param isContainsSec   	是否不包含秒数
		 * @return
		 */
		public static function secondToHMS(totalTime : Number, isContainsSec : Boolean = true, showChinese : Boolean = true, fullShow : Boolean = false) : String
		{
			totalTime = totalTime / 1000; //目前所用的时间，均为服务器下发的时间，都为毫秒 ，所以先转换为秒数
			var secondsUnit : int = 3600;
			var miniteUnit : int = 60;
			var hour : int = totalTime / secondsUnit;
			totalTime = totalTime % secondsUnit;
			var minite : int = totalTime / miniteUnit;
			var seconds : int = totalTime % miniteUnit;
			var _hms : String = "";
			if (hour != 0)
			{
				if (showChinese)
				{
					_hms += String(hour) + LanguageConfig.getText(LangText.TIME_HOUR);
				}
				else
				{
					_hms += String(hour) + ":";
				}
			}
			else
			{
				if (fullShow)
				{
					if (showChinese)
					{
						_hms += "0" + LanguageConfig.getText(LangText.TIME_HOUR);
					}
					else
					{
						_hms += "00:";
					}
				}
			}
			if (minite != 0 || hour != 0)
			{
				if (minite < 10)
				{
					_hms += "0" + String(minite);
				}
				else
				{
					_hms += String(minite);
				}
				
				if (showChinese)
				{
					_hms += LanguageConfig.getText(LangText.TIME_MINUTE);
				}
				else
				{
					_hms += ":";
				}
			}
			else
			{
				if (fullShow)
				{
					if (showChinese)
					{
						_hms += "0" + LanguageConfig.getText(LangText.TIME_MINUTE);
					}
					else
					{
						_hms += "00:";
					}
				}
			}
			if (!isContainsSec)
			{
				return _hms;
			}
			if (seconds != 0 || hour != 0 || minite != 0)
			{
				if (seconds < 10)
				{
					_hms += "0" + String(seconds);
				}
				else
				{
					_hms += String(seconds);
				}
				
				if (showChinese)
				{
					_hms += LanguageConfig.getText(LangText.TIME_SECOND);
				}
			}
			;
			if (_hms == "")
			{
				_hms = "00" + LanguageConfig.getText(LangText.TIME_SECOND);
			}
			return _hms;
		}
		
		private static var _timezoneOffset : Number = ((new Date()).timezoneOffset * TimeUtil.MINUTE_MICRO_SECONDS);
		
		public static function get timezoneOffset() : Number
		{
			return _timezoneOffset;
		}
		
		/**
		 * 判断2个时间是否是同一天
		 * @param timeOne
		 * @param timeTwo
		 *
		 */
		public static function isSameDay(timeOne : Number, timeTwo : Number) : Boolean
		{
			return 0 == getDayCount(timeOne, timeTwo);
		}
		
		/**
		 * 获得timeOne到timeTwo两个时间点之间的天数差
		 * @param timeOne
		 * @param timeTwo
		 * @return 返回两个时间点之间的天数差
		 * @author 康露 2014年10月29日
		 */
		public static function getDayCount(timeOne : Number, timeTwo : Number) : int
		{
			return getDay(timeTwo) - getDay(timeOne);
		}
		
		/**
		 * 返回本地时间从1970年1月1日开始到现在的天数
		 * @param time 时间点
		 * @return 返回本地时间从1970年1月1日开始到现在的天数
		 * @author 康露 2014年11月13日
		 */
		public static function getDay(time : Number) : int
		{
			return ((time - _timezoneOffset) / TimeUtil.DAY_MICRO_SECONDS) >> 0;
		}
		
		/**
		 * 返回本地时间当天经过了多少毫秒
		 * @param time 时间点
		 * @return 返回本地时间当天经过了多少毫秒
		 * @author 康露 2014年11月13日
		 */
		public static function getTodayMicroSecond(time : Number) : Number
		{
			return (time - _timezoneOffset) % TimeUtil.DAY_MICRO_SECONDS;
		}
		
		/**
		 * 获取今天指定时间点的毫秒数
		 * @param $time 今天的任意一个时间点
		 * @param $hour 几点
		 * @param $min 几分
		 * @param $sceond 几秒
		 * @param $millisecond 几毫秒
		 * @return 返回指定时间点的毫秒数
		 * @author 康露 2015年1月29日
		 */
		public static function getTodayTime($time : Number, $hour : int = 0, $min : int = 0, $sceond : int = 0, $millisecond : int = 0) : Number
		{
			return ((($time - _timezoneOffset) / TimeUtil.DAY_MICRO_SECONDS) >> 0) * TimeUtil.DAY_MICRO_SECONDS + _timezoneOffset //
				+ $hour * TimeUtil.HOUR_MICRO_SECONDS + $min * TimeUtil.MINUTE_MICRO_SECONDS + $sceond * SECOND_MICRO_SECONDS + $millisecond;
		}
		
		public static function getDayString(day : int) : String
		{
			switch (day)
			{
				case 0:
				{
					return "周日";
				}
				case 1:
				{
					return "周一";
				}
				case 2:
				{
					return "周二";
				}
				case 3:
				{
					return "周三";
				}
				case 4:
				{
					return "周四";
				}
				case 5:
				{
					return "周五";
				}
				case 6:
				{
					return "周六";
				}
			}
			return "";
		}
		
		public static function getCurrentTimeFromt() : String
		{
			return formatTimeToSpecString(SystemTimeManager.curtTm, "Y-M-D H:I");
		}
		
		/**
		 * 获取传入时间的，月份
		 * @param time
		 */
		public static function getMonth(time : Number) : int
		{
			_tmpDate.setTime(time);
			return _tmpDate.getMonth() + 1;
		}
		
		/**
		 * 后去传入时间的，天
		 * @param time
		 */
		public static function getDate(time : Number) : int
		{
			_tmpDate.setTime(time);
			return _tmpDate.getDate()
		}
		
		/**
		 * 活动规则的时间    这是每天都有的活动
		 * @param time 如：10:10-23:30;
		 * @param dust 活动时长
		 * @return
		 *
		 */
		public static function getRuleTime(time : Date, dust : Number) : String
		{
			var endDate : Date = new Date(time.getTime() + dust);
			return changeTime(time.hours) + ":" + changeTime(time.minutes) + "-" + changeTime(endDate.hours) + ":" + changeTime(endDate.minutes);
		}
		
		/**
		 * 补全数字为两位数
		 * @param time
		 * @return
		 *
		 */
		public static function changeTime(time : int) : String
		{
			if (time < 10)
				return "0" + time;
			
			return time + "";
		}
		
	}
}
