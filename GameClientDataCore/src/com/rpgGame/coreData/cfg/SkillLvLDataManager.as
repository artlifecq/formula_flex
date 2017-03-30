package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class SkillLvLDataManager
	{
		private static var per_server:Array=[1000,1000,1,1000];
		private static var keys:Array=["q_increaDamagePer","q_summon_shang","q_hatred","q_maxhp_per"];
		
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
		
		public static function getAttrValueByType(q_skill_attr_type:int,data:Q_skill_ignore):int
		{
			var value:int=data[keys[q_skill_attr_type]];
			var per:int=per_server[q_skill_attr_type];
			var result:int;
			if(per!=1){
				result=Math.floor(value/per);
			}else{
				result=value;
			}
			
			return result;
		}
	}
}