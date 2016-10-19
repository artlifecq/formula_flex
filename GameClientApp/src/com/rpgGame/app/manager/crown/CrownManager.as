package com.rpgGame.app.manager.crown
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.netease.protobuf.Int64;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.CrownSender;
	import com.rpgGame.app.ui.alert.AlertText;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.country.CrownEvent;
	import com.rpgGame.core.utils.GameTimerUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryMiscCfgData;
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.CrownVoteTypeEnum;
	import com.rpgGame.coreData.enum.ZhanBaoTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.info.crown.CountryModuleData;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangCountry;
	import com.rpgGame.coreData.lang.LangCrown;
	
	import app.message.CountryOfficerDataProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	public class CrownManager
	{
		private static const MAX_INPUT_TEXT : int = 30;
		/**
		 * 国家公告是否改变了  如果改变了，在拿取这份数据的时候需要重新请求一下
		 */
		private static var _announcementIsChange : Boolean = true;
		/**
		 * 禁卫公告是否改变
		 */
		private static var _jinWeiAnnouncementIsChange : Boolean = true;
		/**
		 * 是否投票了
		 */
		public static var isVote : Boolean = false;


		public function CrownManager()
		{
		}
		
		private static function get _countryModuleData():CountryModuleData
		{
			return MainRoleManager.actorInfo.countryModuleData;
		}

		private static var zhanBaoMap : HashMap;
		private static const ZHAN_BAO_MAX : int = 30;
		private static const CROWN_GAME_TIMER : String = "CrownGameTimer";
		private static var gametimer : GameTimer;
		/**记录时间的，如果是当前时间比这个时间小了，证明到第二天了**/
		private static var timeHour : int = int.MAX_VALUE;
		private static var tempDate : Date;
		/**是否可以显示投票面板,如果是已经显示了，就过滤，每天重置**/
		private static var canShowVote : Boolean = true;
		private static var voteState : int;
		private static var voteTimeData : TimeData;

		public static function startCheck() : void
		{
			gametimer = new GameTimer(CROWN_GAME_TIMER, 6000, 0, gameTimerUpdate);
			GameTimerUtil.startTimer(gametimer);
			voteTimeData = new TimeData(CountryMiscCfgData.voteTimeData);
			tempDate = new Date();
		}

		private static function gameTimerUpdate() : void
		{
			var time : Number = SystemTimeManager.curtTm;
			tempDate.setTime(time);
			var hour : int = tempDate.getHours();
			if (hour < timeHour)
			{
				//跨天了	
				canShowVote = true;
			}
			timeHour = hour;
			if (time >= voteStartTime && time < voteEndTime && canShowVotePanel())
			{
				//弹出投票框
				canShowVote = false;
				AppManager.showApp(AppConstant.CROWN_VOTE_PANEL);
			}
		}

		private static function canShowVotePanel() : Boolean
		{
			var king : CountryGovernmentPostData = CountryManager.selfCountryData.officeData.getKing();
			if (!king || !king.id)
				return false;
			if (isVote)
				return false;
			if (!canShowVote)
				return false;
			return true;
		}

		private static function get voteStartTime() : Number
		{
			return voteTimeData.getNextTime().time;
		}

		private static function get voteEndTime() : Number
		{
			return voteStartTime + CountryMiscCfgData.voteDuration;
		}

		public static function onVoteComplete() : void
		{
			isVote = true;
			var king : CountryGovernmentPostData = CountryManager.selfCountryData.officeData.getKing();
			if (!king || !king.id)
				return;
			//投票成功，弹出获得经验
			switch (voteState)
			{
				case CrownVoteTypeEnum.VOTE_BAD:
					GameAlert.showAlertUtil(LangAlertInfo.voteComplteBad, null, null, false, null, king.playerName, CountryMiscCfgData.voteExp);
					break;
				case CrownVoteTypeEnum.VOTE_GOOD:
					GameAlert.showAlertUtil(LangAlertInfo.voteComplteGood, null, null, false, null, king.playerName, CountryMiscCfgData.voteExp);
					break;
				case CrownVoteTypeEnum.VOTE_WAIVER:
					GameAlert.showAlertUtil(LangAlertInfo.voteComplteWaiver, null, null, false, null, king.playerName, CountryMiscCfgData.voteExp);
					break;
			}
		}
		
		public static function openCrownPanel():void
		{
			var office : CountryGovernmentPostData = CountryManager.getSelfOffice();
			if(office)
			{
				AppManager.showAppNoHide(AppConstant.CROWN_PANEL);
			}else
			{
				NoticeManager.showNotify("您没有官职，无法使用官印");
			}
		}

		public static function sendVote(type : int) : void
		{
			//关掉提示
			switch (type)
			{
				case CrownVoteTypeEnum.VOTE_BAD:
					CrownSender.onCountryVote(true, false);
					break;
				case CrownVoteTypeEnum.VOTE_GOOD:
					CrownSender.onCountryVote(true, true);
					break;
				case CrownVoteTypeEnum.VOTE_WAIVER:
					CrownSender.onCountryVote(false);
					break;
			}
			voteState = type;
			onVoteComplete();
		}

		/**镖车被劫：$在【$:$,$】被劫。**/
		public static function biaoCheBeenDestory(scene : int, x : int, y : int, name : String) : void
		{
			var cfg : SceneData = MapDataManager.getMapInfo(scene);
			var msg : String = LanguageConfig.getText(LangCrown.BIAO_CHE_BEEN_DESTORY, name, cfg.name, x, y);
			setZhanBaoByType(ZhanBaoTypeEnum.BIAO_CHE, msg);
		}

		/**官员被杀：$·$在【$：$,$】袭击$。**/
		public static function officerBeenKilled(killCountry : int, scene : int, x : int, y : int, pos : int, name : String) : void
		{
			var cfg : SceneData = MapDataManager.getMapInfo(scene);
			var officerData : CountryOfficerDataProto = CountryOfficerCfgData.getData(pos);
			var msg : String = LanguageConfig.getText(LangCrown.OFFICER_BEEN_KILLED, CountryManager.getCountryName(killCountry), name, cfg.name, x, y, officerData ? officerData.posName : "");
			setZhanBaoByType(ZhanBaoTypeEnum.OFFICER, msg);
		}

		/**国民被杀：$·$在【$：$,$】袭击国民。**/
		public static function memberBeenkilled(killCountry : int, scene : int, x : int, y : int, beenKillLevel : int, beenKillFight : Number, killName : String) : void
		{
			var cfg : SceneData = MapDataManager.getMapInfo(scene);
			if (!cfg)
				return;
			var msg : String = LanguageConfig.getText(LangCrown.MEMBER_BEEN_KILLED, CountryManager.getCountryName(killCountry), killName, cfg.name, x, y);
			setZhanBaoByType(ZhanBaoTypeEnum.ACTIVITY, msg);
		}

		public static function setZhanBaoByType(type : int, msg : String) : void
		{
			if (!zhanBaoMap)
				zhanBaoMap = new HashMap();
			var array : Array = zhanBaoMap.getValue(type);
			if (!array)
			{
				array = [];
				zhanBaoMap.add(type, array);
			}
			if (array.length > ZHAN_BAO_MAX)
				array.shift();
			array.push(msg);
			EventManager.dispatchEvent(CrownEvent.CROWN_ZHAN_BAO_CHANGE);
		}

		public static function getZhanBaoByType(type : int) : Array
		{
			var result : Array = [];
			if (!zhanBaoMap)
				return result;
			if (!zhanBaoMap.getValue(type))
			{
				if (type == ZhanBaoTypeEnum.ALL)
				{
					for (var array : Array in zhanBaoMap.getValues())
					{
						result = result.concat(array);
					}
				}
				return result;
			}
			return zhanBaoMap.getValue(type);
		}

		public static function get countryAnnounment() : String
		{
			if (CountryManager.selfCountryData && CountryManager.selfCountryData.officeData)
				return CountryManager.selfCountryData.officeData.countryAnnounment;
			return "";
		}

		public static function set countryAnnounment(v : String) : void
		{
			if (CountryManager.selfCountryData && CountryManager.selfCountryData.officeData)
				CountryManager.selfCountryData.officeData.countryAnnounment = v;
		}

		public static function get jinWeiAnnounment() : String
		{
			if (CountryManager.selfCountryData && CountryManager.selfCountryData.officeData)
				return CountryManager.selfCountryData.officeData.jinweiAnnounment;
			return "";
		}

		public static function set jinWeiAnnounment(v : String) : void
		{
			if (CountryManager.selfCountryData && CountryManager.selfCountryData.officeData)
				CountryManager.selfCountryData.officeData.jinweiAnnounment = v;
		}

		///////////////囚禁////////////////////
		
		public static var setCaptivityPlayerName : String;
		public static var setCaptivityIndex : int;
		/**囚禁结束时间**/
		public static function setCaptivityEndTime(endTime : Number) : void
		{
			_countryModuleData.captivityEndTime = endTime;
			var time : Number = endTime - SystemTimeManager.curtTm;
			GameAlert.showAlertUtil(LangAlertInfo.getQiuJin,null,null,false,null,TimeUtil.format3TimeType(time*0.001));
			EventManager.dispatchEvent(CrownEvent.CAPTIVITY_END_TIME_CHANGE);
		}

		/**囚禁次数**/
		public static function setHaveCaptivityTime(time : int) : void
		{
//			NoticeManager.showNotify(LangCrown.CROWN_CAPTIVITY_PALYER_COMPLETE);
			var qiuJinTime : Int64 = CountryMiscCfgData.captivityDuration[setCaptivityIndex];
			if(qiuJinTime)
				GameAlert.showAlertUtil(LangAlertInfo.setDontTalkComplete,null,null,false,null,
					setCaptivityPlayerName,TimeUtil.format3TimeType(qiuJinTime.toNumber()*0.001));
			_countryModuleData.captivityTimes = time;
			EventManager.dispatchEvent(CrownEvent.SET_CAPTIVITY_TIME_CHANGE);
			EventManager.dispatchEvent(CrownEvent.NEI_ZHEN_CHANGE);
		}

		public static function captivityPlayer(index : int, id : Number) : void
		{
			if (!id)
				return;
			var self : CountryGovernmentPostData = CountryManager.getSelfOffice();
			if (!self)
			{
				NoticeManager.showNotify(LangCrown.CROWN_CAPTIVITY_PALYER_FAIL_2);
				return;
			}
			var office : CountryOfficerDataProto = CountryOfficerCfgData.getData(self.governmentPost);
			if (!office)
				return;
			if (office.hasCanCaptivityTimes == false)
			{
				NoticeManager.showNotify(LangCrown.CROWN_CAPTIVITY_PALYER_FAIL_2);
				return;
			}
			if (_countryModuleData.captivityTimes >= office.canCaptivityTimes)
			{
				NoticeManager.showNotify(LangCrown.CROWN_CAPTIVITY_PALYER_FAIL_1);
				return;
			}
			setCaptivityIndex = index;
			CrownSender.onCaptivity(index, id);
		}

		////////////////禁言///////////////////
		public static var setDontTalkPlayerName : String;
		public static var setDontTalkIndex : int;
		public static function dontTalkPlayer(index : int, id : Number) : void
		{
			if (!id)
				return;
			var self : CountryGovernmentPostData = CountryManager.getSelfOffice();
			if (!self)
			{
				NoticeManager.showNotify(LangCountry.CROWN_SET_DONT_TALK_FAIL_1);
				return;
			}
			var office : CountryOfficerDataProto = CountryOfficerCfgData.getData(self.governmentPost);
			if (!office)
				return;
			if (office.hasCanSetDontTalkTimes == false)
			{
				NoticeManager.showNotify(LangCountry.CROWN_SET_DONT_TALK_FAIL_1);
				return;
			}
			if (_countryModuleData.setDontTalkTimes >= office.canSetDontTalkTimes)
			{
				NoticeManager.showNotify(LangCountry.CROWN_SET_DONT_TALK_FAIL_2);
				return;
			}
			setDontTalkIndex = index;
			CrownSender.onSetDontTalk(index, id);
		}

		public static function setDontTalkEndTime(endTime : Number) : void
		{
			_countryModuleData.officerSetUntalkEndTime = endTime;
			var time : Number = endTime - SystemTimeManager.curtTm;
			GameAlert.showAlertUtil(LangAlertInfo.getDontTalk,null,null,false,null,TimeUtil.format3TimeType(time*0.001));
			EventManager.dispatchEvent(CrownEvent.DONT_TALK_END_TIME_CHANGE);
		}

		/**设置禁言次数**/
		public static function setHaveDontTalkTime(time : int) : void
		{
//			NoticeManager.showAlert(LangCrown.CROWN_SET_DONT_TALK);
			var qiuJinTime : Int64 = CountryMiscCfgData.untalkTimeDuration[setDontTalkIndex];
			if(qiuJinTime)
				GameAlert.showAlertUtil(LangAlertInfo.setDontTalkComplete,null,null,false,null,
					setDontTalkPlayerName,TimeUtil.format3TimeType(qiuJinTime.toNumber()*0.001));
			_countryModuleData.setDontTalkTimes = time;
			EventManager.dispatchEvent(CrownEvent.SET_DONT_TALK_TIME_CHANGE);
			EventManager.dispatchEvent(CrownEvent.NEI_ZHEN_CHANGE);
		}

		public static function getDontTalk() : Boolean
		{
			return _countryModuleData.officerSetUntalkEndTime > SystemTimeManager.curtTm;
		}
		
		public static function getDontTalkEndTime():Number
		{
			return _countryModuleData.officerSetUntalkEndTime;
		}

		/////////////////募捐//////////////////
		public static function setCountryDonateChange(v : Boolean) : void
		{
			_countryModuleData.isCountryDonate = v;
			EventManager.dispatchEvent(CrownEvent.COUNTRY_DONATE_CHANGE);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_EXCHEQUER_CHANGE);
		}

		/**
		 * 请求募捐
		 *
		 */
		public static function onCountryDonate() : void
		{
			if (_countryModuleData.isCountryDonate)
			{
				NoticeManager.showNotify(LangCrown.CROWN_DONAT_ERROR_1);
				return;
			}
			AlertText.showAlert(LanguageConfig.getText(LangCrown.CROWN_MU_JUAN_TITLE), LanguageConfig.getText(LangCrown.CROWN_MU_JUAN_STRING), onCountryDonateComplete);
		}

		private static function onCountryDonateComplete(str : String) : void
		{
			CrownSender.onCountryDonate(str);
		}

		/**
		 * 募捐广播
		 *
		 * bytes 募捐的文字
		 */
		public static function getCountryDonate(text : String) : void
		{
			GameAlert.showAlertUtil(LangCrown.CROWN_DONATE_BROADCAST,getCountryDonateClick,text);
		}
		
		private static function getCountryDonateClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
				{
					donateToCountry();
					break;
				}
			}			
		}
		
		private static function donateToCountry() : void
		{
			//预留捐款面板
			AppManager.showApp(AppConstant.CROWN_JUAN_KUAN_PANEL);
		}

		////////////////禁卫公告/////////////////
		public static function setJinWeiAnnouncementFunction() : void
		{
			AlertText.showAlert(LanguageConfig.getText(LangCrown.CROWN_JIN_WEI_TITLE), jinWeiAnnounment, CrownSender.setJinWeiAnnouncement);
		}

		/**
		 * 设置禁卫公告
		 * @param emperor
		 *
		 */
		public static function setJinWeiAnnouncement(emperor : String) : void
		{
			if (emperor.length > MAX_INPUT_TEXT)
			{
				//限制不能输入超过五十个字
				NoticeManager.showNotify(LangCrown.CROWN_MAX_INPUT_TEXT, MAX_INPUT_TEXT);
				return;
			}
			jinWeiAnnounment = emperor;
			EventManager.dispatchEvent(CrownEvent.JIN_WEI_ANNOUNCEMENT_CHANGE);
		}

		/**
		 * 国家禁卫改变了
		 *
		 */
		public static function JinWeiAnnouncementChange() : void
		{
			_jinWeiAnnouncementIsChange = true;
		}

		/**
		 * 获取禁卫公告
		 *
		 */
		public static function getJinWeiAnnouncement() : void
		{
			if (_jinWeiAnnouncementIsChange)
			{
				CrownSender.getJinWeiAnnouncement();
				_jinWeiAnnouncementIsChange = false;
			}
			else
				EventManager.dispatchEvent(CrownEvent.JIN_WEI_ANNOUNCEMENT_CHANGE);
		}

		/////////////////俸禄////////////////
		/**
		 * 设置俸禄是否领取
		 * 预留  派发俸禄领取状态改变
		 * @param v
		 * @return
		 *
		 */
		public static function setHasCollectSalary(v : Boolean) : void
		{
			_countryModuleData.hasCollectSalary = v;
			EventManager.dispatchEvent(CrownEvent.HAS_COLLECT_SALARY_CHANGE);
		}

		public static function getCollectSalary() : void
		{
			if (_countryModuleData.hasCollectSalary)
			{
				NoticeManager.showNotify(LangCrown.CROWN_GET_SOLLECT_SALARY);
				return;
			}
			CrownSender.getCollectSalary();
		}

		///////////////国家公告/////////////////
		public static function setAnnouncementFunction() : void
		{
			AlertText.showAlert(LanguageConfig.getText(LangCrown.CROWN_KING_GONG_GAO_TITLE), countryAnnounment, sendAnnouncement);
		}

		private static function sendAnnouncement(str : String) : void
		{
			if (str.length > MAX_INPUT_TEXT)
			{
				//限制不能输入超过五十个字
				NoticeManager.showNotify(LangCrown.CROWN_MAX_INPUT_TEXT, MAX_INPUT_TEXT);
				return;
			}
			CrownSender.setAnnouncement(str);
		}

		/**
		 * 设置国家公告
		 * @param emperor
		 *
		 */
		public static function setAnnouncement(emperor : String) : void
		{
			countryAnnounment = emperor;
			EventManager.dispatchEvent(CrownEvent.ANNOUNCEMENT_CHANGE);
		}

		/**
		 * 国家公告改变了
		 *
		 */
		public static function AnnouncementChange() : void
		{
			_announcementIsChange = true;
		}

		/**
		 * 获取国家公告
		 *
		 */
		public static function getAnnouncement() : void
		{
			if (_announcementIsChange)
			{
				CrownSender.getAnnouncement();
				_announcementIsChange = false;
			}
			else
				EventManager.dispatchEvent(CrownEvent.ANNOUNCEMENT_CHANGE);
		}

		///////////////国家公告/////////////////

		public static function get countryModuleData() : CountryModuleData
		{
			return _countryModuleData;
		}
		
	}
}
