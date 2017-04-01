package com.rpgGame.coreData.cfg.role
{
	import app.message.AllBloodConfig;
	import app.message.BloodLineProto;
	import app.message.BloodSkillProto;

	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-13 上午11:42:07
	 */
	
	public class XueWenCfgData
	{
		/**最大的血纹模型ID*/
		public static var maxModelID:int = 0;
		
		/**血纹强化洗练相关配置*/
		private static var bloodLineDataVec:Vector.<BloodLineData>;
		/**血纹技能属性配置*/
		private static var bloodSkillDataVec:Vector.<BloodSkillData>;
		
		/**方案需银两cost*/
		public static var planCostAry:Array;
		
		/**评级对应关系：  100,普通<p>200,优秀<p>500,精良<p>1000,史诗 ......*/
		public static var rate:Array;
		
		public static function setConfig( config:AllBloodConfig ):void
		{
			bloodLineDataVec = new Vector.<BloodLineData>();
			bloodSkillDataVec = new Vector.<BloodSkillData>();
			planCostAry = [];
			
			if(!config)
				return;
			if(config.bloodLineProto)
			{
				for each (var bloodLineProto:BloodLineProto in config.bloodLineProto) 
				{
					var bloodLineData:BloodLineData = new BloodLineData();
					bloodLineData.setConfig(bloodLineProto);
					bloodLineDataVec.push(bloodLineData);
					
					if(maxModelID < bloodLineData.resourceId)
					{
						maxModelID = bloodLineData.resourceId;
					}
				}
			}
			
			if(config.bloodSkillProto)
			{
				for each (var bloodSkillProto:BloodSkillProto in config.bloodSkillProto) 
				{
					var bloodSkillData:BloodSkillData = new BloodSkillData();
					bloodSkillData.setConfig(bloodSkillProto);
					bloodSkillDataVec.push(bloodSkillData);
				}
			}
			
			if(config.bloodMiscProto)
			{
				planCostAry = config.bloodMiscProto.planCost;	
				rate = config.bloodMiscProto.scoreTitle.split(",");
			}
		}
		
		/**根据血纹ID获取血纹强化洗练配置数据*/
		public static function getBloodLineData(id:int):BloodLineData
		{
			for each (var data:BloodLineData in bloodLineDataVec) 
			{
				if(data.id == id)
				{
					return data;	
				}
			}
			
			return null;
		}
		
		/**根据技能ID获取血纹技能数据*/
		public static function getSkillData(id:int):BloodSkillData
		{
			for each (var data:BloodSkillData in bloodSkillDataVec) 
			{
				if(data.skillId == id)
				{
					return data;	
				}
			}
			return null;
		}
	}
}