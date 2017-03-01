package com.rpgGame.app.manager.fight
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.AttFormulaConfig;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.clientConfig.ClientAttFormula;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;

	/**
	 *战力换算工具 
	 * @author dik
	 * 
	 */
	public class FightValueUtil
	{
		private static const BASE_NUM:uint=100000;
		
		public function FightValueUtil()
		{
		}
		
		/**
		 *获取装备战斗力
		 * @return 
		 * 
		 */
		public static function getFightValueByEquip(itemInfo:ClientItemInfo):uint
		{
			var qItem:Q_item=itemInfo.qItem;
			var job:int=qItem.q_job;
			var sex:int=qItem.q_sex;
			var attId:int=int(qItem.q_att_type);
			var findJob:int;
			if(job==1){
				findJob=sex==1?1:5;
			}
			if(job==2){
				findJob=sex==1?2:3;
			}
			if(job==3){
				findJob=4;
			}
			
			var info:HeroData=MainRoleManager.actorInfo;
			if(job==0){//直接取角色的职业了
				findJob=info.job;
			}
			
			var waiGong:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.WAI_GONG);//外功
			if(findJob==1||findJob==5){//兵家
				waiGong+=level1ToLevel2(attId,findJob,CharAttributeType.LIDAO,CharAttributeType.WAI_GONG);
			}
			if(job==2||job==3){//墨家
				waiGong+=level1ToLevel2(attId,findJob,CharAttributeType.LIDAO,CharAttributeType.WAI_GONG);
			}
			
			var fangYu:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.DEFENSE_PER);//防御百分比
			fangYu+=level1ToLevel2(attId,findJob,CharAttributeType.GENGU,CharAttributeType.DEFENSE_PER);
			
			var qiXue:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.MAX_HP);//气血
			qiXue+=level1ToLevel2(attId,findJob,CharAttributeType.GENGU,CharAttributeType.MAX_HP);
			
			var mingZhong:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.HIT);//命中率
			if(findJob!=3){
				mingZhong+=level1ToLevel2(attId,findJob,CharAttributeType.LIDAO,CharAttributeType.HIT);
			}else{
				mingZhong+=level1ToLevel2(attId,findJob,CharAttributeType.HUIGEN,CharAttributeType.HIT);
			}
			
			var shanBi:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.MISS);//闪避率
			shanBi+=level1ToLevel2(attId,findJob,CharAttributeType.SHENFA,CharAttributeType.MISS);
			
			var moFa:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.NEI_GONG);//魔法攻击力
			if(findJob==3){
				moFa+=level1ToLevel2(attId,findJob,CharAttributeType.HUIGEN,CharAttributeType.NEI_GONG);
			}
			
			var baoJiLv:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.CRIT_PER);//暴击率
			baoJiLv+=level1ToLevel2(attId,findJob,CharAttributeType.SHENFA,CharAttributeType.CRIT_PER);
			
			var baoJi:Number=AttValueConfig.getQattValueByType(attId,CharAttributeType.CRIT);//暴击伤害
			baoJi+=level1ToLevel2(attId,findJob,CharAttributeType.SHENFA,CharAttributeType.CRIT);
			
			var fight:Number=waiGong/1+fangYu/0.004+qiXue/7+mingZhong/0.004+shanBi/0.004+moFa/0.8+baoJiLv/0.004+baoJiLv/0.008;
			fight=uint(fight);
			return fight;
		}
		
		private static function getFormulaValue(job:int,type:int,findType:int):uint
		{
			var jobType:String=job+"_"+type;
			var list:Vector.<ClientAttFormula>=AttFormulaConfig.getAttFormula(jobType);
			for each(var formula:ClientAttFormula in list){
				if(formula.type==findType){
					return formula.value;
				}
			}
			return 0;
		}
		
		
		/**
		 *一级属性值转二级属性值 
		 * @param attId
		 * @param attType
		 * @return 
		 * 
		 */
		private static function level1ToLevel2(attId:int,job:int,type:int,toType:int):Number
		{
			var formulaValue:uint=getFormulaValue(job,type,toType);
			var value:int=AttValueConfig.getQattValueByType(attId,toType);
			return value*(formulaValue/BASE_NUM);
		}
	}
}