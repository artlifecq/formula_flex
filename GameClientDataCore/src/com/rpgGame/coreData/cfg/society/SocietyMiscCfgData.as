package com.rpgGame.coreData.cfg.society
{
	

	/**
	 *
	 * 帮派杂项配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-01 上午10:30:12
	 *
	 */
	public class SocietyMiscCfgData
	{
		/** 创建家族所需银两 **/
		public static var familyCreateMoney : int;
		/** 创建家族所需要的物品 **/
		public static var familyCreateGoods : int;
		/** 捐献用的令牌物品 **/
		public static var donateGoodsId : int;
		/** 捐献银子捐献的基础值 **/
		public static var donateMoneyBase : int;
		/** 捐献1个建设令牌的消耗 **/
//		public static var donateGoodsUpgradeData : UpgradeProto;
		/** 帮派神兽副本开启的时间开始时间[从0点开始计时，当天0点就是0] **/
		public static var animalBarDungeonStartTime : Number;
		/** 帮派神兽副本开启的时间结束时间，同上 **/
		public static var animalBarDungeonEndTime : Number;

		public function SocietyMiscCfgData()
		{
		}

//		public static function setConfig(cfg : FamilyMiscProto) : void
//		{
//			familyCreateMoney = cfg.familyCreateMoney;
//			familyCreateGoods = cfg.familyCreateGoods;
//			donateGoodsId = cfg.donateGoodsId;
//			donateMoneyBase = cfg.donateMoneyBase;
//			donateGoodsUpgradeData = cfg.donateGoodsUpgradeData;
//			animalBarDungeonStartTime = cfg.familyAnimalBarDungeonStartTime ? cfg.familyAnimalBarDungeonStartTime.toNumber() : 0;
//			animalBarDungeonEndTime = cfg.familyAnimalBarDungeonEndTime ? cfg.familyAnimalBarDungeonEndTime.toNumber() : 0;
//		}
	}
}
