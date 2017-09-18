package com.rpgGame.coreData.cfg.fulidating
{
	import com.rpgGame.coreData.clientConfig.Q_sign_accumulate;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	public class SignCfg
	{
		private static var _dataDic:Dictionary;
		private static var keys:Array;
		public static function setup( data:ByteArray ):void
		{
			_dataDic = new Dictionary();
			keys=[];
			var arr : Array = data.readObject();
			for each(var info :Q_sign_accumulate in arr) {
				_dataDic[info.q_day] = info;
				keys.push(info.q_day);
			}
			keys.sort(short);
		}
		
		private static function short(day1:int,day2:int):int
		{
			if(day1<day2) return -1;
			else if(day1>day2) return 1;
			return 0;
		}
		
		public static function getCfgByDay(day:int):Q_sign_accumulate
		{
			return _dataDic[day];
		}
		
		/**依据下标获取配置*/
		public static function getCfgByIndex(index:int):Q_sign_accumulate
		{
			var key:int=keys[index];
			return _dataDic[key];
		}
		
		/**获取累积签到应该显示的阶段*/
		public static function getsignDayIndex(day:int):int
		{
			for(var i:int=keys.length-1;i>=0;i--)
			{
				if(i>0&&keys[keys.length-1]<day)
				{
					return keys.length-1;
				}else if(keys[i]==day)
				{
					return i;
				}else if(i>0&&(keys[i]>day&&keys[i-1]<day))
				{
					return i;
				}
			}
			return 0;
		}
	}
}