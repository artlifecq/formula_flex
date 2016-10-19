package com.rpgGame.core.utils
{
	/**
	 * 数据工具类 
	 * @author Mandragora
	 * 
	 */	 
	public class DataUtil
	{
		public function DataUtil()
		{
		}
		
		public static function dataIsNotNull(data:*):Boolean
		{
			if(data is int)
				return data != 0;
			else if(data is Number)
				return data != 0 ;//&& Number(data)!= NaN;
			else if(data is String)
				return data != "" && data != null;
			else
				return data != null;
		}
	}
}