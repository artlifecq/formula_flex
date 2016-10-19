package com.rpgGame.coreData.info.country.country
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.lang.LangCountry;
	
	import app.message.CountryMemberProto;
	import app.message.CountryOfficeProto;
	import app.message.CountryOfficerDataProto;
	import app.message.CountryOfficerPos;
	import app.message.CountryPosOfficersProto;
	import app.message.OfficerMemberProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 国家官员数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryOfficeData
	{
		/** 统治力 **/
		public var tongZhiLi : int;
		public var jinweiAnnounment : String;
		public var countryAnnounment : String;
		private var _membersByPos : HashMap;

		public function CountryOfficeData()
		{
			_membersByPos = new HashMap();

			var officerPosArray : Array = CountryOfficerCfgData.getAllData();
			var postData : CountryGovernmentPostData;
			var members : Array;
			for each (var officers : CountryOfficerDataProto in officerPosArray)
			{
				members = [];
				for (var i : int = 0; i < officers.officerCount; i++)
				{
					postData = new CountryGovernmentPostData();
					postData.index = i;
					postData.governmentPost = officers.pos;
					members.push(postData);
				}
				_membersByPos.add(officers.pos, members);
			}
		}

		public function setConfig(cfg : CountryOfficeProto) : void
		{
			tongZhiLi = cfg.tongZhiLi;
			jinweiAnnounment = cfg.jinWeiAnnouncement ? cfg.jinWeiAnnouncement : "";
			countryAnnounment = cfg.countryAnnouncement ? cfg.countryAnnouncement : "";
			var postData : CountryGovernmentPostData;
			for each (var members : Array in _membersByPos.getValues())
			{
				for each (postData in members)
				{
					postData.clear();
				}
			}

			for each (var posOfficersProto : CountryPosOfficersProto in cfg.officers)
			{
				var index : int = 0;
				for each (var memberProto : OfficerMemberProto in posOfficersProto.mem)
				{
					postData = getOfficeByPosAndIndex(posOfficersProto.pos, index);
					postData.setConfig(posOfficersProto.pos, memberProto);
					index++;
				}
			}
		}

		public function getOfficesWithoutJinWeiJun() : Array
		{
			var result : Array = [];
			for each (var member : Array in _membersByPos.getValues())
			{
				for each (var postData : CountryGovernmentPostData in member)
				{
					if (postData.governmentPost != CountryOfficerPos.POS_JIN_WEI)
						result.push(postData);
				}
			}
			result.sortOn(["governmentPost"], [Array.NUMERIC]);
			return result;
		}
		/**获取所有的在职官员**/
		public function getAllOffice():Array
		{
			var result : Array = [];
			for each (var member : Array in _membersByPos.getValues())
			{
				for each (var postData : CountryGovernmentPostData in member)
				{
					if (postData.id)
						result.push(postData);
				}
			}
			result.sortOn(["governmentPost"], [Array.NUMERIC]);
			return result;
		}

		public function getOfficesOnlyJinWeiJun() : Array
		{
			var result : Array = [];
			for each (var member : Array in _membersByPos.getValues())
			{
				for each (var postData : CountryGovernmentPostData in member)
				{
					if (postData.id > 0 && postData.governmentPost == CountryOfficerPos.POS_JIN_WEI)
						result.push(postData);
				}
			}
			result.sortOn(["governmentPost", "index"], [Array.NUMERIC, Array.NUMERIC]);
			return result;
		}

		/**
		 * 通过官职和位置拿数据
		 * @param pos
		 * @param index
		 * @return
		 *
		 */
		public function getOfficeByPosAndIndex(pos : int, index : int) : CountryGovernmentPostData
		{
			var members : Array = _membersByPos.getValue(pos);
			for each (var postData : CountryGovernmentPostData in members)
			{
				if (postData.governmentPost == pos && postData.index == index)
					return postData;
			}
			postData = new CountryGovernmentPostData()
			members.push(postData);
			return postData;
		}
		
		/**
		 * 根据玩家ID拿到官职
		 * @return
		 *
		 */
		public function getOfficeById(id : Number) : CountryGovernmentPostData
		{
			for each (var members : Array in _membersByPos.getValues())
			{
				for each (var postData : CountryGovernmentPostData in members)
				{
					if (postData.id == id)
						return postData;
				}
			}
			return null;
		}

		public function setConfigIsKing(memberProto : CountryMemberProto) : void
		{
			var kingPostData : CountryGovernmentPostData = new CountryGovernmentPostData();
			kingPostData.setConfigIsMember(memberProto);
			var members : Array = [kingPostData];
			_membersByPos.add(CountryOfficerPos.POS_KING, members);
		}

		public function getKing() : CountryGovernmentPostData
		{
			var members : Array = _membersByPos.getValue(CountryOfficerPos.POS_KING) as Array;
			var postData : CountryGovernmentPostData = (members && members.length > 0) ? members[0] : null;
			return postData;
		}

		public function removeKing() : void
		{
			var members : Array = _membersByPos.getValue(CountryOfficerPos.POS_KING) as Array;
			if (members)
				members.length = 0;
		}
	}
}
