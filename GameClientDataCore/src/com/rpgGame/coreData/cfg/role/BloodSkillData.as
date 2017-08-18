package com.rpgGame.coreData.cfg.role
{
	

	/**
	 * 血纹技能属性配置
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-13 下午12:02:08
	 */
	
	public class BloodSkillData
	{
		/**技能id*/
		public var skillId:int;
		
		/**名称*/
		public var name:String;
		
		/**icon*/
		public var icon:String;
		
		/**技能描述*/
		public var desc:String;
		
		/**技能品质*/
		public var skillQuality:int;
		
		/**技能基础分值*/
		public var skillBaseScore:int;
		
//		public function setConfig(proto:BloodSkillProto):void
//		{
//			skillId = proto.skillId;
//			icon = proto.icon;
//			name = proto.name;
//			desc = proto.desc;
//			skillQuality = proto.skillQuality;
//			skillBaseScore = proto.skillBaseScore;
//		}
	}
}