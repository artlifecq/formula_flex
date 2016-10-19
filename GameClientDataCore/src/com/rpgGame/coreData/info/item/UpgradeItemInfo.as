package com.rpgGame.coreData.info.item
{
	/**
	 *
	 * 扣物品信息
	 * @author fly.liuyang
	 * 创建时间：2014-11-10 上午11:05:53
	 * 
	 */
	public class UpgradeItemInfo
	{
		public var index:int;
		public var cfgId:int;
		public var expirtime:int;
		public var costCount:int;
		
		public function UpgradeItemInfo()
		{
		}
		
		public function get tag():String
		{
			return cfgId+"_"+expirtime;
		}
		
	}
}