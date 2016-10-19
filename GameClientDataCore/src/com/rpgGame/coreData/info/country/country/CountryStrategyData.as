package com.rpgGame.coreData.info.country.country
{
	import app.message.CountryStrategyProto;

	public class CountryStrategyData
	{
		/**夺经结束时间，当当前时间>该时间时，活动结束，否则，在活动中**/
		public var duoJingEndTime:Number;
		/**今天是不是开启了迷信**/
		public var isTodayStartMiXin:Boolean;
		/**今天是不是开启了夺经**/
		public var isTodayStartDuoJing:Boolean;
		/**当前密信目标国家**/
		public var miXinTargetCountry:int;
		/**密信结束时间，当当前时间>该时间时，活动结束，否则，在活动中**/
		public var miXinEndTime:Number;
		/**是否有开启军费补贴**/
		public var hasMilitarySubsiby:Boolean;
		/**今天是否有开启国运**/
		public var isTodayStartGuoYun : Boolean;
		/**国运开启时间**/
		public var guoYunStartTime : Number;
		/**国运结束时间 **/
		public var guoYunEndTime:Number;
		public function CountryStrategyData()
		{
		}
		
		public function setConfig(cfg : CountryStrategyProto) : void
		{
			duoJingEndTime = cfg.hasDuoJingEndTime ? cfg.duoJingEndTime.toNumber() : 0;
			miXinEndTime = cfg.hasMiXinEndTime ? cfg.miXinEndTime.toNumber() : 0;
			isTodayStartMiXin = cfg.isTodayStartMiXin;
			isTodayStartDuoJing = cfg.isTodayStartDuoJing;
			miXinTargetCountry = cfg.miXinTargetCountry;
			
			hasMilitarySubsiby = cfg.hasMilitarySubsiby;
			
			isTodayStartGuoYun = cfg.isTodayStartGuoYun;
			guoYunStartTime = cfg.guoYunStartTime?cfg.guoYunStartTime.toNumber():0;
			guoYunEndTime = cfg.guoYunEndTime?cfg.guoYunEndTime.toNumber():0;
		}
	}
}