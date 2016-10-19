package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.EquipTypeNameInfo;
	import com.rpgGame.coreData.clientConfig.RaceNameInfo;
	
	import flash.utils.ByteArray;
	
	import app.message.RaceConfig;
	import app.message.RaceDataProto;
	import app.message.SpellProto;
	
	import org.client.mainCore.ds.HashMap;

	public class RaceCfgData
	{

		private static var raceDataMap : HashMap = new HashMap();
		
		private static var raceNameMap : HashMap = new HashMap();

		public function RaceCfgData()
		{
		}
		/**
		 * 设置职业名称 
		 * @param data
		 * 
		 */		
		public static function setup(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			raceNameMap = new HashMap();
			for each (var info : RaceNameInfo in arr)
			{
				raceNameMap.add(info.race, info);
			}
		}

		public static function setConfig(raceConfig : RaceConfig) : void
		{
			if (raceConfig == null)
				return;

			var len : int = raceConfig.races.length;
			var raceDataProto : RaceDataProto;
			for (var i : int = 0; i < len; i++)
			{
				raceDataProto = raceConfig.races[i];
				raceDataMap.add(raceDataProto.race, raceDataProto);
			}
		}

		/**
		 * 得到职业数据
		 * @param raceId
		 * @return
		 *
		 */
		public static function getRaceData(raceId : int) : RaceDataProto
		{
			if (raceDataMap.getValue(raceId) == null)
				return null;

			return raceDataMap.getValue(raceId);
		}
		/**
		 * 获取职业对应的头像 
		 * @param race
		 * @return 
		 * 
		 */		
		public static function getFriendRaceHead(race:int):String
		{
			var info : RaceNameInfo = (raceNameMap.getValue(race) as RaceNameInfo);
			if(info)
				return info.friendAsset;
			return "";
		}

		/**
		 *
		 * @param raceId
		 * @return
		 *
		 */
		public static function getDefaultSpell(raceId : int) : SpellProto
		{
			if (raceDataMap.getValue(raceId) == null)
				return null;
			return (raceDataMap.getValue(raceId) as RaceDataProto).defaultSpell;
		}
		/**
		 *  
		 * @param raceId
		 * @return 
		 * 
		 */		
		public static function getRaceName(raceId : int):String
		{
			if((raceNameMap.getValue(raceId) as RaceNameInfo))
				return (raceNameMap.getValue(raceId) as RaceNameInfo).name;
			return "";
		}
	}
}
