package com.rpgGame.coreData.cfg
{
	

	public class TradeCfgData
	{
		public function TradeCfgData()
		{
		}
		/**交易最大能够交易的物品数量**/
		public static var tradeGoodsLimit : int;
		/**交易邀请过期时长**/
		public static var tradeInviteExpireTime : Number;
		/**交易最大距离**/
		public static var tradeMaxDistance : int;
//		public static function setup(cfg:TradeConfig):void
//		{
//			tradeGoodsLimit = cfg.tradeGoodsLimit;
//			tradeInviteExpireTime = cfg.tradeInviteExpireTime?cfg.tradeInviteExpireTime.toNumber():0;
//			tradeMaxDistance = cfg.tradeMaxDistance;
//		}
	}
}