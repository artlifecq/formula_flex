package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class SkillLvLDataManager
	{
		private static var _map:HashMap = new HashMap();
		public function SkillLvLDataManager()
		{
		}
		
		public static function setup(data : ByteArray) : void
		{
			var arr:Array = data.readObject();
			for each (var skillData : Q_skill_ignore in arr)
			{
				_map.add(skillData.q_skillID_q_grade,skillData);
			}
		}
		
		public static function getData(q_skillID_q_grade:String):Q_skill_ignore
		{
			return _map.getValue(q_skillID_q_grade);
		}
	}
}