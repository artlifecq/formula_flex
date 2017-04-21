package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class LostSkillData
	{
		private static var _datas:Dictionary;
		private static var _lists:Array;
		public static function setup( data:ByteArray ):void
		{
			_datas = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info :Q_lostskill_open in arr) {
				_datas[info.q_id] = info;
			}
			_lists = arr;
			_lists.sortOn("q_level",Array.NUMERIC);
		}
		public static function getModeInfoById(id:int):Q_lostskill_open
		{
			return _datas[id];
		}
		public static function get datas():Array
		{
			return _lists;
		}
	}
}