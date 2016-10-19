package com.rpgGame.coreData.info.guild
{
	import com.rpgGame.coreData.cfg.society.SocietyStaticConfigData;
	
	import app.message.GuildFlagProto;
	import app.message.GuildMemberProto;
	import app.message.GuildOfficeProto;
	import app.message.GuildOfficerPos;
	import app.message.GuildPosOfficersProto;
	import app.message.GuildProto;
	import app.message.AllFamilyHallDatasProto.FamilyHallLevelDataProto;

	public class GuildData
	{
		public function GuildData()
		{
		}
		
		public var country : int; // 帮派所属国家
		public var name : String; // 帮派名字
		public var guild_flag : GuildFlagProto;
		/**
		 *公告,可能为空 
		 */		
		public var announcement : String; // 
		/**
		 *所有家族 
		 */		
		public var families : Array; // 
		/**
		 *帮派官员 
		 */		
		public var office : GuildOfficeProto; // 
		/**
		 *帮派仓库 
		 */		
		public var storage : GuildStorageData; // 
		/**
		 * 帮派等级
		 */		
		public var level : int; // 
		
		public function setup(data:GuildProto):void
		{
			country = data.country;
			name = data.name;
			guild_flag = data.guildFlag;
			announcement = data.announcement;
			families = data.families;
			office = data.office;
			storage = new GuildStorageData();
			storage.fanRongDu = data.storage.fanRongDu.toNumber();
			storage.money = data.storage.money.toNumber();
			level = data.level;
		}
		
		public function getFamilyLeaderName(name:String):String
		{
			for each(var guildMember : GuildMemberProto in families)
			{
				if(guildMember && guildMember.familyName == name)
					return guildMember.leaderName;
			}
			return "无";
		}
		/**获取当前在线的人数**/
		public function getAllOnlineMember():int
		{
			var result : int = 0;
			for each(var guildMember : GuildMemberProto in families)
			{
				if(guildMember)
					result += guildMember.onlineMember;
			}
			return result;
		}
		/**获取总的家族人数**/
		public function getAllFamilyMember():int
		{
			var result : int = 0;
			for each(var guildMember : GuildMemberProto in families)
			{
				if(guildMember)
					result += guildMember.familyMember;
			}
			return result;
		}
		/**拿到帮主帮派的名字**/
		public function getGuildMainLeader():String
		{
			for each(var guildOffice : GuildPosOfficersProto in office.officers)
			{
				if(guildOffice. pos == GuildOfficerPos.GUILD_LEADER)
					return guildOffice.leader[0];
			}
			return "没有帮主？";
		}
		
		public function getGuildViceLeader():Array
		{
			for each(var guildOffice : GuildPosOfficersProto in office.officers)
			{
				if(guildOffice. pos == GuildOfficerPos.GUILD_VICE_LEADER)
					return guildOffice.leader;
			}
			return [];
		}
		/**获取帮派能容纳的最大人数**/
		public function getMaxFamilyMemeber():int
		{
			var result : int = 0;
			for each(var guildMember : GuildMemberProto in families)
			{
				if(guildMember)
				{
					var level : FamilyHallLevelDataProto = SocietyStaticConfigData.getBuildHallLevelData(guildMember.familyLevel);
					if(level)
						result += level.capacity;
				}
			}
			return result;
		}
		/**
		 * 这个家族是不是在帮派里面 
		 * @param name
		 * @return 
		 * 
		 */		
		public function getFamilyIsInGuild(name:String):Boolean
		{
			return families.indexOf(name) != -1;
		}
		
		public function clear():void
		{
			name = "";
		}
	}
}