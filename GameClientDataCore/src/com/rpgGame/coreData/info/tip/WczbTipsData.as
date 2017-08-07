package com.rpgGame.coreData.info.tip
{
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;

	/**
	 *王城争霸tips数据 
	 * @author dik
	 * 
	 */
	public class WczbTipsData
	{
		public var cityInfo:GuildWarCityInfo;
		public var rewardState:int;
		public var nextTime:int;
		public var isOwner:Boolean;
		public var isHczb:Boolean;
		public function WczbTipsData()
		{
		}
	}
}