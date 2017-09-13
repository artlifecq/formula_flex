package com.rpgGame.app.manager.fulidating
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.coreData.info.fulidating.SignVO;
	
	public class SignManager
	{
		private var _signVO:SignVO = new SignVO();
		
		private static var _instance:SignManager;
		public static function get instance():SignManager
		{
			if(_instance == null)
				_instance = new SignManager();
			return _instance;
		}
		
		public function isHaveToDay():Boolean
		{
			if(_signVO.dayList==null||_signVO.dayList.length==0) return false;
			for(var i:int=0;i<_signVO.dayList.length;i++)
			{
				if(SystemTimeManager.sysDateTime.date==_signVO.dayList[i])
					return true;
			}
			return false;
		}
		/**
		 * 获取可补签的次数
		 * */
		public function get canBuQianNum():int
		{
			if(SystemTimeManager.sysDateTime.fullYear>_signVO.openServerTime.fullYear)
			{
				if(isHaveToDay())
					return SystemTimeManager.sysDateTime.date-_signVO.dayList.length;
				else
					return SystemTimeManager.sysDateTime.date-_signVO.dayList.length-1;
			}
			else
			{
				if(SystemTimeManager.sysDateTime.month>_signVO.openServerTime.month)
				{
					if(isHaveToDay())
						return SystemTimeManager.sysDateTime.date-_signVO.dayList.length;
					else
						return SystemTimeManager.sysDateTime.date-_signVO.dayList.length-1;
				}
				else
				{
					if(SystemTimeManager.sysDateTime.month==_signVO.openServerTime.month&&SystemTimeManager.sysDateTime.date>=_signVO.openServerTime.date)
					{
						if(isHaveToDay())
							return (SystemTimeManager.sysDateTime.date-_signVO.dayList.length-_signVO.openServerTime.date);
						else
							return (SystemTimeManager.sysDateTime.date-_signVO.dayList.length-_signVO.openServerTime.date+1);
					}
					else
						return -1;
				}
			}
			return -1;
		}	
		
		public function get signVO():SignVO
		{
			return _signVO;
		}
		
		public function isCanSign():Boolean
		{
			if(signVO!=null)
			{
				if(!signVO.dayIsSign( SystemTimeManager.sysDateTime ))
				{
					return true;
				}
			}
			return false;
		}
	}
}