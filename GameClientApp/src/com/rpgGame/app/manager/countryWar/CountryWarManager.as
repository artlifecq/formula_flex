package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.CountryWarSender;
	import com.rpgGame.core.events.country.CountryWarEvent;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	
	import app.message.CountryWarDataProto;
	import app.message.CountryWarProto;
	import app.message.CountryWarRecordProto;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 国战数据管理
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarManager
	{
		
		/**要进行的国战信息列表*/
		public static var wars : Array;
		/**国战历史记录信息列表*/
		public static var recentRecords : Array;
		

		public function CountryWarManager()
		{
			
		}

		/**当前正在进行的国战信息*/
		public static function getCurrentWarInfo():CountryWarInfoData
		{
			if (wars)
			{
				var len : int = wars.length;
				for (var i : int = 0; i < len; i++)
				{
					var countryWar : CountryWarInfoData = wars[i];
					if (countryWar.warStartTime <= SystemTimeManager.curtTm && countryWar.warEndTime >= SystemTimeManager.curtTm)
					{
						return countryWar;
					}
				}
			}
			return null;
		}
		
		/**
		 * 获取自己国家未进行或者正在进行的国战信息
		 * @return 返回null表示自己国家还没有宣战或者被宣战
		 * 
		 */
		public static function getSelfCountryWarInfo():CountryWarInfoData
		{
			var warRecord:CountryWarInfoData;
			if (wars)
			{
				var selfCountry:int = MainRoleManager.actorInfo.countryId;
				var len : int = wars.length;
				for (var i : int = 0; i < len; i++)
				{
					var countryWar : CountryWarInfoData = wars[i];
					if (countryWar.attackCountry == selfCountry || countryWar.defenceCountry == selfCountry)
					{
						warRecord = countryWar;
						break;
					}
				}
			}
			return warRecord;
		}
		
		/**
		 * 获取自己国家国战的敌对国家名称
		 * @return 
		 * 
		 */
		public static function getSelfEnemyCountryName():String
		{
			var enemyName:String;
			var selfCountryWarInfo:CountryWarInfoData = getSelfCountryWarInfo();
			if(selfCountryWarInfo)
			{
				var enemyCountry:int;
				if(selfCountryWarInfo.attackCountry == MainRoleManager.actorInfo.countryId)
				{
					enemyCountry = selfCountryWarInfo.defenceCountry;
				}
				else if(selfCountryWarInfo.defenceCountry == MainRoleManager.actorInfo.countryId)
				{
					enemyCountry = selfCountryWarInfo.attackCountry;
				}
				enemyName = CountryManager.getCountryName(enemyCountry);
			}
			return enemyName;
		}
		
		/**
		 * 尝试宣战某国
		 * @param country
		 * 
		 */
		public static function tryToDeclareWarToCountry(country:int):void
		{
			var currentDate:Date = SystemTimeManager.sysDateTime;
			var currentHours:int = currentDate.hours;
			if(currentHours < 8)
			{
				NoticeManager.mouseFollowNotify("每日8:00-24:00可对他国宣战");
				return;
			}
			if(CountryManager.selfCountryData.exchequer.amount < CountryWarCfgData.declareMoneyCost)
			{
				NoticeManager.mouseFollowNotify("宣战需要消耗国库资金100锭");
				return;
			}
			CountryWarSender.reqCountryWarInfo(country);
		}
		
		public static function setCountryWarInfo(warDataProto : CountryWarDataProto) : void
		{
			var infoData : CountryWarInfoData;
			wars = [];
			for each (var countryWar : CountryWarProto in warDataProto.wars)
			{
				infoData = new CountryWarInfoData();
				infoData.setCountryWarConfig(countryWar);
				wars.push(infoData);
			}
			wars.sort(sortWarInfo);

			recentRecords = [];
			for each (var warRecord : CountryWarRecordProto in warDataProto.recentRecords)
			{
				infoData = new CountryWarInfoData();
				infoData.setRecentRecordsConfig(warRecord);
				recentRecords.push(infoData);
			}
			recentRecords.sort(onSortRecentRecords);
			EventManager.dispatchEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE);
		}

		public static function setCountryWarRecords(records : Array) : void
		{
			var infoData : CountryWarInfoData;
			recentRecords = [];
			for each (var warRecord : CountryWarRecordProto in records)
			{
				infoData = new CountryWarInfoData();
				infoData.setRecentRecordsConfig(warRecord);
				recentRecords.push(infoData);
			}
			recentRecords.sort(onSortRecentRecords);
			EventManager.dispatchEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE);
		}

		private static function sortWarInfo(countryWarA : CountryWarInfoData, countryWarB : CountryWarInfoData) : int
		{
			if (countryWarA.warStartTime > countryWarB.warStartTime)
				return 1;
			else if (countryWarA.warStartTime < countryWarB.warStartTime)
				return -1;
			return 0;
		}

		private static function onSortRecentRecords(warRecordProtoA : CountryWarInfoData, warRecordProtoB : CountryWarInfoData) : int
		{
			if (warRecordProtoA.warEndTime < warRecordProtoB.warEndTime)
				return 1;
			else if (warRecordProtoA.warEndTime > warRecordProtoB.warEndTime)
				return -1;
			return 0;
		}

		public static function countryWarEnd(attackCountry:int,defenceCountry:int,winCountry:int):void
		{
			if(defenceCountry == winCountry)
			{
				var attackCountryName:String = CountryManager.getCountryName(attackCountry);
				var defenceCountryName:String = CountryManager.getCountryName(defenceCountry);
				NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_14,[defenceCountryName,attackCountryName,defenceCountryName]);
			}
			var i : int;
			var len : int;
			var warRecord:CountryWarInfoData;
			if (wars)
			{
				len = wars.length;
				for (i = 0; i < len; i++)
				{
					var countryWar : CountryWarInfoData = wars[i];
					if (countryWar.attackCountry == attackCountry && countryWar.defenceCountry == defenceCountry && countryWar.warStartTime < SystemTimeManager.curtTm)
					{
						warRecord = countryWar;
						wars.splice(i, 1);
						break;
					}
				}
			}
			if(warRecord == null)
			{
				warRecord = new CountryWarInfoData();
				warRecord.attackCountry = attackCountry;
				warRecord.defenceCountry = defenceCountry;
			}
			warRecord.warEndTime = SystemTimeManager.curtTm;
			
			recentRecords.push(warRecord);
			recentRecords.sort(onSortRecentRecords);
			EventManager.dispatchEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE);
		}
		
		/**
		 * 宣战成功，客户端把该国战加入国战列表
		 *
		 * varint32 攻击国
		 * varint32 防御国
		 * varint64 开始时间
		 */
		public static function addWarInfo(warData:CountryWarInfoData) : void
		{
			wars.push(warData);
			wars.sort(sortWarInfo);
			EventManager.dispatchEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE);
		}
	}
}
