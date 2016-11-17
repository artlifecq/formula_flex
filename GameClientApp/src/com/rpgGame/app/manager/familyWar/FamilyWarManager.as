
package com.rpgGame.app.manager.familyWar
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.FamilyWarSender;
	import com.rpgGame.app.sender.SocietySender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FamilyWarEvent;
	import com.rpgGame.core.utils.DataUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.country.CountryGovernmentPostData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarBidRankData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarBidRankItemData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarBroadcastData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarCfgData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarDungeonRankData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarDungeonRankItemData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarFightFamilyData;
	import com.rpgGame.coreData.info.familyWar.FamilyWarMonsterData;
	import com.rpgGame.coreData.info.guild.GuildData;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.society.SocietyMemberData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangFamilyWar;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import app.cmd.KingWarModuleMessages;
	import app.message.KingWarBroadcastProto;
	import app.message.KingWarPartyType;
	import app.message.StatType;
	import app.message.NpcDialogProto.NpcType;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	import utils.TimerServer;

	public class FamilyWarManager
	{
		public function FamilyWarManager()
		{
		}
		private static const SMALL_MONSTER_ID : int = 2000;
		private static const MESSAGE_LOCK : Number = 3000;
		/**竞标开始时间**/
		private static var _bidStartTime : Number;
		/**竞标结束时间**/
		private static var _bidEndTime : Number;
		/**竞标总价**/
		private static var _myBid : Number = 0;
		/**竞标排名**/
		private static var _myBidRank : int = 0;
		private static var _minBid : Number = 0;
		private static var _warStartTime : Number;
		private static var _warEndTime : Number;
		private static var _jinGongFamily : FamilyWarFightFamilyData;
		private static var _fangShouFamily : FamilyWarFightFamilyData;
		private static var _bidRank : FamilyWarBidRankData;
		private static var _dungeonRank : FamilyWarDungeonRankData;
		private static var _reliveTime : Number;
		/**是否显示过进入王城战面板了**/
		private static var _isShowJoinWarPanel : Boolean;
		private static var _isAlertJoinWar : Boolean;
		private static var _monsters:HashMap;
		
		/***********进游戏初始化的一些东西**************/
		public static function initFamilyWar(buffer:ByteBuffer):void
		{
			_warStartTime = buffer.readVarint64();//varint64 本次竞标开始时间
			trace("战斗开始时间"+TimeUtil.changeTimeToSpecStr(_warStartTime));
			_bidEndTime = buffer.readVarint64();//varint64 本次竞标结束时间
			setBidMin(buffer.readVarint64());//varint64 本次竞标底价
			_bidStartTime = _warStartTime - FamilyWarCfgData.bid_start_before_war_start_duration;
			trace("竞标开始时间"+TimeUtil.changeTimeToSpecStr(_bidStartTime));
			var bidIsEnd : Boolean = buffer.readBoolean();
			if(bidIsEnd)
			{
				var arr : Array = [];
				while(buffer.bytesAvailable)
				{
					arr.push(buffer.readUTF());
				}
				bidEndUpdateFamilyWar(arr,false);
			}
			_isShowJoinWarPanel = false;
			_isAlertJoinWar = false;
			TimerServer.addLoop(onUpdateTime,1000);
		}
		/**计时器，初始化游戏的时候就开启了
		 * 用于开启进入王城战面板
		 * **/
		private static function onUpdateTime():void
		{
			var systemTime : Number = SystemTimeManager.curtTm;
			var myFamily : String = GuildManager.guildData.name;
			if(!DataUtil.dataIsNotNull(myFamily))
				return;
//			trace(TimeUtil.formatTimeToSpecString(_warStartTime),"==========",TimeUtil.formatTimeToSpecString(systemTime));
			if(isEndWar())
				return;
			if(MapDataManager.currentScene.mapType == EnumMapType.MAP_TYPE_FAMILY_BATTLE_SCENE)
			{
				_isShowJoinWarPanel = true;
				_isAlertJoinWar = true;
				return;
			}
			if(jinGongFamilyName == myFamily || myFamily == fangShouFamilyName)
			{
				if(!_isShowJoinWarPanel && !AppManager.isAppInScene(AppConstant.FAMILY_WAR_WAIT_JION_DUNGEON_PANEL))
				{
					_isShowJoinWarPanel = true;
					AppManager.showApp(AppConstant.FAMILY_WAR_WAIT_JION_DUNGEON_PANEL);
				}
				
				if(_warStartTime > systemTime)
					return;
				if(!_isAlertJoinWar)
				{
					GameAlert.showAlertUtil(LangAlertInfo.joinFamilyWar,joinWarAlertClick);
					_isAlertJoinWar = true;
				}
			}
		}
		
		private static function joinWarAlertClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					FamilyWarSender.familyWarEnterDungeon();
					break;
			}
		}
		/******************************客户端操作****************************/
		
		public static function showJoinDengeonPanel():void
		{
			var myFamily : String = GuildManager.guildData.name;
			if(!GuildManager.haveGuild)
			{
				NoticeManager.showNotify("你还没有帮派");
				return;
			}
			if(jinGongFamilyName == myFamily || myFamily == fangShouFamilyName)
			{
				AppManager.showApp(AppConstant.FAMILY_WAR_WAIT_JION_DUNGEON_PANEL);
			}else
			{
				NoticeManager.showNotify("你没有参与王城战的资格");
			}
		}
		
		public static function getPrize():void
		{
			var myFamily : String = GuildManager.guildData.name;
			if(!DataUtil.dataIsNotNull(myFamily))
			{
				NoticeManager.showNotify("你还没有帮派");
				return;
			}
			if(CountryManager.selfCountryKingFamilyName == myFamily)
				FamilyWarSender.getCountryKingFamilyPrize();
			else
				NoticeManager.showNotify("你没有领取王城战奖励的资格");
		}
		
		/************************服务器返回的操作*********************/
		//----------------------复活的，应该没用了，走副本复活的
		public static function reliveTimeChange(time:Number):void
		{
			_reliveTime = time;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_RELIVE_TIME_CHANGE);
		}
		/**
		 * 复活时间戳 
		 * @return 
		 * 
		 */		
		public static function get reliveTime():Number
		{
			return _reliveTime;
		}
		
		//---------------------------竞标的------------------------
		/**竞标结束，更新进攻防守方的名字**/
		public static function bidEndUpdateFamilyWar(array:Array,alert:Boolean = true):void
		{
			_bidRank && _bidRank.clearRankDatas();
			_myBid = 0;
			_myBidRank=0;
			var country : int = MainRoleManager.actorInfo.countryId;
			var countryName : String = CountryManager.getCountryName(country);
			var startTime : String = TimeUtil.formatTimeToSpecString(warStartTime);
			var myFamily : String = GuildManager.guildData.name;;
			if(array.length == 1)
			{
				jinGongFamily.name = array[0];
				fangShouFamily.name = CountryManager.getOfficeDatas().getKing().guildName;
				if(alert && DataUtil.dataIsNotNull(jinGongFamily.name)&& DataUtil.dataIsNotNull(fangShouFamily.name))
				{
					NoticeManager.showNotify(LangFamilyWar.FamilyWarBidComplete,jinGongFamily.name,countryName,startTime,countryName);
					NoticeManager.showNotify(LangFamilyWar.FamilyWarBidComplete,fangShouFamily.name,countryName,startTime,countryName);
				}
			}else if(array.length == 2)
			{
				jinGongFamily.name = array[1];
				fangShouFamily.name = array[0];
				if(alert &&	DataUtil.dataIsNotNull(jinGongFamily.name)&& DataUtil.dataIsNotNull(fangShouFamily.name))
				{
					NoticeManager.showNotify(LangFamilyWar.FamilyWarBidComplete,jinGongFamily.name,countryName,startTime,countryName);
					NoticeManager.showNotify(LangFamilyWar.FamilyWarBidComplete,fangShouFamily.name,countryName,startTime,countryName);
				}
			}else
			{
				if(CountryManager.getOfficeDatas() && CountryManager.getOfficeDatas().getKing())
				{
					fangShouFamily.name = CountryManager.getOfficeDatas().getKing().guildName;
					if(alert &&	DataUtil.dataIsNotNull(jinGongFamily.name)&& DataUtil.dataIsNotNull(fangShouFamily.name))
						NoticeManager.showNotify(LangFamilyWar.FamilyWarBidComplete,fangShouFamily.name,countryName,startTime,countryName);
				}
			}
			if(DataUtil.dataIsNotNull(myFamily) && DataUtil.dataIsNotNull(jinGongFamily.name)&& DataUtil.dataIsNotNull(fangShouFamily.name) && (myFamily == fangShouFamily.name || myFamily == jinGongFamily.name))
			{
				if(alert)
					NoticeManager.showNotify(LangFamilyWar.FamilyWarMyFamilyBidComplete,startTime);
			}
			trace("进攻方：",jinGongFamilyName,"防守方:",fangShouFamilyName);
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_FIGHT_FAMILY);
		}
		
		/**更新自己的竞标价格**/
		public static function updateMyBid(bid:Number):void
		{
			var addBid : Number = bid - myBid;
			/**可能会有一些限制，后面加上去**/
			if(!isStartBid())
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFamilyWar.UpdateMyBidError_3),FamilyWarCfgData.bid_min_limit);
				return;
			}
			if(isEndBid())
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFamilyWar.UpdateMyBidError_4),FamilyWarCfgData.bid_min_limit);
				return;
			}
			
			if(!GuildManager.haveGuild)
			{
				NoticeManager.showNotify("竞标失败，您没有帮派");
				return;
			}
			var guild : GuildData = GuildManager.guildData;
			if(guild.storage.fanRongDu <addBid)
			{
				NoticeManager.showNotify("繁荣度不足，无法竞标");
				return;
			}
			if(bid<myBid+FamilyWarCfgData.bid_min_limit)
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFamilyWar.UpdateMyBidError_1),FamilyWarCfgData.bid_min_limit+myBid);
				return;
			}
			if(bid<minBid)
			{
				NoticeManager.showNotify(LanguageConfig.getText(LangFamilyWar.UpdateMyBidError_2),minBid);
				return;
			}
			FamilyWarSender.familyWarBid(addBid);
		}
		/**获取竞标排名，只能通过监听FAMILY_WAR_BID_RANK消息来获得**/
		public static function getBidRank():void
		{
			if(!ReqLockUtil.isReqLocked(KingWarModuleMessages.C2S_KING_WAR_BID_RANK,true))
			{
				FamilyWarSender.familyWarBidRank();
				ReqLockUtil.lockReq(KingWarModuleMessages.C2S_KING_WAR_BID_RANK,1000);
			}else
				EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_BID_RANK);
		}
		
		/**竞标起始价格**/
		public static function get minBid():Number
		{
			return _minBid;
		}
		
		public static function setBidStartTime(time:Number):void
		{
			_bidStartTime = time;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_BID_START_TIME_CHANGE);
		}
		
		public static function showBidPanel():void
		{
			if(GuildManager.haveGuild == false)
			{
				NoticeManager.showNotify(LangFamilyWar.ShowFamilyWarBidPanelFail);
				return;
			}
			AppManager.showAppNoHide(AppConstant.FAMILY_WAR_BID_PANEL);
		}
		/**是否开始竞价了**/
		public static function isStartBid():Boolean
		{
			return _bidStartTime<SystemTimeManager.curtTm;
		}
		/**是否结束竞价了**/
		public static function isEndBid():Boolean
		{
			return _bidEndTime<SystemTimeManager.curtTm;
		}
		/**竞标排名改变了**/
		public static function updateBid(bid:Number,rank:int):void
		{
			_myBid = bid;
			_myBidRank = rank;
			getBidRank();
			GuildManager.getSelfGuildBaseData();
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_MY_BID_CHANGE);
		}
		/**竞标结束时间改变了**/
		public static function endTimeChange(end:Number):void
		{
			_bidEndTime = end;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_END_TIME_CHANGE);
		}
		/**设置竞标底价**/
		public static function setBidMin(v:Number):void
		{
			_minBid = v;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_MIN_BID_CHANGE);
		}
		
		/**更新竞标排名**/
		public static function updateBidRank(bytes:ByteBuffer):void
		{
			if(!_bidRank)
				_bidRank = new FamilyWarBidRankData();
			_bidRank.readByte(bytes);
			SocietySender.setReqGetSelfFamilyInfoChanged();
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_BID_RANK);
		}
		
		//---------------------------------竞标的----------------------------
		/**王城战结束**/
		public static function familyWarEnd(country:int,nextTime:Number,jinGong:String,fangShou:String,win:String,winBoss:String):void
		{
			var msg : String;
			var countryName : String = CountryManager.getCountryName(country);
			var office : CountryGovernmentPostData =  CountryManager.selfCountryData.officeData.getKing();
			if(office)
			{
				var oldKing : String = office.playerName;
				if(oldKing == win)
				{
					msg = LangFamilyWar.FamilyWarDungeonEndKingDontChange;
				}else
					msg = LangFamilyWar.FamilyWarDungeonEndKingChange;
			}
			else
				msg = LangFamilyWar.FamilyWarDungeonEndKingChange;
			if(!win || !winBoss)
				return;
			NoticeManager.showNotify(msg,countryName,win,winBoss,countryName);
			if(CountryManager.getSelfCountryId() == country && (jinGong != "" || fangShou != ""))
			{
				AppManager.showApp(AppConstant.FAMILY_WAR_DUNGEON_ZHAN_BAO_PANEL,[win,winBoss]);
				jinGongFamily.name = "";
				fangShouFamily.name = "";
			}
		}
		
		/**广播一条战场广播**/
		public static function addOneSceneBroadcast(one:KingWarBroadcastProto):void
		{
			var oneBroadcast : FamilyWarBroadcastData = _dungeonRank.addOneBroadcast(one);
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_SCENE_BROADCAST);
			NoticeManager.showNotify(oneBroadcast.getMsg());
		}
		/**战场广播返回**/
		public static function getAllSceneBroadcast(all:Array):void
		{
			_dungeonRank.readBroadcasts(all);
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_SCENE_BROADCAST);
		}
		/**副本状态改变了**/
		public static function dungeonStatusChange(buffer:ByteBuffer):void
		{
			jinGongFamily.jifen = buffer.readVarint64();
			fangShouFamily.jifen = buffer.readVarint64();
			if(!_monsters)
				_monsters = new HashMap;
			else
				_monsters.clear();
			while(buffer.bytesAvailable)
			{
				var monsterId : Number = buffer.readVarint64();
				var monsterModeId : int = buffer.readVarint32();
				var name : String = buffer.readUTF();
				var hp : int = buffer.readVarint32();
				var monster : FamilyWarMonsterData = new FamilyWarMonsterData();
				monster.family = name;
				monster.hp = hp;
				monster.monsterModeId = monsterModeId;
				if(name == jinGongFamily.name)
				{
					monster.isJinGong = true;
				}else if(name == fangShouFamily.name)
				{
					monster.isJinGong = false;
				}else
					monster.family = "";
				monster.isBig = monsterModeId != SMALL_MONSTER_ID;
				_monsters.add(monsterId,monster);
				var sceneRole : SceneRole = SceneManager.getSceneObjByID(monsterId) as SceneRole;
				if(!sceneRole)
					continue;
				(sceneRole.data as MonsterData).ownerName = name;
				if(SceneRoleSelectManager.selectedRole && SceneRoleSelectManager.selectedRole.id == monsterId)
				{
					sceneRole.fightChange = true;
					SceneRoleSelectManager.updateSelectRole();
				}
				
				var lastHp : int = (sceneRole.data as MonsterData).hp;
				var maxHp : int = (sceneRole.data as MonsterData).totalStat.getStatValue(StatType.MAX_LIFE);
				
				var resCfg:AvatarResConfig = AvatarResConfigSetData.getInfo((sceneRole.data as MonsterData).avatarInfo.bodyResID);
				
				if(!monster.isJinGong)
				{
					//蓝色变红色
					if (resCfg.blendMaskTexture && resCfg.blendTexture)
					{
						var ru : RenderUnit3D = sceneRole.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
						ru.addBlend(ClientConfig.getAvatarTexture(resCfg.blendMaskTexture), ClientConfig.getAvatarTexture(resCfg.blendTexture), resCfg.blendMaterialName);
						ru.blendBias = lastHp / maxHp * 4 -2;
						TweenLite.to(ru, 2, {blendBias: hp / maxHp * 4 - 2, ease: Linear.easeNone});
					}
				}else
				{
					//红色变蓝色
					if (resCfg.blendRestoreMaskTexture && resCfg.blendTexture)
					{
						ru = sceneRole.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
						ru.addBlend(ClientConfig.getAvatarTexture(resCfg.blendRestoreMaskTexture), ClientConfig.getAvatarTexture(resCfg.blendTexture), resCfg.blendMaterialName);
						ru.blendBias = lastHp / maxHp * 4 - 2;
						TweenLite.to(ru, 2, {blendBias: hp / maxHp * 4 - 2, ease: Linear.easeNone});
					}
				}
			}
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_DUNGEON_STATUS_CHANGE);
		}
		
		/**王城战杀人排行榜**/
		public static function updateDungeonRank(bytes:ByteBuffer):void
		{
			if(!_dungeonRank)
				_dungeonRank = new FamilyWarDungeonRankData();
			_dungeonRank.readByte(bytes);
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_DUNGEION);
		}
		/**战斗开始时间**/
		public static function warStartTimeChange(v:Number):void
		{
			_warStartTime = v;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_FIGHT_START_TIME);
		}
		/**结束时间改变了**/
		public static function warEndTimeChange(warEnd:Number):void
		{
			_warEndTime = warEnd;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_FIGHT_END_TIME);
		}
		/**更新进攻防守方的名字**/
		public static function updateFamilyWarBroadcast(jinGong:String,fangShou:String):void
		{
			jinGongFamily.name = jinGong;
			fangShouFamily.name =fangShou;
			EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_FIGHT_FAMILY);
		}
		
		/*****************获取竞标的信息*******************/
		public static function get bidRank():Array
		{
			return _bidRank?_bidRank.rankDatas:[];
		}
		
		public static function get monsters():Array
		{
			return _monsters?_monsters.getValues():[];
		}
		
		public static function get myBidData():FamilyWarBidRankItemData
		{
			var myFamilyName : String = GuildManager.guildData.name;
			if(!myFamilyName)
			{
				return null;
			}
			for each(var data : FamilyWarBidRankItemData in bidRank)
			{
				if(data.familyName == myFamilyName)
					return data;
			}
			return null;
		}
		public static function get myBid():Number
		{
			return _myBid;
		}
		
		public static function get myBidRank():Number
		{
			return _myBidRank;
		}
		
		public  static function get bidEndTime():Number
		{
			return _bidEndTime;
		}
		
		public static function get bidStartTime():Number
		{
			return _bidStartTime;
		}

		/**王城战战斗结束时间**/
		public static function get warEndTime():Number
		{
			return _warEndTime?_warEndTime:_warStartTime+FamilyWarCfgData.war_duration;
		}
		
		/**获取国战开始时间**/
		public static function get warStartTime():Number
		{
			return _warStartTime;
		}
		
		public static function get jinGongFamilyName():String
		{
			return jinGongFamily?jinGongFamily.name:null;
		}
		
		public static function get fangShouFamilyName():String
		{
			return fangShouFamily?fangShouFamily.name:null;
		}
		
		public static function get allDungeonInfo():String
		{
			var result : String = "";
			for (var i:int = 0; i < _dungeonRank.broadcasts.length;i++)
			{
				result+=_dungeonRank.broadcasts[i].getMsg()+"<br/>"
			}
			return result;
		}
		
		/**进攻和防守的帮派，可能不需要缓存下来**/
		public static function get jinGongFamily():FamilyWarFightFamilyData
		{
			if(!_jinGongFamily)
			{
				_jinGongFamily = new FamilyWarFightFamilyData();
				_jinGongFamily.PartyType = KingWarPartyType.ATTACK;
			}
			return _jinGongFamily;
		}
		/**进攻和防守的帮派，可能不需要缓存下来**/
		public static function get fangShouFamily():FamilyWarFightFamilyData
		{
			if(!_fangShouFamily)
			{
				_fangShouFamily = new FamilyWarFightFamilyData();
				_fangShouFamily.PartyType = KingWarPartyType.DEFENCE;
			}
			return _fangShouFamily;
		}

		public static function get dungeonRank():Vector.<FamilyWarDungeonRankItemData>
		{
			return _dungeonRank?_dungeonRank.rankDatas:null;
		}
		/**
		 * 是否开始王城战了 
		 * @return 
		 */		
		public static function isStartWar():Boolean
		{
			return warStartTime<SystemTimeManager.curtTm;
		}
		//开始副本之后的东西
		/**获取副本排行榜**/
		public static function getDungeionRank():void
		{
			if(!ReqLockUtil.isReqLocked(KingWarModuleMessages.C2S_KING_WAR_DUNGEON_RANK,true))
			{
				FamilyWarSender.familyWarDungeonRank();
				ReqLockUtil.lockReq(KingWarModuleMessages.C2S_KING_WAR_DUNGEON_RANK,MESSAGE_LOCK);
			}else
				EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_DUNGEION);
		}
		
		/**获取所有的战场广播**/
		public static function getFamilyWarBroadcast():void
		{
			if(!ReqLockUtil.isReqLocked(KingWarModuleMessages.C2S_KING_WAR_BROADCAST,true))
			{
				FamilyWarSender.getFamilyWarBroadcast();
				ReqLockUtil.lockReq(KingWarModuleMessages.C2S_KING_WAR_BROADCAST,MESSAGE_LOCK);
			}else
				EventManager.dispatchEvent(FamilyWarEvent.FAMILY_WAR_SCENE_BROADCAST);
		}
		
		public static function isEndWar():Boolean
		{
			return warEndTime<SystemTimeManager.curtTm;
		}
		/**
		 * 是否准备战斗了，如果准备战斗，就限制玩家移动之类的 
		 * @return 
		 * 
		 */		
		public static function isWaitFight():Boolean
		{
			if(!MapDataManager.currentScene)
				return false;
			if(MapDataManager.currentScene.mapType != EnumMapType.MAP_TYPE_FAMILY_BATTLE_SCENE)
				return false;
			if(isStartWar())
				return false;
			if(FamilyWarManager.warStartTime - FamilyWarCfgData.war_prepare_duration - SystemTimeManager.curtTm < 0)
				return true;
			return false;
		}
	}
}