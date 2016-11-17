package com.rpgGame.app.cmdlistener.crown
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.crown.CrownManager;
	import com.rpgGame.app.manager.yunBiao.YunBiaoManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangCountry;
	import com.rpgGame.coreData.lang.LangCrown;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import app.cmd.CountryModuleMessages;
	import app.cmd.SummonModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class CrownCmdListener extends BaseBean
	{
		public function CrownCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_COUNTRY_ANNOUNCEMENT, onSetCountryAnnouncement);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_COUNTRY_ANNOUNCEMENT_FAIL, onSetCountryAnnouncementFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_COUNTRY_ANNOUNCEMENT_CHANGED_BROADCAST, onSetCountryAnnouncementChangeBroadcast);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_GET_COUNTRY_ANNOUNCEMENT, onGetCountryAnnouncement);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COLLECT_SALARY, onCollectSalary);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COLLECT_SALARY_FAIL, onCollectSalaryFail);

			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_JIN_WEI_ANNOUNCEMENT, onSetJinWeiAnnouncement);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_JIN_WEI_ANNOUNCEMENT_FAIL, onSetJinWeiAnnouncementFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_JIN_WEI_ANNOUNCEMENT_CHANGED_BROADCAST, onSetJinWeiAnnouncementChangeBroadcast);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_GET_JIN_WEI_ANNOUNCEMENT, onGetJinWeiAnnouncement);
			//////////////////////募捐///////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_DONATE, onCountryDonate);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_DONATE_FAIL, onCountryDonateFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_DONATE_BROADCAST, onCountryDonateBroadcast);
			//////////////////////募捐///////////////////////
			/////////////////////捐款///////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_DO_DONATE, onDoDonate);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_DO_DONATE_FAIL, onDoDonateFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_LARGE_DONATE_BROADCAST, onLargeDonateBroadcast);
			/////////////////////捐款///////////////////////

			/////////////////////禁言//////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_DONT_TALK, onSetDontTalk);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_SET_DONT_TALK_FAIL, onSetDontTalkFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_BEEN_SET_DONT_TALK, onBeenSetDontTalk);
			/////////////////////禁言//////////////////////

			////////////////////囚禁///////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_CAPTIVITY, onSetCaptivity);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_CAPTIVITY_FAIL, onSetCaptivityFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_BEEN_CAPTIVITY, onBeenSetCaptivity);
			////////////////////囚禁///////////////////////
			//////////////////国运///////////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_START_GUO_YUN, onStartGuoYun);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_START_GUO_YUN_FAIL, onStartGuoYunFail);
			//////////////////国运///////////////////////////
			

			/////////////////////官员//////////////////////
			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_OFFICER_SUMMON, onOfficerSummon);
			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_COUNTRY_OFFICER_SUMMON, onCountryOfficerSummon);
			SocketConnection_protoBuffer.addCmdListener(SummonModuleMessages.S2C_COUNTRY_OFFICER_SUMMON_FAIL, onCountryOfficerSummonFail);
			/////////////////////官员//////////////////////

			/////////////////////评价/////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_VOTE, onVoteComplete);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_VOTE_FAIL, onVoteFail);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_VOTE_CHANGED, onVoteChange);
			//////////////////////战报//////////////////////
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_MEMBER_BEEN_KILLED, onMemberBeenKilled);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_COUNTRY_OFFICER_BEEN_KILLED, onOfficerBeenKilled);
			SocketConnection_protoBuffer.addCmdListener(CountryModuleMessages.S2C_BIAO_CHE_BEEN_DESTROY, onBiaoCheBeenDestory);
			finish();
		}
		/**
		 * 开启国运成功
		 */
		private function onStartGuoYun(buffer : ByteBuffer):void
		{
			YunBiaoManager.openCountryYunBiaoComplete(CountryManager.getSelfCountryId());
			if(CountryManager.selfCountryData)
				CountryManager.selfCountryData.strategy.isTodayStartGuoYun = true;
		}
		/**
		 * 开启国运失败，返回varint32错误码
		 *
		 * 1. 权限不够
		 * 2. 已经开启了
		 * 3. 没在开启时间段内
		 */
		private function onStartGuoYunFail(buffer : ByteBuffer):void
		{
			switch(buffer.readVarint32())
			{
				case 1:
				{
					NoticeManager.showNotify("权限不够");
					break;
				}
				case 2:
				{
					NoticeManager.showNotify("已经开启了");
					break;
				}
				case 3:
				{
					NoticeManager.showNotify("没在开启时间段内");
					break;
				}
			}
		}
		
		/**
		 * 某国投票变更了
		 *
		 * varint32 国家
		 * varint32 昨天的好评
		 * varint32 昨天的差评
		 */
		private function onVoteChange(buffer : ByteBuffer) : void
		{
			var country : int = buffer.readVarint32();
			var goods : int = buffer.readVarint32();
			var bad : int = buffer.readVarint32();

		}

		/**
		 * 镖车被劫
		 *
		 * 镖车被劫：镖车主国民名字在【地图：坐标x,y】被劫。
		 *
		 * varint32 所在地图id
		 * varint32 x
		 * varint32 y
		 * bytes 镖车主国民名字
		 */
		private function onBiaoCheBeenDestory(buffer : ByteBuffer) : void
		{
			var scene : int = buffer.readVarint32();
			var x : int = buffer.readVarint32();
			var y : int = buffer.readVarint32();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.biaoCheBeenDestory(scene, x, y, name);
		}

		/**
		 * 国家官员被人击杀
		 *
		 * 公告内容：
		 *
		 * 官员被杀：击杀者国家·名字在【地图：坐标x,y】袭击职位。
		 *
		 * varint32 击杀者国家
		 * varint32 所在地图id
		 * varint32 x
		 * varint32 y
		 * varint32 countryOfficerPos职位
		 * bytes 击杀者的名字
		 */
		private function onOfficerBeenKilled(buffer : ByteBuffer) : void
		{
			var country : int = buffer.readVarint32();
			var scene : int = buffer.readVarint32();
			var x : int = buffer.readVarint32();
			var y : int = buffer.readVarint32();
			var pos : int = buffer.readVarint32();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.officerBeenKilled(country, scene, x, y, pos, name);
		}

		/**
		 * 国家有人被击杀
		 * <p>
		 * 公告内容：
		 * <p>
		 * 国民被杀：击杀者国家·名字在【地图：坐标x,y】袭击国民。
		 * <p>
		 * varint32 击杀者国家
		 * varint32 所在地图id
		 * varint32 x
		 * varint32 y
		 * varint32 被袭击者的等级
		 * varint64 被袭击者的武勋
		 * bytes 击杀者的名字
		 */
		private function onMemberBeenKilled(buffer : ByteBuffer) : void
		{
			var country : int = buffer.readVarint32();
			var scene : int = buffer.readVarint32();
			var x : int = buffer.readVarint32();
			var y : int = buffer.readVarint32();
			var beenkillLevel : int = buffer.readVarint32();
			var beenkillfight : Number = buffer.readVarint64();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.memberBeenkilled(country, scene, x, y, beenkillLevel, beenkillfight, name);
		}

		/**
		 * 评价失败，返回varint32错误码
		 *
		 * 1. 已经评价过了
		 * 2. 等级过低
		 * 3. 没有国王
		 * 4. 当前没在投票时间段内
		 */
		private function onVoteFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var errorStr : String;
			switch (error)
			{
				case 1:
					errorStr = LanguageConfig.getText(LangCrown.CROWN_VOTE_FAIL_1);
					break;
				case 2:
					errorStr = LanguageConfig.getText(LangCrown.CROWN_VOTE_FAIL_2);
					break
				case 3:
					errorStr = LanguageConfig.getText(LangCrown.CROWN_VOTE_FAIL_3);
					break
				case 4:
					errorStr = LanguageConfig.getText(LangCrown.CROWN_VOTE_FAIL_4);
					break;
			}
			NoticeManager.showNotify(errorStr);
		}

		/**
		 * 评价成功，将当前国家投票状态设置为true
		 */
		private function onVoteComplete(buffer : ByteBuffer) : void
		{
			CrownManager.onVoteComplete();
		}

		/////////////////////官员//////////////////////
		/**
		 * 回应召唤失败，返回varint32错误码
		 *
		 * 1. 没有人召唤过你
		 * 2. 条件不满足
		 */
		private function onCountryOfficerSummonFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var errorStr : String;
			switch (error)
			{
				case 1:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_COUNTRY_OFFICER_SUMMON_FAIL_1);
					break;
				case 2:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_COUNTRY_OFFICER_SUMMON_FAIL_2);
					break;
			}
			NoticeManager.showNotify(errorStr);
		}

		/**
		 * 召唤成功
		 *
		 * varint32 召唤id
		 */
		private function onCountryOfficerSummon(buffer : ByteBuffer) : void
		{
//			var id : int = buffer.readVarint32();
		}

		/**
		 * 国王令/虎符/禁卫军 召唤，同一个人可能会收到两条相同id的数据
		 *
		 * varint32 TokenType令牌类型
		 *
		 * varint32 召唤的id
		 * varint32 CountryOfficerPos 职位
		 * utfbytes 官员名字
		 * varint32 场景
		 * varint32 x
		 * varint32 y
		 * varint32 CountryType 场景所属国家，0表示中立区
		 * varint64 召唤过期时间
		 * bytes 召唤文本
		 */
		private function onOfficerSummon(buffer : ByteBuffer) : void
		{
			var type : int = buffer.readVarint32();
			var id : int = buffer.readVarint32();
			var offficePos : int = buffer.readVarint32();
			var officerName : String = buffer.readUTF();
			var sceneId : int = buffer.readVarint32();
			var pointX : int = buffer.readVarint32();
			var pointY : int = buffer.readVarint32();
			var countryType : int = buffer.readVarint32();
			var endTime : Number = buffer.readVarint32();
			var summonLbl : String = buffer.readUTFBytes(buffer.bytesAvailable);
		}

		/////////////////////囚禁//////////////////////
		/**
		 * 囚禁目标成功
		 *
		 * varint32 今日囚禁的次数
		 */
		private function onSetCaptivity(buffer : ByteBuffer) : void
		{
			var time : int = buffer.readVarint32();
			CrownManager.setHaveCaptivityTime(time);
		}

		/**
		 * 囚禁失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 没有次数了
		 * 3. 要禁言的时长非法
		 * 4. 目标没在线
		 * 5. 目标已经被禁言过了
		 * 6. 服务器繁忙
		 * 7. 目标不是本国国民
		 * 8. 目标在副本
		 * 9. 服务器bug
		 */
		private function onSetCaptivityFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var errorStr : String;
			switch (error)
			{
				case 1:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_1);
					break;
				case 2:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_2);
					break;
				case 3:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_3);
					break;
				case 4:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_4);
					break;
				case 5:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_5);
					break;
				case 6:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_6);
					break;
				case 7:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_7);
					break;
			}
			NoticeManager.showNotify(errorStr);
		}

		/**
		 * 你被国王囚禁了
		 *
		 * 接着你就要进入被囚禁的场景了
		 *
		 * varint64 囚禁结束时间
		 */
		private function onBeenSetCaptivity(buffer : ByteBuffer) : void
		{
			var endTime : Number = buffer.readVarint64();
			CrownManager.setCaptivityEndTime(endTime);
		}

		/////////////////////禁言//////////////////////
		/**
		 * 你被禁言了
		 *
		 * varint64 禁言结束时间
		 */
		private function onBeenSetDontTalk(buffer : ByteBuffer) : void
		{
			var endTime : Number = buffer.readVarint64();
			CrownManager.setDontTalkEndTime(endTime);
		}

		/**
		 * 禁言失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 没有次数了
		 * 3. 要禁言的时长非法
		 * 4. 目标没在线
		 * 5. 目标已经被禁言过了
		 * 6. 服务器繁忙
		 * 7. 目标不是本国国民
		 */
		private function onSetDontTalkFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var errorStr : String;
			switch (error)
			{
				case 1:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_1);
					break;
				case 2:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_2);
					break;
				case 3:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_3);
					break;
				case 4:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_4);
					break;
				case 5:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_5);
					break;
				case 6:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_6);
					break;
				case 7:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_SET_DONT_TALK_FAIL_7);
					break;
			}
			NoticeManager.showNotify(errorStr);
		}

		/**
		 * 禁言成功
		 *
		 * varint32 当前的禁言次数
		 */
		private function onSetDontTalk(buffer : ByteBuffer) : void
		{
			var time : int = buffer.readVarint32();
			CrownManager.setHaveDontTalkTime(time);
		}

		/////////////////////禁言//////////////////////
		/////////////////////捐款///////////////////////
		/**
		 * 捐款成功
		 *
		 * varint64 当前国库银子数量
		 */
		private function onDoDonate(buffer : ByteBuffer) : void
		{
			var money : int = buffer.readVarint32();
			CountryManager.onSetExchequerDonate(money);
		}

		/**
		 * 捐款失败，返回varint32错误码
		 *
		 * 1. 要捐的钱的数量非法
		 * 2. 钱不够捐
		 * 3. 捐献失败，国库已满
		 */
		private function onDoDonateFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var errorStr : String;
			switch (error)
			{
				case 1:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_DO_DONATE_FAIL_1);
					break;
				case 2:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_DO_DONATE_FAIL_2);
					break;
				case 3:
					errorStr = LanguageConfig.getText(LangCountry.CROWN_DO_DONATE_FAIL_3);
					break;
			}
			NoticeManager.showNotify(errorStr);
		}

		/**
		 * 大额捐款广播
		 *
		 * varint32 捐献的额度
		 * bytes 捐献者的名字
		 */
		private function onLargeDonateBroadcast(buffer : ByteBuffer) : void
		{
			var money : int = buffer.readVarint32();
			var people : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangCountry.CROWN_DO_LARGE_DONATE_BROADCAST, people, MoneyUtil.getHtmlMoneyString(money));
		}

		//////////////////////募捐///////////////////////
		/**
		 * 募捐广播
		 *
		 * bytes 募捐的文字
		 */
		private function onCountryDonateBroadcast(buffer : ByteBuffer) : void
		{
			var text : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.getCountryDonate(text);
		}

		/**
		 * 募捐失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 * 2. 已经募捐过了
		 */
		private function onCountryDonateFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var failReason : String;
			switch (error)
			{
				case 1:
					failReason = LangCountry.CROWN_COUNTRY_DONATE_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.CROWN_COUNTRY_DONATE_FAIL_2;
					break;
			}
			NoticeManager.showNotify(failReason);
		}

		/**
		 * 募捐成功
		 *
		 * 将当前是否发送过募捐设置成true
		 */
		private function onCountryDonate(buffer : ByteBuffer) : void
		{
			CrownManager.setCountryDonateChange(true);
		}

		//////////////////////禁卫公告/////////////////////

		/**
		 * 返回禁卫公告，缓存数据，该国家公告可能为空，意味着官员没有设置，不管，缓存
		 */
		private function onSetJinWeiAnnouncement(buffer : ByteBuffer) : void
		{
			var announcement : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.setJinWeiAnnouncement(announcement);
		}

		/**
		 * 禁卫公告变更广播，如有需要，清空禁卫公告
		 */
		private function onSetJinWeiAnnouncementChangeBroadcast(buffer : ByteBuffer) : void
		{
			CrownManager.JinWeiAnnouncementChange();
		}

		/**
		 * 返回禁卫公告
		 */
		private function onGetJinWeiAnnouncement(buffer : ByteBuffer) : void
		{
			var announcement : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.setJinWeiAnnouncement(announcement);
		}

		/**
		 * 设置禁卫公告失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 */
		private function onSetJinWeiAnnouncementFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var failReason : String;
			switch (error)
			{
				case 1:
				{
					failReason = LangCountry.COUNTRY_SET_ANNOUNCEMENT_FAIL_1;
					break;
				}

			}
			NoticeManager.showNotify(failReason);
		}

		///////////////俸禄////////////////////////////

		/**
		 * 领取自己的职位俸禄成功，不附带任何参数
		 *
		 * 将今日是否领取俸禄设置为已经领取
		 */
		private static function onCollectSalary(buffer : ByteBuffer) : void
		{
			CrownManager.setHasCollectSalary(true);
			NoticeManager.showNotify("领取今日俸禄成功");
		}

		/**
		 * 领取职位俸禄失败，返回varint32错误码
		 *
		 * 1. 不是官员
		 * 2. 不够一天
		 * 3. 当前没有俸禄
		 * 4. 银子太多
		 * 5. 已经领取俸禄了
		 */
		private static function onCollectSalaryFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangCountry.COUNTRY_COLLECT_SALARY_FAIL_1;
					break;
				case 2:
					failReason = LangCountry.COUNTRY_COLLECT_SALARY_FAIL_2;
					break;
				case 3:
					failReason = LangCountry.COUNTRY_COLLECT_SALARY_FAIL_3;
					break;
				case 4:
					failReason = LangCountry.COUNTRY_COLLECT_SALARY_FAIL_4;
					break;
				case 5:
					failReason = LangCountry.COUNTRY_COLLECT_SALARY_FAIL_5;
					break;
			}
			NoticeManager.showNotify(failReason, failID);
		}

		//////////////////////公告/////////////////////

		/**
		 * 返回国家公告，缓存数据，该国家公告可能为空，意味着官员没有设置，不管，缓存
		 *
		 * bytes 国家公告
		 */
		private function onGetCountryAnnouncement(buffer : ByteBuffer) : void
		{
			var announcement : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.setAnnouncement(announcement);
		}

		/**
		 * 国家公告变更广播，如有需要，清空国家公告
		 */
		private function onSetCountryAnnouncementChangeBroadcast(buffer : ByteBuffer) : void
		{
			CrownManager.AnnouncementChange();
		}

		/**
		 * 返回国家公告
		 */
		private function onSetCountryAnnouncement(buffer : ByteBuffer) : void
		{
			var announcement : String = buffer.readUTFBytes(buffer.bytesAvailable);
			CrownManager.setAnnouncement(announcement);
		}

		/**
		 * 设置国家公告失败，返回varint32错误码
		 *
		 * 1. 没有权限
		 */
		private function onSetCountryAnnouncementFail(buffer : ByteBuffer) : void
		{
			var error : uint = buffer.readVarint32();
			var failReason : String;
			switch (error)
			{
				case 1:
				{
					failReason = LangCountry.COUNTRY_SET_ANNOUNCEMENT_FAIL_1;
					break;
				}
			}
			NoticeManager.showNotify(failReason);
		}
	}
}
