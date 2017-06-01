package com.rpgGame.coreData.cfg
{
	import flash.utils.ByteArray;

	public class FunctionNoticeCfgData
	{
		private static var _list:Array;

		public static function get list():Array
		{
			return _list;
		}

		public static function setup( byte:ByteArray ):void
		{
			_list = byte.readObject();
		}
	}
}