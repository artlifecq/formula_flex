package com.rpgGame.coreData.info.crown
{
	import app.message.JinWeiRequiresProto;

	public class CrownJinWeiSetData
	{
		/**
		 * 禁卫设置 
		 * 
		 */		
		public function CrownJinWeiSetData()
		{
		}
		public var level : int;// 等级要求
		public var fightAmount : Number; // 战力要求
		public var fightRank : int;// 战力排行要求
		public var isSelfCountry : Boolean;// 要求本国战力排行
		// 禁卫军要求
		public function setConfig(cfg:JinWeiRequiresProto):void
		{
			level = cfg.level;
			fightAmount = cfg.fightingAmount?cfg.fightingAmount.toNumber():0;
			fightRank = cfg.fightingRank;
			isSelfCountry = cfg.isSelfCountry;
		}
	}
}