package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.cost.CostCheckManager;
	import com.rpgGame.app.sender.CountryWarSender;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.info.cost.CostInfo;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarRankData;
	
	import app.message.SelfCountryWarInfoProto;
	
	/**
	 * 国战中跟自己相关信息管理
	 * GuoDong.Zhang
	 * 2016-8-8
	 */
	public class CountryWarSelfRelatedManager
	{
		/**自己国战击杀人数**/
		public static var selfKillCount:int = 0;
		/**自己国家排行信息*/
		public static var selfCountryRankDataVect:Vector.<CountryWarRankData>;
		/**自己国家的国战积分*/
		public static var selfCountryScore:Number = 0;
		/**自己的国战信息*/
		public static var selfInfo:SelfCountryWarInfoProto;
		
		private static var _upgradeCostChecker : CostCheckManager;
		
		public static function tryJoinCountryWar():void
		{
			if(_upgradeCostChecker == null)
			{
				_upgradeCostChecker = new CostCheckManager(onUpgradeCostCheckComplete);
				_upgradeCostChecker.setUpgradeCost(CountryWarCfgData.joinCountryWarCostInfo);
			}
			_upgradeCostChecker.checkCost();
		}
		
		private static function onUpgradeCostCheckComplete(isPass : Boolean, cost : CostInfo = null, lackNum : int = 0) : void
		{
			if (isPass)
			{
				CountryWarSender.reqJoinCountryWar(_upgradeCostChecker.getBytes());
			}
			else
			{
				
			}
		}

	}
}