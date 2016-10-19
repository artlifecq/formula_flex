package com.rpgGame.coreData.cfg
{
	import flash.utils.ByteArray;
	
	/**
	 * 客户端国战城门配置
	 * GuoDong.Zhang
	 * 2016-8-25
	 */
	public class ClientCountryWarChengMenCfgData
	{
		public static var doorArr:Array;
		
		public static function setup(data : ByteArray) : void
		{
			doorArr = data.readObject();
		}

	}
}