package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_lostskill_up;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class LostSkillUpData
	{
		private static var _datas:Dictionary;
		public static function setup( data:ByteArray ):void
		{
			_datas = new Dictionary();
			var arr : Array = data.readObject();
			for each(var info :Q_lostskill_up in arr) 
			{
				_datas[info.q_id_level] = info;
			}
		}
		
		public static function getDatabyIdAndLevel(skillid:int,level:int):Q_lostskill_up
		{
			var q_id:String = skillid.toString()+"_"+level;
			return _datas[q_id];
		}
	}
}