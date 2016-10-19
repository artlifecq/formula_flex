package com.rpgGame.app.manager.country
{
	import com.rpgGame.app.manager.BiaoJuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.crown.CrownManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.CountrySender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.country.CrownEvent;
	import com.rpgGame.core.events.toujing.TouJingEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryMiscCfgData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	import com.rpgGame.coreData.enum.CrownNeiZhengEnum;
	import com.rpgGame.coreData.info.country.CountryExchequerDetailedData;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.info.country.country.CountryData;
	import com.rpgGame.coreData.info.country.country.CountryHistoryRecordData;
	import com.rpgGame.coreData.info.country.country.CountryOfficeData;
	import com.rpgGame.coreData.info.crown.CountryMilitaryData;
	import com.rpgGame.coreData.info.crown.CrownDiplomacyData;
	import com.rpgGame.coreData.info.crown.CrownInteriorItemData;
	import com.rpgGame.coreData.info.crown.CrownJinWeiSetData;
	import com.rpgGame.coreData.info.toujing.TouJingBookStateData;
	import com.rpgGame.coreData.lang.LangCountry;
	import com.rpgGame.coreData.lang.LangCrown;
	import com.rpgGame.coreData.lang.LangTouJing;
	import com.rpgGame.coreData.lang.LangTransfer;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.utils.Dictionary;
	
	import app.message.AllUnionStatusProto;
	import app.message.CountryDataProto;
	import app.message.CountryExchequerLogProto;
	import app.message.CountryHistoryRecordProto;
	import app.message.CountryHistoryRecordsProto;
	import app.message.CountryMemberProto;
	import app.message.CountryOfficeProto;
	import app.message.CountryOfficerDataProto;
	import app.message.CountryOfficerPos;
	import app.message.JinWeiRequiresProto;
	import app.message.NpcCountryUsableType;
	import app.message.OfficerMemberProto;
	import app.message.OtherCountryDataProto;
	import app.message.AllUnionStatusProto.UnionStatusProto;
	import app.message.AllUnionStatusProto.UnionStatusProto.UnionStatusType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 国家管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-21 上午10:05:12
	 *
	 */
	public class CountryManager
	{
		/**
		 * 国家数据CountryData
		 */
		private static var _countryDataBySequence : Dictionary = new Dictionary();
		/**
		 * 国家历史日志数据[CountryHistoryRecordData]
		 */
		private static var _countryHistoryRecordsBySequence : Dictionary;
		/**
		 * 国库日志CountryExchequerDetailedData
		 */
		private static var _exchequerRecords : Array;
		/**
		 * 禁卫军申请列表
		 */
		private static var _jinWeiApplicantMap : HashMap = new HashMap();
		/** 国家经书 **/
		public static var countryJingShuArr : Array = [];
		/** 国家经书 **/
		public static var otherCountryJingShuArr : Array = [];
		/** 国家所有经书数量 **/
		public static var jingShuNum:int;

		public function CountryManager()
		{
		}

		//----------------------------------

		public static function getJinWeiApplicantById(id : int) : CountryGovernmentPostData
		{
			return _jinWeiApplicantMap.getValue(id) as CountryGovernmentPostData;
		}

		public static function getJinWeiApplicantList() : Array
		{
			var time : Number = SystemTimeManager.curtTm;
			var temp : Array = [];

			for each (var data : CountryGovernmentPostData in _jinWeiApplicantMap.getValues())
			{
				if (data.timeOut < time)
					temp.push(data.id);
			}
			for each (var id : Number in temp)
			{
				_jinWeiApplicantMap.remove(id);
			}
			return _jinWeiApplicantMap.getValues();
		}

		/**获取禁卫要求**/
		public static function getJinWeiSetData() : void
		{
			if (!selfCountryData.jinWeiSet)
				CountrySender.reqGetJinWeiRequires();
			else
				EventManager.dispatchEvent(CountryEvent.COUNTRY_GET_JIN_WEI_SET);
		}

		/**获取禁卫成功，返回数据**/
		public static function getJinWeiSetDataComplete(jinw : JinWeiRequiresProto) : void
		{
			if (!selfCountryData.jinWeiSet)
				selfCountryData.jinWeiSet = new CrownJinWeiSetData();
			selfCountryData.jinWeiSet.setConfig(jinw);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_GET_JIN_WEI_SET);
		}

		public static function setJinWeiSetData(level : int, fightAmount : Number, fightRank : int, isSelfCountry : Boolean) : void
		{
			jinWeiLevel = level;
			jinWeiFightAmount = fightAmount;
			jinWeiFightRank = fightRank;
			jinWeiIsSelfCountry = isSelfCountry;
			CountrySender.reqChangeJinWeiRequires(level, fightAmount, fightRank, isSelfCountry);
			trace("发送禁卫修改申请");
		}
		private static var jinWeiLevel : int;
		private static var jinWeiFightAmount : Number;
		private static var jinWeiFightRank : int;
		private static var jinWeiIsSelfCountry : Boolean;

		public static function setJinWeiSetDataComplete() : void
		{
			if (!selfCountryData.jinWeiSet)
				selfCountryData.jinWeiSet = new CrownJinWeiSetData();
			selfCountryData.jinWeiSet.level = jinWeiLevel;
			selfCountryData.jinWeiSet.fightRank = jinWeiFightRank;
			selfCountryData.jinWeiSet.fightAmount = jinWeiFightAmount;
			selfCountryData.jinWeiSet.isSelfCountry = jinWeiIsSelfCountry;
			EventManager.dispatchEvent(CountryEvent.COUNTRY_GET_JIN_WEI_SET);
			trace("修改禁卫需求成功");
		}

		public static function jinWeiSetDataChange() : void
		{
			trace("禁卫军数据改变了，清空数据需要重新请求");
			selfCountryData.jinWeiSet = null;
		}

		/**
		 * 自己国家数据
		 */
		public static function get selfCountryData() : CountryData
		{
			return _countryDataBySequence[MainRoleManager.actorInfo.countryId];
		}

		/**获取王帮的名字**/
		public static function get selfCountryKingFamilyName() : String
		{
			return selfCountryData.officeData.getKing() ? selfCountryData.officeData.getKing().familyName : "";
		}

		/**
		 * 自己国家的盟国
		 * @return
		 *
		 */
		public static function get unionCountry() : int
		{
			var countryData : CountryData = CountryManager.selfCountryData;
			return (countryData && countryData.unionStatus) ? countryData.unionStatus.getUnionCountry() : 0;
		}

		/**
		 * 是否是结盟的两国家
		 * @param a
		 * @param b
		 * @return
		 *
		 */
		public static function isUnionCountry(a : int, b : int) : Boolean
		{
			var countryAData : CountryData = CountryManager.getCountryData(a);
			if (countryAData.unionStatus && countryAData.unionStatus.getUnionCountry() == b)
				return true;
			return false;
		}

		/**
		 * 两个国家是否是敌国
		 * @param a
		 * @param b
		 * @return
		 *
		 */
		public static function isEnemyCountry(a : int, b : int) : Boolean
		{
			return (a != b) && !isUnionCountry(a, b);
		}

		/**
		 * 是否我的敌国
		 * @param countryId
		 * @return
		 *
		 */
		public static function isMyEnemyCountry(countryId : int) : Boolean
		{
			return (MainRoleManager.actorInfo.countryId != countryId) && (unionCountry != countryId);
		}

		//-------------------------------------------
		/**
		 * 我自己的国家
		 * @return
		 *
		 */
		public static function getSelfCountryId() : int
		{
			return MainRoleManager.actorInfo.countryId;
		}

		/** 获取自己国家的名字 **/
		public static function getSelfCountryName() : String
		{
			return getCountryName(getSelfCountryId());
		}

		/**
		 * 获取自身官职
		 * @return
		 *
		 */
		public static function getSelfOffice() : CountryGovernmentPostData
		{
			return getSelfCountryOfficeById(MainRoleManager.actorInfo.id);
		}

		/**
		 * 根据ID获取本国的玩家的职位
		 * @param id
		 * @return
		 *
		 */
		public static function getSelfCountryOfficeById(id : Number) : CountryGovernmentPostData
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return null;
			if (countryData.officeData)
				return countryData.officeData.getOfficeById(id);
			return null;
		}

		/**
		 * 是否在本国
		 * @return
		 *
		 */
		public static function isAtMyCountry() : Boolean
		{
			var curMapCountry : int = MainRoleManager.actorInfo.sceneSequence;
			return curMapCountry > 0 && curMapCountry == MainRoleManager.actorInfo.countryId;
		}

		/**
		 * NPC功能国家使用
		 * @param npcModelId
		 * @return
		 *
		 */
		public static function isNpcFuncCountryUseable(countryUsableType : int = -1) : Boolean
		{
			var curMapCountry : int = MainRoleManager.actorInfo.sceneSequence;
			if (curMapCountry > 0)
			{
				if (countryUsableType > -1)
				{
					switch (countryUsableType)
					{
						case NpcCountryUsableType.SELF_COUNTRY: //自己国家
							return curMapCountry == MainRoleManager.actorInfo.countryId;
						case NpcCountryUsableType.SELF_OR_UNION_COUNTRY: //自己国家或盟国
							return curMapCountry == MainRoleManager.actorInfo.countryId || curMapCountry == unionCountry;
						case NpcCountryUsableType.NOT_SELF_COUNTRY: //除了自己国家以外的其他国家
							return curMapCountry != MainRoleManager.actorInfo.countryId;
						case NpcCountryUsableType.NOT_SELF_OR_UNION_COUNTRY: //除了自己国家或者盟国以外的其他国家
							return curMapCountry != MainRoleManager.actorInfo.countryId && curMapCountry != unionCountry;
						case NpcCountryUsableType.ALL_COUNTRY: //所有国家
							return true;
							break;
					}
				}
				else
				{
					return curMapCountry == MainRoleManager.actorInfo.countryId;
				}
				return false;
			}
			return true;
		}

		/**
		 * 是否在敌国
		 * @return
		 *
		 */
		public static function isAtEnemyCountry() : Boolean
		{
			var curMapCountry : int = MainRoleManager.actorInfo.sceneSequence;
			if (curMapCountry > 0 && isMyEnemyCountry(curMapCountry))
			{
				//不是中立、不是盟国与本国，就是敌国
				return true;
			}
			return false;
		}


		/**
		 * 不带参数，用来请求所有国家的状态，获取国家等级，灵石数量等等，请求过一次以后不需要再请求了
		 */
		public static function reqResponseCountryState() : void
		{
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.PRIVILEGE_MARK_TYPE, 1);

			//CountrySender.reqResponseCountryState();
		}
		//****官员设置局部变量
		private static var officePos : int;
		private static var officeIndex : int;

		/**
		 * 设置官员
		 *
		 * varint32 CountryOfficerPos
		 * varint32 第几个
		 *
		 * if(buffer.readable()){
		 *      varint64 设置的人
		 * } else {
		 *      撤职该位置上的人
		 * }
		 */
		public static function setOfficer(pos : int, index : int, id : Number = 0, isSet : Boolean = true) : void
		{
			/**qqqq 过滤条件以后再写**/
			officePos = pos;
			officeIndex = index;
			CountrySender.reqSetOfficer(pos, index, id, isSet);
		}

		/**
		 * 设置官员
		 * @param memberProto
		 *
		 */
		public static function setOfficerComplete(memberProto : OfficerMemberProto) : void
		{
			var msg : String;
			var office : CountryGovernmentPostData = selfCountryData.officeData.getOfficeByPosAndIndex(officePos, officeIndex);
			if (memberProto)
			{
				if (office)
					office.setConfig(officePos, memberProto);
				msg = LanguageConfig.getText(LangCountry.COUNTRY_SET_OFFICER_RIGHT);
			}
			else
			{
				if (office)
					office.clear();
				msg = LanguageConfig.getText(LangCountry.COUNTRY_SET_OFFICER_LEFT);
			}
			NoticeManager.showNotify(msg);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		public static function setJinWeiJun(memberProto : OfficerMemberProto) : void
		{
			var msg : String;
			var office : CountryGovernmentPostData = selfCountryData.officeData.getOfficeByPosAndIndex(CountryOfficerPos.POS_JIN_WEI, officeIndex);
			if (memberProto)
			{
				if (office)
					office.setConfig(CountryOfficerPos.POS_JIN_WEI, memberProto);
				msg = LanguageConfig.getText(LangCountry.COUNTRY_SET_OFFICER_RIGHT);
			}
			else
			{
				if (office)
					office.clear();
				msg = LanguageConfig.getText(LangCountry.COUNTRY_SET_OFFICER_LEFT);
			}
			NoticeManager.showNotify(msg);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		public static function countryTransfer(roleId : Number, orgCountry : int, changeCountry : int, roleName : String) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(roleId) as SceneRole;
			if (role)
			{
				(role.data as HeroData).countryId = changeCountry;
				if (role.isMainChar)
				{
					EventManager.dispatchEvent(CountryEvent.COUNTRY_SELF_TRANSFER_COUNTRY);
				}
			}
			NoticeManager.showNotify(LangTransfer.TRANSFER_CHANGE_COUNTRY_BROADCAST, roleName, CountryNameCfgData.getCountryNameById(orgCountry), CountryNameCfgData.getCountryNameById(changeCountry));
			EventManager.dispatchEvent(CountryEvent.COUNTRY_TRANSFER_COUNTRY);
		}

		/**
		 * 自己卸任了
		 *
		 */
		public static function officeRetire() : void
		{
			/**qqqq 之后再加过滤条件**/
			CountrySender.reqOfficeRetire();
		}

		/**
		 * 自己卸任成功了
		 */
		public static function officeRetireComplete() : void
		{
			var office : CountryGovernmentPostData = selfCountryData.officeData.getOfficeById(MainRoleManager.actorID);
			if (office)
				office.clear();
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 请求结盟
		 * @param countryId 结盟的国家
		 *
		 */
		public static function inviteCountryunion(countryId : int, msg : String) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			var time : Number = countryData.unionStatus.unionCd;
			if (time > SystemTimeManager.curtTm)
			{
				GameAlert.showAlertUtil(LangCrown.CROWN_UNION_INVITE_ERROR_1, null, TimeUtil.formatTimeToSpecString(time));
				return;
			}
			time = getCountryData(countryId).unionStatus.unionCd;
			if (time > SystemTimeManager.curtTm)
			{
				GameAlert.showAlertUtil(LangCrown.CROWN_UNION_INVITE_ERROR_2, null, TimeUtil.formatTimeToSpecString(time));
				return;
			}
			CountrySender.reqUnionInviteOther(countryId, msg);
		}

		/**
		 * 邀请结盟 成功
		 * @param unionId
		 *
		 */
		public static function setUnionInviteOther(unionId : int) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			countryData.unionStatus.inviteCountry = countryData.sequence;
			countryData.unionStatus.beenInviteCountry = unionId;
			countryData.unionStatus.unionStatus = UnionStatusType.WAIT_UNION_REPLY;
			countryData.unionStatus.unionCd = SystemTimeManager.curtTm + CountryMiscCfgData.waitUnionReplyCd;
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
		}

		/**
		 * 收到其他国家的结盟申请
		 * @param sequence
		 *
		 */
		public static function otherCountryUnionInvite(sequence : int, msg : String = "") : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			//预留打开结盟提示面板
			AppManager.showApp(AppConstant.CROWN_BEEN_INVITE_UNION_PANEL, [sequence, msg]);
			countryData.unionStatus.expireTime = SystemTimeManager.curtTm + CountryMiscCfgData.waitUnionReplyCd;
			trace("过期时间" + TimeUtil.changeTimeToSpecStr(countryData.unionStatus.expireTime), CountryMiscCfgData.waitUnionReplyCd)
		}

		/**
		 * 发送其他国家结盟申请回复
		 * @param b
		 *
		 */
		public static function replyUnionInvite(b : Boolean) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			var time : Number = countryData.unionStatus.expireTime;
			if (time < SystemTimeManager.curtTm)
			{
				CountrySender.reqUnionInviteesReply(false);
				GameAlert.showAlertUtil(LangCrown.CROWN_UNION_GET_INVITE_ERROR_1);
				return;
			}
			CountrySender.reqUnionInviteesReply(b);
		}
		private static var needSendUnionStates : Boolean = true;

		public static function getAllUnitonStates() : void
		{
			if (needSendUnionStates)
				CountrySender.reqAllCountryUnionStatus();
			else
				EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
		}

		/**
		 * 设置各个国家的结盟状态
		 * @param proto
		 *
		 */
		public static function setAllUnionStatus(proto : AllUnionStatusProto) : void
		{
			var country : CountryData;
			for each (var data : UnionStatusProto in proto.unionStatus)
			{
				country = getCountryData(data.invitorCountry);
				if (country)
					country.unionStatus.setSelfUnionStatus(data);
				country = getCountryData(data.beenInvitorCountry);
				if (country)
					country.unionStatus.setSelfUnionStatus(data);
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
		}

		public static function otherCountryInviteReply(countryId : int, b : Boolean) : void
		{
			if (b)
				NoticeManager.showNotify(LangCountry.OTHER_COUNTRY_INVITE_REPLY_OK, getCountryName(countryId));
			else
				GameAlert.showAlertUtil(LangCountry.OTHER_COUNTRY_INVITE_REPLY_CANCEL, null, getCountryName(countryId));
		}

		/**
		 * 回复结盟邀请之后会收到这个
		 * @param b
		 *
		 */
		public static function unionInviteReply(countryId : int, b : Boolean) : void
		{
			var msg : String;
			if (b)
			{
				msg = LanguageConfig.getText(LangCrown.CROWN_UINION_INVITE_REPLY_1, getCountryName(countryId));
				NoticeManager.showNotify(msg);
			}
			else
			{
				GameAlert.showAlertUtil(LangCrown.CROWN_UINION_INVITE_REPLY_2, null, getCountryName(countryId));
			}
		}

		/**
		 * 结盟成功
		 * @param countryId A
		 * @param otherCountryId B
		 *
		 */
		public static function unionInviteOtherReplyRight(countryId : int, otherCountryId : int) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			needSendUnionStates = true;
			var countryA : CountryData;
			var countryB : CountryData;
			countryA = getCountryData(countryId);
			countryA.unionStatus.unionStatus = UnionStatusType.WAIT_UNION;
			countryA.unionStatus.inviteCountry = countryId;
			countryA.unionStatus.beenInviteCountry = otherCountryId;

			countryB = getCountryData(otherCountryId);

			countryB.unionStatus.unionStatus = UnionStatusType.WAIT_UNION;
			countryB.unionStatus.inviteCountry = countryId;
			countryB.unionStatus.beenInviteCountry = otherCountryId;

			GameAlert.showAlertUtil(LangCrown.CROWN_UINION_INVITE_REPLY_4, null, getCountryName(countryId), getCountryName(otherCountryId));
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 广播正式结盟
		 * @param a
		 * @param b
		 *
		 */
		public static function onOfficialUnion(countryAId : int, countryBId : int) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			needSendUnionStates = true;
			var msg : String;
			var countryA : CountryData;
			var countryB : CountryData;
			countryA = getCountryData(countryAId);
			countryA.unionStatus.unionStatus = UnionStatusType.UNION;
			countryA.unionStatus.inviteCountry = countryAId;
			countryA.unionStatus.beenInviteCountry = countryBId;

			countryB = getCountryData(countryBId);

			countryB.unionStatus.unionStatus = UnionStatusType.UNION;
			countryB.unionStatus.inviteCountry = countryAId;
			countryB.unionStatus.beenInviteCountry = countryBId;

			GameAlert.showAlertUtil(LangCrown.CROWN_UINION_INVITE_REPLY_5, null, getCountryName(countryAId), getCountryName(countryBId));
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 结盟被拒绝了
		 * @param countryId
		 *
		 */
		public static function unionInviteOtherReplyLeft(countryId : int, b : Boolean) : void
		{
			var countryData : CountryData = selfCountryData;
			if (!countryData)
				return;
			var msg : String;
			if (b)
			{
				GameAlert.showAlertUtil(LangCrown.CROWN_UINION_INVITE_REPLY_6, null, getCountryName(countryId));
			}
			else
			{
				GameAlert.showAlertUtil(LangCrown.CROWN_UINION_INVITE_REPLY_3, null, getCountryName(countryId));
				countryData.unionStatus.clearUnion();
				var country : CountryData = getCountryData(countryId);
				if (country)
					country.unionStatus.clearUnion();
			}
			//关闭结盟提示面板
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
		}

		/**
		 * 解盟 申请成功
		 *
		 */
		public static function onLeftUnion() : void
		{
			var msg : String = LanguageConfig.getText(LangCrown.CROWN_LEFT_UNION);
			NoticeManager.showNotify(msg);
		}

		/**
		 * 正式解盟
		 * @param A
		 * @param B
		 *
		 */
		public static function onOfficialLeftUnion(a : int, b : int) : void
		{
			var countryA : CountryData = getCountryData(a);
			var countryB : CountryData = getCountryData(b);
			needSendUnionStates = true;
			countryA.unionStatus.clearUnion();
			countryA.unionStatus.lastUnionCountry = b;
			countryA.unionStatus.unionStatus = UnionStatusType.NONE;
			countryB.unionStatus.clearUnion();
			countryB.unionStatus.lastUnionCountry = a;
			countryB.unionStatus.unionStatus = UnionStatusType.NONE;
			var msg : String = LanguageConfig.getText(LangCrown.CROWN_OFFICIAL_LEFT_UNION_BROADCAST, getCountryName(a), getCountryName(b));
			NoticeManager.showNotify(msg);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 等待解盟
		 * @param a
		 * @param b
		 *
		 */
		public static function onWaitLeftUnion(a : int, b : int) : void
		{
			var countryA : CountryData = getCountryData(a);
			var countryB : CountryData = getCountryData(b);
			needSendUnionStates = true;
			countryA.unionStatus.unionStatus = UnionStatusType.WAIT_LIFT;
			countryB.unionStatus.unionStatus = UnionStatusType.WAIT_LIFT;
			var msg : String = LanguageConfig.getText(LangCrown.CROWN_LEFT_UNION_BROADCAST, getCountryName(a), getCountryName(b));
			NoticeManager.showNotify(msg);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_UNION_STATE_CHANGE);
		}

		public static function getCountryUnions() : Array
		{
			var result : Array = [];
			var item : CrownDiplomacyData;
			for each (var country : CountryData in _countryDataBySequence)
			{
				item = new CrownDiplomacyData();
				item.countryId = country.sequence;
				item.countryLevel = country.countryStrong;
				item.nationalStrength = country.countryPower + "";
				item.treasuryCapital = MoneyUtil.getHtmlMoneyString(country.exchequer.amount);
				item.currAllyId = country.unionStatus.getUnionCountry();
				result.push(item);
			}
			return result;
		}

		/**
		 * 设置自己国家数据
		 * @param client
		 *
		 */
		public static function setSelfCountryState(proto : CountryDataProto) : void
		{
			var countryData : CountryData = new CountryData();
			countryData.setSelfConfig(proto);
			countryData.sequence = MainRoleManager.actorInfo.countryId;
			countryData.unionStatus.mineCountry = MainRoleManager.actorInfo.countryId;
			_countryDataBySequence[countryData.sequence] = countryData;
		}

		/**
		 * 设置其他国家数据
		 * @param client
		 *
		 */
		public static function setOtherCountryState(otherCountries : Array) : void
		{
			for each (var dataProto : OtherCountryDataProto in otherCountries)
			{
				var countryData : CountryData = new CountryData();
				countryData.setOtherConfig(dataProto);
				_countryDataBySequence[countryData.sequence] = countryData;
			}
		}

		/**
		 * 获取国家数据
		 * @param sequence 国家顺序
		 * @return
		 *
		 */
		public static function getCountryData(sequence : int) : CountryData
		{
			return _countryDataBySequence[sequence] as CountryData;
		}

		/**
		 * 国家等级变更
		 * @param country
		 * @param country_power
		 * @param power_type
		 *
		 */
		public static function changeCountryPower(country : int, country_power : Number, power_type : int) : void
		{
			var countryData : CountryData = getCountryData(country);
			if (countryData)
			{
				countryData.countryPower = country_power;
				countryData.powerType = power_type;
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 国王改变
		 * @param sequence
		 * @param id
		 * @param name
		 *
		 */
		public static function changeCountryKing(sequence : int, id : Number, name : String) : void
		{
			var countryData : CountryData = getCountryData(sequence);
			if (countryData && countryData.officeData)
			{
				if (id > 0 && name)
				{
					var postData : CountryGovernmentPostData = countryData.officeData.getKing();
					if (postData)
					{
						postData.id = id;
						postData.playerName = name;
					}
				}
				else
				{
					countryData.officeData.removeKing();
				}
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);

			CountrySender.setOtherCountryKingChanged();
		}

		public static function changeYesterdayIncome(yesterdayIncome : Number, todayJinWeiSalary : Number) : void
		{
			var countryData : CountryData = selfCountryData;
			if (countryData && countryData.exchequer)
			{
				countryData.exchequer.yesterdayIncome = yesterdayIncome;
				countryData.exchequer.todayJinWeiSalary = todayJinWeiSalary;
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_EXCHEQUER_CHANGE);
		}

		public static function changeTaxRate(taxRate : Number) : void
		{
			var countryData : CountryData = selfCountryData;
			if (countryData && countryData.exchequer)
			{
				countryData.exchequer.taxRate = taxRate;
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_EXCHEQUER_CHANGE);
		}

		public static function setTaxRate(rate : int) : void
		{
			if (rate > CountryMiscCfgData.taxRateUpper || rate < CountryMiscCfgData.taxRateLower)
			{
				NoticeManager.showNotify(LangCountry.COUNTRY_TAX_RATE_ERROR, CountryMiscCfgData.taxRateLower, CountryMiscCfgData.taxRateUpper);
				return;
			}
			CountrySender.reqChangeTaxRate(rate);
		}
		//----军费修改变量
		private static var militaryTotal : Number;
		private static var militaryPercent : int;
		private static var militaryMax : int;

		/**
		 * varint64 军费补贴总额
		 * varint32 军费补贴百分比
		 * varint32 军费补贴上限
		 */
		public static function changeMilitary(total : Number, percent : int, max : int) : void
		{
			if (total > selfCountryData.exchequer.amount * CountryMiscCfgData.militarySubsidyPerInTotal / 100 && percent == 0 && max == 0)
			{
				NoticeManager.showNotify(LangCountry.COUNTRY_MILITARY_EXCHEQUER_TOTAL_ERROR, CountryMiscCfgData.militarySubsidyPerInTotal);
				return;
			}
			if (total < CountryMiscCfgData.militarySubsidyLower && percent == 0 && max == 0)
			{
				NoticeManager.showNotify(LangCountry.COUNTRY_MILITARY_SUBSIDY_LOWER_ERROR, MoneyUtil.getHtmlMoneyString(CountryMiscCfgData.militarySubsidyLower));
				return;
			}
			if (((percent) < CountryMiscCfgData.militarySubsidyPerLower || (percent) > CountryMiscCfgData.militarySubsidyPerUpper) && total == 0 && max == 0)
			{
				NoticeManager.showNotify(LangCountry.COUNTRY_MILITARY_PERCENT_ERROR, CountryMiscCfgData.militarySubsidyPerLower, CountryMiscCfgData.militarySubsidyPerUpper);
				return;
			}
			if (max > CountryMiscCfgData.militarySubsidyLowerPerTimes && total == 0 && percent == 0)
			{
				NoticeManager.showNotify(LangCountry.COUNTRY_MILITARY_MAX_ERROR, CountryMiscCfgData.militarySubsidyLowerPerTimes);
				return;
			}
			militaryTotal = total;
			militaryPercent = percent;
			militaryMax = max;
			CountrySender.reqChangeMilitary(total, percent, max);
		}

		/**获取军费补贴成功**/
		public static function getMilitaryComplete(total : Number, percent : Number, max : Number, less : Number) : void
		{
			if (!selfCountryData.military)
				selfCountryData.military = new CountryMilitaryData();
			selfCountryData.military.maxMilitary = max;
			selfCountryData.military.rate = percent;
			selfCountryData.military.military = total;
			selfCountryData.military.haveMilitary = less;
			EventManager.dispatchEvent(CountryEvent.COUNTRY_MILITARY_CHANGE);
		}

		/**军费修改成功了**/
		public static function setMilitary() : void
		{
			if (!selfCountryData.military)
				selfCountryData.military = new CountryMilitaryData();
			selfCountryData.military.maxMilitary = militaryMax;
			selfCountryData.military.rate = militaryPercent;
			selfCountryData.military.military = militaryTotal;
			NoticeManager.showNotify("军费修改成功");
			EventManager.dispatchEvent(CountryEvent.COUNTRY_MILITARY_CHANGE);
		}

		/**
		 * 获取军费补贴数据
		 *
		 */
		public static function getMilitary() : void
		{
			if (!selfCountryData.military)
			{
				CountrySender.reqGetMilitary();
			}
			else
				EventManager.dispatchEvent(CountryEvent.COUNTRY_MILITARY_CHANGE);
		}

		public static function changeTongZhiLi(tongZhiLi : int) : void
		{
			var countryData : CountryData = selfCountryData;
			if (countryData && countryData.officeData)
			{
				countryData.officeData.tongZhiLi = tongZhiLi;
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 在视野内查找变更官职的玩家，如果有，则变更玩家头顶的官职头衔
		 * 如果该玩家是皇帝，又是国王，当变得没有国王的时候，显示皇帝
		 * @param roleId
		 * @param pos
		 *
		 */
		public static function changeAroundOfficerPos(roleId : Number, pos : int) : void
		{
		}

		/**
		 * 官职变更了
		 * @param isSet true(上任)/false(卸任)
		 * @param pos 职位
		 * @param name 被设置的人的名字
		 *
		 */
		public static function changeOfficerPos(isSet : Boolean, pos : int, index : int, id : Number, name : String) : void
		{
			var office : CountryGovernmentPostData = selfCountryData.officeData.getOfficeByPosAndIndex(pos, index);
			var msg : String;
			if (isSet)
			{
				office.id = id;
				office.index = index;
				office.playerName = name;
				msg = LanguageConfig.getText(LangCountry.COUNTRY_OFFICE_CHANGED_2, name, office.governmentName);
			}
			else
			{
				msg = LanguageConfig.getText(LangCountry.COUNTRY_OFFICE_CHANGED_1, name, office.governmentName);
				office.clear();
			}
			NoticeManager.showNotify(msg);

			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
			CountrySender.setOfficeChanged();
		}

		/**
		 * 设置其他国家国王数据
		 * @param client
		 *
		 */
		public static function setOtherCountryKing(otherKings : Dictionary) : void
		{
			for (var sequence : * in otherKings)
			{
				var dataProto : CountryMemberProto = otherKings[sequence];
				if (dataProto)
				{
					var countryData : CountryData = getCountryData(sequence);
					if (countryData)
					{
						countryData.setOfficeDataIsKing(dataProto);
					}
				}
			}

			EventManager.dispatchEvent(CountryEvent.COUNTRY_OTHER_COUNTRY_INFO_CHANGE);
		}

		/**
		 * 设置国家历史日志
		 * @param sequence
		 * @param records
		 *
		 */
		public static function setCountryHistoryRecords(sequence : int, datasProto : CountryHistoryRecordsProto) : void
		{
			if (!_countryHistoryRecordsBySequence)
			{
				_countryHistoryRecordsBySequence = new Dictionary();
			}
			var records : Array = datasProto.records;
			for each (var dataProto : CountryHistoryRecordProto in records)
			{
				var recordData : CountryHistoryRecordData = new CountryHistoryRecordData();
				recordData.setConfig(dataProto);

				var recordDatas : Array = _countryHistoryRecordsBySequence[sequence];
				if (!recordDatas)
				{
					recordDatas = [];
					_countryHistoryRecordsBySequence[sequence] = recordDatas;
				}
				recordDatas.push(recordData);
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_HISTORY_RECORDS_UPDATE, sequence);
		}

		/**
		 * 获取国家历史日志
		 * @param sequence
		 * @return
		 *
		 */
		public static function getCountryHistoryRecords(sequence : int) : Array
		{
			if (!_countryHistoryRecordsBySequence)
				return null;
			var records : Array = _countryHistoryRecordsBySequence[sequence];
			return records;
		}

		/**
		 * 设置国库日志
		 * @param records
		 *
		 */
		public static function setExchequerRecords(records : Array) : void
		{
			_exchequerRecords = [];
			for each (var dataProto : CountryExchequerLogProto in records)
			{
				var detailedData : CountryExchequerDetailedData = new CountryExchequerDetailedData();
				detailedData.setConfig(dataProto);
				_exchequerRecords.push(detailedData);
			}
			_exchequerRecords.sort(onSortExchequerRecords);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_EXCHEQUER_RECORDS_UPDATE);
		}

		public static function getExchequerRecords() : Array
		{
			return _exchequerRecords;
		}

		private static function onSortExchequerRecords(detailedDataA : CountryExchequerDetailedData, detailedDataB : CountryExchequerDetailedData) : int
		{
			if (detailedDataA.time < detailedDataB.time)
				return 1;
			else if (detailedDataA.time > detailedDataB.time)
				return -1;
			return 0;
		}

		/**
		 * 设置官员列表
		 * @param officeProto
		 *
		 */
		public static function setOffice(officeProto : CountryOfficeProto) : void
		{
			var countryData : CountryData = selfCountryData;
			if (countryData)
			{
				countryData.setOfficeData(officeProto);
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OFFICE_UPDATE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
		}

		/**
		 * 设置禁卫军成员列表
		 * @param members
		 *
		 */
		public static function setJinWeiApplicant(hash : HashMap) : void
		{
			_jinWeiApplicantMap = hash;
			EventManager.dispatchEvent(CountryEvent.COUNTRY_JIN_WEI_APPLICANT_UPDATE);
		}

		/**获取所有国家的国库银两**/
		public static function getAllCountryExchequerAmount() : void
		{
			for each (var country : CountryData in _countryDataBySequence)
			{
				if (country)
					CountrySender.reqExchequerAmount(country.sequence);
			}
		}

		/**
		 * 设置一个国家的银两
		 * @param country
		 * @param amount
		 *
		 */
		public static function changeExchequerAmount(country : int, amount : Number) : void
		{
			var countryData : CountryData = getCountryData(country);
			if (countryData && countryData.exchequer)
			{
				countryData.exchequer.amount = amount;
			}
			EventManager.dispatchEvent(CountryEvent.COUNTRY_EXCHEQUER_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_INFO_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_OTHER_COUNTRY_INFO_CHANGE);
		}

		/**
		 * 设置国库银两
		 * @param v
		 *
		 */
		public static function onSetExchequerDonate(v : int) : void
		{
			selfCountryData.exchequer.amount = v;
			EventManager.dispatchEvent(CrownEvent.EXCHEQUER_DONATE_CHANGE);
		}

		public static function getOfficeDatas() : CountryOfficeData
		{
			var countryData : CountryData = selfCountryData;
			if (countryData)
			{
				return countryData.officeData;
			}
			return null;
		}

		private static var neiZhenMap : HashMap;

		/**
		 *获取内政数据列表
		 * @return
		 *
		 */
		public static function getNeiZhenList() : Array
		{
			if (!neiZhenMap)
				neiZhenMap = new HashMap();
			var selfOffice : CountryGovernmentPostData = getSelfOffice();
			if (!selfOffice)
				return [];
			var neiz : CrownInteriorItemData;
			neiz = getJinYanInteriorItemData();
			neiz.availableState = CrownManager.countryModuleData.setDontTalkTimes + "/" + CountryOfficerCfgData.getData(selfOffice.governmentPost).canSetDontTalkTimes;
			neiz.operate = CrownManager.countryModuleData.setDontTalkTimes < CountryOfficerCfgData.getData(selfOffice.governmentPost).canSetDontTalkTimes;

			neiz = getQiuJinInteriorItemData();
			neiz.availableState = CrownManager.countryModuleData.captivityTimes + "/" + CountryOfficerCfgData.getData(selfOffice.governmentPost).canCaptivityTimes;
			neiz.operate = CrownManager.countryModuleData.captivityTimes < CountryOfficerCfgData.getData(selfOffice.governmentPost).canCaptivityTimes;

			neiz = getGuoYunInteriorItemData();
			var endTime : Number = selfCountryData.strategy.guoYunEndTime - SystemTimeManager.curtTm;
			neiz.availableState = endTime > 0 ? "生效中" : selfCountryData.strategy.isTodayStartGuoYun ? "已启用" : "可启用";
			neiz.time = endTime;
			neiz.operate = !selfCountryData.strategy.isTodayStartGuoYun;

			neiz = getBiaoJuInteriorItemData();
			neiz.operateStr = BiaoJuManager.isOpen ? "关闭" : "开启";
			neiz.availableState = BiaoJuManager.isOpen ? "生效中" : "未开启";
			neiz.operate = !BiaoJuManager.isOpen;
			return neiZhenMap.getValues();
		}

		private static function getBiaoJuInteriorItemData() : CrownInteriorItemData
		{
			var neiz : CrownInteriorItemData = neiZhenMap.getValue(CrownNeiZhengEnum.BIAO_JU);
			if (!neiz)
			{
				neiz = new CrownInteriorItemData();
				neiz.index = CrownNeiZhengEnum.BIAO_JU;
				neiZhenMap.add(CrownNeiZhengEnum.BIAO_JU, neiz);
			}
			return neiz;
		}

		private static function getGuoYunInteriorItemData() : CrownInteriorItemData
		{
			var neiz : CrownInteriorItemData = neiZhenMap.getValue(CrownNeiZhengEnum.GUO_YUN);
			if (!neiz)
			{
				neiz = new CrownInteriorItemData();
				neiz.index = CrownNeiZhengEnum.GUO_YUN;
				neiz.operateStr = "开启";
				neiZhenMap.add(CrownNeiZhengEnum.GUO_YUN, neiz);
			}
			return neiz;
		}

		private static function getQiuJinInteriorItemData() : CrownInteriorItemData
		{
			var neiz : CrownInteriorItemData = neiZhenMap.getValue(CrownNeiZhengEnum.QIU_JIN); //囚禁
			if (!neiz)
			{
				neiz = new CrownInteriorItemData();
				neiz.index = CrownNeiZhengEnum.QIU_JIN;
				neiz.operateStr = "囚禁";
				neiZhenMap.add(CrownNeiZhengEnum.QIU_JIN, neiz);
			}
			return neiz;
		}

		private static function getJinYanInteriorItemData() : CrownInteriorItemData
		{
			var neiz : CrownInteriorItemData = neiZhenMap.getValue(CrownNeiZhengEnum.JING_YAN); //禁言
			if (!neiz)
			{
				neiz = new CrownInteriorItemData();
				neiz.index = CrownNeiZhengEnum.JING_YAN;
				neiz.operateStr = "禁言";
				neiZhenMap.add(CrownNeiZhengEnum.JING_YAN, neiz);
			}
			return neiz;
		}

		public static function cliclNeizhen(index : int) : void
		{
			trace("内政点击了:" + index);
			switch (index)
			{
				case CrownNeiZhengEnum.JING_YAN: //禁言:
					AppManager.showApp(AppConstant.CROWN_SET_DONT_TALK_PANEL);
					break;
				case CrownNeiZhengEnum.QIU_JIN: //囚禁:
					AppManager.showApp(AppConstant.CROWN_QIU_JIN_PANEL);
					break;
				case CrownNeiZhengEnum.GUO_YUN: //国运
					YunBiaoManager.openCountryYunBiao();
					break;
				case CrownNeiZhengEnum.BIAO_JU:
					AppManager.showApp(AppConstant.BIAO_JU_PANEL);
					break;
			}
		}

		/////------------工具方法
		/**
		 * 获取国家名字
		 * @return
		 *
		 */
		public static function getCountryName(countryId : int) : String
		{
			return CountryNameCfgData.getCountryNameById(countryId);
		}

		public static function addOneJinWeiApplicant(id : Number, name : String, timeOut : Number) : void
		{
			var office : CountryGovernmentPostData = new CountryGovernmentPostData();
			office.id = id;
			office.playerName = name;
			office.timeOut = timeOut;
			_jinWeiApplicantMap.add(id, office);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.JIN_WEI_APPLICANT_TYPE, _jinWeiApplicantMap.length);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_JIN_WEI_APPLICANT_UPDATE);
		}

		public static function removeOneJinWeiApplicant(id : Number, agree : Boolean) : void
		{
			_jinWeiApplicantMap.remove(id);
			if (_jinWeiApplicantMap.length > 0)
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.JIN_WEI_APPLICANT_TYPE, _jinWeiApplicantMap.length);
			else
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.JIN_WEI_APPLICANT_TYPE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_JIN_WEI_APPLICANT_UPDATE);
		}

		public static function sendJinWeireply(id : Number, agree : Boolean) : void
		{
			removeOneJinWeiApplicant(id, agree);
			CountrySender.reqReplyJinWeiApplicant(id, agree);
		}

		/**
		 * 获取官职的俸禄
		 * @return
		 *
		 */
		public static function getOfficerSalary() : Number
		{
			if (!getSelfOffice())
				return 0;
			var office : CountryOfficerDataProto = CountryOfficerCfgData.getData(getSelfOffice().governmentPost);
			if (!office)
				return 0;
			if (selfCountryData.isStrongCountry)
				return office.strongSalary;
			if (selfCountryData.isWeakCountry)
				return office.weakSalary;
			return office.normalSalary;
		}

		/**获取自己是不是国王**/
		public static function getSelfIsKing() : Boolean
		{
			return getOfficeDatas() && getOfficeDatas().getKing() && getOfficeDatas().getKing().playerName == MainRoleManager.actorInfo.name;
		}

		public static function getKingGuildName() : String
		{
			if (getOfficeDatas() && getOfficeDatas().getKing())
				return getOfficeDatas().getKing().guildName;
			return "";
		}

		/**
		 * 国家的经书变化
		 * @param country1 自己国家id
		 * @param jinShu1 自己国家经书变化的数量
		 * @param country2 经书变化的国家id
		 * @param jinShu2 经书变化数量
		 *
		 */
		public static function onRecCountryJingShuChange(country1 : int, jinShu1 : int, country2 : int, jinShu2 : int) : void
		{
			var countryData : CountryData = selfCountryData;
			otherCountryJingShuArr = [];
			for (var idx : int = 0; idx < countryJingShuArr.length; idx++)
			{
				var data : TouJingBookStateData = countryJingShuArr[idx];
				if (data.countryId == country1 )
					data.countryJingShu = jinShu1;
				
				if (data.countryId == country2)
					data.countryJingShu = jinShu2;
				if( data.countryId != MainRoleManager.actorInfo.countryId )
					otherCountryJingShuArr.push( data );
			}
			EventManager.dispatchEvent(TouJingEvent.TOUJING_COUNTRY_JINGSHU_CHANGE, otherCountryJingShuArr);
		}
		
		/**
		 * 上线登录请求国家经书数据
		 * @return
		 *
		 */
		public static function setCountryJingShu() : void
		{
			var data : TouJingBookStateData;
			countryJingShuArr =[];
			otherCountryJingShuArr = [];
			for each (var country : CountryData in _countryDataBySequence)
			{
				data = new TouJingBookStateData();
				data.countryId = country.sequence;
				data.countryLevel = country.countryStrong;
				data.countryJingShu = country.jingShu;
				countryJingShuArr.push(data);
				jingShuNum += country.jingShu;
				
				if( data.countryId != MainRoleManager.actorInfo.countryId )
					otherCountryJingShuArr.push( data );
			}
		}
		
		/**
		 * 通过国家id获得国家的经书数量
		 * @param countryId
		 * @return
		 *
		 */
		public static function getJingShuAmountByCountryId(countryId : int) : int
		{
			if( countryJingShuArr == null || countryJingShuArr.length <= 0 )
				return 0;
			
			for (var idx : int = 0; idx < countryJingShuArr.length; idx++)
			{
				var data : TouJingBookStateData = countryJingShuArr[idx];
				if (countryId == data.countryId)
				{
					return data.countryJingShu;
				}
			}
			return 0;
		}
		
		/**
		 * 根据国家id获取对应的经书数量状态 
		 * @param countryId
		 * @return 
		 * 
		 */		
		public static function getCountryJingShuState( countryId : int ):String
		{
			var str:String = "";
			if( countryJingShuArr == null || countryJingShuArr.length <= 0 )
				return str;
			
			var inEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_1 ) ) / 100;
			var outEmptyRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_2 ) ) / 100;
			var inParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_3 ) ) / 100;
			var outParamarthaRate:Number = int( LanguageConfig.getText( LangTouJing.TOU_JING_RATE_4 ) ) / 100;
			
			for (var idx : int = 0; idx < countryJingShuArr.length; idx++)
			{
				var data : TouJingBookStateData = countryJingShuArr[idx];
				if (countryId == data.countryId)
				{
					if( data.countryJingShu < (jingShuNum * inEmptyRate) )
						return str = LanguageConfig.getText( LangTouJing.TOU_JING_JIEKONG );
					else if( data.countryJingShu > (jingShuNum * outEmptyRate) && data.countryJingShu < (jingShuNum * inParamarthaRate) )
						return str = LanguageConfig.getText( LangTouJing.TOU_JING_PUTONG );
					else if( data.countryJingShu >= (jingShuNum * inParamarthaRate) )
						return str = LanguageConfig.getText( LangTouJing.TOU_JING_ZHENDI );
					else if( data.countryJingShu < (jingShuNum * outParamarthaRate) && data.countryJingShu > (jingShuNum * outEmptyRate) )
						return str = LanguageConfig.getText( LangTouJing.TOU_JING_PUTONG  );
					else
						return str = LanguageConfig.getText( LangTouJing.TOU_JING_PUTONG );
				}
			}
			
			return str;
		}

		public static function setCountryCote(country : int, good : int, bad : int) : void
		{
			var data : CountryData = getCountryData(country);
			if (!data)
				return;
			data.yesterdayBadComments = bad;
			data.yesterdayGoodComments = good;
			EventManager.dispatchEvent(CountryEvent.COUNTRY_VOTE_CHANGE);
		}

		/**
		 * 是否是在国运期间 
		 * @return 
		 * 
		 */		
		public static function get isInGuoYun():Boolean
		{
			//国运奖励
			if( CountryManager.selfCountryData && CountryManager.selfCountryData.strategy && CountryManager.selfCountryData.strategy.isTodayStartGuoYun )
			{
				if( CountryManager.selfCountryData.strategy.guoYunEndTime > SystemTimeManager.curtTm )
					return true;
			}
			return false;
		}

	}
}
