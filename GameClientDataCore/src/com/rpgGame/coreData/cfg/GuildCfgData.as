package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import app.message.GuildLevelDatasProto.GuildLevelDataProto;
	import app.message.GuildOfficerDatasProto.GuildOfficerDataProto;
	
	import org.client.mainCore.ds.HashMap;

	public class GuildCfgData
	{
		public function GuildCfgData()
		{
		}
		
		/**等级数据**/
		private static var _guildlevel : HashMap;
		
		public static function setupGuildInfo( data:ByteArray ):void
		{
			_guildlevel = new HashMap();
			var arr : Array = data.readObject();
			for each(var info :Q_guild in arr) {
				_guildlevel.add(info.q_level,info);
			}
		}
		
		/**
		 * 根据等级获取帮会等级配置 
		 * @param level
		 * @return 
		 * 
		 */
		public static function getLevelInfo(level:int):Q_guild
		{
			return _guildlevel.getValue(level) as Q_guild;
		}
		
		private static var _guildPermission : HashMap;
		
		public static function setupGuildPermissionInfo( data:ByteArray ):void
		{
			_guildPermission = new HashMap();
			var arr : Array = data.readObject();
			for each(var info :Q_guild_permission in arr) {
				_guildPermission.add(info.q_id,info);
			}
		}
		
		/**
		 * 根据职务等级获取职务权限配置
		 * @param level
		 * @return 
		 * 
		 */
		public static function getPermissionInfo(post:int):Q_guild_permission
		{
			return _guildPermission.getValue(post) as Q_guild_permission;
		}
		
	}
}