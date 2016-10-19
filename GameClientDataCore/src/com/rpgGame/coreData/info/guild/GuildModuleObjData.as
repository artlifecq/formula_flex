package com.rpgGame.coreData.info.guild
{
	public class GuildModuleObjData
	{
		public function GuildModuleObjData()
		{
		}
		/**
		 *今日是否领取了帮派奖励 
		 */		
		public var isCollectGuildPrize : Boolean;
		/**
		 *今日是否领取了王帮奖励 
		 */		
		public var isCollectKingGuildPrize : Boolean;
		/**
		 *当前的帮派贡献度 
		 */		
		public var guildContributionPoint : int;
	}
}