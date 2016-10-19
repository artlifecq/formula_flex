package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.time.SystemTimeManager;

	import flash.utils.Dictionary;

	import app.cmd.CountryModuleMessages;
	import com.game.engine3D.vo.SenderReferenceSet;

	/**
	 *
	 * 国家消息发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-21 上午10:05:12
	 *
	 */
	public class CountrySender extends BaseSender
	{
		private static const REQ_COUNTRY_EXCHEQUER_RECORDS_DELAY_TIME : int = 60000;
		private static const REQ_HISTORY_RECORDS_DELAY_TIME : int = 60000;
		private static const REQ_OFFICE_DELAY_TIME : int = 30000;
		private static const REQ_OTHER_COUNTRY_KING_DELAY_TIME : int = 30000;
		/**
		 * 请求国家历史记录时间
		 */
		private static var _reqHistoryRecordsTimeBySequence : Dictionary = null;
		private static var _reqGetOfficeReferenceSet : SenderReferenceSet = new SenderReferenceSet("onReqGetOffice",onReqGetOffice, REQ_OFFICE_DELAY_TIME);
		private static var _reqOtherCountryKingRefSet : SenderReferenceSet = new SenderReferenceSet("onReqOtherCountryKing",onReqOtherCountryKing, REQ_OTHER_COUNTRY_KING_DELAY_TIME);
		private static var _reqExchequerRecordsReferenceSet : SenderReferenceSet = new SenderReferenceSet("onReqCountryExchequerRecords",onReqCountryExchequerRecords, REQ_COUNTRY_EXCHEQUER_RECORDS_DELAY_TIME);

		public function CountrySender()
		{
		}

		public static function setOfficeChanged() : void
		{
			_reqGetOfficeReferenceSet.dataChanged();
		}

		public static function setOtherCountryKingChanged() : void
		{
			_reqOtherCountryKingRefSet.dataChanged();
		}

		public static function addReqGetOfficeReference(ref : Object) : void
		{
			_reqGetOfficeReferenceSet.addRef(ref);
		}

		public static function removeReqGetOfficeReference(ref : Object) : void
		{
			_reqGetOfficeReferenceSet.removeRef(ref);
		}

		public static function addReqOtherCountryKingRef(ref : Object) : void
		{
			_reqOtherCountryKingRefSet.addRef(ref);
		}

		public static function removeReqOtherCountryKingRef(ref : Object) : void
		{
			_reqOtherCountryKingRefSet.removeRef(ref);
		}

		public static function addReqExchequerRecordsReference(ref : Object) : void
		{
			_reqExchequerRecordsReferenceSet.addRef(ref);
		}

		public static function removeReqExchequerRecordsReference(ref : Object) : void
		{
			_reqExchequerRecordsReferenceSet.removeRef(ref);
		}

		/**
		 * 请求他国国王数据，缓存数据，30S后数据无效
		 *
		 * 如果收到国王变更，立即将数据设置为无效，在需要数据是再次请求
		 */
		private static function reqOtherCountryKing() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_OTHER_COUNTRY_KING, _bytes);
		}

		/**
		 * 请求国家历史记录，单个国家的请求，60S才允许请求一次
		 *
		 * varint32 国家id
		 */
		public static function reqHistoryRecords(sequence : int) : void
		{
			if (!_reqHistoryRecordsTimeBySequence)
				_reqHistoryRecordsTimeBySequence = new Dictionary();
			var time : Number = _reqHistoryRecordsTimeBySequence[sequence] ? _reqHistoryRecordsTimeBySequence[sequence] : 0;
			if (SystemTimeManager.curtTm >= time)
			{
				_bytes.clear();
				_bytes.writeVarint32(sequence);
				send(CountryModuleMessages.C2S_COUNTRY_HISTORY_RECORDS, _bytes);
				_reqHistoryRecordsTimeBySequence[sequence] = SystemTimeManager.curtTm + REQ_HISTORY_RECORDS_DELAY_TIME;
			}
		}

		/**
		 * 获得国库里有多少钱，该国国库资金客户端缓存5S，如有需要，该国数据5S后可以来请求一次
		 *
		 * varint32 哪个国家
		 */
		public static function reqExchequerAmount(sequence : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(sequence);
			send(CountryModuleMessages.C2S_GET_COUNTRY_EXCHEQUER_AMOUNT, _bytes);
		}

		private static function onReqCountryExchequerRecords() : void
		{
			reqCountryExchequerRecords();
		}

		private static function onReqGetOffice() : void
		{
			reqGetOffice();
		}

		private static function onReqOtherCountryKing() : void
		{
			reqOtherCountryKing();
		}

		/**
		 * 请求获得本国官员列表
		 *
		 * 客户端缓存30S，如有需要，可以来进行请求，如果收到官员变更，如有需要可以请求
		 *
		 * 如果没有收到任何官员变更，也不需要知道这些官员在线不在线，也不需要来请求
		 */
		private static function reqGetOffice() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_GET_OFFICE, _bytes);
		}

		/**
		 * 获取军费补贴数据, 如果当前死亡了，且在军费补贴地图，有军费补贴，5S后可以再来请求一次该数据
		 *
		 * 如果当前没有军费补贴，不要来请求
		 *
		 * 当前没达到复活军费补贴的等级，不要来请求
		 *
		 * 如果当前没死亡或者没在军费补贴地图，不要请求
		 *
		 * 如果当前有权限修改军费，不知道该数据时，可以来请求
		 */
		public static function reqGetMilitary() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_GET_MILITARY, _bytes);
		}

		/**
		 * 请求禁卫申请，如果不能够设置禁卫，则不可以请求
		 *
		 * 本次登录期间，每30S可以请求一次
		 */
		public static function reqJinWeiApplicant() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_GET_JIN_WEI_APPLICANT, _bytes);
		}

		/**
		 * 请求禁卫需求，登录是，该数据为空，如有需要可以来请求
		 *
		 * 收到S2C_CHANGE_JIN_WEI_REQUIRES_BROADCAST，将缓存删除掉，如有需要可以在此请求
		 *
		 * 当存在缓存时，一直使用缓存
		 */
		public static function reqGetJinWeiRequires() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_GET_JIN_WEI_REQUIRES, _bytes);
		}

		/**
		 * 请求本国国库日志，不附带任何参数
		 *
		 * 如果有需要，可以1分钟来请求
		 */
		private static function reqCountryExchequerRecords() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_COUNTRY_EXCHEQUER_RECORDS, _bytes);
		}

		/**
		 * 设置官员
		 *
		 * varint32 CountryOfficerPos
		 * varint32 第几个
		 * varint64 设置的人
		 * bool true(上任)/false(卸任)
		 */
		public static function reqSetOfficer(pos : int, index : int, id : Number = 0, isSet : Boolean = true) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(pos);
			_bytes.writeVarint32(index);
			_bytes.writeVarint64(id);
			_bytes.writeBoolean(isSet);
			send(CountryModuleMessages.C2S_SET_OFFICER, _bytes);
		}

		/**
		 * 自己卸任
		 */
		public static function reqOfficeRetire() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_OFFICE_RETIRE, _bytes);
		}

		/**
		 * 请求获得官员官印
		 */
		public static function reqGetOfficeSeal() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_GET_OFFICE_SEAL, _bytes);
		}

		/**
		 * 发送禁卫申请
		 */
		public static function reqSentJinWeiApplicant() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_SENT_JIN_WEI_APPLICANT, _bytes);
		}

		/**
		 * 回复禁卫申请
		 *
		 * varint64 申请者的id
		 * bool 同意(true)/拒绝(false)
		 */
		public static function reqReplyJinWeiApplicant(id : Number, agree : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(id);
			_bytes.writeBoolean(agree);
			send(CountryModuleMessages.C2S_REPLY_JIN_WEI_APPLICANT, _bytes);
		}

		/**
		 * 修改税率
		 *
		 * varint32 税率
		 */
		public static function reqChangeTaxRate(taxRate : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(taxRate);
			send(CountryModuleMessages.C2S_CHANGE_TAX_RATE, _bytes);
		}

		/**
		 * 修改禁卫要求，本次请求期间
		 *
		 * varint32 等级要求
		 * varint64 战斗力要求
		 * varint32 战斗力排名
		 * bool true(是本国)/false(是所有国家) 战斗力排行
		 */
		public static function reqChangeJinWeiRequires(level : int, combat : Number, combatRank : int, isSelf : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(level);
			_bytes.writeVarint64(combat);
			_bytes.writeVarint32(combatRank);
			_bytes.writeBoolean(isSelf);
			send(CountryModuleMessages.C2S_CHANGE_JIN_WEI_REQUIRES, _bytes);
		}

		/**
		 * 修改军费设置
		 *
		 * varint64 军费补贴总额
		 * varint32 军费补贴百分比
		 * varint32 军费补贴上限
		 */
		public static function reqChangeMilitary(total : Number, percent : int, max : int) : void
		{
			_bytes.clear();
			_bytes.writeVarint64(total);
			_bytes.writeVarint32(percent);
			_bytes.writeVarint32(max);
			send(CountryModuleMessages.C2S_CHANGE_MILITARY, _bytes);
		}

		/**
		 * 请求结盟状态，或者如果收到
		 *
		 * S2C_UNION_BROADCAST
		 * S2C_OFFICIAL_UNION_BROADCAST
		 * S2C_LIFT_UNION_BROADCAST
		 * S2C_OFFICIAL_LIFT_UNION_BROADCAST
		 *
		 * 可以来请求一次
		 */
		public static function reqAllCountryUnionStatus() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_ALL_COUNTRY_UNION_STATUS, _bytes);
		}

		/**
		 * 请求结盟
		 *
		 * varint32 目标国
		 */
		public static function reqUnionInviteOther(targetSequence : int, msg : String) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(targetSequence);
			_bytes.writeUTFBytes(msg);
			send(CountryModuleMessages.C2S_UNION_INVITE_OTHER, _bytes);
		}

		/**
		 * 回复目标结盟邀请
		 *
		 * bool true(同意结盟)/false(拒绝结盟)
		 */
		public static function reqUnionInviteesReply(agree : Boolean) : void
		{
			_bytes.clear();
			_bytes.writeBoolean(agree);
			send(CountryModuleMessages.C2S_UNION_INVITEES_REPLY, _bytes);
		}

		/**
		 * 解盟
		 *
		 */
		public static function leftUnion() : void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_LIFT_UNION, _bytes);
		}
		/**
		 * 开启国运
		 */
		public static function onStartGuoYun():void
		{
			_bytes.clear();
			send(CountryModuleMessages.C2S_START_GUO_YUN, _bytes);
		}
	}
}
