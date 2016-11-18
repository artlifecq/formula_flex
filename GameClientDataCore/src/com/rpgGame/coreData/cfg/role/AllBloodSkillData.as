package com.rpgGame.coreData.cfg.role
{
	import app.message.PlanSkillObjProto;

	/**
	 * 单个方案的技能proto
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-13 下午3:26:28
	 */
	
	public class AllBloodSkillData
	{
		/**当前血纹skill*/
		public var curSkillAry:Array;//SingleBloodSkillData
		
		/**方案名称*/
		public var schemeName:String;
		
		public function setConfig(proto:PlanSkillObjProto):void
		{
			curSkillAry = [];
			var data:SingleBloodSkillData;
			
			for (var i:int = 0; i < proto.curSkills.length; i++) 
			{
				data = new SingleBloodSkillData();
				data.setData(proto.curSkills[i]);
				curSkillAry.push(data);
			}
			
			schemeName = proto.name;
		}
	}
}