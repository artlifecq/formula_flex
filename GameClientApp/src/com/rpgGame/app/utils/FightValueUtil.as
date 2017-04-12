package com.rpgGame.app.utils
{
	import com.rpgGame.coreData.cfg.AttFormulaConfig;
	import com.rpgGame.coreData.clientConfig.ClientAttFormula;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.type.CharAttributeType;

	public class FightValueUtil
	{
		private static const BASE_NUM:uint=100000;
		public static function calAtrributeFightPower(list:Vector.<Number>,job:int):int
		{
			//一级属性转二级属性
			calFistAtrributeFightByType(list,job,CharAttributeType.LIDAO);
			calFistAtrributeFightByType(list,job,CharAttributeType.GENGU);
			calFistAtrributeFightByType(list,job,CharAttributeType.SHENFA);
			calFistAtrributeFightByType(list,job,CharAttributeType.HUIGEN);
			var combat:Number = 0;
			//物理攻击
			combat += list[CharAttributeType.WAI_GONG]/1;
			//气血
			combat += list[CharAttributeType.MAX_HP]/7;
			//闪避率
			combat += list[CharAttributeType.MISS]/0.004;
			
			//暴击率
			combat += list[CharAttributeType.CRIT_PER]/0.004;
			
			//魔法攻击力
			combat += list[CharAttributeType.NEI_GONG]/0.8;
			
			//防御百分比
			combat += list[CharAttributeType.DEFENSE_PER]/0.004;
			
			//命中率
			combat += list[CharAttributeType.HIT]/0.004;
			
			//暴击伤害
			combat = combat +list[CharAttributeType.CRIT]/0.008;
			
			return Math.round(combat);
		}
		
		public static function calFightPowerByAttValue(att:Q_att_values,job:int):int
		{
			if(att==null)
				return 0;
			var list:Vector.<Number> = new Vector.<Number>(30,0);
			var type:int;
			var value:int;
			for(var i:int = 1;i<=15;i++)
			{
				type = att["q_type"+i];
				if(type==0)
					continue;
				value = att["q_value"+i];
				list[type] = value;
			}
			return calAtrributeFightPower(list,job);
		}
		
		private static function calFistAtrributeFightByType(proplist:Vector.<Number>,job:int,type:int):void
		{
			var jobType:String = job+"_"+type;
			var base:int = proplist[type];
			var list:Vector.<ClientAttFormula>=AttFormulaConfig.getAttFormula(jobType);
			for each(var formula:ClientAttFormula in list){
				proplist[formula.type] +=  base*formula.value/BASE_NUM;
			}
		}
	}
}