package com.rpgGame.coreData.cfg.role
{
	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-9-13 下午3:31:02
	 */
	
	public class SingleBloodSkillData
	{
		/**技能Id*/
		public var bloodSkillId:int;
		/**血纹技能随机分值 --(固定分客户端自己取表)*/
		public var randomScore:int;
		/**随机属性*/
//		public var randomStat:SpriteStatProto;
		/**最小值*/
		public var minValue:Number;
		/**最大值*/
		public var maxValue:Number;
		
//		public function setData(data:BloodSkillObjProto):void
//		{
//			bloodSkillId = data.bloodSkillId;
//			randomScore = data.randomScore;
//			randomStat = data.randomStat;
//			minValue = data.minValue.toNumber();
//			maxValue = data.maxValue.toNumber();
//		}
	}
}