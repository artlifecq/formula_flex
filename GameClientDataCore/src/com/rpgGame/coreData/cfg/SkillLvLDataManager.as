package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class SkillLvLDataManager
	{
		private static var per_server:Array=[100,100,1,100,[100,1],[100,1],[100,1]];
		private static var keys:Array=["q_increaDamagePer","q_summon_shang","q_hatred","q_maxhp_per",
			["q_increaDamagePer","q_increDamage"],["q_increaDamagePer","q_maxhp"],["q_maxhp_per","q_maxhp"]];
		
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
		
		public static function getPercentValue(q_skill_attr_type:int,value:int,index:int=0):String
		{
			var per:*;
			per=per_server[q_skill_attr_type];
			if(per is Array){
				per=per[index];
			}
			var percent:Number=value/per;
			var percentStr:String=percent.toFixed(2);
			percentStr=Number(percentStr).toString();
			if(per!=1){
				percentStr+="%";
			}
			percentStr=HtmlTextUtil.getTextColor(0x6BCC08,percentStr);
			return percentStr;
		}
		
		/**
		 *根据属性类型获取属性值 
		 * @param q_skill_attr_type
		 * @param data
		 * @return 
		 * 
		 */
		public static function getAttrValueByType(q_skill_attr_type:int,data:Q_skill_ignore):Array
		{
			var index:int=q_skill_attr_type;
			var keyValue:*=keys[index];
			var result:Array=[];
			if(keyValue is String){
				result.push(data[keyValue]);
			}else if(keyValue is Array){
				for each(var key:String in keyValue){
					result.push(data[key]);
				}
			}
			return result;
		}
	}
}