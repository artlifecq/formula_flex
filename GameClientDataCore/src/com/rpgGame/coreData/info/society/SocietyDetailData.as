package com.rpgGame.coreData.info.society
{
	import com.netease.protobuf.Int64;
	
	import flash.utils.Dictionary;
	
	import app.message.FamilyMemberProto;
	import app.message.FamilyOfficerPos;
	import app.message.FamilySharedProto;
	import app.message.FamilyOfficeProto.FamilyPosOfficersProto;
	
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 *
	 * 帮派详细数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-02 上午10:30:12
	 *
	 */
	public class SocietyDetailData
	{
		/** 国家 **/
		public var country : int;
		/** 创建时间 **/
		public var createTime : Number;
		/** 帮派名 **/
		public var societyName : String;
		/** 等级 **/
		public var level : int;
		/** 成员 **/
		private var _members : Array;
		/** 公告 **/
		public var announcement : String;
		/** 帮派银两 需要乘上基础值！**/
		public var buildMoneyCount : Number;
		/** 帮派令牌 **/
		public var buildTokenCount : Number;
		/** 是否自动接受入族申请 **/
		public var isAutoAcceptJoinRequest : Boolean;
		/** 家族大厅等级 **/
		public var hallLevel : int;
		/** 家族书院等级 **/
		public var collageLevel : int;
		/** 家族镖局等级 **/
		public var biaoLevel : int;
		/** 家族兽栏等级 **/
		public var animalBarLevel : int;
		/** 神兽副本开启时间，非0表示已经开启了 **/
		public var animalBarStartTime : Number;
		/** 神兽副本结束时间，可能当前时间<end_time，这时候还没有结束，还是可以进副本的 **/
		public var animalBarEndTime : Number;
		/** 神兽Boss等级 **/
		public var animalBarBossLevel : int;
		/** 帮派名字 **/
		public var guildName : String;

		public function SocietyDetailData()
		{
			super();
		}

		public function setConfig(cfg : FamilySharedProto) : void
		{
			country = cfg.country;
			createTime = cfg.createTime ? cfg.createTime.toNumber() : 0;
			societyName = BytesUtil.bytes2UTF(cfg.familyName);
			level = cfg.hallLevel;
			announcement = cfg.announcement ? cfg.announcement.content : "";
			buildMoneyCount = (cfg.storageStat && cfg.storageStat.money) ? cfg.storageStat.money.toNumber() : 0;
			buildTokenCount = (cfg.storageStat && cfg.storageStat.familyBuildToken) ? cfg.storageStat.familyBuildToken.toNumber() : 0;
			isAutoAcceptJoinRequest = cfg.isAutoAcceptJoinRequest;
			hallLevel = cfg.hallLevel;
			collageLevel = cfg.collageLevel;
			biaoLevel = cfg.biaoLevel;
			animalBarLevel = cfg.animalBarLevel;
			animalBarStartTime = (cfg.animalBarStat && cfg.animalBarStat.startTime) ? cfg.animalBarStat.startTime.toNumber() : 0;
			animalBarEndTime = (cfg.animalBarStat && cfg.animalBarStat.endTime) ? cfg.animalBarStat.endTime.toNumber() : 0;
			animalBarBossLevel = cfg.animalBarStat ? cfg.animalBarStat.animalBarLevel : animalBarLevel; //没有兽栏信息，即第一次没打过。
			guildName = cfg.guildName;
			var posById : Dictionary = new Dictionary();
			if (cfg.office)
			{
				for each (var familyOfficersProto : FamilyPosOfficersProto in cfg.office.officers)
				{
					for each (var memberId : Int64 in familyOfficersProto.leaderId)
					{
						posById[memberId.toNumber()] = familyOfficersProto.pos;
					}
				}
			}

			_members = [];
			for each (var memberProto : FamilyMemberProto in cfg.members)
			{
				var posValue : * = posById[memberProto.id.toNumber()];
				var pos : int = posValue == null ? int.MAX_VALUE : int(posValue);
				var memberData : SocietyMemberData = new SocietyMemberData();
				memberData.setConfig(pos, memberProto);
				_members.push(memberData);
			}
			_members.sort(onSortMemberDatas);
		}

		private static function onSortMemberDatas(memberDataA : SocietyMemberData, memberDataB : SocietyMemberData) : int
		{
			if (memberDataA.societyPos < memberDataB.societyPos)
			{
				return -1;
			}
			else if (memberDataA.societyPos > memberDataB.societyPos)
			{
				return 1;
			}
			else
			{
				if (memberDataA.level > memberDataB.level)
				{
					return -1;
				}
				else if (memberDataA.level < memberDataB.level)
				{
					return 1;
				}
				else
				{
					if (memberDataA.fightingAmount > memberDataB.fightingAmount)
					{
						return -1;
					}
					else if (memberDataA.fightingAmount < memberDataB.fightingAmount)
					{
						return 1;
					}
					else
					{
						if (memberDataA.contribution > memberDataB.contribution)
						{
							return -1;
						}
						else if (memberDataA.contribution < memberDataB.contribution)
						{
							return 1;
						}
					}
				}
			}
			return 0;
		}

		/**
		 * 神兽是否开启
		 * @param currTime
		 * @return
		 *
		 */
		public function get animalBarIsOpened() : Boolean
		{
			return animalBarStartTime > 0;
		}

		/**
		 * 神兽是否结束
		 */
		public function get animalBarIsEnd() : Boolean
		{
			return animalBarStartTime >= animalBarEndTime;
		}

		/**
		 * 得到帮主的名字
		 * @return
		 *
		 */
		public function getLeaderName() : String
		{
			for each (var memberData : SocietyMemberData in _members)
			{
				if (FamilyOfficerPos.LEADER == memberData.societyPos)
				{
					return memberData.name;
				}
			}
			return "";
		}

		public function getMemberDataById(id : Number) : SocietyMemberData
		{
			for each (var memberData : SocietyMemberData in _members)
			{
				if (memberData.id == id)
				{
					return memberData;
				}
			}
			return null;
		}

		/**
		 * 设置官职
		 * @param id
		 * @param pos
		 *
		 */
		public function setMemberOfficer(id : Number, pos : int) : void
		{
			for each (var memberData : SocietyMemberData in _members)
			{
				if (memberData.id == id)
				{
					memberData.societyPos = pos;
					return;
				}
			}
		}

		public function getMembers() : Array
		{
			return _members;
		}

		/**
		 * 总人数
		 * @return
		 *
		 */
		public function getPeopleCount() : int
		{
			return _members.length;
		}

		/**
		 * 在线人数
		 * @return
		 *
		 */
		public function getOnlinePeopleCount() : int
		{
			var count : int = 0;
			for each (var memberData : SocietyMemberData in _members)
			{
				if (memberData.isOnline)
					count++;
			}
			return count;
		}
	}
}
