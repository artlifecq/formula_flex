package com.rpgGame.coreData.info.country
{
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	
	import app.message.CountryMemberProto;
	import app.message.CountryOfficerPos;
	import app.message.ModelProto;
	import app.message.OfficerMemberProto;

	/**
	 * 国家官职数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-17 下午6:50:25
	 *
	 */
	public class CountryGovernmentPostData
	{
		/**
		 * ID
		 */
		public var id : Number = 0;
		/**
		 * 官职
		 */
		public var governmentPost : int;
		/**
		 * 序号
		 */
		public var index : int;
		/**
		 * 玩家名称
		 */
		public var playerName : String;
		/**
		 * 家族名字
		 */
		public var familyName : String;
		/**
		 * 是否在线，为true表示在线，false读取下面的离线时间
		 */
		public var isOnline : Boolean;
		/**
		 * 离线时间，时间戳
		 */
		public var lastOfflineTime : Number;
		/**
		 * 等级
		 */
		public var level : int;
		/**
		 * 战斗力
		 */
		public var fightingAmount : Number;
		/**
		 * 外观
		 */
		public var equipmentResources : Number;
		/**
		 * 外观 
		 */		
		public var model:ModelProto;
		/**上任时间戳**/
		public var takeOfficeTime : Number;
		/**禁卫军申请过期时间**/
		public var timeOut : Number;
		
		public var guildName : String;

		public function CountryGovernmentPostData()
		{
		}

		public function setConfig(pos : int, cfg : OfficerMemberProto) : void
		{
			governmentPost = pos;
			if(!cfg.data)
			{
				clear();
				return;
			}
			id = cfg.data.id?cfg.data.id.toNumber():0;
			playerName =  cfg.data.name?cfg.data.name.toString():"";
			familyName = cfg.data.familyName?cfg.data.familyName.toString():"";
			isOnline = cfg.data.isOnline;
			index = cfg.memIdx;
			lastOfflineTime = cfg.data.lastOfflineTime ? cfg.data.lastOfflineTime.toNumber() : 0;
			takeOfficeTime = cfg.takeOfficeTime?cfg.takeOfficeTime.toNumber():0;
			guildName = cfg.data.guildName;
		}

		public function get governmentName() : String
		{
			return CountryOfficerCfgData.getData(governmentPost).posName;
		}

		/**
		 * 清除
		 */
		public function clear() : void
		{
			id = 0;
			playerName = "";
			familyName = "";
			guildName = "";
			level = 0;
			fightingAmount = 0;
			isOnline = false;
			lastOfflineTime = 0;
			id = 0;
		}

		public function setConfigIsMember(cfg : CountryMemberProto,isKing :Boolean = true) : void
		{
			governmentPost = isKing?CountryOfficerPos.POS_KING:CountryOfficerPos.POS_JIN_WEI;
			id = cfg.id?cfg.id.toNumber():0;
			playerName = cfg.name?cfg.name.toString():"";
			familyName = cfg.familyName?cfg.familyName.toString():"";
			level = cfg.level;
			fightingAmount = cfg.fightingAmount ? cfg.fightingAmount.toNumber() : 0;
//			equipmentResources = cfg.equipmentResources ? cfg.equipmentResources.toNumber() : 0;
			model = cfg.model;
			isOnline = cfg.isOnline;
			guildName = cfg.guildName?cfg.guildName:"";
			lastOfflineTime = cfg.lastOfflineTime ? cfg.lastOfflineTime.toNumber() : 0;
		}
		
		public function setDontTalkTimes():int
		{
			return CountryOfficerCfgData.getData(governmentPost).canSetDontTalkTimes;
		}
	}
}
