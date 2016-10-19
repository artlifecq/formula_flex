package com.rpgGame.coreData.cfg
{
	import app.message.GuildConfig;
	import app.message.GuildMiscDataProto;
	import app.message.GuildLevelDatasProto.GuildLevelDataProto;
	import app.message.GuildOfficerDatasProto.GuildOfficerDataProto;
	
	import org.client.mainCore.ds.HashMap;

	public class GuildCfgData
	{
		public function GuildCfgData()
		{
		}
		/**帮派杂项数据**/
		public static var guildMiscData : GuildMiscDataProto;
		/**等级数据**/
		public static var guildLevel : HashMap;
		/**官员数据**/
		public static var guildOfficer : HashMap;
		
		public static var createGuildNpc : Number;
		public static function setup(data:GuildConfig):void
		{
			if(!data)
				return;
			guildMiscData = data.miscData;
			setGuildLevel(data.levelDatas.datas?data.levelDatas.datas:null);
			setGuildOffice(data.hasOfficerDatas?data.officerDatas.datas:null);
		}
		public static function setGuildLevel(array:Array):void
		{
			if(!guildLevel)
				guildLevel = new HashMap();
			for each(var level : GuildLevelDataProto in array)
			{
				if(level)
				{
					guildLevel.add(level.level,level);
				}
			}
		}
		
		public static function getGuildLevelData(level:int):GuildLevelDataProto
		{
			return guildLevel?guildLevel.getValue(level):null;
		}
		
		public static function setGuildOffice(array:Array):void
		{
			if(!guildOfficer)
				guildOfficer = new HashMap();
			for each(var level : GuildOfficerDataProto in array)
			{
				if(level)
				{
					guildOfficer.add(level.pos,level);
				}
			}
		}
		
		public static function getGuildOfficeData(pos:int):GuildOfficerDataProto
		{
			return guildOfficer?guildOfficer.getValue(pos):null;
		}
	}
}