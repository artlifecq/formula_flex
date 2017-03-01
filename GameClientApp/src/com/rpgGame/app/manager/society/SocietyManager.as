package com.rpgGame.app.manager.society
{
	import com.rpgGame.app.manager.GameSetting;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.sender.SocietySender;
	import com.rpgGame.app.sender.SummonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.events.society.SocietyEvent;
	import com.rpgGame.coreData.cfg.society.SocietyMiscCfgData;
	import com.rpgGame.coreData.cfg.society.SocietyStaticConfigData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.society.SocietyData;
	import com.rpgGame.coreData.info.society.SocietyDetailData;
	import com.rpgGame.coreData.info.society.SocietyJoinApproveData;
	import com.rpgGame.coreData.info.society.SocietyJoinInviteData;
	import com.rpgGame.coreData.info.society.SocietyMemberData;
	import com.rpgGame.coreData.info.society.SocietySpellTotalData;
	import com.rpgGame.coreData.info.society.SocietyTrendsData;
	import com.rpgGame.coreData.info.society.SummonTokenData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangSociety;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import app.message.AllFamilyNewsProto;
	import app.message.ClientFamilyListProto;
	import app.message.FamilyBuildingType;
	import app.message.FamilyInListProto;
	import app.message.FamilyModuleObjProto;
	import app.message.FamilyNewsProto;
	import app.message.FamilyProto;
	import app.message.AllFamilyAnimalBarDatasProto.FamilyAnimalBarLevelDataProto;
	import app.message.FamilyModuleObjProto.FamilyInfoProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;
	
	import utils.TimerServer;

	/**
	 *
	 * 帮派管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-27 上午10:05:12
	 *
	 */
	public class SocietyManager
	{
		public static var INVITATE_ME_TIMEOUT : int = 120000;
		private static var _selfSocietyList : Array;
		private static var _otherSocietyList : Array;
		private static var _societyTrendsList : Array;
		/**自己的家族详细信息**/
		private static var _selfSocietyData : SocietyDetailData;
		private static var _announcementTemp : String = null;
		private static var _lastAnnouncement : String = null;
		public static var lastInputAnnouncement : String = null;
		public static var announcementIsEdit : Boolean = false;
		private static var _nextUseFamilyLeaderTokenTime : Number = 0;

		/**邀请我入族的列表**/
		private static var _invitateMeMap : HashMap = new HashMap();
		/**入族申请的列表**/
		private static var _approveMap : HashMap = new HashMap();
		private static var _hasRequestJoin : Boolean = false;
		/**我申请加入的家族**/
		private static var _joinFamilyRequestMap : HashMap = new HashMap();
		/**技能总数据**/
		private static var _societySpellTotalData : SocietySpellTotalData;

		public static function init() : void
		{
			TimerServer.addLoop(onTimeTick, 10000);
		}

		/**
		 * 本国帮派列表
		 * @param familyProto
		 *
		 */
		public static function setClientFamilyProto(familyProto : ClientFamilyListProto) : void
		{
			_selfSocietyList = [];
			for each (var family : FamilyInListProto in familyProto.family)
			{
				var data : SocietyData = new SocietyData();
				data.setConfig(family);
				data.isJoinApplying = hasJoinFamily(data.societyName);
				_selfSocietyList.push(data);
			}
			_selfSocietyList.sort(onSortSocietyList);
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
		}

		public static function getSocietyData(societyName : String) : SocietyData
		{
			if (!_selfSocietyList)
				return null;
			for each (var data : SocietyData in _selfSocietyList)
			{
				if (data.societyName == societyName)
					return data;
			}
			return null;
		}

		/**
		 * 他国帮派列表
		 * @param familyProto
		 *
		 */
		public static function setClientOtherFamilyProto(familyProto : ClientFamilyListProto) : void
		{
			_otherSocietyList = [];
			for each (var family : FamilyInListProto in familyProto.family)
			{
				var data : SocietyData = new SocietyData();
				data.setConfig(family);
				_otherSocietyList.push(data);
			}
			_otherSocietyList.sort(onSortSocietyList);
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_OTHER_LIST_UPDATE);
		}

		public static function setClientNewsProto(datasProto : AllFamilyNewsProto) : void
		{
			_societyTrendsList = [];
			for each (var newsProto : FamilyNewsProto in datasProto.news)
			{
				var trendsData : SocietyTrendsData = new SocietyTrendsData();
				trendsData.setConfig(newsProto);
				_societyTrendsList.push(trendsData);
			}
			_societyTrendsList.sort(onSortTrends);
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_TRENDS_UPDATE);
		}

		private static function onSortSocietyList(societyDataA : SocietyData, societyDataB : SocietyData) : int
		{
			if (societyDataA.level > societyDataB.level)
				return -1;
			else if (societyDataA.level < societyDataB.level)
				return 1;
			else
			{
				if (societyDataA.onlineCount > societyDataB.onlineCount)
					return -1;
				else if (societyDataA.onlineCount < societyDataB.onlineCount)
					return 1;
				else
				{
					if (societyDataA.peopleCount > societyDataB.peopleCount)
						return -1;
					else if (societyDataA.peopleCount < societyDataB.peopleCount)
						return 1;
					else
					{
						if (societyDataA.createTime > societyDataB.createTime)
							return 1;
						else if (societyDataA.createTime < societyDataB.createTime)
							return -1;
					}
				}
			}
			return 0;
		}

		private static function onSortTrends(trendsDataA : SocietyTrendsData, trendsDataB : SocietyTrendsData) : int
		{
			if (trendsDataA.time > trendsDataB.time)
				return -1;
			else if (trendsDataA.time < trendsDataB.time)
				return 1;
			return 0;
		}

		public static function getSelfSocietyList() : Array
		{
			return _selfSocietyList;
		}

		public static function getOtherSocietyList() : Array
		{
			return _otherSocietyList;
		}

		public static function getSocietyTrendsList() : Array
		{
			return _societyTrendsList;
		}

		public static function getSelfSocietyData() : SocietyDetailData
		{
			return _selfSocietyData;
		}

		public static function getSelfMemberData() : SocietyMemberData
		{
			return _selfSocietyData ? _selfSocietyData.getMemberDataById(MainRoleManager.actorID) : null;
		}

		/** 获取帮派成员国家官职 **/
		public static function getMemberCountryPos(memberData : SocietyMemberData) : int
		{
//			var countryOfficeData : CountryOfficeData = CountryManager.getOfficeDatas();
//			if (countryOfficeData)
//			{
//				var postData : CountryGovernmentPostData = countryOfficeData.getOfficeById(memberData.id);
//				if (postData)
//					return postData.governmentPost;
//			}
			return -1;
		}

		public static function get animalBarIsOpened() : Boolean
		{
			return _selfSocietyData ? _selfSocietyData.animalBarIsOpened : false;
		}

		public static function get animalBarBossLevel() : int
		{
			var animalBarLevel : int = _selfSocietyData ? _selfSocietyData.animalBarBossLevel : 0;
			return animalBarLevel;
		}

		public static function get animalBarBossSceneId() : int
		{
			var familyAnimalBarLevelDataProto : FamilyAnimalBarLevelDataProto = SocietyStaticConfigData.getBuildAnimalBarLevelData(animalBarBossLevel);
			if (familyAnimalBarLevelDataProto)
				return familyAnimalBarLevelDataProto.sceneId;
			return 0;
		}

		/**
		 * 神兽开启中
		 * @return
		 *
		 */
		public static function get animalBarDuring() : Boolean
		{
			var currTime : Number = SystemTimeManager.curtTm;
			var startHour : int = SocietyMiscCfgData.animalBarDungeonStartTime / TimeUtil.HOUR_MICRO_SECONDS;
			var startMin : int = SocietyMiscCfgData.animalBarDungeonStartTime % TimeUtil.MINUTE_MICRO_SECONDS;
			var endHour : int = SocietyMiscCfgData.animalBarDungeonEndTime / TimeUtil.HOUR_MICRO_SECONDS;
			var endMin : int = SocietyMiscCfgData.animalBarDungeonEndTime % TimeUtil.MINUTE_MICRO_SECONDS;

			var startTime : Number = TimeUtil.getTodayTime(currTime, startHour, startMin);
			var endTime : Number = TimeUtil.getTodayTime(currTime, endHour, endMin);

			return currTime >= startTime && currTime < endTime;
		}

		/**
		 * 神兽已被击杀
		 * @return
		 *
		 */
		public static function get animalBarBossIsKilled() : Boolean
		{
			return animalBarDuring && _selfSocietyData && _selfSocietyData.animalBarIsEnd;
		}

		/**
		 * 设置自己帮派信息
		 * @param value
		 *
		 */
		public static function setSelfSocietyInfo(value : FamilyProto) : void
		{
			_hasRequestJoin = value.hasRequestJoin;
			_selfSocietyData = new SocietyDetailData();
			_selfSocietyData.setConfig(value.shared);
			GuildManager.guildNameChange(_selfSocietyData.guildName);
			if (_selfSocietyData.guildName)
				GuildManager.getSelfGuildBaseData();
			_lastAnnouncement = _selfSocietyData.announcement;
			GameSetting.autoAgreeJoinApprove = _selfSocietyData.isAutoAcceptJoinRequest;
			_societySpellTotalData.updateSocietyData(_selfSocietyData);
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
			EventManager.dispatchEvent(BuffEvent.UPDATE_SOCIETY_SPELL_BUFF);
			updateAnimalBarTime();
		}

		public static function cacheAnnouncement(info : String) : void
		{
			_announcementTemp = info;
		}

		public static function restoreAnnouncement() : void
		{
			_announcementTemp = null;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANNOUNCEMENT_CHANGE);
		}

		public static function submitAnnouncement() : void
		{
			if (_selfSocietyData)
				_selfSocietyData.announcement = _announcementTemp;
			_lastAnnouncement = _announcementTemp;
			lastInputAnnouncement = null;
			announcementIsEdit = false;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANNOUNCEMENT_CHANGE);
		}

		public static function openAnimalDungeon() : void
		{
			NoticeManager.mouseFollowNotify("神兽副本开启成功");
		}

		public static function setAnimalDungeonStart(startTime : Number, bossLevel : int) : void
		{
			if (_selfSocietyData)
			{
				_selfSocietyData.animalBarStartTime = startTime;
				_selfSocietyData.animalBarBossLevel = bossLevel;
			}
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANIMAL_DUNGEON_STATE_CHANGE);
		}

		public static function setAnimalDungeonEnd() : void
		{
			if (_selfSocietyData)
				_selfSocietyData.animalBarEndTime = SystemTimeManager.curtTm;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANIMAL_DUNGEON_STATE_CHANGE);
		}

		public static function enterAnimalDungeon(endTime : Number) : void
		{
			if (_selfSocietyData)
				_selfSocietyData.animalBarStartTime = endTime;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANIMAL_DUNGEON_STATE_CHANGE);
		}

		public static function get lastAnnouncement() : String
		{
			return _lastAnnouncement;
		}

		private static var kickMemberId : Number = NaN;

		public static function requestExpelled(heroId : Number, heroName : String) : void
		{
			kickMemberId = heroId;
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.SOCIETY_EXPELLED_MEMBER_REQ_ALERT,heroName);
			GameAlert.showAlert(alertSet,requestExpelledClick);
		}
		
		private static function requestExpelledClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					requestExpelledSureCallback();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					requestExpelledCancelCallback();
					break;
			}			
		}
		
		private static function requestExpelledSureCallback() : void
		{
			SocietySender.reqKickMember(kickMemberId);
			kickMemberId = NaN;
		}

		private static function requestExpelledCancelCallback() : void
		{
			kickMemberId = NaN;
		}

		public static function reqInviteJoin(heroId : Number) : void
		{
			SocietySender.reqInviteJoin(heroId);
		}

		/**
		 * 添加到邀请我家族列表
		 * @param familyData
		 *
		 */
		public static function addInvitateMe(inviteData : SocietyJoinInviteData) : void
		{
			_invitateMeMap.add(inviteData.societyName, inviteData);

			EventManager.dispatchEvent(SocietyEvent.INVITATE_SOCIETY_CHANGE);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE, _invitateMeMap.length);
			NoticeManager.showNotify(LangSociety.INVITATE_ADD_SOCIETY, inviteData.heroName, inviteData.societyName);
		}

		/**
		 * 删除这个邀请我入族的缓存
		 * @param familyName
		 *
		 */
		public static function deleteInvitateMe(societyName : String) : void
		{
			_invitateMeMap.remove(societyName);
			EventManager.dispatchEvent(SocietyEvent.INVITATE_SOCIETY_CHANGE);
			if (_invitateMeMap.length > 0)
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE, _invitateMeMap.length);
			else
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE);
		}

		/**
		 * 设置申请列表
		 * @param approveData
		 *
		 */
		public static function setApproves(datas : Array) : void
		{
			_approveMap.clear();
			for each (var approveData : SocietyJoinApproveData in datas)
			{
				_approveMap.add(approveData.id, approveData);
			}
			_hasRequestJoin = _approveMap.length > 0;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE);
		}

		/**
		 * 删除这个申请
		 * @param heroId
		 *
		 */
		public static function removeApprove(heroId : Number) : void
		{
			_approveMap.remove(heroId);
			_hasRequestJoin = _approveMap.length > 0;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE);
			if (!_hasRequestJoin)
			{
				AppManager.hideApp(AppConstant.SOCIETY_JOIN_APPROVE_PANEL);
			}
		}

		/**
		 * 删除所有入族申请的列表
		 *
		 */
		public static function deleteAllApprove() : void
		{
			_approveMap.clear();
			_hasRequestJoin = false;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE);
			AppManager.hideApp(AppConstant.SOCIETY_JOIN_APPROVE_PANEL);
		}

		/**
		 * 删除所有邀请我入家族的列表
		 *
		 */
		public static function deleteAllInvitateMe() : void
		{
			_invitateMeMap.clear();
			EventManager.dispatchEvent(SocietyEvent.INVITATE_SOCIETY_CHANGE);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE);
		}

		/**
		 * 邀请列表
		 * @return
		 *
		 */
		public static function getInvitateMeList() : Array
		{
			var values : Array = _invitateMeMap.getValues();
			return values;
		}

		/**
		 * 申请列表
		 * @return
		 *
		 */
		public static function getApproveList() : Array
		{
			var values : Array = _approveMap.getValues();
			return values;
		}

		public static function setMemberOfficer(id : Number, pos : int, takeOffice : Boolean) : void
		{
			if (_selfSocietyData)
				_selfSocietyData.setMemberOfficer(id, takeOffice ? pos : int.MAX_VALUE);
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
		}

		public static function get hasRequestJoin() : Boolean
		{
			return _hasRequestJoin;
		}

		public static function set hasRequestJoin(value : Boolean) : void
		{
			if (_hasRequestJoin == value)
				return;
			_hasRequestJoin = value;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE);
		}

		/**
		 * 加入帮派
		 *
		 */
		public static function joinSociety(guildName : String) : void
		{
			deleteAllInvitateMe();
			MainRoleManager.actorInfo.societyName = guildName;
			deleteAllJoinFamily();
			EventManager.dispatchEvent(SocietyEvent.JOIN_SOCIETY);
		}

		/**
		 * 离开帮派
		 *
		 */
		public static function leaveSociety() : void
		{
			if (_societyTrendsList)
			{
				_societyTrendsList.length = 0;
				_societyTrendsList = null;
			}
			_selfSocietyData = null;
			_announcementTemp = null;
			_lastAnnouncement = null;
			_nextUseFamilyLeaderTokenTime = 0;
			lastInputAnnouncement = null;
			announcementIsEdit = false;
			deleteAllApprove();

			MainRoleManager.actorInfo.societyName = "";
			_hasRequestJoin = false;
			_societySpellTotalData.clear();
			EventManager.dispatchEvent(BuffEvent.UPDATE_SOCIETY_SPELL_BUFF);
			//			MainRoleManager.actor.headFace.addAndUpdateFamilyName();
			EventManager.dispatchEvent(SocietyEvent.LEAVE_SOCIETY);

			GuildManager.guildData.clear();
			EventManager.dispatchEvent(GuildEvent.HAVE_GUILD_CHANGE);

			AppManager.hideApp(AppConstant.SOCIETY_JOIN_APPROVE_PANEL);
			NoticeManager.showHint(EnumHintInfo.MY_LEAVE_FAMILY);
		}

		/**
		 * 设置申请了哪些家族
		 * @param familyName
		 *
		 */
		public static function setJoinFamilies(datas : HashMap) : void
		{
			var keys : Array = datas.keys();
			for each (var societyName : String in keys)
			{
				var outTime : Number = datas.getValue(societyName);
				_joinFamilyRequestMap.add(societyName, outTime);
				var societyData : SocietyData = getSocietyData(societyName);
				if (societyData)
					societyData.isJoinApplying = true;
			}
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
		}

		/**
		 * 我申请了哪些家族
		 * @param familyName
		 *
		 */
		public static function addJoinFamily(societyName : String, outTime : Number) : void
		{
			_joinFamilyRequestMap.add(societyName, outTime);
			var societyData : SocietyData = getSocietyData(societyName);
			if (societyData)
				societyData.isJoinApplying = true;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
			NoticeManager.mouseFollowNotify("提交申请成功");
		}

		/**
		 * 删除自己的申请过的家族
		 * @param familyName
		 *
		 */
		public static function removeJoinFamily(societyName : String) : void
		{
			_joinFamilyRequestMap.remove(societyName);
			var societyData : SocietyData = getSocietyData(societyName);
			if (societyData)
				societyData.isJoinApplying = false;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
			NoticeManager.mouseFollowNotify("取消申请成功");
		}

		/**
		 * 删除所有自己的申请过的家族
		 *
		 */
		public static function deleteAllJoinFamily() : void
		{
			_joinFamilyRequestMap.clear();
			if (_selfSocietyList)
			{
				for each (var societyData : SocietyData in _selfSocietyList)
				{
					societyData.isJoinApplying = false;
				}
			}
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
		}

		/**
		 * 我是否申请过加入这个帮派
		 * @param familyName
		 * @return
		 *
		 */
		public static function hasJoinFamily(familyName : String) : Boolean
		{
			if (_joinFamilyRequestMap.getValue(familyName) != null)
				return true;
			return false;
		}

		private static function onTimeTick() : void
		{
			var curtTm : Number = SystemTimeManager.curtTm;
			var values : Array;
			var len : int;
			var i : int;
			var newLen : int;
			if (_joinFamilyRequestMap)
			{
				var keys : Array = _joinFamilyRequestMap.keys();
				values = _joinFamilyRequestMap.getValues();
				len = values.length;
				for (i = len - 1; i >= 0; i--)
				{
					var outTime : Number = values[i];
					if (curtTm > outTime)
					{
						var societyName : String = keys[i];
						_joinFamilyRequestMap.remove(societyName);
						var societyData : SocietyData = getSocietyData(societyName);
						if (societyData)
							societyData.isJoinApplying = false;
					}
				}
				newLen = _joinFamilyRequestMap.length;
				if (len > newLen)
				{
					EventManager.dispatchEvent(SocietyEvent.SOCIETY_LIST_UPDATE);
				}
			}
			if (_invitateMeMap)
			{
				values = _invitateMeMap.getValues();
				len = values.length;
				for (i = len - 1; i >= 0; i--)
				{
					var inviteData : SocietyJoinInviteData = values[i];
					if (curtTm > inviteData.outTime)
					{
						_invitateMeMap.remove(inviteData.societyName);
					}
				}
				newLen = _invitateMeMap.length;
				if (len > newLen)
				{
					EventManager.dispatchEvent(SocietyEvent.INVITATE_SOCIETY_CHANGE);
					if (_invitateMeMap.length > 0)
						EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE, _invitateMeMap.length);
					else
						EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.SOCIETY_JOIN_INVITE_TYPE);
				}
			}
			if (_approveMap)
			{
				values = _approveMap.getValues();
				len = values.length;
				for (i = len - 1; i >= 0; i--)
				{
					var approveData : SocietyJoinApproveData = values[i];
					if (curtTm > approveData.outTime)
					{
						_approveMap.remove(approveData.id);
					}
				}
				newLen = _approveMap.length;
				if (len > newLen)
				{
					_hasRequestJoin = _approveMap.length > 0;
					EventManager.dispatchEvent(SocietyEvent.SOCIETY_APPROVE_CHANGE);
					if (!_hasRequestJoin)
					{
						AppManager.hideApp(AppConstant.SOCIETY_JOIN_APPROVE_PANEL);
					}
				}
			}
			updateAnimalBarTime();
		}

		private static function updateAnimalBarTime() : void
		{
			if (_selfSocietyData && !TimeUtil.getIsInSameDay(_selfSocietyData.animalBarEndTime))
			{
				var currTime : Number = SystemTimeManager.curtTm;
				var endHour : int = SocietyMiscCfgData.animalBarDungeonEndTime / TimeUtil.HOUR_MICRO_SECONDS;
				var endMin : int = SocietyMiscCfgData.animalBarDungeonEndTime % TimeUtil.MINUTE_MICRO_SECONDS;
				var endTime : Number = TimeUtil.getTodayTime(currTime, endHour, endMin);
				_selfSocietyData.animalBarStartTime = 0;
				_selfSocietyData.animalBarEndTime = endTime;
				EventManager.dispatchEvent(SocietyEvent.SOCIETY_ANIMAL_DUNGEON_STATE_CHANGE);
			}
		}

		/**
		 * 设置英雄数据
		 * @param familyInfo 家族信息，可能为空
		 *
		 */
		public static function setHero(familyModuleObj : FamilyModuleObjProto) : void
		{
			if(!familyModuleObj)
				return;
			MainRoleManager.actorInfo.societyName = "";
			_societySpellTotalData = new SocietySpellTotalData(MainRoleManager.actorInfo.id);
			var familyInfo : FamilyInfoProto = familyModuleObj.familyInfo;
			if (familyInfo != null)
			{
				MainRoleManager.actorInfo.societyName = BytesUtil.bytes2UTF(familyInfo.familyName);
//				MainRoleManager.actor.headFace.addAndUpdateFamilyName();
				_societySpellTotalData.updateLearnLevels(familyModuleObj.collageLearnSpells.levels);
			}
			GameSetting.autoAgreeJoinApprove = familyModuleObj.familyAutoAcceptInvite;
			GameSetting.autoRefuseJoinInvite = familyModuleObj.familyForbidOtherInviteMeJoin;
		}

		/**
		 * 是否有帮派
		 * @return
		 *
		 */
		public static function hasSociecy() : Boolean
		{
			var sociecyName : String = MainRoleManager.actorInfo.societyName;
			return MainRoleManager.actorInfo.societyName != "";
		}

		public static function setBuildMoney(donateMoney : int, hasMoney : Number) : void
		{
			var societyData : SocietyDetailData = SocietyManager.getSelfSocietyData();
			if (societyData)
			{
				societyData.buildMoneyCount = hasMoney;
			}
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
		}

		public static function setBuildToken(donateGoodsCount : int, hasGoodsCount : Number) : void
		{
			var societyData : SocietyDetailData = SocietyManager.getSelfSocietyData();
			if (societyData)
			{
				societyData.buildTokenCount = hasGoodsCount;
			}
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
		}

		public static function setBuildAmount(hasMoney : Number, hasGoodsCount : Number) : void
		{
			var societyData : SocietyDetailData = SocietyManager.getSelfSocietyData();
			if (societyData)
			{
				societyData.buildMoneyCount = hasMoney;
				societyData.buildTokenCount = hasGoodsCount;
			}
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
		}

		public static function setBuildLevel(type : int, level : int) : void
		{
			var societyData : SocietyDetailData = SocietyManager.getSelfSocietyData();
			if (societyData)
			{
				switch (type)
				{
					case FamilyBuildingType.HALL:
						societyData.hallLevel = level;
						break;
					case FamilyBuildingType.COLLAGE:
						societyData.collageLevel = level;
						if (_societySpellTotalData)
						{
							_societySpellTotalData.updateSocietyData(societyData);
						}
						break;
					case FamilyBuildingType.BIAO:
						societyData.biaoLevel = level;
						break;
					case FamilyBuildingType.ANIMAL_BAR:
						societyData.animalBarLevel = level;
						break;
				}
			}
			EventManager.dispatchEvent(SocietyEvent.SELF_SOCIETY_INFO_UPDATE);
		}

		public static function get societySpellTotalData() : SocietySpellTotalData
		{
			return _societySpellTotalData;
		}

		public static function getSocietySpellList() : Array
		{
			if (_societySpellTotalData)
				return _societySpellTotalData.getSpellList();
			return null;
		}

		public static function setSocietySpellLevel(index : int, level : int) : void
		{
			if (_societySpellTotalData)
			{
				_societySpellTotalData.setSpellLevel(index, level);
			}
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_SPELL_LIST_UPDATE);
			EventManager.dispatchEvent(BuffEvent.UPDATE_SOCIETY_SPELL_BUFF);
		}

		/**
		 * 改变场景内英雄的家族
		 *
		 */
		public static function changeHeroFamily(heroId : Number, familyName : String) : void
		{
			NoticeManager.showHint(EnumHintInfo.NEW_FAMILY_CREATED, [familyName]);

			var sceneRole : SceneRole = SceneManager.getSceneObjByID(heroId) as SceneRole;
			if (sceneRole == null)
				return;
			(sceneRole.data as HeroData).societyName = familyName;

//			sceneRole.headFace.addAndUpdateFamilyName();
		}

		public static function useFamilyLeaderToken(item : ClientItemInfo) : void
		{
			var selfMemberData : SocietyMemberData = getSelfMemberData();
			if (!selfMemberData || !selfMemberData.isLeader)
			{
				NoticeManager.showNotify(LangSociety.ONLY_LEADER_USE_FAMILY_LEADER_TOKEN);
				return;
			}
			if (tokenTimeoutSurplus > 0)
			{
				NoticeManager.showNotify(LangSociety.USE_FAMILY_LEADER_TOKEN_IS_CD);
				return;
			}
//			if (!CountryManager.isAtMyCountry() || !MapDataManager.currentScene.isNormalScene)
//			{
//				NoticeManager.showNotify(LangSociety.USE_FAMILY_LEADER_TOKEN_NEED_SAFE);
//				return;
//			}
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.useFamilyLeaderToken);
			GameAlert.showAlert(alertSet,useFamilyLeaderTokenClick,item);
		}
		
		private static function useFamilyLeaderTokenClick(gameAlert:GameAlert,item : ClientItemInfo):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onUseFamilyLeaderToken(item);
					break;
			}			
		}

		private static function onUseFamilyLeaderToken(item : ClientItemInfo) : void
		{
			var msgBytes : ByteBuffer = new ByteBuffer();
			msgBytes.writeUTFBytes(LangSociety.FAMILY_LEADER_TOKEN_CONVENE_MSG);
//			ItemSender.reqUseGoods(item.index, 1, msgBytes);
		}

		public static function setLeaderSummon(tokenData : SummonTokenData) : void
		{
			_nextUseFamilyLeaderTokenTime = tokenData.timeoutTime;
			EventManager.dispatchEvent(SocietyEvent.SOCIETY_LEADER_SUMMON);

			var societyMemberData : SocietyMemberData = getSelfMemberData();
			if (societyMemberData && societyMemberData.isLeader)
			{
				NoticeManager.showNotify(LangSociety.FAMILY_LEADER_SUMMON_SUCCESS);
			}
			else
			{
				
				var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.replyGotoSummon);
				alertSet.isClickHide = false;
				alertSet.autoCloseTime = TimeUtil.MINUTE_MICRO_SECONDS;
				GameAlert.showAlert(alertSet,setLeaderSummonClick,tokenData);
			}
		}
		
		private static function setLeaderSummonClick(gameAlert:GameAlert,data:Array):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onReplyGotoSummon(data[0]);
					break;
			}
		}

		private static function onReplyGotoSummon(tokenData : SummonTokenData) : void
		{
//			if (!CountryManager.isAtMyCountry() || !MapDataManager.currentScene.isNormalScene)
//			{
//				NoticeManager.showNotify(LangSociety.REPLY_FAMILY_LEADER_TOKEN_NEED_SAFE);
//				return;
//			}
			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				NoticeManager.showNotify(LangSociety.REPLY_FAMILY_LEADER_TOKEN_DEAD);
				return;
			}
			SummonSender.reqCountryOfficerSummon(tokenData.summonId);
			GameAlert.closeAlert(LangAlertInfo.replyGotoSummon);
		}

		public static function get tokenTimeoutSurplus() : Number
		{
			return _nextUseFamilyLeaderTokenTime - SystemTimeManager.curtTm;
		}
	}
}
