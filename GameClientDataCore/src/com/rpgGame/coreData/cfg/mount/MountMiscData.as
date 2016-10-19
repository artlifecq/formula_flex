package com.rpgGame.coreData.cfg.mount
{
	import app.message.MountMiscDataProto;

	/**
	 * 坐骑杂项data 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountMiscData
	{
		/** 最多能够训练的坐骑数量 **/
		public static var canTraningMountCount:int;
		/** 上下马cd **/
		public static var upOrDownCd:int;
		/** 坐骑等级比他的主人高的等级 **/
		public static var mountLevelCapThanMaster:int;
		/** 坐骑最大饥饿度 **/
		public static var maxHungerDegree:int;
		/** 能够骑乘的等级 **/
		public static var canRideLevel:int;
		/** 能够骑战的等级 **/
		public static var canRideFightLevel:int;
		/** 能够繁育的等级 **/
		public static var canBreedLevel:int;
		/** 只有小于等于该饥饿度时，才能够繁育 **/
		public static var canBreedMaxHungreDegree:int;
		/** 自动下马的饥饿度 **/
		public static var autoDownFromMountHungerDegree:int;
//		/** 速度减半的饥饿度 **/
//		public static var moveSpeedHalfHugerDegree:int;
		/** 强化消耗的绑定银两(refineCostVitalityBase点根骨点消耗refineCostBandMoneyBase银两) **/
		public static var refineCostBnadMonoyBase:int;
		/** 强化消耗的绑定银两跟根骨的比例(refineCostVitalityBase点根骨点消耗refineCostBandMoneyBase银两) **/
		public static var refineCostVitalityBase:int;
		/** 继承坐骑技能的时候,每个技能要消耗多少绑银 **/
		public static var inhertPerSpellCostBandMonry:int;
		
		
		public function MountMiscData()
		{
		}
		
		/**
		 * 设置坐骑杂项数据
		 * @param config
		 * 
		 */		
		public static function setConfig( config:MountMiscDataProto ):void
		{
			if( config == null )
				return;
			
			canTraningMountCount = config.canTraningMountCount;
			upOrDownCd = config.upOrDownCd;
			mountLevelCapThanMaster = config.mountLevelCapThanMaster;
			maxHungerDegree = config.maxHungerDegree;
			canRideLevel = config.canRideLevel;
			canRideFightLevel = config.canRideFightLevel;
			canBreedLevel = config.canBreedLevel;
			canBreedMaxHungreDegree = config.canBreedMaxHungreDegree;
			autoDownFromMountHungerDegree = config.autoDownFromMountHungerDegree;
//			moveSpeedHalfHugerDegree = config.;
			refineCostBnadMonoyBase = config.refineCostBandMoneyBase;
			refineCostVitalityBase = config.refineCostVitalityBase;
			inhertPerSpellCostBandMonry = config.inheritPerSpellCostBandMoney;
		}
	}
}