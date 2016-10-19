package com.rpgGame.app.cmdlistener.country
{
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.countryWar.CountryWarChengMenManager;
	import com.rpgGame.app.manager.countryWar.CountryWarManager;
	import com.rpgGame.app.manager.countryWar.CountryWarSelfRelatedManager;
	import com.rpgGame.app.manager.countryWar.CountryWarStatusManager;
	import com.rpgGame.app.manager.countryWar.CountryWarWatchManager;
	import com.rpgGame.app.manager.countryWar.CountryWarWorshipManager;
	import com.rpgGame.app.manager.countryWar.CountryWarZhanCheManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.CountryWarSender;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.country.CountryWarEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.country.CountryOfficerCfgData;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarMonsterDeadInfo;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarMonsterLifeData;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarRankData;
	import com.rpgGame.coreData.lang.LangCountryWar;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.ZhanCheData;
	import com.rpgGame.coreData.type.CountryWarMonsterType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.utils.ByteArray;
	
	import app.cmd.CountryWarModuleMessages;
	import app.message.CountryOfficerPos;
	import app.message.CountryWarDataProto;
	import app.message.CountryWarEndProto;
	import app.message.CountryWarRecordProto;
	import app.message.OtherCountryWarEndProto;
	import app.message.SelfCountryWarInfoProto;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * 国战协议处理
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarCmdListener extends BaseBean
	{
		public function CountryWarCmdListener()
		{
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_INFO, onRecCountryWarInfo);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_FAIL, onRecCountryWarFail);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_DECLARE_WAR, onRecCountryWarDeclareWar);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_DECLARE_WAR_BROADCAST, onRecCountryWarDeclareWarBroadcast);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_START, onCountryWarStart);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_END, onRecCountryWarEnd);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_OTHER_COUNTRY_WAR_END, onRecOtherCountryWarEnd);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_STAUS, onRecCountryWarStatus);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_RANK_LIST, onRecCountryWarRankList);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_RESPONSE_COUNTRY_WAR_SELF_RANK, onRecCountryWarSelfRank);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ADD_COUNTRY_WAR_MONSTER, onRecAddCountryWarMonster);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_WAR_MONSTER_DEAD, onRecMonsterDead);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_GET_COUNTRY_WAR_DETAIL, onCountryWarDetail);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_JOIN_COUNTRY_WAR, onJoinCountryWar);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ENTER_ADMIRE_AREA, onEndterAdmireArea);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ADMIRE_COUNTRY_KING, onAdmireCountryKing);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_FAIL_COUNTRY_OFFICE_ADMIRE, onFailCountryOfficeAdmire);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_FAIL_COUNTRY_MEMBER_ADMIRE, onFailCountryMemberAdmire);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_SELF_WAR_INFO, onSelfWarInfo);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_CONTINUE_KILL_HERO, onContinueKillHero);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_INTERRUPT_CONTINUE_KILL_HERO, onInterruptContinueKillHero);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_CONTINUE_BEEN_KILLED_WHEN_NOT_KILL_OTHER, onContinueBeenKilledWhenNotKillOther);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_COUNTRY_OFFICER_BEEN_KILLED, onCountryOfficerBeenKilled);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ADD_ZHAN_CHE, onAddZhanChe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ACCEPT_ZHAN_CHE, onAcceptZhanChe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_UP_OR_DOWN_FROM_ZHAN_CHE_BROADCAST, onUpOrDownFromZhanCheBroadcast);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_DOWN_FROM_ZHAN_CHE, onDownFromZhanChe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_OLD_DRIVER_TAKE_ME, onOldDriverTakeMe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_OLD_DRIVER_BYE, onOldDriverBye);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_TAKE_ZHAN_CHE, onTakeZhanChe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_GET_OFF_ZHAN_CHE, onGetOffZhanChe);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ZHAN_CHE_CHANGE_SCENE, onZhanCheChangeScene);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ZHAN_CHE_SCENE_LOADED, onZhanCheSceneLoaded);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ZHAN_CHE_MEMBER_CHANGED, onZhanCheMemberChanged);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_SUPPORT, onSupport);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_POINT_CHANGED, onPointChanged);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ENTER_WATCH_MODE, onEnterWatchMode);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE, onEnterWatchScene);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE_FAIL_AND_RETURN_TARGET_INFO, onEnterWatchSceneFailAndReturnTargetInfo);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE_FAIL, onEnterWatchSceneFail);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_LEAVE_WATCH_SCENE, onLeaveWatchScene);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_CHANGE_WATCH_POS, onChangeWatchPos);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_GET_HERO_POSITION, onGetHeroPosition);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_TRY_OPEN_OR_CLOSE_DAN_MU, onTryOpenOrCloseDanMu);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_SEND_DAN_MU, onSendDanMu);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_SEND_DAN_MU_BROADCAST, onSendDanMuBroadcast);
			SocketConnection.addCmdListener(CountryWarModuleMessages.S2C_HAS_ADMIRE, onHasAdmire);

			finish();
		}

		private function onRecCountryWarInfo(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_INFO;
			var warDataProto:CountryWarDataProto = new CountryWarDataProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			warDataProto.mergeFrom(bytes);
			CountryWarManager.setCountryWarInfo(warDataProto);
		}

		private function onCountryWarDetail(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_GET_COUNTRY_WAR_DETAIL;
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var records : Array = [];
			while (bytes.bytesAvailable)
			{
				var recordProto : CountryWarRecordProto = new CountryWarRecordProto();
				recordProto.mergeFrom(bytes);
				records.push(recordProto);
			}
			CountryWarManager.setCountryWarRecords(records);
		}

		private function onRecCountryWarFail(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_FAIL;
			var failId : int = buffer.readVarint32();
			NoticeManager.showHint(EnumHintInfo["COUNRY_WAR_FAIL" + failId]);
		}

		private function onRecCountryWarDeclareWar(buffer:ByteBuffer):void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_DECLARE_WAR;
		}

		private function onRecCountryWarDeclareWarBroadcast(buffer:ByteBuffer):void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_DECLARE_WAR_BROADCAST;
			var warDate:CountryWarInfoData = new CountryWarInfoData();
			warDate.warType = buffer.readVarint32();
			warDate.attackCountry = buffer.readVarint32();
			warDate.defenceCountry = buffer.readVarint32();
			warDate.warStartTime = buffer.readVarint64();
			CountryWarManager.addWarInfo(warDate);
		}

		private function onCountryWarStart(buffer:ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_START;
		}
		
		private function onRecCountryWarEnd(buffer:ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_END;
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			var endProto:CountryWarEndProto = new CountryWarEndProto();
			endProto.mergeFrom(bytes);
			CountryWarManager.countryWarEnd(endProto.attackCountry,endProto.defenceCountry,endProto.winCountry); 
			AppManager.hideApp(AppConstant.COUNTRY_WAR_TOP_BAR_PANEL);
			AppManager.hideApp(AppConstant.COUNTRY_WAR_RIGHT_BAR_PANEL);
			AppManager.hideApp(AppConstant.COUNTRY_WAR_BOTTOM_BAR_PANEL);
			AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_RESULT_PANEL,endProto);
			MainUIManager.showTaskBar();
			//国战结束司机下车，销毁战车
			if(MainRoleManager.actorInfo.zhanCheOwnerID == MainRoleManager.actorID)
			{
				CountryWarSender.reqDownFromZhanChe();
			}
			if(endProto.winCountry == MainRoleManager.actorInfo.countryId)
			{
				CountryWarStatusManager.playWinEffect();
			}
			else
			{
				CountryWarStatusManager.playLoseEffect();
			}
			CountryWarChengMenManager.tryRemoveChengMen(endProto.defenceCountry);
		}

		private function onRecOtherCountryWarEnd(buffer:ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_OTHER_COUNTRY_WAR_END;
			var endProto:OtherCountryWarEndProto = new OtherCountryWarEndProto();
			endProto.mergeFrom(buffer);
			CountryWarManager.countryWarEnd(endProto.attackCountry,endProto.defenceCountry,endProto.winCountry); 
		}
		
		private function onRecCountryWarStatus(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_STAUS;
			var warType : int = buffer.readVarint32();
			var attackCountryId:int = buffer.readVarint32();
			var defenseCountryId:int = buffer.readVarint32();
			var supportAttackCount:int = buffer.readVarint32();
			var supportDefenceCount:int = buffer.readVarint32();
			var watcherCount:int = buffer.readVarint32();
			var supportCountChanged:Boolean = false;
			if(CountryWarStatusManager.supportAttackCount != supportAttackCount)
			{
				supportCountChanged = true;
				CountryWarStatusManager.supportAttackCount = supportAttackCount;
			}
			if(CountryWarStatusManager.supportDefenceCount != supportDefenceCount)
			{
				supportCountChanged = true;
				CountryWarStatusManager.supportDefenceCount = supportDefenceCount;
			}
			if(supportCountChanged)
			{
				EventManager.dispatchEvent(CountryWarEvent.SUPPORT_COUNT_CHANGE);
			}
			if(CountryWarStatusManager.watcherCount != watcherCount)
			{
				CountryWarStatusManager.watcherCount = watcherCount;
				EventManager.dispatchEvent(CountryWarEvent.WATCHER_COUNT_CHANGE);
			}
			//神兽状态
			var monsterData:CountryWarMonsterLifeData = CountryWarStatusManager.monsterFinalData;
			if(monsterData == null)
			{
				monsterData = new CountryWarMonsterLifeData();
				CountryWarStatusManager.monsterFinalData = monsterData;
			}
			monsterData.monsterType = CountryWarMonsterType.QINLIN_TYPE;
			monsterData.monsterId = buffer.readVarint32();
			monsterData.monsterCountry = buffer.readVarint32();
			monsterData.isDead = !buffer.readBoolean();
			monsterData.bloodProgress = monsterData.isDead?0:buffer.readVarint32();
			//圣兽状态
			var monsterHolyDataVect:Vector.<CountryWarMonsterLifeData> = CountryWarStatusManager.monsterHolyDataVect;
			if(monsterHolyDataVect == null)
			{
				monsterHolyDataVect = new Vector.<CountryWarMonsterLifeData>();
				CountryWarStatusManager.monsterHolyDataVect = monsterHolyDataVect;
			}
			var shengShouCount:int = buffer.readVarint32();
			var i:int;
			for( i = 0; i < shengShouCount; i ++ )
			{
				if(i < monsterHolyDataVect.length)
				{
					monsterData = monsterHolyDataVect[i];
				}
				else
				{
					monsterData = new CountryWarMonsterLifeData();
					monsterHolyDataVect.push(monsterData);
				}
				monsterData.monsterType = CountryWarMonsterType.SHENSHOU_TYPE;
				monsterData.monsterId = buffer.readVarint32();
				monsterData.monsterCountry = buffer.readVarint32();
				monsterData.isDead = !buffer.readBoolean();
				monsterData.bloodProgress = monsterData.isDead?0:buffer.readVarint32();
			}
			//带复活点的守关怪
			var monsterWithReliveDataVect:Vector.<CountryWarMonsterLifeData> = CountryWarStatusManager.monsterWithReliveDataVect;
			if(monsterWithReliveDataVect == null)
			{
				monsterWithReliveDataVect = new Vector.<CountryWarMonsterLifeData>();
				CountryWarStatusManager.monsterWithReliveDataVect = monsterWithReliveDataVect;
			}
			var generalCount:int = buffer.readVarint32();
			for( i = 0; i < generalCount; i ++ )
			{
				var monsterId:int = buffer.readVarint32();
				monsterData = CountryWarStatusManager.getMonsterWithReliveLifeData(monsterId);
				if(monsterData == null)
				{
					monsterData = new CountryWarMonsterLifeData();
					monsterWithReliveDataVect.push(monsterData);
				}
				monsterData.monsterId = monsterId;
				monsterData.monsterCountry = buffer.readVarint32();
				monsterData.isDead = !buffer.readBoolean();
				monsterData.bloodProgress = monsterData.isDead?0:buffer.readVarint32();
				monsterData.monsterType = CountryWarMonsterType.GENERAL_TYPE;
			}
			CountryWarStatusManager.sortReliveMonsterDataByPriority();
			EventManager.dispatchEvent(CountryWarEvent.MONSTER_STATUS_CHANGE);
			CountryWarChengMenManager.tryShowChengMen();
		}

		private function onRecCountryWarRankList(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_RANK_LIST;
			var count : int = buffer.readVarint32();
			var i : int = 0;
			var rankVect : Vector.<CountryWarRankData> = new Vector.<CountryWarRankData>();
			var rankData : CountryWarRankData;
			for (i = 0; i < count; i++)
			{
				rankData = new CountryWarRankData();
				rankData.rank = i + 1;
				rankData.heroID = buffer.readVarint64();
				rankData.heroName = buffer.readUTF();
				rankData.killCount = buffer.readVarint64();
				rankData.countryID = buffer.readVarint32();
				rankVect.push(rankData);
			}
			CountryWarSelfRelatedManager.selfCountryRankDataVect = rankVect;
			EventManager.dispatchEvent(CountryWarEvent.MY_COUNTRY_RANK_INFO_CHANGE);
		}

		private function onRecCountryWarSelfRank(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_RESPONSE_COUNTRY_WAR_SELF_RANK;
			var killPoepleCount : int = buffer.readVarint32();
			CountryWarSelfRelatedManager.selfKillCount = killPoepleCount;
			EventManager.dispatchEvent(CountryWarEvent.KILL_INFO_CHANGE);
		}

		private function onRecAddCountryWarMonster(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ADD_COUNTRY_WAR_MONSTER;
			var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
			data.id = buffer.readVarint64();
			data.modelID = buffer.readVarint32();
			data.countryId = buffer.readVarint32();
			RoleData.readGeneric(data, buffer);
			SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
		}

		private function onRecMonsterDead(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_COUNTRY_WAR_MONSTER_DEAD;
			var info : CountryWarMonsterDeadInfo = new CountryWarMonsterDeadInfo();
			info.attackCountryId = buffer.readVarint32();
			info.defendCountryId = buffer.readVarint32();
			info.monConfigId = buffer.readVarint32();
			info.monArmyType = buffer.readVarint32();
			var isInCountryWar:Boolean = MainRoleManager.isInCountryWar;
			var isSelfAttacker:Boolean = !CountryManager.isMyEnemyCountry(info.attackCountryId);
			var isSelfDefencer:Boolean = !CountryManager.isMyEnemyCountry(info.defendCountryId);
			var monsterName:String = MonsterDataManager.getMonsterName(info.monConfigId);
			var killerCountry:int;
			var killerName:String = "";
			if(buffer.bytesAvailable)
			{
				killerCountry = buffer.readVarint32();
				killerName = buffer.readUTFBytes(buffer.bytesAvailable);
			}
			//战场动态信息（公告）
			var attackCountryName:String = CountryManager.getCountryName(info.attackCountryId);
			var defenceCountryName:String = CountryManager.getCountryName(info.defendCountryId);
			var killedByAttackCountry:Boolean = !CountryManager.isEnemyCountry(info.attackCountryId,killerCountry);
			var monsterData:CountryWarMonsterLifeData;
			var progressText:String;
			if(CountryWarStatusManager.checkIsFinalMonster(info.monConfigId))//神兽
			{
				monsterData = CountryWarStatusManager.monsterFinalData;
				monsterData.isDead = true;
				NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_13,[attackCountryName,defenceCountryName,killerName,attackCountryName]);
				if(isInCountryWar)
				{
					if(isSelfDefencer)
					{
						progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_7);
					}
					else
					{
						progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_7);
					}
				}
			}
			else
			{
				monsterData = CountryWarStatusManager.getMonsterWithReliveLifeData(info.monConfigId);
				if(monsterData)//守卫
				{
					monsterData.isDead = true;
					var guardIndex:int = CountryWarStatusManager.getRelivePointMonsterIndex(info.monConfigId);
					switch(guardIndex)
					{
						case 0:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_1,[attackCountryName,killerName,monsterName]);
							break;
						case 1:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_2,[attackCountryName,killerName,monsterName]);
							break;
						case 2:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_3,[attackCountryName,killerName,monsterName]);
							CountryWarChengMenManager.tryRemoveChengMen(info.defendCountryId);
							break;
						case 3:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_4,[attackCountryName,killerName,monsterName]);
							break;
					}
					if(isInCountryWar)
					{
						if(isSelfDefencer)
						{
							CountryWarStatusManager.playLoseGuardEffect();
							switch(guardIndex)
							{
								case 0:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_1);
									break;
								case 1:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_2);
									break;
								case 2:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_3);
									break;
								case 3:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_4);
									break;
							}
						}
						else
						{
							CountryWarStatusManager.playKillGuardEffect();
							switch(guardIndex)
							{
								case 0:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_1);
									break;
								case 1:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_2);
									break;
								case 2:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_3);
									break;
								case 3:
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_4);
									break;
							}
						}
					}
				}
				else
				{
					monsterData = CountryWarStatusManager.getMonsterHolyLifeData(info.monConfigId);
					if(monsterData)//圣兽
					{
						monsterData.isDead = true;
						var holyIndex:int = CountryWarStatusManager.getHolyMonsterIndex(info.monConfigId);
						if(killedByAttackCountry)
						{
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_5,[attackCountryName,killerName,monsterName,defenceCountryName]);
							if(isInCountryWar)
							{
								if(isSelfDefencer)
								{
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_5,monsterName);
								}
								else
								{
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_5,monsterName);
								}
							}
						}
						else
						{
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_6,[defenceCountryName,killerName,monsterName,attackCountryName]);
							if(isInCountryWar)
							{
								if(isSelfDefencer)
								{
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_2_6,monsterName);
								}
								else
								{
									progressText = LanguageConfig.getText(LangCountryWar.COUNTRY_WAR_PROGRESS_1_6,monsterName);
								}
							}
						}
					}
				}
			}
			if(progressText)
			{
				AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_PROGRESS_TEXT_PANEL,progressText);
			}
			EventManager.dispatchEvent(CountryWarEvent.MONSTEN_DEAD);
		}
		
		private function onJoinCountryWar(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_JOIN_COUNTRY_WAR;
		}
		
		private function onEndterAdmireArea(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ENTER_ADMIRE_AREA;
		}
		
		private function onAdmireCountryKing(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ADMIRE_COUNTRY_KING;
			NoticeManager.showHint(EnumHintInfo.COUNRY_WAR_SUCCESS_1);
			CountryWarWorshipManager.hideIcon();
		}
		
		private function onFailCountryOfficeAdmire(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_FAIL_COUNTRY_OFFICE_ADMIRE;
			var failCountry:int = buffer.readVarint32();
			var officerPos:int = buffer.readVarint32();
			var failCountryName:String = CountryManager.getCountryName(failCountry);
			var officerName:String = CountryOfficerCfgData.getData(officerPos).posName;
			var heroName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_29,[failCountryName,officerName,heroName]);
		}
		
		private function onFailCountryMemberAdmire(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_FAIL_COUNTRY_MEMBER_ADMIRE;
			var count:int = buffer.readVarint32();
			NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_30,[count]);
		}
		
		private function onSelfWarInfo(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_SELF_WAR_INFO;
			var selfCountryWarInfoProto:SelfCountryWarInfoProto = new SelfCountryWarInfoProto();
			selfCountryWarInfoProto.mergeFrom(buffer);
			CountryWarSelfRelatedManager.selfInfo = selfCountryWarInfoProto;
			EventManager.dispatchEvent(CountryWarEvent.SELF_INFO_CHANGED);
		}
		
		private function onContinueKillHero(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_CONTINUE_KILL_HERO;
			var count:Number = buffer.readVarint64();
			var killderID:Number = buffer.readVarint64();
			var killerName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			var continueKillHeroTimes:Array = CountryWarCfgData.continueKillHeroTimes;
			if(continueKillHeroTimes)
			{
				var index:int = continueKillHeroTimes.indexOf(count);
				if(index >= 0)
				{
					switch(index)
					{
						case 0:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_17,[killerName]);
							if(killderID == MainRoleManager.actorID)
							{
								CountryWarStatusManager.playContinueKillEffect(1);
							}
							break;
						case 1:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_18,[killerName]);
							if(killderID == MainRoleManager.actorID)
							{
								CountryWarStatusManager.playContinueKillEffect(2);
							}
							break;
						case 2:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_19,[killerName]);
							if(killderID == MainRoleManager.actorID)
							{
								CountryWarStatusManager.playContinueKillEffect(3);
							}
							break;
						case 3:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_20,[killerName]);
							if(killderID == MainRoleManager.actorID)
							{
								CountryWarStatusManager.playContinueKillEffect(4);
							}
							break;
						case 4:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_21,[killerName]);
							if(killderID == MainRoleManager.actorID)
							{
								CountryWarStatusManager.playContinueKillEffect(5);
							}
							break;
					}
				}
			}
		}
		
		private function onInterruptContinueKillHero(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_INTERRUPT_CONTINUE_KILL_HERO;
			var count:Number = buffer.readVarint64();
			NoticeManager.showNotify("收到打断连杀协议：",count);
			var targetName:String = buffer.readUTF();
			var killderID:Number = buffer.readVarint64();
			var killerName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			var beenKilledContinueKillHeroTimes:Array = CountryWarCfgData.beenKilledContinueKillHeroTimes;
			if(beenKilledContinueKillHeroTimes)
			{
				var index:int = beenKilledContinueKillHeroTimes.indexOf(count);
				if(index >= 0)
				{
					switch(index)
					{
						case 0:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_22,[killerName,targetName]);
							if(MainRoleManager.actorID == killderID)
							{
								CountryWarStatusManager.playBreakContinueKillEffect(1);
							}
							break;
						case 1:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_23,[killerName,targetName]);
							if(MainRoleManager.actorID == killderID)
							{
								CountryWarStatusManager.playBreakContinueKillEffect(2);
							}
							break;
						case 2:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_24,[killerName,targetName]);
							if(MainRoleManager.actorID == killderID)
							{
								CountryWarStatusManager.playBreakContinueKillEffect(3);
							}
							break;
						case 3:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_25,[killerName,targetName]);
							if(MainRoleManager.actorID == killderID)
							{
								CountryWarStatusManager.playBreakContinueKillEffect(4);
							}
							break;
						case 4:
							NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_26,[killerName,targetName]);
							if(MainRoleManager.actorID == killderID)
							{
								CountryWarStatusManager.playBreakContinueKillEffect(5);
							}
							break;
					}
				}
			}
		}
		
		private function onContinueBeenKilledWhenNotKillOther(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_CONTINUE_BEEN_KILLED_WHEN_NOT_KILL_OTHER;
			var count:Number = buffer.readVarint64();
			var targetName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_27,[targetName]);
		}
		
		private function onCountryOfficerBeenKilled(buffer:ByteBuffer):void
		{
			CountryWarModuleMessages.S2C_COUNTRY_OFFICER_BEEN_KILLED;
			var targetOfficialPosition:int = buffer.readVarint32();
			var targetCountry:int = buffer.readVarint32();
			var targetName:String = buffer.readUTF();
			var killerCountry:int = buffer.readVarint32();
			var killerName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			var targetCountryName:String = CountryManager.getCountryName(targetCountry);
			var killerCountryName:String = CountryManager.getCountryName(killerCountry);
			if(targetOfficialPosition == CountryOfficerPos.POS_KING)
			{
				NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_15,[targetCountryName,targetName,killerCountryName,killerName]);
			}
			else
			{
				var targetOfficialPositionName:String = CountryOfficerCfgData.getData(targetOfficialPosition).posName;
				NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_28,[targetCountryName,targetOfficialPositionName,killerCountryName,killerName]);
			}
		}
		
		private function onAddZhanChe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ADD_ZHAN_CHE;
			
			var data : ZhanCheData = new ZhanCheData(RoleType.TYPE_ZHAN_CHE);
			data.ownerId = buffer.readVarint64();
			data.ownerName = buffer.readUTF();
			data.ownerCountry = buffer.readVarint32();
			data.id = buffer.readVarint64();
			data.modelID = buffer.readVarint32();
			RoleData.readGeneric(data, buffer);
			if(data.ownerId == MainRoleManager.actorID)
			{
				data.totalStat.moveSpeed = CountryWarZhanCheManager.selfZhanCheSpeed;
			}
			if(data.ownerId == MainRoleManager.actorID)
			{
				ShortcutsManger.getInstance().replaceToTempSpells(CountryWarCfgData.getSpellsOfZhanChe(data.modelID));
			}
			CountryWarZhanCheManager.addZhanCheID(data.ownerId,data.id);
			var zhanChe:SceneRole = SceneRoleManager.getInstance().createZhanChe(data);
			var passengerIDs:Vector.<Number> = CountryWarZhanCheManager.getPassengerIDs(data.ownerId);
			if(passengerIDs)
			{
				var len:int = passengerIDs.length;
				var i:int;
				for(i = 0; i < len; i++)
				{
					var passengerID:Number = passengerIDs[i];
					var passenger:SceneRole = SceneManager.getSceneObjByID( passengerID ) as SceneRole;
					if( passenger != null )
					{
						var heroData:HeroData = passenger.data as HeroData;
						if( heroData != null )
						{
							heroData.zhanCheOwnerID = data.ownerId;
							passenger.setCamouflageEntity(zhanChe);
						}
					}
				}
			}
		}
		
		private function onAcceptZhanChe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ACCEPT_ZHAN_CHE;
			var speed:Number = buffer.readVarint64();
			CountryWarZhanCheManager.selfZhanCheSpeed = speed;
			var zhanCheID:Number = CountryWarZhanCheManager.getZhanCheID(MainRoleManager.actorID);
			var zhanChe:SceneRole = SceneManager.getSceneObjByID(zhanCheID) as SceneRole;
			if(zhanChe)
			{
				var zhanCheData:ZhanCheData = zhanChe.data as ZhanCheData;
				if(zhanCheData)
				{
					zhanCheData.totalStat.moveSpeed = speed;
				}
			}
		}
		
		private function onUpOrDownFromZhanCheBroadcast(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_UP_OR_DOWN_FROM_ZHAN_CHE_BROADCAST;
			var roleID:Number = buffer.readVarint64();
			var isUp:Boolean = buffer.readBoolean();
			if(isUp)
			{
				CountryWarZhanCheManager.addPassengerID(roleID,roleID);
			}
			else
			{
				CountryWarZhanCheManager.removePassengerID(roleID);
			}
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( roleID ) as SceneRole;
			if( sceneRole != null )
			{
				var heroData:HeroData = sceneRole.data as HeroData;
				if( heroData != null )
				{
					if(isUp)
					{
						heroData.zhanCheOwnerID = roleID;
						var zhanCheID:Number = CountryWarZhanCheManager.getZhanCheID(roleID);
						var zhanChe:SceneRole = SceneManager.getSceneObjByID(zhanCheID) as SceneRole;
						if( zhanChe != null )
						{
							sceneRole.setCamouflageEntity(zhanChe);
						}
					}
					else
					{
						CountryWarZhanCheManager.removeZhanCheID(heroData.zhanCheOwnerID);
						heroData.zhanCheOwnerID = 0;
						sceneRole.setCamouflageEntity(null);
						var passengerIDs:Vector.<Number> = CountryWarZhanCheManager.getPassengerIDs(roleID);
						if(passengerIDs)
						{
							var len:int = passengerIDs.length;
							var i:int;
							for(i = 0; i < len; i++)
							{
								var passengerID:Number = passengerIDs[i];
								CountryWarZhanCheManager.removePassengerID(passengerID);
								var passenger:SceneRole = SceneManager.getSceneObjByID( passengerID ) as SceneRole;
								if( passenger != null )
								{
									var passengerData:HeroData = passenger.data as HeroData;
									if( passengerData != null )
									{
										passengerData.zhanCheOwnerID = 0;
										passenger.setCamouflageEntity(null);
										if(passengerID == MainRoleManager.actorID)
										{
											EventManager.dispatchEvent(CountryWarEvent.GET_OFF_OTHERS_ZHAN_CHE);
										}
									}
								}
							}
						}
					}
				}
			}
			if(roleID == MainRoleManager.actorID)
			{
				if(isUp)
				{
					EventManager.dispatchEvent(CountryWarEvent.GET_ON_OWN_ZHAN_CHE);
				}
				else
				{
					ShortcutsManger.getInstance().reset();
					EventManager.dispatchEvent(CountryWarEvent.GET_OFF_OWN_ZHAN_CHE);
				}
			}
		}
		
		private function onDownFromZhanChe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_DOWN_FROM_ZHAN_CHE;
		}
		
		private function onOldDriverTakeMe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_OLD_DRIVER_TAKE_ME;
			
		}
		
		private function onOldDriverBye(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_OLD_DRIVER_BYE;
		}
		
		private function onTakeZhanChe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_TAKE_ZHAN_CHE;
			var roleID:Number = buffer.readVarint64();
			var zhanCheOwnerID:Number = buffer.readVarint64();
			CountryWarZhanCheManager.addPassengerID(zhanCheOwnerID,roleID);
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( roleID ) as SceneRole;
			if( sceneRole != null )
			{
				var heroData:HeroData = sceneRole.data as HeroData;
				if( heroData != null )
				{
					heroData.zhanCheOwnerID = zhanCheOwnerID;
					var zhanCheID:Number = CountryWarZhanCheManager.getZhanCheID(zhanCheOwnerID);
					var zhanChe:SceneRole = SceneManager.getSceneObjByID(zhanCheID) as SceneRole;
					if( zhanChe != null )
					{
						sceneRole.setCamouflageEntity(zhanChe);
					}
				}
			}
			if(roleID == MainRoleManager.actorID)
			{
				EventManager.dispatchEvent(CountryWarEvent.GET_ON_OTHERS_ZHAN_CHE);
			}
		}
		
		private function onGetOffZhanChe(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_GET_OFF_ZHAN_CHE;
			var roleID:Number = buffer.readVarint64();
			CountryWarZhanCheManager.removePassengerID(roleID);
			var sceneRole:SceneRole = SceneManager.getSceneObjByID( roleID ) as SceneRole;
			if( sceneRole != null )
			{
				var heroData:HeroData = sceneRole.data as HeroData;
				if( heroData != null )
				{
					heroData.zhanCheOwnerID = 0;
					sceneRole.setCamouflageEntity(null);
				}
			}
			if(roleID == MainRoleManager.actorID)
			{
				EventManager.dispatchEvent(CountryWarEvent.GET_OFF_OTHERS_ZHAN_CHE);
			}
		}
		
		private function onZhanCheChangeScene(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ZHAN_CHE_CHANGE_SCENE;
			var mapId:int = buffer.readVarint32();
			var versionNumber:int = buffer.readVarint32();
			if(MainRoleManager.isTakeZhanChe)
			{
				if(versionNumber > CountryWarZhanCheManager.zhanCheVersionNumber)
				{
					CountryWarZhanCheManager.zhanCheSceneLoaded = false;
				}
				else
				{
					CountryWarZhanCheManager.zhanCheSceneLoaded = true;
				}
				MainRoleManager.actorInfo.mapID = mapId;
				CountryWarZhanCheManager.sceneLoadedWhenTakeZhanChe = false;
				SceneSwitchManager.changeMap();
			}
		}
		
		private function onZhanCheSceneLoaded(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ZHAN_CHE_SCENE_LOADED;
			var mapId:int = buffer.readVarint32();
			var versionNumber:int = buffer.readVarint32();
			CountryWarZhanCheManager.zhanCheVersionNumber = versionNumber;
			CountryWarZhanCheManager.zhanCheSceneLoaded = true;
			if(CountryWarZhanCheManager.sceneLoadedWhenTakeZhanChe)
			{
				SceneSender.sceneLoaded(SceneManager.viewDistance);
			}
		}
		
		private function onZhanCheMemberChanged(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ZHAN_CHE_MEMBER_CHANGED;
		}
		
		private function onPointChanged(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_POINT_CHANGED;
			var score:Number = buffer.readVarint64();
			CountryWarSelfRelatedManager.selfCountryScore = score;
			EventManager.dispatchEvent(CountryWarEvent.COUNTRY_WARS_SCORE_UPDATE);
		}
		
		private function onSupport(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_SUPPORT;
			var attackCountry:int = buffer.readVarint32();
			var attackCountrySupportCount:int = buffer.readVarint32();
			var defenceCountry:int = buffer.readVarint32();
			var defenceCountrySupportCount:int = buffer.readVarint32();
			CountryWarStatusManager.supportAttackCount = attackCountrySupportCount;
			CountryWarStatusManager.supportDefenceCount = defenceCountrySupportCount;
			EventManager.dispatchEvent(CountryWarEvent.SUPPORT_COUNT_CHANGE);
		}
		
		private function onEnterWatchMode(buffer : ByteBuffer) : void
		{
			trace("!!!!!!!!!!!!!!!onEnterWatchMode");
			CountryWarModuleMessages.S2C_ENTER_WATCH_MODE;
			var mapID:int = CountryWarStatusManager.getCurrentProgressSceneID();
			MainRoleManager.actorInfo.mapID = mapID;
			CountryWarWatchManager.watchMapID = mapID;
			CountryWarWatchManager.watchTargetID = 0;
			CountryWarWatchManager.startWatch();
			SceneSwitchManager.changeMap();
		}
		
		private function onEnterWatchScene(buffer : ByteBuffer) : void
		{
			trace("!!!!!!!!!!!!!!!onEnterWatchScene");
			var mapID:int = buffer.readVarint32();
			var country:int = buffer.readVarint32();
			var tx:int = buffer.readVarint32();
			var ty:int = buffer.readVarint32();
			if(mapID == CountryWarWatchManager.watchMapID)
			{
				MainRoleManager.actorInfo.x = tx;
				MainRoleManager.actorInfo.y = ty;
				CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE;
				EventManager.dispatchEvent(MapEvent.MAP_SWITCH_COMPLETE);
			}
		}
		
		private function onEnterWatchSceneFailAndReturnTargetInfo(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE_FAIL_AND_RETURN_TARGET_INFO;
			var targetID:Number = buffer.readVarint64();
			trace("!!!!!!!!!!!!!!!onEnterWatchSceneFailAndReturnTargetInfo");
		}
		
		private function onEnterWatchSceneFail(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_ENTER_WATCH_SCENE_FAIL;
			var errID:int = buffer.readVarint32();
			NoticeManager.showHint(EnumHintInfo["COUNTRY_WAR_WATCH_SCENE_FAIL_" + errID]);
			trace("!!!!!!!!!!!!!!!onEnterWatchSceneFail",errID);
		}
		
		private function onLeaveWatchScene(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_LEAVE_WATCH_SCENE;
			CountryWarWatchManager.stopWatch();
		}
		
		private function onChangeWatchPos(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_CHANGE_WATCH_POS;
			var targetID:Number = buffer.readVarint64();
			var tx:int = buffer.readVarint32();
			var ty:int = buffer.readVarint32();
			CountryWarWatchManager.nextWatchCDEndTime = SystemTimeManager.curtTm + CountryWarCfgData.changePosCd;
			trace("!!!!!!!!!!!!!!!onChangeWatchPos");
		}
		
		private function onGetHeroPosition(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_GET_HERO_POSITION;
		}
		
		private function onTryOpenOrCloseDanMu(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_TRY_OPEN_OR_CLOSE_DAN_MU;
		}
		
		private function onSendDanMu(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_SEND_DAN_MU;
		}
		
		private function onSendDanMuBroadcast(buffer : ByteBuffer) : void
		{
			CountryWarModuleMessages.S2C_SEND_DAN_MU_BROADCAST;
		}
		
		private function onHasAdmire(buffer:ByteBuffer):void
		{
			CountryWarModuleMessages.S2C_HAS_ADMIRE;
			var endTime:Number = buffer.readVarint64();
			CountryWarWorshipManager.endTime = endTime;
			var startTime:Number = endTime - CountryWarCfgData.worshipDuration;
			var currentTime:Number = SystemTimeManager.curtTm;
			if(currentTime < endTime)
			{
				if(currentTime >= startTime)
				{
					CountryWarWorshipManager.showIcon();
				}
				else
				{
					var delayTime:Number = (startTime - currentTime)/1000;
					TweenLite.delayedCall(delayTime,CountryWarWorshipManager.showIcon);
				}
			}
		}
	}
}
