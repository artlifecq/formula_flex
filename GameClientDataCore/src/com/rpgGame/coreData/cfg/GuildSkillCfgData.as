package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_guildskill;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	public class GuildSkillCfgData
	{
		/**等级数据**/
		private static var _guildskilllevel : HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			_guildskilllevel = new HashMap();
			var arr : Array = data.readObject();
			for each(var info :Q_guildskill in arr) {
				_guildskilllevel.add(getKey(info.q_skillid,info.q_level),info);
			}
		}
		
		private static function getKey(id:int,level:int):String
		{
			return id.toString()+"_"+level;
		}
		
		public static function getSkill(skillid:int,level:int):Q_guildskill
		{
			return _guildskilllevel.getValue(getKey(skillid,level)) as Q_guildskill;
		}
	}
}