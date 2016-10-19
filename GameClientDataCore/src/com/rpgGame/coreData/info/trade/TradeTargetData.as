package com.rpgGame.coreData.info.trade
{
	/**
	 * 交易目标的信息 
	 * @author Mandragora
	 * 
	 */	
	public class TradeTargetData
	{
		public var playerId : Number;
		public var playerName : String;
		public var level:int;
		/**
		 * 是否锁定 
		 */		
		public var isLock : Boolean;
		/**
		 * 是否确认了 
		 */		
		public var isSure : Boolean;
		/**过期时间**/
		public var timeOut : Number;
		public function TradeTargetData()
		{
		}
	}
}