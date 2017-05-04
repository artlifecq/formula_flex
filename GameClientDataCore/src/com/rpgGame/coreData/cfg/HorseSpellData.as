package com.rpgGame.coreData.cfg
{
	import flash.utils.ByteArray;
	
	/**
	 * 坐骑技能数据 
	 * @author 陈鹉光-2016-09-14
	 * Q_horse_skills
	 */	
	public class HorseSpellData
	{
		private static var _all:Array;
		
		public static function setConfig( data:ByteArray):void
		{
			if( data == null )
				return;
			_all = data.readObject();
		}
		
		public static  function get allSpell():Array
		{
			return _all;
		}
	}
}