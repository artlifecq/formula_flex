package com.rpgGame.app.cmdlistener.country
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.lang.LangCountry;
	import com.rpgGame.coreData.lang.LangCrown;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import app.cmd.CountryModuleMessages;
	import app.message.AllCountryDataProto;
	import app.message.AllUnionStatusProto;
	import app.message.CountryExchequerLogProto;
	import app.message.CountryHistoryRecordsProto;
	import app.message.CountryMemberProto;
	import app.message.CountryOfficeProto;
	import app.message.JinWeiRequiresProto;
	import app.message.OfficerMemberProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 国家消息处理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-21 上午10:05:12
	 *
	 */
	public class CountryCmdListener extends BaseBean
	{
		public function CountryCmdListener()
		{
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_COUNTRY_STATUS, onCountryStates);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_KING_CHANGED_BROADCAST, onKingChangedBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OTHER_COUNTRY_KING, onOtherCountryKing);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_COUNTRY_HISTORY_RECORDS, onHistoryRecords);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_COUNTRY_POWER_CHANGED, onPowerChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_COUNTRY_EXCHEQUER_AMOUNT, onExchequerAmount);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_OFFICE, onGetOffice);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_YESTERDAY_INCOME_CHANGED, onYesterdayIncomeChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_MILITARY, onGetMilitary);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_JIN_WEI_APPLICANT, onGetJinWeiApplicant);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_JIN_WEI_APPLICANT_FAIL, onGetJinWeiApplicantFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_JIN_WEI_REQUIRES, onGetJinWeiRequires);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_COUNTRY_EXCHEQUER_RECORDS, onCountryExchequerRecords);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_TONG_ZHI_LI_CHANGED, onTongZhiLiChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_SET_OFFICER, onSetOfficer);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_SET_OFFICER_FAIL, onSetOfficerFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OFFICE_RETIRE, onOfficeRetire);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OFFICE_RETIRE_FAIL, onOfficeRetireFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_AROUND_OFFICER_CHANGED, onAroundOfficerChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OFFICER_CHANGED, onOfficerChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_OFFICE_SEAL, onGetOfficeSeal);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_GET_OFFICE_SEAL_FAIL, onGetOfficeSealFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_COUNTRY_JING_SHU_CHANGED, onCountryJingShuChanged);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_SENT_JIN_WEI_APPLICANT, onSentJinWeiApplicant);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_SENT_JIN_WEI_APPLICANT_FAIL, onSentJinWeiApplicantFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_RECEIVE_JIN_WEI_APPLICANT, onReceiveJinWeiApplicant);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_REPLY_JIN_WEI_APPLICANT, onReplyJinWeiApplicant);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_REPLY_JIN_WEI_APPLICANT_FAIL, onReplyJinWeiApplicantFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_RECEIVE_JIN_WEI_APPLICANT_REPLY, onReceiveJinWeiApplicantReply);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_TAX_RATE_BROADCAST, onTaxRateBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_TAX_RATE_FAIL, onTaxRateFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_JIN_WEI_REQUIRES, onChangeJinWeiRequires);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_JIN_WEI_REQUIRES_BROADCAST, onChangeJinWeiRequiresBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_JIN_WEI_REQUIRES_FAIL, onChangeJinWeiRequiresFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_MILITARY, onChangeMilitary);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_CHANGE_MILITARY_FAIL, onChangeMilitaryFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_ALL_COUNTRY_UNION_STATUS, onAllCountryUnionStatus);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_INVITE_OTHER, onUnionInviteOther);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_INVITE_OTHER_FAIL, onUnionInviteOtherFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_OTHER_INVITE_SELF, onUnionOtherInviteSelf);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_INVITEES_REPLY, onUnionInviteReply);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OFFICIAL_UNION_BROADCAST, onOfficialUnion);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_OTHER_REPLY_INVITATION, onUnionOtherReplyInvite);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_INVITEES_REPLY_FAIL, onUnionInviteesReplyFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_UNION_BROADCAST, onUnionBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_LIFT_UNION, onLeftUnion);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_LIFT_UNION_FAIL, onLeftUnionFail);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_LIFT_UNION_BROADCAST, onLeftUnionBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_OFFICIAL_LIFT_UNION_BROADCAST, onOfficialLeftUnionBroadcast);
			SocketConnection.addCmdListener(CountryModuleMessages.S2C_AUTO_LIFT_UNION_BROADCAST, onAutoLeftUnionBroadcast);

			finish();
		}

		/**
		 * 返回国家的状态，数据已经压缩
		 *
		 * byte[] CountryCityProto，数据已经压缩
		 */
		private function onCountryStates(buffer : ByteBuffer) : void
		{
			var allData : AllCountryDataProto = new AllCountryDataProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			allData.mergeFrom(bytes);
			CountryManager.setSelfCountryState(allData.selfCountry);
			CountryManager.setOtherCountryState(allData.otherCountries);
			CountryManager.setCountryJingShu();
			YunBiaoManager.onGameStartYunBiao();
			EventManager.dispatchEvent(CountryEvent.COUNTRY_DATA_ONLINE);
		}

		/**
		 * 国王变化广播
		 * @param buffer
		 *
		 */
		private function onKingChangedBroadcast(buffer : ByteBuffer) : void
		{
			var sequence : int = buffer.readVarint32();
			var id : Number = 0;
			var name : String = null;
			if (buffer.bytesAvailable)
			{
				id = buffer.readVarint64();
				name = buffer.readUTFBytes(buffer.bytesAvailable);
			}
			CountryManager.changeCountryKing(sequence, id, name);
		}

		/**
		 * 返回他国国王数据，已经压缩
		 *
		 * 该数据里面不会包括自己国家国王的数据
		 *
		 * 解压缩
		 *
		 * while(buffer.readable()){
		 *      varint32 国家
		 *      varint32 后面数据长度，长度为0表示没有国王
		 *      bytes decode成CountryMemberProto
		 * }
		 */
		private function onOtherCountryKing(buffer : ByteBuffer) : void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var otherKings : Dictionary = new Dictionary();
			while (bytes.bytesAvailable)
			{
				var memberProto : CountryMemberProto = null;
				var sequence : int = bytes.readVarint32();
				var len : int = bytes.readVarint32();
				if (len > 0)
				{
					memberProto = new CountryMemberProto();
					var protoBytes : ByteArray = new ByteArray();
					bytes.readBytes(protoBytes, 0, len);
					memberProto.mergeFrom(protoBytes);
				}
				otherKings[sequence] = memberProto;
			}
			CountryManager.setOtherCountryKing(otherKings);
		}

		/**
		 * 国家历史记录，该消息需要解压，收到后，客户端缓存
		 *
		 * 解压后
		 *
		 * varint32 国家id
		 *
		 * bytes CountryHistoryRecordsProto
		 */
		private function onHistoryRecords(buffer : ByteBuffer) : void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var sequence : int = bytes.readVarint32();
			var datasProto : CountryHistoryRecordsProto = new CountryHistoryRecordsProto();
			var protoBytes : ByteArray = new ByteArray();
			bytes.readBytes(protoBytes);
			datasProto.mergeFrom(protoBytes);
			CountryManager.setCountryHistoryRecords(sequence, datasProto);
		}

		/**
		 * 每晚0点，国家实力会变更
		 *
		 * varint32 country 哪个国家
		 * varint64 country_power 国力
		 * varint32 power_type 国力类型，即CountryPowerType
		 */
		private function onPowerChanged(buffer : ByteBuffer) : void
		{
			var country : int = buffer.readVarint32();
			var country_power : Number = buffer.readVarint64();
			var power_type : int = buffer.readVarint32();
			CountryManager.changeCountryPower(country, country_power, power_type);
		}

		/**
		 * 返回当前国库里面总共有多少钱，缓存该国家的数据
		 *
		 * varint32 哪个国家
		 * varint64 国库钱的数量
		 */
		private function onExchequerAmount(buffer : ByteBuffer) : void
		{
			var country : int = buffer.readVarint32();
			var amount : Number = buffer.readVarint64();
			CountryManager.changeExchequerAmount(country, amount);
		}

		/**
		 * 官员列表数据，已经压缩
		 *
		 * 解压
		 *
		 * bytes CountryOfficeProto
		 */
		private function onGetOffice(buffer : ByteBuffer) : void
		{
			var officeProto : CountryOfficeProto = new CountryOfficeProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			officeProto.mergeFrom(bytes);
			CountryManager.setOffice(officeProto);
		}

		/**
		 * 昨日收益跟禁卫今日的俸禄变更了
		 *
		 * varint64 昨日收入
		 * varint64 禁卫今日的俸禄
		 */
		private function onYesterdayIncomeChanged(buffer : ByteBuffer) : void
		{
			var yesterdayIncome : Number = buffer.readVarint64();
			var todayJinWeiSalary : Number = buffer.readVarint64();
			CountryManager.changeYesterdayIncome(yesterdayIncome, todayJinWeiSalary);
		}

		/**
		 * 获取军费补贴数据成功
		 *
		 * varint64 军费补贴总额
		 * varint32 军费补贴百分比
		 * varint32 军费补贴上限
		 * varint64 剩余的补贴额度
		 */
		private function onGetMilitary(buffer : ByteBuffer) : void
		{
			var total : Number = buffer.readVarint64();
			var percent : Number = buffer.readVarint32();
			var max : int = buffer.readVarint32();
			var less : Number = buffer.readVarint64();
			CountryManager.getMilitaryComplete(total, percent, max, less);
		}

		/**
		 * 回复禁卫申请，压缩
		 *
		 * 解压缩
		 *
		 * while(buffer.readable()){
		 *      varint64 该申请过期时间
		 *      varint32 后面数据长短
		 *      bytes 解析成 CountryMemberProto
		 * }
		 */
		private function onGetJinWeiApplicant(buffer : ByteBuffer) : void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var members : HashMap = new HashMap();
			while (bytes.bytesAvailable)
			{
				var timeOut : Number = bytes.readVarint64();
				var len : int = bytes.readVarint32();
				if (len > 0)
				{
					var dataProto : CountryMemberProto = new CountryMemberProto();
					var protoBytes : ByteArray = new ByteArray();
					var office : CountryGovernmentPostData;
					bytes.readBytes(protoBytes, 0, len);
					dataProto.mergeFrom(protoBytes);
					office = new CountryGovernmentPostData();
					office.setConfigIsMember(dataProto, false);
					office.timeOut = timeOut;
					members.add(office.id, office);
				}
			}
			CountryManager.setJinWeiApplicant(members);
		}

		/**
		 * 请求禁卫申请失败，返回varint32错误码
		 *
		 * 1. 没有权限查看
		 */
		private function onGetJinWeiApplicantFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_GET_JIN_WEI_APPLICANT_FAIL;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 返回禁卫需求，缓存下来
		 *
		 * bytes JinWeiRequiresProto
		 */
		private function onGetJinWeiRequires(buffer : ByteBuffer) : void
		{
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			var jinwei : JinWeiRequiresProto = new JinWeiRequiresProto();
			jinwei.mergeFrom(bytes);
			CountryManager.getJinWeiSetDataComplete(jinwei);
		}

		/**
		 * 国库日志，该消息需要解压
		 *
		 * 解压后
		 *
		 * while(buffer.readable()){
		 *      varint32 后面历史数据长度
		 *      bytes 数据，解析成CountryExchequerLogProto，如果CountryExchequerLogProto.time==0，表明这是当前的数据，还没有加入到现有日志里面去的
		 * }
		 */
		private function onCountryExchequerRecords(buffer : ByteBuffer) : void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var records : Array = [];
			while (bytes.bytesAvailable)
			{
				var len : int = bytes.readVarint32();
				if (len > 0)
				{
					var dataProto : CountryExchequerLogProto = new CountryExchequerLogProto();
					var protoBytes : ByteArray = new ByteArray();
					bytes.readBytes(protoBytes, 0, len);
					dataProto.mergeFrom(protoBytes);
					records.push(dataProto);
				}
			}
			CountryManager.setExchequerRecords(records);
		}

		/**
		 * 统治力变更了
		 *
		 * varint32 新的统治力
		 *
		 * 国王可能做了什么操作，导致统治力变更了
		 */
		private function onTongZhiLiChanged(buffer : ByteBuffer) : void
		{
			var tongZhiLi : int = buffer.readVarint32();
			CountryManager.changeTongZhiLi(tongZhiLi);
		}

		/**
		 * 设置官员成功，刷新成你设置的结果
		 *
		 * 提示设置成功，如有需要，可以立马请求官员数据
		 */
		private function onSetOfficer(buffer : ByteBuffer) : void
		{
			var memberProto : OfficerMemberProto;
			if (buffer.bytesAvailable)
			{
				memberProto = new OfficerMemberProto();
				var bytes : ByteArray = new ByteArray();
				buffer.readBytes(bytes);
				memberProto.mergeFrom(bytes);
			}
			CountryManager.setOfficerComplete(memberProto);
		}

		/**
		 * 设置官员失败，返回varint32错误码
		 *
		 * 解锁
		 *
		 * 1. 没有权限
		 * 2. 要设置的官职没有找到
		 * 3. 国王无法通过该方法设置
		 * 4. 禁卫无法通过该方法设置
		 * 5. 目标不在线，无法设置官员
		 * 6. 目标不是我们国家的
		 * 7. 今天已经被设置过官员了
		 * 8. 目标已经是官员了，请先卸任
		 * 9. 要卸任的官职上不是该官员了(刷新官员数据)
		 * 10. 要设置的位置有别的官员，清闲卸任他
		 * 11. 服务器bug
		 */
		private function onSetOfficerFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_5;
					break;
				case 6:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_6;
					break;
				case 7:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_7;
					break;
				case 8:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_8;
					break;
				case 9:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_9;
					break;
				case 10:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_10;
					break;
				case 11:
					failReason = LangCountry.COUNTRY_SET_OFFICER_FAIL_11;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 卸任成功
		 *
		 * 如有需要，玩家可以立刻请求官员数据
		 */
		private function onOfficeRetire(buffer : ByteBuffer) : void
		{
			CountryManager.officeRetireComplete();
		}

		/**
		 * 卸任失败，返回varint32错误码
		 *
		 * 1. 你不是官员
		 * 2. 国王无法卸任
		 */
		private function onOfficeRetireFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_OFFICE_RETIRE_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_OFFICE_RETIRE_FAIL_2;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 周围有官员职位变更了
		 *
		 * varint64 变更官职的玩家
		 *
		 * if(buffer.readable()){
		 *      varint32 CountryOfficerPos
		 * } else {
		 *      职位变没了
		 * }
		 *
		 * 收到这个消息，在视野内查找变更官职的玩家，如果有，则变更玩家头顶的官职头衔
		 *
		 * 如果该玩家是皇帝，又是国王，当变得没有国王的时候，显示皇帝
		 */
		private function onAroundOfficerChanged(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var countryOfficerPos : int = 0;
			if (buffer.bytesAvailable)
				countryOfficerPos = buffer.readVarint32();
			CountryManager.changeAroundOfficerPos(id, countryOfficerPos);
		}

		/**
		 * 官职变更了
		 *
		 * boolean isSet true(上任)/false(卸任)
		 * varint32 CountryOfficerPos
		 * varint32 该官职的第几个官员
		 * bytes 被设置的人的名字
		 *
		 * 如果是自己，提示自己怎么怎么了，如果不是自己，提示别人怎么怎么了
		 *
		 * 清掉本国官员数据，如有需要可以请求
		 */
		private function onOfficerChanged(buffer : ByteBuffer) : void
		{
			var isSet : Boolean = buffer.readBoolean();
			var countryOfficerPos : int = buffer.readVarint32();
			var index : int = buffer.readVarint32();
			var id : Number = buffer.readVarint64();
			var setRoleName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CountryManager.changeOfficerPos(isSet, countryOfficerPos, index, id, setRoleName);
		}

		/**
		 * 获得官印成功
		 */
		private function onGetOfficeSeal(buffer : ByteBuffer) : void
		{

		}

		/**
		 * 获得官印失败，返回varint32错误码
		 */
		private function onGetOfficeSealFail(buffer : ByteBuffer) : void
		{

		}

		/**
		 * 国家的经书数量变化，如果有打开需要显示该国家经书数量的面板等等，更新经书数量
		 *
		 * varint32 serverSequence 有经书变化的国家
		 * varint32 变化后的国家的经书数量
		 * varint32 serverSequence 有经书变化的国家
		 * varint32 变化后的国家的经书数量
		 *
		 * 增加经书的国家广播:
		 *    找策划
		 *
		 * 减少经书的国家广播:
		 *    找策划
		 */
		private function onCountryJingShuChanged(buffer : ByteBuffer) : void
		{
			var addSequence : int = buffer.readVarint32();
			var addCount : int = buffer.readVarint32();
			var reduceSequence : int = buffer.readVarint32();
			var reduceCount : int = buffer.readVarint32();
			CountryManager.onRecCountryJingShuChange(addSequence, addCount, reduceSequence, reduceCount);
			
			//30796 【夺经书】获得经书时的提示，全国的人都能看到 【未解决】   -----修改为只有自己能看到（策划需求）
//			if (MainRoleManager.actorInfo.countryId == addSequence)
//				NoticeManager.showHint(EnumHintInfo.COUNTRY_TOUJING_CHANGE, [addCount]);
//			if (MainRoleManager.actorInfo.countryId == reduceSequence)
//				NoticeManager.showHint(EnumHintInfo.COUNTRY_TOUJING_CHANGE, [reduceCount]);
		}

		/**
		 * 发送禁卫申请成功，等待国王回复
		 */
		private function onSentJinWeiApplicant(buffer : ByteBuffer) : void
		{
			GameAlert.showAlertUtil(LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT);
		}

		/**
		 * 发送申请失败，返回
		 *
		 * varint32错误码
		 *
		 * 1. 当前是官员，不可以申请禁卫
		 * 2. 禁卫人数已满
		 * 3. 当前没有国王
		 * 4. 申请已经达到上限了
		 * 5. 已经发送了禁卫申请了
		 * 6. 等级不满足
		 * 7. 战斗力不满足
		 * 8. 排行不满足
		 */
		private function onSentJinWeiApplicantFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_5;
					break;
				case 6:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_6;
					break;
				case 7:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_7;
					break;
				case 8:
					failReason = LangCountry.COUNTRY_SENT_JIN_WEI_APPLICANT_FAIL_8;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 收到禁卫申请
		 *
		 * 数据
		 *
		 * varint64 该申请过期时间
		 * varint64 申请者的id
		 * bytes 申请者的名字
		 *
		 * 清楚本地禁卫请求缓存
		 */
		private function onReceiveJinWeiApplicant(buffer : ByteBuffer) : void
		{
			var timeOut : Number = buffer.readVarint64();
			var id : Number = buffer.readVarint64();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CountryManager.addOneJinWeiApplicant(id, name, timeOut);
		}

		/**
		 * 回复申请成功，删除目标的申请
		 *
		 * varint64 申请者的id
		 * bool 同意(true)/拒绝(false)
		 */
		private function onReplyJinWeiApplicant(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var agree : Boolean = buffer.readBoolean();
			CountryManager.removeOneJinWeiApplicant(id, agree);
		}

		/**
		 * 回复申请失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 目标根本没有发送过申请
		 * 3. 不是本国的
		 * 4. 禁卫人数已满
		 * 5. 目标已经是官员了
		 * 6. 目标没在线
		 * 7. 目标今天已经被设置过官员了
		 */
		private function onReplyJinWeiApplicantFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_5;
					break;
				case 6:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_6;
					break;
				case 7:
					failReason = LangCountry.COUNTRY_REPLY_JIN_WEI_APPLICANT_FAIL_7;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 收到禁卫申请回复
		 *
		 * bool 同意(true)/拒绝(false)
		 *
		 * if(同意){
		 *      bytes OfficerMemberProto
		 * }
		 */
		private function onReceiveJinWeiApplicantReply(buffer : ByteBuffer) : void
		{
			var agree : Boolean = buffer.readBoolean();
			if (agree)
			{
				var officer : OfficerMemberProto = new OfficerMemberProto();
				var bytes : ByteArray = new ByteArray();
				buffer.readBytes(bytes);
				officer.mergeFrom(bytes);
				CountryManager.setJinWeiJun(officer);
			}
		}

		/**
		 * 修改税率成功
		 *
		 * varint32 税率，自己换算百分比
		 */
		private function onTaxRateBroadcast(buffer : ByteBuffer) : void
		{
			var taxRate : int = buffer.readVarint32();
			CountryManager.changeTaxRate(taxRate);
		}

		/**
		 * 修改税率失败，返回varint32错误码
		 *
		 * 1. 没权限修改税率
		 * 2. 税率设置非法，不是有效的税率
		 */
		private function onTaxRateFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_TAX_RATE_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_TAX_RATE_FAIL_2;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 修改禁卫要求成功，将发送修改前的数据覆盖上去
		 */
		private function onChangeJinWeiRequires(buffer : ByteBuffer) : void
		{
			CountryManager.setJinWeiSetDataComplete();
		}

		/**
		 * 禁卫需求修改了，清掉禁卫需求数据
		 */
		private function onChangeJinWeiRequiresBroadcast(buffer : ByteBuffer) : void
		{
			CountryManager.jinWeiSetDataChange();
		}

		/**
		 * 修改禁卫要求失败，返回varint32错误码
		 *
		 * 1. 没权限修改禁卫请求
		 * 2. 等级要求非法
		 * 3. 战力要求非法
		 * 4. 战力排行要求非法
		 */
		private function onChangeJinWeiRequiresFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_CHANGE_JIN_WEI_REQUIRES_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_CHANGE_JIN_WEI_REQUIRES_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_CHANGE_JIN_WEI_REQUIRES_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_CHANGE_JIN_WEI_REQUIRES_FAIL_4;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 修改军费设置
		 *
		 * 将新的设置覆盖进去
		 */
		private function onChangeMilitary(buffer : ByteBuffer) : void
		{
			CountryManager.setMilitary();
		}

		/**
		 * 修改军费补贴失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 补贴额度非法
		 * 3. 补贴百分比非法
		 * 4. 补贴上限非法
		 * 5. 当前国库钱不够
		 */
		private function onChangeMilitaryFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_CHANGE_MILITARY_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_CHANGE_MILITARY_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_CHANGE_MILITARY_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_CHANGE_MILITARY_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_CHANGE_MILITARY_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 各个国家的结盟状态，压缩，缓存数据，将是否已经请求结盟状态设置为true
		 *
		 * 解压
		 *
		 * bytes AllUnionStatusProto
		 */
		private function onAllCountryUnionStatus(buffer : ByteBuffer) : void
		{
			var allData : AllUnionStatusProto = new AllUnionStatusProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			allData.mergeFrom(bytes);
			CountryManager.setAllUnionStatus(allData);
		}

		/**
		 * 发送结盟成功，等待对方回复，这时候会进入cd，一定时间以内是无法操作的
		 *
		 * varint32 目标国
		 */
		private function onUnionInviteOther(buffer : ByteBuffer) : void
		{
			var targetSequence : int = buffer.readVarint32();
			CountryManager.setUnionInviteOther(targetSequence);
		}

		/**
		 * 结盟广播
		 *
		 * varint32 A
		 * varint32 B
		 *
		 * 广播内容:
		 *
		 * A已成功向B发起结盟，结盟关系将于本日24:00正式确立。
		 *
		 * 修改A/B两国的结盟状态
		 */
		private function onUnionBroadcast(buffer : ByteBuffer) : void
		{
			var countryA : int = buffer.readVarint32();
			var countryB : int = buffer.readVarint32();
			CountryManager.unionInviteOtherReplyRight(countryA, countryB);
		}

		/**
		 * 正式结盟广播
		 *
		 * varint32 A
		 * varint32 B
		 *
		 * 广播内容:
		 *
		 * A跟B正式结盟
		 */
		private function onOfficialUnion(buffer : ByteBuffer) : void
		{
			var countryA : int = buffer.readVarint32();
			var countryB : int = buffer.readVarint32();
			CountryManager.onOfficialUnion(countryA, countryB);
		}

		/**
		 * 解盟成功，不附带消息
		 */
		private function onLeftUnion(buffer : ByteBuffer) : void
		{
			CountryManager.onLeftUnion();

		}

		/**
		 * 广播正式解盟
		 *
		 * varint32 国家A
		 * varint32 国家B
		 *
		 * A跟B正式解盟
		 */
		private function onOfficialLeftUnionBroadcast(buffer : ByteBuffer) : void
		{
			var countryA : int = buffer.readVarint32();
			var countryB : int = buffer.readVarint32();
			CountryManager.onOfficialLeftUnion(countryA, countryB);
		}

		/**
		 * 将自动解盟
		 *
		 * varint32 国家A
		 * varint32 国家B
		 *
		 * A跟B将自动解盟，两个成员将外交值设置为0
		 */
		private function onAutoLeftUnionBroadcast(buffer : ByteBuffer) : void
		{
			var countryA : int = buffer.readVarint32();
			var countryB : int = buffer.readVarint32();
			CountryManager.onOfficialLeftUnion(countryA, countryB);
		}

		/**
		 * 广播解盟
		 *
		 * varint32 国家A
		 * varint32 国家B
		 *
		 * A已成功向B发起解盟，结盟关系将于本日24:00正式解除。
		 */
		private function onLeftUnionBroadcast(buffer : ByteBuffer) : void
		{
			var countryA : int = buffer.readVarint32();
			var countryB : int = buffer.readVarint32();
			CountryManager.onWaitLeftUnion(countryA, countryB);
		}

		/**
		 * 解盟失败，附带varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 当前没有盟国
		 * 3. 当前正在解盟中
		 */
		private function onLeftUnionFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCrown.CROWN_LEFT_UNION_FAIL_1;
					break;
				case 2:
					failReason = LangCrown.CROWN_LEFT_UNION_FAIL_2;
					break;
				case 3:
					failReason = LangCrown.CROWN_LEFT_UNION_FAIL_3;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 发送结盟申请失败，返回varint32错误码
		 *
		 * 1. 我国是强国，无法发起结盟
		 * 2. 没权限
		 * 3. 当前在结盟状态中
		 * 4. 非法的结盟国家
		 * 5. 想结盟国家是强国
		 * 6. 想结盟的国家没有结盟管理者在线
		 * 7. 目标在结盟状态中
		 * 8. 国库钱不够
		 * 9. 结盟cd中
		 * 10. 目标国家结盟cd中
		 */
		private function onUnionInviteOtherFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_5;
					break;
				case 6:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_6;
					break;
				case 7:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_7;
					break;
				case 8:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_8;
					break;
				case 9:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_9;
					break;
				case 10:
					failReason = LangCountry.COUNTRY_UNION_INVITE_OTHER_FAIL_10;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 有别的国家给你发送了结盟请求
		 *
		 * varint32 申请国
		 *
		 * bytes 结盟文字
		 */
		private function onUnionOtherInviteSelf(buffer : ByteBuffer) : void
		{
			var sequence : int = buffer.readVarint32();
			var msg : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CountryManager.otherCountryUnionInvite(sequence, msg);
		}

		/**
		 * 回复目标结盟邀请成功（回复人会收到）
		 *
		 * varint32 回复的国家
		 * bool true(同意结盟)/false(拒绝结盟)
		 *
		 * 收到消息，关闭面板，提示您同意/拒绝了xxx国的结盟邀请
		 */
		private function onUnionInviteReply(buffer : ByteBuffer) : void
		{
			var countryId : int = buffer.readVarint32();
			var bool : Boolean = buffer.readBoolean();
			CountryManager.unionInviteReply(countryId, bool);
		}

		/**
		 * 他国回复拒绝你的结盟邀请（邀请人会收到）
		 *
		 * varint32 回复的国家
		 * bool true(同意结盟)/false(拒绝结盟)
		 *
		 * 收到消息，关闭面板，提示对方拒绝结盟
		 */
		private function onUnionOtherReplyInvite(buffer : ByteBuffer) : void
		{
			var countryId : int = buffer.readVarint32();
			var bool : Boolean = buffer.readBoolean();
			CountryManager.otherCountryInviteReply(countryId,bool);
		}

		/**
		 * 回复失败，返回varint32错误码
		 *
		 * 1. 没权限
		 * 2. 回复结盟的国家非法
		 * 3. 目标没有给你发送过结盟邀请
		 * 4. 申请过期了
		 * 5. 自己是强国
		 * 6. 目标国家是强国
		 */
		private function onUnionInviteesReplyFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_5;
					break;
				case 6:
					failReason = LangCountry.COUNTRY_UNION_INVITEES_REPLY_FAIL_6;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}
	}
}
