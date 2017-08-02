package com.rpgGame.app.utils
{
	import com.game.engine2D.config.staticdata.CharAngleType;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.AttFormulaConfig;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.ClientAttFormula;
	import com.rpgGame.coreData.clientConfig.Q_att_transfer;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.CharAttributeType;

	public class FightValueUtil
	{
		private static const BASE_NUM:uint=100000;
		public static function calAtrributeFightPower(list:Vector.<Number>,job:int):int
		{
			list[CharAttributeType.MISS] =list[CharAttributeType.MISS]/BASE_NUM;
			list[CharAttributeType.CRIT_PER] =list[CharAttributeType.CRIT_PER]/BASE_NUM;
			list[CharAttributeType.DEFENSE_PER] =list[CharAttributeType.DEFENSE_PER]/BASE_NUM;
			list[CharAttributeType.HIT] =list[CharAttributeType.HIT]/BASE_NUM;
			list[CharAttributeType.CRIT] =list[CharAttributeType.CRIT]/BASE_NUM;
			//一级属性转二级属性
//			calFistAtrributeFightByType(list,job,CharAttributeType.LIDAO);
//			calFistAtrributeFightByType(list,job,CharAttributeType.GENGU);
//			calFistAtrributeFightByType(list,job,CharAttributeType.SHENFA);
//			calFistAtrributeFightByType(list,job,CharAttributeType.HUIGEN);
			var combat:Number = 0;
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.LIDAO);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.GENGU);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.SHENFA);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.HUIGEN);
			//物理攻击
			combat += list[CharAttributeType.WAI_GONG]/1;
//			trace(CharAttributeType.WAI_GONG,list[CharAttributeType.WAI_GONG]/1);
			//气血
			combat += list[CharAttributeType.MAX_HP]/7;
//			trace(CharAttributeType.MAX_HP,list[CharAttributeType.MAX_HP]/7);
			//闪避率
			combat += list[CharAttributeType.MISS]/0.004;
//			trace(CharAttributeType.MISS,list[CharAttributeType.MISS]/0.004);
			//暴击率
			combat += list[CharAttributeType.CRIT_PER]/0.004;
//			trace(CharAttributeType.CRIT_PER,list[CharAttributeType.CRIT_PER]/0.004);
			//魔法攻击力
			combat += list[CharAttributeType.NEI_GONG]/0.8;
			trace(CharAttributeType.NEI_GONG,list[CharAttributeType.NEI_GONG]/0.8);
			//防御百分比
			combat += list[CharAttributeType.DEFENSE_PER]/0.004;
//			trace(CharAttributeType.DEFENSE_PER,list[CharAttributeType.DEFENSE_PER]/0.004);
			//命中率
			combat += list[CharAttributeType.HIT]/0.004;
//			trace(CharAttributeType.HIT,list[CharAttributeType.HIT]/0.004);
			//暴击伤害
			combat +=list[CharAttributeType.CRIT]/0.008;
//			trace(CharAttributeType.CRIT,list[CharAttributeType.CRIT]/0.008);
			return Math.round(combat);
		}
		public static function calFightPowerByHash(hash:HashMap,job:int):int
		{
			if (hash==null) 
			{
				return 0;
			}
			var list:Vector.<Number> = new Vector.<Number>(30,0);
			var keys:Array=hash.keys();
			for each (var key:int in keys) 
			{
				list[key]=hash.getValue(key);
			}
			return calAtrributeFightPower(list,job);
		}
		
		/**
		 * 通过物品信息计算战斗力
		 * @param item
		 * @return 
		 * 
		 */
		public static function calFightPowerByEquip(equip:EquipInfo):int
		{
			var result:int=0;
			var attValues:Q_att_values=AttValueConfig.getAttInfoById(int(equip.qItem.q_att_type));
			result=calFightPowerByAttValue(attValues,equip.qItem.q_job);//基本属性
			var stren:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(equip.qItem.q_kind,equip.qItem.q_job,equip.strengthLevel);
			attValues=AttValueConfig.getAttInfoById(stren.q_att_type);//强化属性
			result+=calFightPowerByAttValue(attValues,equip.qItem.q_job);
			var washcfg:Q_equip_wash_attr=EquipWashAttCfg.getEquipWashAttr(equip.smeltAtt1);
			if(washcfg.q_attr_id!=0){
				attValues=AttValueConfig.getAttInfoById(washcfg.q_attr_id);//洗练属性
				result+=calFightPowerByAttValue(attValues,equip.qItem.q_job);
			}
			result+=calFightPowerByAttValue(attValues,equip.qItem.q_job);
			washcfg=EquipWashAttCfg.getEquipWashAttr(equip.smeltAtt2);
			if(washcfg.q_attr_id!=0){
				attValues=AttValueConfig.getAttInfoById(washcfg.q_attr_id);//洗练属性
				result+=calFightPowerByAttValue(attValues,equip.qItem.q_job);
			}
			
			return result;
		}
		
		/**
		 * 通过配置属性计算战斗力
		 * @param att
		 * @param job
		 * @return 
		 * 
		 */
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
		private static function calFistAtrributeFightPower(proplist:Vector.<Number>,job:int,type:int):Number
		{
			var ret:Number=0;
			var jobType:String = job+"_"+type;
			var base:int = proplist[type];
			var qTrans:Q_att_transfer=AttFormulaConfig.getAttrTrans(jobType);
			
			ret=base*(qTrans?qTrans.q_fight_power:0)/BASE_NUM;
//			var list:Vector.<ClientAttFormula>=AttFormulaConfig.getAttFormula(jobType);
//			for each(var formula:ClientAttFormula in list){
//				proplist[formula.type] +=  base*formula.value/BASE_NUM;
//				
//			}
			return ret;
		}
	}
}