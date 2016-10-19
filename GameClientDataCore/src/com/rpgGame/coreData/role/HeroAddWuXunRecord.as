package com.rpgGame.coreData.role
{
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto;

	/**
	 *
	 * 英雄获得武勋日志
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class HeroAddWuXunRecord
	{
		/** 时间 **/
		public var time : Number;
		/** 击杀获得的武勋 **/
		public var killAddAmount : int;
		/** 其他途径获得的武勋 **/
		public var otherAddAmount : int;

		public function HeroAddWuXunRecord()
		{
		}

		public function setConfig(cfg : AddWuXunRecordProto) : void
		{
			time = cfg.time.toNumber();
			killAddAmount = cfg.killAddAmount?cfg.killAddAmount.toNumber():0;
			otherAddAmount = cfg.otherAddAmount?cfg.otherAddAmount.toNumber():0;
		}
	}
}
