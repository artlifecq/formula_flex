package com.game.mainCore.core.utils
{
    public class TimeDataUtil 
    {
        public static function getTime(num:int):Array
        {
            num = (num / 1000);
            return ([Math.floor((num / 3600)), (Math.floor((num / 60)) % 60), Math.floor((num % 60))]);
        }

        public static function sec3DetailTime(sec:uint):String
        {
            var hours:uint = Math.floor((sec / 3600));
            var hoursStr:String;
            if ((((hours > 0)) && ((hours < 10))))
            {
                hoursStr = ("0" + hours);
            };
            var minutes:uint = Math.floor((Math.floor((sec % 3600)) / 60));
            var minutesStr:String;
            if ((minutes < 10))
            {
                minutesStr = ("0" + minutes);
            };
            var seconds:uint = Math.floor((Math.floor((sec % 3600)) % 60));
            var secondsStr:String;
            if ((seconds < 10))
            {
                secondsStr = ("0" + seconds);
            };
            var str:String = ((minutesStr + ":") + secondsStr);
            if (hours)
            {
                str = ((((hoursStr + ":") + minutesStr) + ":") + secondsStr);
            };
            return (str);
        }

        public static function sec2DetailTime(sec:uint):String
        {
            var hours:uint = Math.floor((sec / 3600));
            var hoursStr:String;
            if ((hours < 10))
            {
                hoursStr = ("0" + hours);
            };
            var minutes:uint = Math.floor((Math.floor((sec % 3600)) / 60));
            var minutesStr:String;
            if ((minutes < 10))
            {
                minutesStr = ("0" + minutes);
            };
            var seconds:uint = Math.floor((Math.floor((sec % 3600)) % 60));
            var secondsStr:String;
            if ((seconds < 10))
            {
                secondsStr = ("0" + seconds);
            };
            return (((((hoursStr + ":") + minutesStr) + ":") + secondsStr));
        }

        public static function secDetailZnTm(sec:uint):String
        {
            var hours:uint = Math.floor((sec / 3600));
            var hoursStr:String;
            if ((hours < 10))
            {
                hoursStr = ("0" + hours);
            };
            var minutes:uint = Math.floor((Math.floor((sec % 3600)) / 60));
            var minutesStr:String;
            if ((minutes < 10))
            {
                minutesStr = ("0" + minutes);
            };
            var seconds:uint = Math.floor((Math.floor((sec % 3600)) % 60));
            var secondsStr:String;
            if ((seconds < 10))
            {
                secondsStr = ("0" + seconds);
            };
            if ((hours == 0))
            {
                return ((((minutesStr + "分") + secondsStr) + "秒"));
            };
            return ((((((hoursStr + "小时") + minutesStr) + "分") + secondsStr) + "秒"));
        }

        public static function msec2THM(msec:uint):String
        {
            var sec:uint = Math.floor((msec / 1000));
            var hours:uint = Math.floor((sec / 3600));
            var hoursStr:String;
            if ((hours < 10))
            {
                hoursStr = ("0" + hours);
            };
            var minutes:uint = Math.floor((Math.floor((sec % 3600)) / 60));
            var minutesStr:String;
            if ((minutes < 10))
            {
                minutesStr = ("0" + minutes);
            };
            return ((((hoursStr + "小时") + minutesStr) + "分"));
        }

        public static function msec2TMS(msec:uint):String
        {
            var sec:uint = Math.floor(msec / 1000);
            var minutes:uint = Math.floor(Math.floor((sec % 3600)) / 60);
            var minutesStr:String;
            if (minutes < 10)
            {
                minutesStr = "0" + minutes;
            }
            var seconds:uint = Math.floor(Math.floor((sec % 3600)) % 60);
            var secondsStr:String;
            if (seconds < 10)
            {
                secondsStr = "0" + seconds;
            }
            return minutesStr + "分" + secondsStr + "秒";
        }

        public static function msec2THMS(msec:uint):String
        {
            var sec:uint = Math.floor(msec / 1000);
            var hours:uint = Math.floor(sec / 3600);
            var hoursStr:String;
            if (hours < 10)
            {
                hoursStr = "0" + hours;
            }
            var minutes:uint = Math.floor(Math.floor(sec % 3600) / 60);
            var minutesStr:String;
            if ((minutes < 10))
            {
                minutesStr = "0" + minutes;
            }
            var seconds:uint = Math.floor(Math.floor(sec % 3600) % 60);
            var secondsStr:String;
            if (seconds < 10)
            {
                secondsStr = "0" + seconds;
            }
            if (hours == 0)
            {
                return minutesStr + "分" + secondsStr + "秒";
            }
            return hoursStr + "小时" + minutesStr + "分" + secondsStr + "秒";
        }

        public static function msec2DateYMD(milliseconds:Number):String
        {
            var date:Date = new Date(milliseconds);
            return date.fullYear + "年" + (date.month + 1) + "月" + date.date + "日";
        }

        public static function msec2TimeDHS(milliseconds:Number):String
        {
            var sec:uint = milliseconds / 1000;
            var days:uint = Math.floor(sec / 86400);
            var hours:uint = Math.floor(Math.floor(sec % 86400) / 3600);
            var minutes:uint = Math.floor(Math.floor(sec % 3600) / 60);
            if (days > 0)
            {
                return days + "天" + hours + "小时" + minutes + "分";
            }
            return hours + "小时" + minutes + "分";
        }

        public static function msec2TimeDH(milliseconds:Number):String
        {
            var sec:uint = milliseconds / 1000;
            var days:uint = Math.floor(sec / 86400);
            var hours:uint = Math.floor(Math.floor(sec % 86400) / 3600);
            return days + "天" + hours + "小时";
        }

        public static function date2DetailTime(date:Date):String
        {
            return date.fullYear + "年" + (date.month + 1) + "月" + date.date + "日" + date.hours + "时" + date.minutes + "分" + date.seconds + "秒";
        }

        public static function convertToUnix(date:Date):String
        {
            var currentDate:int = date.date;
            var currentMonth:int = date.month;
            var currentYear:int = date.fullYear;
            var curtHour:int = date.hours;
            var curtMinutes:int = date.minutes;
            var curtSeconds:int = date.seconds;
            var dt:Date = new Date(currentYear, currentMonth, currentDate, curtHour, curtMinutes, curtSeconds);
            return Math.round(dt.getTime() / 1000).toString();
        }
    }
}