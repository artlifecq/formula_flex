package com.rpgGame.app.utils
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.AttFormulaConfig;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_transfer;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_equip_polish;
	import com.rpgGame.coreData.clientConfig.Q_equip_strength;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import away3d.log.Log;

	public class FightValueUtil
	{
		private static const BASE_NUM:uint=100000;
		private static const GLOBAL_ID:int=35;
		
		private static var calMap:HashMap;
		private static var debug:Boolean=false;
		
		public static function calAtrributeFightPower(list:Vector.<Number>,job:int):int
		{
			if(!calMap){
				calMap=new HashMap();
				var calCfg:Q_global=GlobalSheetData.getSettingInfo(GLOBAL_ID);
				var strV:String=calCfg.q_string_value;
				var typeList:Array=strV.split(";");
				var num:int=typeList.length;
				for(var i:int=0;i<num;i++){
					var typeStr:String=typeList[i];
					var values:Array=typeStr.split(",");
					calMap.put(int(values[0]),Number(values[1]));
				}
			}
			log("前端战斗力计算:");
			list[CharAttributeType.MISS] =list[CharAttributeType.MISS]/BASE_NUM;
			list[CharAttributeType.CRIT_PER] =list[CharAttributeType.CRIT_PER]/BASE_NUM;
			list[CharAttributeType.DEFENSE_PER] =list[CharAttributeType.DEFENSE_PER]/BASE_NUM;
			list[CharAttributeType.HIT] =list[CharAttributeType.HIT]/BASE_NUM;
			list[CharAttributeType.CRIT] =list[CharAttributeType.CRIT]/BASE_NUM;
			//一级属性转二级属性
			log("一级属性转二级属性:");
			var combat:Number = 0;
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.LIDAO);
			logByType(CharAttributeType.LIDAO,combat);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.GENGU);
			logByType(CharAttributeType.GENGU,combat);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.SHENFA);
			logByType(CharAttributeType.SHENFA,combat);
			combat+=calFistAtrributeFightPower(list,job,CharAttributeType.HUIGEN);
			logByType(CharAttributeType.HUIGEN,combat);
			//外功
			var combat2:Number=calAttByType(list,CharAttributeType.WAI_GONG) ;
			logByType2(CharAttributeType.WAI_GONG,combat2);
			combat +=combat2;
			logByType(CharAttributeType.WAI_GONG,combat);
			//气血
			combat2= calAttByType(list,CharAttributeType.MAX_HP) ;
			logByType2(CharAttributeType.MAX_HP,combat2);
			combat +=combat2;
			logByType(CharAttributeType.MAX_HP,combat);
			//闪避率
			combat2= calAttByType(list,CharAttributeType.MISS) ;
			logByType2(CharAttributeType.MISS,combat2);
			combat +=combat2;
			logByType(CharAttributeType.MISS,combat);
			//暴击率
			combat2= calAttByType(list,CharAttributeType.CRIT_PER) ;
			logByType2(CharAttributeType.CRIT_PER,combat2);
			combat +=combat2;
			logByType(CharAttributeType.CRIT_PER,combat);
			//内功
			combat2= calAttByType(list,CharAttributeType.NEI_GONG) ;
			logByType2(CharAttributeType.NEI_GONG,combat2);
			combat +=combat2;
			logByType(CharAttributeType.NEI_GONG,combat);
			//防御百分比
			combat2= calAttByType(list,CharAttributeType.DEFENSE_PER) ;
			logByType2(CharAttributeType.DEFENSE_PER,combat2);
			combat +=combat2;
			logByType(CharAttributeType.DEFENSE_PER,combat);
			//命中率
			combat2= calAttByType(list,CharAttributeType.HIT) ;
			logByType2(CharAttributeType.HIT,combat2);
			combat +=combat2;
			logByType(CharAttributeType.HIT,combat);
			//暴击伤害
			combat2= calAttByType(list,CharAttributeType.CRIT) ;
			logByType2(CharAttributeType.CRIT,combat2);
			combat +=combat2;
			logByType(CharAttributeType.CRIT,combat);
			combat= Math.round(combat);
			log("最终前端计算战斗力:"+combat);
			return Math.round(combat);
		}
		
		
		private static function logByType2(type:int,value:Number):void
		{
			if(!debug){
				return;
			}
			Log.debug("二级属性"+type+"_"+CharAttributeType.getCNName(type)+"计算之后:"+value);
		}
		private static function logByType(type:int,value:Number):void
		{
			if(!debug){
				return;
			}
			Log.debug("叠加计算"+CharAttributeType.getCNName(type)+"计算之后:"+value);
		}
		
		private static function log(des:String):void
		{
			if(!debug){
				return;
			}
			Log.debug(des);
		}
		
		private static function calAttByType(list:Vector.<Number>,type:int):Number
		{
			var baseNum:Number=calMap.getValue(type);
			if(!baseNum||baseNum==0){
				return 0;
			}
				
			return list[type]/calMap.getValue(type);
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
			var equipAtt:Q_att_values=AttValueConfig.getAttInfoById(equip.qItem.q_att_type);
			if(!equipAtt){
				return 0;
			}
			
			
			var maps:HashMap=AttValueConfig.getTypeValueMap(equipAtt);
			
			var polishLv:int=equip.polishLevel;//琢磨等级
			var calNum:int=BASE_NUM;
			var curPolishValue:int=calNum;
			if(polishLv!=0){
				var polishCfg:Q_equip_polish=EquipPolishCfg.getPolishCfg(polishLv);
				if(polishCfg){
					curPolishValue+=polishCfg.q_promote;
				}
			}
			
			var newValue:int;
			var keys:Array=maps.keys();
			var key:int;
			for each (key in keys) 
			{
				newValue=maps.getValue(key);
				newValue=(newValue*curPolishValue)/calNum;
				maps.put(key,newValue);
			}
			
			var strenLv:int=equip.strengthLevel;//强化等级
			var tempMap:HashMap;
			if(strenLv!=0){
				var strenCfg:Q_equip_strength=EquipStrengthCfg.getStrengthCfg(equip.qItem.q_kind,equip.qItem.q_job,equip.strengthLevel);
				if(strenCfg){
					var strenAtt:Q_att_values=AttValueConfig.getAttInfoById(strenCfg.q_att_type);
					if(strenAtt){
						tempMap=AttValueConfig.getTypeValueMap(strenAtt);
						for each (key in keys) 
						{
							newValue=tempMap.getValue(key);
							newValue=maps.getValue(key)+(newValue*curPolishValue)/calNum;
							maps.put(key,newValue);
						}
					}
				}
			}
			
			var washCfg:Q_equip_wash_attr=EquipWashAttCfg.getEquipWashAttr(equip.smeltAtt1);
			var washAtt:Q_att_values;
			if(washCfg){
				washAtt=AttValueConfig.getAttInfoById(washCfg.q_attr_id);
				if(washAtt){
					tempMap=AttValueConfig.getTypeValueMap(washAtt);
					keys=tempMap.keys();
					for each (key in keys) 
					{
						newValue=tempMap.getValue(key);
						if(newValue!=0){
							if(maps.get(key)){
								newValue=newValue+maps.getValue(key);
							}
							maps.put(key,newValue);
						}
					}
				}
			}
			
			washCfg=EquipWashAttCfg.getEquipWashAttr(equip.smeltAtt2);
			if(washCfg){
				washAtt=AttValueConfig.getAttInfoById(washCfg.q_attr_id);
				if(washAtt){
					tempMap=AttValueConfig.getTypeValueMap(washAtt);
					keys=tempMap.keys();
					for each (key in keys) 
					{
						newValue=tempMap.getValue(key);
						if(newValue!=0){
							if(maps.get(key)){
								newValue=newValue+maps.getValue(key);
							}
							maps.put(key,newValue);
						}
					}
				}
			}
			
			result=calFightPowerByHash(maps,equip.qItem.q_job);
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
		
		private static function calFistAtrributeFightPower(proplist:Vector.<Number>,job:int,type:int):Number
		{
			var ret:Number=0;
			var jobType:String = job+"_"+type;
			var base:int = proplist[type];
			var qTrans:Q_att_transfer=AttFormulaConfig.getAttrTrans(jobType);
			
			ret=base*(qTrans?qTrans.q_fight_power:0)/BASE_NUM;
			return ret;
		}
	}
}