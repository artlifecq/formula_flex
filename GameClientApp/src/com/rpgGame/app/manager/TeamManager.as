package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneCursorHelper;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.team.TeamInfo;
	import com.rpgGame.coreData.info.team.TeamJoinTeamInfo;
	import com.rpgGame.coreData.info.team.TeamNearPlayerInfo;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.lang.LangTeam;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.type.TeamType;
	
	import flash.geom.Point;
	
	import app.cmd.TeamModuleMessages;
	import app.message.RaceId;
	import app.message.TeamDropAllocateType;
	import app.message.TeamModuleObjProto;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	
	import utils.TimerServer;

	/**
	 * 队伍数据管理器
	 * @author
	 *
	 */
	public class TeamManager
	{
		/**队伍中最大数量5个*/
		public static const TEAM_MAX_COUNT : int = 5;
		/** 队伍中属性加成最高有效成员数 */
		public static const TEAM_MAX_EFF_MEB_NUM : int = TEAM_MAX_COUNT - 1;
		/** 伤害加成 */
		public static const EACH_MEB_ADD_ATT : int = 2;
		/** 经验加成 */
		public static const EACH_MEB_ADD_EXP : int = 10;
		/**邀请组队与申请入队的保留时间(2分钟120秒) 秒*/
		private static const HOLE_TIME : int = 120;
		/**玩家离线自动退队时间(5分钟300秒) 毫秒*/
		private static const OFFLINE_OUT_TIME : int = 300 * 1000;
		/**附近队伍、附近玩家刷新按钮冷却时间*/
		public static const BTN_REFRESH_TIME : int = 10;
		/**禁止他人邀请我加入队伍*/
		public static var forbidOtherInviteMeJoin : Boolean = false;
		/**自动允许队伍邀请*/
		public static var autoAcceptTeamInvite : Boolean = false;
		/**自动允许成员加入*/
		public static var autoAcceptleMemberJoin : Boolean = false;
		/**我的队伍数据*/
		private static var _teamInfo : TeamInfo = null;
		/**收到邀请我入队的队长数据管理 数据类型:JoinTeamInfo*/
		private static var _inventCaptionList : HashMap = new HashMap();
		/**我是队长，收到申请入队的玩家数据管理 数据类型:JoinTeamInfo*/
		private static var _applyJoinList : HashMap = new HashMap();
		/**所有邀请与申请消息延迟删除 数据类型:TweenLite*/
		private static var _joinInfoDelayList : HashMap = new HashMap();
		/** 被邀请的玩家id **/
		private static var invitePlayerId : Number;
		/** 附近玩家数据 **/
		public static var nearPlayerArr : Array = [];
		/** 附近所有玩家数据（不筛选） **/
		private static var _allNearPlayerArr : Array = [];
		/** 附近队伍数据 **/
		public static var nearTeamsArr:Array = [];
		/** 申请入队玩家id **/
		public static var applyPlayerID : Number;
		/** 选中的玩家的id **/
		public static var selectedPlayerId : Number = 0;
		/** 经验模式索引（0：经验平局分配、1：伤害分配） **/
		private static var _expIndex : int = 0;
		/** 拾取模式索引（0：轮流拾取、1：猎杀者模式、2：自由拾取） **/
		private static var _pickupIndex : int = 0;
		/** 附近玩家---当前选中的玩家数据 **/
		private static var _curNearPlaerInfo : TeamNearPlayerInfo;
		/** 附近队伍---当前选中的队伍数据 **/
		private static var _curTeamInfo : TeamInfo;
		/** 弹出菜单（有队伍），自己是队长，点别人[ 转移队长,请离队伍,加为好友,邀请队伍语音,查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_HAVE_TEAM_WE_ARE_LEADER1 : Array = [LangMenu.TRANSFER_THE_CAPTAIN, LangMenu.PLEASE_FROM_THE_TEAM, LangMenu.ADD_FRIEND, LangMenu.INVITE_TEAM_VOICE, LangMenu.LOOK_HERO,  LangMenu.COPY_THE_NAME];
		/** 弹出菜单（有队伍），自己是队长，点自己[ 离开队伍,查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_HAVE_TEAM_WE_ARE_LEADER2 : Array = [LangMenu.LEAVE_TEAM, LangMenu.LOOK_HERO, LangMenu.COPY_THE_NAME];
		/** 弹出菜单（有队伍），自己不是队长，点别人[ 加为好友,邀请队伍语音,查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_HAVE_TEAM_NOT_LEADER1 : Array = [LangMenu.ADD_FRIEND, LangMenu.INVITE_TEAM_VOICE, LangMenu.LOOK_HERO, LangMenu.COPY_THE_NAME];
		/** 弹出菜单（有队伍），自己不是队长，点自己[ 离开队伍,查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_HAVE_TEAM_NOT_LEADER2 : Array = [LangMenu.LEAVE_TEAM, LangMenu.LOOK_HERO, LangMenu.COPY_THE_NAME];
		/** 弹出菜单（没有队伍），点别人[ 邀请组队,加为好友,查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_NOT_TEAM1 : Array = [LangMenu.INVITE_TEAM, LangMenu.ADD_FRIEND, LangMenu.LOOK_HERO, LangMenu.COPY_THE_NAME];
		/** 弹出菜单（没有队伍），点自己[ 查看资料,赠送鲜花,复制名称 ] **/
		public static const MENUS_NOT_TEAM2 : Array = [LangMenu.LOOK_HERO, LangMenu.COPY_THE_NAME];
		/** 弹出菜单（经验模式）[ 经验平均分配,经验按伤害分配 ] **/
		public static const MENUS_EXP_MODE : Array = [LangMenu.TEAM_EXP_MEAN_MODE, LangMenu.TEAM_EXP_HURT_MODE];
		/** 弹出菜单（拾取模式）[ 轮流拾取,自由拾取,猎杀者拾取 ] **/
		public static const MENUS_PICK_UP_MODE : Array = [LangMenu.TEAM_PICK_UP_MODE, LangMenu.TEAM_FEED_PICK_UP_MODE, LangMenu.TEAM_KILLER_MODE];
		/** (true[伤害分配]/false(平均)) **/
		public static var teamExpAllocateBool : Boolean = false;
		/** ( 0：KILLER--猎杀者模式、1：TURN--轮流拾取、2：FREE--自由拾取 ) **/
		public static var teamDropAllocateType : int = -1;
		/** 队伍英雄数据 **/
		private static var _teamSceneRoleHashMap : HashMap = new HashMap();
		/** 距离队长的范围 （可配置，暂定10米） **/
		private static const DISTANCE : Number = 1000;
		/** 是否释放了技能 **/
		private static var _isReleaseSpell : Boolean;

		public function TeamManager()
		{

		}

		public static function setup() : void
		{
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, walkToLeaderPos);
			EventManager.addEvent(TeamEvent.TEAM_CAPTION_CHANGE, walkToLeaderPos);
			EventManager.addEvent(SpellEvent.SPELL_HERO_RELEASE_SPELL, onIsReleaseSpell);
		}

		public static function setHeroTeam(data : TeamModuleObjProto) : void
		{
			forbidOtherInviteMeJoin = data.teamForbidOtherInviteMeJoin;
			autoAcceptleMemberJoin = data.teamAutoAcceptRequest;
			autoAcceptTeamInvite = data.teamAutoAcceptInvite;
		}


		/**-----------------------------队伍创建------------------------------------------------------------------------------**/

		/**
		 *  创建一个自己的队伍
		 *
		 */
		public static function createMyTeam() : void
		{
			updatMyHasTeam(true);
			_teamInfo.leaderId = MainRoleManager.actorInfo.id;
			var selfMemberInfo : TeamUnit = getMyTeamMemData();
			addTeamMember(selfMemberInfo);
		}

		/**
		 * 创建一个自己的队伍数据信息
		 *
		 */
		public static function getMyTeamMemData() : TeamUnit
		{
			var mainPlayer : HeroData = MainRoleManager.actorInfo;
			var memData : TeamUnit = new TeamUnit();
			memData.id = mainPlayer.id;
			memData.countryId = mainPlayer.countryId;
			memData.name = mainPlayer.name;
			memData.guildName = mainPlayer.societyName;
			memData.sceneId = mainPlayer.mapID;
			memData.line = mainPlayer.line;
			memData.mapCountryId = mainPlayer.sceneSequence;
			memData.level = mainPlayer.totalStat.level;
			memData.raceId = mainPlayer.job;
			memData.isOnline = true;
			memData.isInCopy = (MapDataManager.getMapType(memData.sceneId) != EnumMapType.MAP_TYPE_NORMAL);
			return memData;
		}

		/**
		 *  收到创建队伍成功
		 *
		 */
		public static function createTeamComplete() : void
		{
			createMyTeam();
			if (invitePlayerId)
			{
				invitePlayerJionMyTeam(invitePlayerId);
			}
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP6);
		}



		/**-----------------------------操作（进队、离队、任命队长、踢出队友等）------------------------------------------------------------------------------**/
		/**
		 *改变队长
		 * @param id
		 *
		 */
		public static function changeCaption(id : Number) : void
		{
			if (leaderId != MainRoleManager.actorID)
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP7);
				return;
			}

			if (id == leaderId)
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP8);
				return;
			}

			if (id == 0)
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP9);
				return;
			}

			if (!isHaveTeam())
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP10);
				return;
			}

			TeamSender.changeCaption(id);
		}

		/**
		 * 新的队长产生了
		 * @param id 新的队长id
		 *
		 */
		public static function onNewCaption(id : Number) : void
		{
			//新队长的数据
			var leaderInfo : TeamUnit = findMemberByID(id);
			//老队长的数据
			var oldLeaderInfo : TeamUnit = findMemberByID(leaderId);
			_teamInfo.leaderId = id;
			refreshCaptain(id);

			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP4, leaderInfo.name);
			EventManager.dispatchEvent(TeamEvent.TEAM_CAPTION_CHANGE);

			//不管是谁，只要是老队长转移了队长职位，队长和队员的界面全部移除
			EventManager.dispatchEvent(TeamEvent.TEAM_FOLLOW_LEADER, [null]);
			removeALLTeamFollowPlayer();
		}

		/**
		 * 队长变更后，将队长数据提到队伍最前面
		 * @param leaderID
		 *
		 */
		public static function refreshCaptain(leaderID : Number) : void
		{
			_teamInfo.leaderId = leaderID;
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				if (list[i].id == leaderID)
				{
					list.unshift(list.splice(i, 1)[0]);
					break;
				}
			}
			arrageTeamData();
		}

		/**
		 * 对队伍成员除了队长外数据根据入队时间进行排序
		 *
		 */
		private static function arrageTeamData() : void
		{
			var memberInfo : TeamUnit = findMemberByID(_teamInfo.leaderId);
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			deletMemberInTeamList(memberInfo.id);
			list.sort(sortMebByIndex);
			list.unshift(memberInfo);
		}

		/**
		 * 根据入队时间进行排序
		 * @param data1
		 * @param data2
		 * @return
		 *
		 */
		private static function sortMebByIndex(data1 : TeamUnit, data2 : TeamUnit) : int
		{
			if (data1.index > data2.index)
				return 1;
			else if (data1.index < data2.index)
				return -1;
			return 0;
		}

		/**
		 * 踢人
		 * @param id 被踢的玩家id
		 *
		 */
		public static function kickPlayer(id : Number) : void
		{
			if (id == 0)
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP9);
				return;
			}

			if (id == MainRoleManager.actorID)
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP11);
				return;
			}

			if (!ReqLockUtil.isReqLocked(TeamModuleMessages.C2S_KICK, true))
				TeamSender.kickParter(id);
			ReqLockUtil.lockReq(TeamModuleMessages.C2S_KICK);
		}

		/**
		 * 你被踢出队伍了（自己被踢了）
		 *
		 */
		public static function beenKick() : void
		{
			//自己被踢出队伍，取消小队跟随，自己的跟随状态设置为false
			sendTeamsMemberFollow(false);
			EventManager.dispatchEvent(TeamEvent.TEAM_KICK_PLAYER, [false, MainRoleManager.actorInfo.name]);
			MainRoleManager.actorInfo.isFollowing = false;

			updatMyHasTeam(false);
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP5);
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
		}

		/**----------------------------- 队伍内信息广播，已经组队经验、伤害加成 ------------------------------------------------------------------------------**/
		/**
		 * 队长收到某队员下线，开始倒计时其5min后退队
		 * @param id
		 * @return
		 *
		 */
		public static function setTeamMembOffLine(id : Number) : TeamUnit
		{
			var memberInfo : TeamUnit = findMemberByID(id);
			if (memberInfo)
			{
				memberInfo.leveTime = SystemTimeManager.curtTm + OFFLINE_OUT_TIME;
				memberInfo.sceneId = 0;
				memberInfo.line = 0;
				memberInfo.mapCountryId = -1;
				memberInfo.isOnline = false;
			}
			return memberInfo;
		}

		/**
		 * 队长收到某人上线，清除倒计时，更新他的场景id
		 * @param id
		 * @param mapID
		 * @param line
		 */
		public static function setTeamMembOnLine(id : Number, mapID : int, line : int, mapCountryId : int) : TeamUnit
		{
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				var memberInfo : TeamUnit = list[i];
				if (memberInfo.id == id)
				{
					var mapData : SceneData = MapDataManager.getMapInfo(mapID);
					memberInfo.sceneId = mapID;
					memberInfo.mapCountryId = mapCountryId;
					memberInfo.line = line;
					memberInfo.isOnline = true;
					memberInfo.leveTime = 0;
					return memberInfo;
				}
			}
			return null;
		}

		/**
		 * 收到队伍中成员等级提升
		 * @param id 玩家id
		 * @param newlv 新等级
		 */
		public static function getSomeParterLvUp(id : Number, newLv : int) : TeamUnit
		{
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				var membInfo : TeamUnit = list[i];
				if (membInfo.id == id)
				{
					membInfo.level = newLv;
					return membInfo;
				}
			}
			return null;
		}

		/**
		 * 收到队伍中成员名字变化
		 * @param id 玩家id
		 * @param name 玩家名字
		 * @return
		 *
		 */
		public static function getMembRename(id : int, name : String) : TeamUnit
		{
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				var membInfo : TeamUnit = list[i];
				if (membInfo.id == id)
				{
					membInfo.name = name;
					return membInfo;
				}
			}
			return null;
		}

		/**
		 * 收到队伍中成员场景/线变化
		 * @param id 玩家id
		 * @param sceneId 场景id
		 * @param line 线数 (场景id是个副本时, 无视)
		 * @param mapCountryId 所在场景属于哪个国家[0表示在一个副本或者中立区，1-3表示在三个国家]
		 * @return
		 *
		 */
		public static function getPaterSceneChange(id : Number, sceneId : int, line : int, mapCountryId : int) : TeamUnit
		{
			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = list.length;
			for (var i : int = 0; i < len; i++)
			{
				var member : TeamUnit = list[i];
				if (member.id == id)
				{
					var mapInfo : SceneData = MapDataManager.getMapInfo(sceneId); //获取地图配置数据
					if (mapInfo != null)
					{
						member.id = id;
						member.sceneId = sceneId;
						member.line = line;
						member.mapCountryId = mapCountryId;
						member.isInCopy = (mapInfo.mapType != EnumMapType.MAP_TYPE_NORMAL);
						return member;
					}
				}
			}
			return null;
		}

		/**
		 * 更新我队伍中某个玩家的坐标
		 * @param id 玩家id
		 * @param mx x坐标
		 * @param my y坐标
		 * @return
		 *
		 */
		public static function updateMyTeammebPos(id : Number, mx : Number, my : Number) : TeamUnit
		{
			if (!isHaveTeam())
				return null;

			var list : Vector.<TeamUnit> = teamMemberInfolist;
			var membInfo : TeamUnit;
			for each (membInfo in list)
			{
				if (membInfo.id == id)
				{
					membInfo.mx = mx;
					membInfo.my = my;
					return membInfo;
				}
			}
			return null;
		}

//		/**
//		 * 收到某个队友的装备发生了变化 刷新某个成员的装备
//		 * @param id 玩家id
//		 * @param equip
//		 * @param gujian
//		 * @return
//		 *
//		 */
//		public static function updateMemberEquip(id : Number, equip : Number, gujian : Number) : TeamUnit
//		{
//			var list : Vector.<TeamUnit> = teamMemberInfolist;
//			var membInfo : TeamUnit;
//			for each (membInfo in list)
//			{
//				if (membInfo.id == id)
//				{
//					//membInfo.equipResource = equip;
//					membInfo.guJianWearedResource = gujian;
//					return membInfo;
//				}
//			}
//			return null;
//		}

		/**
		 * 组队经验加成
		 * @return
		 *
		 */
		public static function getCurTeamExpAdd() : int
		{
			var membInSameMap : int = getMembInSameMapNum();
			return membInSameMap * EACH_MEB_ADD_EXP;
		}

		/**
		 * 组队伤害加成
		 * @return
		 *
		 */
		public static function getCurTeamAttAdd() : int
		{
			var membInSameMap : int = getMembInSameMapNum();
			return membInSameMap * EACH_MEB_ADD_ATT;
		}

		/**
		 * 获取场景队伍加成数量
		 * @return
		 *
		 */
		public static function getMembInSameMapNum() : int
		{
			if (!_teamInfo)
				return 0;

			var membNum : int = 0;
			var membList : Vector.<TeamUnit> = teamMemberInfolist;
			for each (var membInfo : TeamUnit in membList)
			{
				if (membInfo.isOnline == true && membInfo.id != MainRoleManager.actorInfo.id)
				{
					var isInSameMap : Boolean = (membInfo.sceneId == SceneSwitchManager.currentMapId && membInfo.mapCountryId == MainRoleManager.actorInfo.sceneSequence);
					if (isInSameMap == true)
					{
						membNum++;
					}
				}
			}
			return membNum;
		}

		/**
		 * 有玩家加入了我的队伍
		 * @param memData
		 *
		 */
		public static function otherJoinMyTeam(memData : TeamUnit) : void
		{
			if (!isHaveTeam())
			{
				createMyTeam();
				EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
			}
			addTeamMember(memData);
			//			showTeamIco(memData.id);
			EventManager.dispatchEvent(TeamEvent.TEAM_OTHER_JOIN_MY_TEAM);
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP1, memData.name);
		}

		/**
		 *  队伍解散了
		 *
		 */
		public static function onTeamDissolve() : void
		{
			updatMyHasTeam(false);
			updateTeamIcon();
			//队伍解散了，所有玩家的跟随状态设为false
			EventManager.dispatchEvent(TeamEvent.TEAM_FOLLOW_LEADER, [null]);
			removeALLTeamFollowPlayer();

			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP3);
		}

		/**
		 *  隐藏小地图上队员图标
		 *
		 */
		private static function updateTeamIcon() : void
		{
			// TODO Auto Generated method stub

		}

		/**
		 * 队员离开了队伍
		 * @param roleID
		 *
		 */
		public static function teamPlayerLeave(id : Number) : void
		{
			var membInfo : TeamUnit = findMemberByID(id);
			deletMemberInTeamList(membInfo.id);
			updateTeamIcon();
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP2, membInfo.name);
			//离开的玩家的跟随状态设置为false，刷新队长跟随状态界面显示
			var data : HeroData = getHeroDataById(id);
			data.isFollowing = false;
			if (isTeamLeader(MainRoleManager.actorID))
			{
				EventManager.dispatchEvent(TeamEvent.TEAM_LEAVER_TEAM, [false, membInfo.name]);
				TeamManager.setTeamPlayerIsFollowing(false, membInfo.name);
			}

			EventManager.dispatchEvent(TeamEvent.TEAM_MEMB_LEAVE);
		}

		/**
		 *  自己离开队伍了
		 *
		 */
		public static function leaveTeamComplete() : void
		{
			//隐藏小地图上
			updatMyHasTeam(false);
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
			if ( isTeamLeader(MainRoleManager.actorID) || !isHaveTeam() ) //自己离开队伍，自己是队长
			{
				EventManager.dispatchEvent(TeamEvent.TEAM_FOLLOW_LEADER, [null]);
			}
			else
			{
				EventManager.dispatchEvent(TeamEvent.TEAM_MY_LEAVE_TEAM, [null]);
				removeTeamFollowPlayer(false);
			}
		}


		/**-----------------------------申请入队相关------------------------------------------------------------------------------**/
		/**
		 * 添加一个申请入队的信息
		 * @param joinInfo
		 *
		 */
		public static function addApplyJoinInfo(joinInfo : TeamJoinTeamInfo) : void
		{
			applyPlayerID = joinInfo.id;
			var tweenLite : TweenLite = TweenLite.delayedCall(HOLE_TIME, removeApplyJoinInfo, [joinInfo]);
			_applyJoinList.add(joinInfo.id, joinInfo);
			_joinInfoDelayList.add(joinInfo, tweenLite);

			//弹出进队申请消息icon
			if (!AppManager.isAppInScene(AppConstant.TEAM_APPLY_JOIN_WAITE_PANEL))
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.TEAM_APPLY_JOIN_TYPE, getApplyJoinTeamInfoList().length);
			}
		}

		/**
		 * 移除一个申请入队的信息
		 * @param joinInfo
		 *
		 */
		public static function removeApplyJoinInfo(joinInfo : TeamJoinTeamInfo) : void
		{
			var tweenLite : TweenLite = _joinInfoDelayList.getValue(joinInfo);
			if (!tweenLite)
				return;
			tweenLite.kill();
			_applyJoinList.remove(joinInfo.id);
			_joinInfoDelayList.remove(joinInfo);
			EventManager.dispatchEvent(TeamEvent.TEAM_APPLY_JOIN_INFO_CHANGE);
			if (_applyJoinList.length == 0)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_APPLY_JOIN_TYPE);
				AppManager.hideApp(AppConstant.TEAM_APPLY_JOIN_WAITE_PANEL);
			}
		}

		/**
		 * 通过ID移除一个入队申请
		 * @param id
		 *
		 */
		public static function removeApplyJoinInfoById(id : Number) : void
		{
			removeApplyJoinInfo(getApplyJoinInfo(id));
		}

		/**
		 * 获取一个申请入队的信息
		 * @param id
		 * @return
		 *
		 */
		public static function getApplyJoinInfo(id : Number) : TeamJoinTeamInfo
		{
			return _applyJoinList.getValue(id) as TeamJoinTeamInfo;
		}

		/**
		 * 获取所有申请入队的消息
		 *
		 */
		public static function getApplyJoinTeamInfoList() : Array
		{
			return _applyJoinList.getValues();
		}

		/**
		 * 1、清空所有申请入队消息
		 * 2、移除主界面消息icon显示事件
		 * 3、关闭申请进队消息面板
		 *
		 */
		public static function clearAllApplyJoinTeamInfo() : void
		{
			_applyJoinList.clear();
			var joinInfoArr : Array = _joinInfoDelayList.keys();
			var len : uint = joinInfoArr.length;
			for (var i : uint = 0; i < len; i++)
			{
				var joinInfo : TeamJoinTeamInfo = joinInfoArr[i] as TeamJoinTeamInfo;
				if (joinInfo.joinType == TeamType.JOININFO_TYPE_JOIN)
				{
					var tweenLite : TweenLite = _joinInfoDelayList.getValue(joinInfo);
					tweenLite.kill();
					_joinInfoDelayList.remove(joinInfo);
				}
			}
			TweenLite.killDelayedCallsTo(removeApplyJoinInfo);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_APPLY_JOIN_TYPE);

			TeamSender.refuseAllJoinRequest();
			AppManager.hideApp(AppConstant.TEAM_APPLY_JOIN_WAITE_PANEL);
		}

		/**
		 * 回复别人的入队申请
		 * @param id
		 * @param isAgree
		 *
		 */
		public static function joinMyTeamRequest(id : Number, isAgree : Boolean) : void
		{
			removeApplyJoinInfoById(id);
			if (isAgree)
				TeamSender.replyJoinTeamRequest(id, isAgree);
		}

		/**
		 *  申请加入别人的队伍成功，等待对方同意，等待两分钟解除限制
		 *
		 */
		public static function onJoinOtherTeamWaitComplete() : void
		{
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP12);
		}

		/**
		 * 消息解锁
		 *
		 */
		public static function unLockJoinOtherTeam() : void
		{
			ReqLockUtil.unlockReq(TeamModuleMessages.C2S_SEND_REQUEST);
		}

		/**
		 *  申请加入别人的队伍成功
		 *
		 */
		public static function reqJoinOtherTeamComplete() : void
		{
			unLockJoinOtherTeam();
			EventManager.dispatchEvent(TeamEvent.TEAM_PLAYER_TEAM_STATE_UPDATE);
		}

		/**
		 * 申请进入其他玩家的队伍
		 * @param id
		 *
		 */
		public static function reqJoinOtherTeam(id : Number) : void
		{
			if (isHaveTeam())
			{
				NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP13);
				return;
			}

			var key : String = TeamModuleMessages.C2S_SEND_REQUEST;
			if (ReqLockUtil.isReqLocked(key)) //已经申请加入队伍了
				return;

			ReqLockUtil.lockReq(key);
			TeamSender.requestJoinOtherTeam(id);
		}



		/**-----------------------------组队邀请相关------------------------------------------------------------------------------**/

		/**
		 * 邀请玩家加入队伍
		 * @param player 被邀请的玩家id
		 *
		 */
		public static function invitePlayerJionMyTeam(playerId : Number) : void
		{
			var actorID : Number = MainRoleManager.actorID;
			if (isHaveTeam() && !isTeamLeader(actorID)) //自身有组队并且不是队长
			{
				NoticeManager.showNotify(LangTeam.TEAM_COMMON_ERROR_DONT_IS_LEADER);
				return;
			}

			if (actorID == playerId) //自身
			{
				if (isHaveTeam()) //自己是否有队伍
					NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP14);
				else
					TeamSender.requestCreateMyTeam();
			}
			else
			{
				if (isInTeam(playerId)) //有队伍
				{
					NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP15);
				}
				else if (isTeamFull()) //队伍满人
				{
					NoticeManager.showNotify(LangTeam.TEAM_COMMON_ERROR_MORE_THAN_MAX_COUNT);
				}
				else
				{
					var key : String = TeamModuleMessages.C2S_SEND_INVITE + playerId;
//					if(ReqLockUtil.isReqLocked(key,true))
//						return;
//					ReqLockUtil.lockReq(key,500);
					invitePlayerId = playerId;
					if (isHaveTeam()) //自己是否有队伍
						TeamSender.requestInventJoinTeam(playerId);
					else
						TeamSender.requestCreateMyTeam();
				}
			}
		}

		private static function reqInviteJoinTeam(playerId : int) : void
		{
			var key : String = TeamModuleMessages.C2S_SEND_INVITE + invitePlayerId;
//			if(ReqLockUtil.isReqLocked(key))
//			{
//				NoticeManager.showNotify("已经邀请了改玩家，等待服务器响应");
//				return;
//			}
			TeamSender.requestInventJoinTeam(playerId);
		}

		/**
		 * 玩家拒绝了你的组队请求
		 * @param id
		 * @param name
		 *
		 */
		public static function otherRejectInvite(id : Number, name : String) : void
		{
			var key : String = TeamModuleMessages.C2S_SEND_INVITE + id;
			ReqLockUtil.unlockReq(key);
			NoticeManager.showNotify(LangTeam.TEAM_CHATA_TIP16, name);
		}

		/**
		 * 判断被邀请玩家是“自动允许队伍邀请”进队伍，还是要等待被邀玩家同意进队伍
		 * @param joinData 被邀请玩家的数据
		 *
		 */
		public static function beenInvite(joinData : TeamJoinTeamInfo) : void
		{
			if (autoAcceptTeamInvite)
			{
				TeamSender.requestBeInventJoinTeam(joinData.id, true);
			}
			else
			{
				addCaptainInventJoinTeamInfo(joinData);

				//弹出组队邀请消息icon
				if (!AppManager.isAppInScene(AppConstant.TEAM_INVITE_WAITE_PANEL))
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.TEAM_INVITE_WAITE_TYPE, getCaptainInventJoinTeamInfoList().length);
				}
				EventManager.dispatchEvent(TeamEvent.TEAM_INVENT_JOIN_INFO_CHANGE);
			}
		}

		/**
		 * 添加一个被邀请组队的信息
		 * @param joinInfo
		 *
		 */
		public static function addCaptainInventJoinTeamInfo(joinInfo : TeamJoinTeamInfo) : void
		{
			var tweenLite : TweenLite = TweenLite.delayedCall(HOLE_TIME, removeCaptainInventJoinTeamInfo, [joinInfo]);
			_inventCaptionList.add(joinInfo.id, joinInfo);
			_joinInfoDelayList.add(joinInfo, tweenLite);
			EventManager.dispatchEvent(TeamEvent.TEAM_INVENT_JOIN_INFO_CHANGE);
		}

		/**
		 *  邀请玩家加入，等待玩家操作
		 *
		 */
		public static function invitePlayerJoinMyTeamWaitComplete() : void
		{
			var key : String = TeamModuleMessages.C2S_SEND_INVITE + invitePlayerId;
			ReqLockUtil.unlockReq(key);
			invitePlayerId = 0;
			NoticeManager.showNotify(LangTeam.TEAM_INVITE_PLAER_WAIT_COMPLETE);
		}

		/**
		 *
		 * 邀请入队成功, 对方设为了自动接受邀请, 即将加入本队
		 */
		public static function invitePlayerJionMyTeamComplete() : void
		{
			var key : String = TeamModuleMessages.C2S_SEND_INVITE + invitePlayerId;
			ReqLockUtil.unlockReq(key);
			invitePlayerId = 0;
			NoticeManager.showNotify(LangTeam.TEAM_INVITE_PLAYER_COMPLETE);
		}

		/**
		 * 移除一个被邀请组队的信息
		 * @param joinInfo
		 *
		 */
		public static function removeCaptainInventJoinTeamInfo(joinInfo : TeamJoinTeamInfo) : void
		{
			var tweenLite : TweenLite = _joinInfoDelayList.getValue(joinInfo);
			tweenLite.kill();
			_inventCaptionList.remove(joinInfo.id);
			_joinInfoDelayList.remove(joinInfo);
			EventManager.dispatchEvent(TeamEvent.TEAM_INVENT_JOIN_INFO_CHANGE);
			if (_inventCaptionList.length == 0)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_INVITE_WAITE_TYPE);
				AppManager.hideApp(AppConstant.TEAM_INVITE_WAITE_PANEL);
			}
		}

		/**
		 * 通过ID移除一个被邀请组队的信息
		 * @param id
		 *
		 */
		public static function removeCaptainInventJoinTeamInfoById(id : Number) : void
		{
			removeCaptainInventJoinTeamInfo(getCaptainInventJoinTeamInfo(id));
		}

		/**
		 * 获取一个被邀请组队的信息
		 * @param id
		 * */
		public static function getCaptainInventJoinTeamInfo(id : Number) : TeamJoinTeamInfo
		{
			return _inventCaptionList.getValue(id) as TeamJoinTeamInfo;
		}

		/**
		 * 获取邀请我组队的所有信息
		 * */
		public static function getCaptainInventJoinTeamInfoList() : Array
		{
			return _inventCaptionList.getValues();
		}

		/**
		 * 1、清空所有邀请组队信息
		 * 2、移除主界面消息icon显示事件
		 * 3、关闭组队邀请组队消息面板
		 *
		 */
		public static function clearAllCaptainInventJoinTeamInfo() : void
		{
			_inventCaptionList.clear();
			var joinInfoArr : Array = _joinInfoDelayList.keys();
			var len : uint = joinInfoArr.length;
			for (var i : uint = 0; i < len; i++)
			{
				var joinInfo : TeamJoinTeamInfo = joinInfoArr[i] as TeamJoinTeamInfo;
				if (joinInfo.joinType == TeamType.JOININFO_TYPE_INVENT)
				{
					var tweenLite : TweenLite = _joinInfoDelayList.getValue(joinInfo);
					tweenLite.kill();
					_joinInfoDelayList.remove(joinInfo);
				}
			}
			TweenLite.killDelayedCallsTo(removeCaptainInventJoinTeamInfo);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.TEAM_INVITE_WAITE_TYPE);

			TeamSender.refuseAllInventRequest();
			AppManager.hideApp(AppConstant.TEAM_INVITE_WAITE_PANEL);
		}

		/**-----------------------------   一些相关条件判断  ------------------------------------------------------------------------------**/
		/**
		 * 判断队伍是否已经满了
		 */
		public static function isTeamFull() : Boolean
		{
			if (_teamInfo)
			{
				return _teamInfo.memberCount >= TEAM_MAX_COUNT;
			}
			return false;
		}

		/**
		 * 判断某个队友是否在线
		 * @param id
		 * @return
		 *
		 */
		public static function isMemberOnline(id : Number) : Boolean
		{
			var vec : Vector.<TeamUnit> = teamMemberInfolist;
			if (vec && vec.length > 0)
			{
				for each (var teamMemberInfo : TeamUnit in vec)
				{
					if (teamMemberInfo.id == id)
					{
						return teamMemberInfo.isOnline;
					}
				}
			}
			return false;
		}

		/**
		 * 判断某个人是否是自己队伍的成员
		 * @param id 玩家id
		 * @return
		 *
		 */
		public static function isMyTeamMember(id : Number) : Boolean
		{
			var vec : Vector.<TeamUnit> = teamMemberInfolist;
			if (vec && vec.length > 0)
			{
				for each (var teamMemberInfo : TeamUnit in vec)
				{
					if (teamMemberInfo.id == id)
					{
						return true;
					}
				}
			}
			return false;
		}

		/**
		 * 判断某个人是不是队长
		 * @param id 玩家id
		 * @return
		 *
		 */
		public static function isTeamLeader(id : Number) : Boolean
		{
			return leaderId == id;
		}

		/**
		 * 判断自己当前是否有队伍
		 */
		public static function isHaveTeam() : Boolean
		{
			return _teamInfo != null;
		}

		/**
		 * 判断某队友是否与自己同地图
		 * @param membId 队友id
		 * @return
		 *
		 */
		public static function isInSameMapByTeamMembId(membId : Number) : Boolean
		{
			var membInfo : TeamUnit = findMemberByID(membId);
			if (membInfo)
			{
				return (membInfo.sceneId == SceneSwitchManager.currentMapId && membInfo.mapCountryId == MainRoleManager.actorInfo.sceneSequence);
			}
			return false;
		}

		/**
		 * 判断某玩家是否在队伍中
		 * @param playerID 需要被判断的游戏对象
		 * @return 返回目标对象是否有组队
		 * @author
		 */
		public static function isInTeam(playerID : Number) : Boolean
		{
			var returnValue : Boolean = false;
			if (null != getTeammaterByID(playerID))
				returnValue = true;

			return returnValue;
		}

		/**
		 * 通过玩家id取得队伍成员的信息
		 * @param playerID
		 * @return
		 *
		 */
		public static function getTeammaterByID(playerID : Number) : TeamUnit
		{
			var membList : Vector.<TeamUnit> = new Vector.<TeamUnit>();
			for (var i : int = 0; i < nearTeamsArr.length; i++)
			{
				membList = nearTeamsArr[i].teamMemberInfolist;
				for (var j : int = 0; j < membList.length; j++)
				{
					if (membList[j].id == playerID)
						return membList[j];
				}
			}
			return null;
		}

		/**
		 * 通过ID查找一个队员的信息
		 * @param id
		 * @return
		 *
		 */
		public static function findMemberByID(id : Number) : TeamUnit
		{
			if (_teamInfo == null)
				return null;

			var list : Vector.<TeamUnit> = teamMemberInfolist;
			for each (var memberInfo : TeamUnit in list)
			{
				if (memberInfo.id == id)
				{
					return memberInfo;
				}
			}
			return null;
		}

		/**
		 * 添加一个队员
		 * @param info
		 *
		 */
		public static function addTeamMember(info : TeamUnit,teamLeaderId:Number=0) : void
		{
			var teamMemberList : Vector.<TeamUnit> = teamMemberInfolist;
			info.index = teamMemberList.length;
			teamMemberList.push(info);

			var roleData : HeroData = new HeroData();
			var heroData : HeroData = MainRoleManager.actorInfo;
			if (info.id == MainRoleManager.actorID)
			{
				heroData.cloneResourcesTo(roleData);
				roleData.id = heroData.id;
				roleData.name = heroData.name;
				roleData.countryId = heroData.countryId;
			}
			else
			{
				HeroData.setTeamRoleData(roleData, info);
			}
			_teamSceneRoleHashMap.add(roleData.id, roleData);
		}

		/**
		 * 移除一个队员
		 * @param id
		 *
		 */
		public static function deletMemberInTeamList(id : Number) : void
		{
			var teamMemberList : Vector.<TeamUnit> = teamMemberInfolist;
			var len : int = teamMemberList.length;
			for (var i : uint = 0; i < len; i++)
			{
				var memberInfo : TeamUnit = teamMemberList[i];
				if (memberInfo.id == id)
				{
					teamMemberList.splice(i, 1);
					break;
				}
			}
		}

		/**
		 * 获取我的队伍的 队员列表
		 * @return
		 *
		 */
		public static function get teamMemberInfolist() : Vector.<TeamUnit>
		{
			if (_teamInfo)
			{
				return _teamInfo.teamMemberInfolist;
			}
			return null;
		}

		/**
		 * 更新自己是否有队伍
		 * @param	hasTeam
		 */
		public static function updatMyHasTeam(hasTeam : Boolean) : void
		{
//			MainManager.actorInfo.isInTeam = hasTeam;
			if (hasTeam)
			{
				if (!_teamInfo)
				{
					_teamInfo = new TeamInfo();
				}
				_teamInfo.reset();
			}
			else
			{
				_teamInfo = null;
				clearAllApplyJoinTeamInfo();
			}
			clearAllCaptainInventJoinTeamInfo();
		}

		/**
		 * 显示同组图标
		 * @param id
		 *
		 */
		public static function showTeamIco(id : Number) : void
		{
		}

		/**
		 * 隐藏同组图标
		 * @param id
		 *
		 */
		public static function hideTeamIcon(id : Number) : void
		{
			var actor : SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
			if (actor != null)
			{
				if(actor.headFace is HeadFace)
					(actor.headFace as HeadFace).removeBodyIco();
			}
		}

		/**
		 * 菜单栏检测
		 * @param playerId 玩家id
		 * @param name 玩家名字
		 * @param hasTeam 是否有队伍
		 *
		 */
		public static function onCheckMenu(playerId : Number, name:String, hasTeam : Boolean) : void
		{
			if (hasTeam) //有队伍
			{
				//自己是队长
				if (isTeamLeader(MainRoleManager.actorID))
				{
					if (playerId == MainRoleManager.actorID) //点击的对象是自己
					{
						MenuManager.showMenu(MENUS_HAVE_TEAM_WE_ARE_LEADER2, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
					}
					else
					{
						MenuManager.showMenu(MENUS_HAVE_TEAM_WE_ARE_LEADER1, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
					}

				}
				else
				{
					//自己不是是队长
					if (playerId == MainRoleManager.actorID) //点击的对象是自己
					{
						MenuManager.showMenu(MENUS_HAVE_TEAM_NOT_LEADER2, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
					}
					else
					{
						MenuManager.showMenu(MENUS_HAVE_TEAM_NOT_LEADER1, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
					}
				}
			}
			else
			{
				//没有队伍
				if (playerId == MainRoleManager.actorID) //点击的对象是自己
				{
					MenuManager.showMenu(MENUS_NOT_TEAM2, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
				}
				else
				{
					MenuManager.showMenu(MENUS_NOT_TEAM1, [playerId,name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
				}
			}

		}

		/**
		 * 附近玩家筛选 
		 * @param nearHeros 所有玩家
		 * @return 
		 * 
		 */		
		public static function screenNearPlayer( nearHeros:Vector.<TeamNearPlayerInfo> ):void
		{
			if( nearHeros == null || nearHeros.length <= 0 )
				return;
				
			var tempData:TeamNearPlayerInfo;
			var screenArr:Array = [];//筛选后的数据
			
			//把Vector转换为Array，用于面板显示
			for ( var i:int = 0; i < nearHeros.length; i++ ) 
			{
				tempData = nearHeros[i];
				var selfId:Number = MainRoleManager.actorID;
				if( !TeamManager.isInTeam( tempData.id ) && tempData.id != selfId )//没有队伍，并且不是自己
					screenArr.push( tempData );
			}
			TeamManager.nearPlayerArr = screenArr;
		}

		/**
		 * 根据队长的id获取队伍数据
		 * @param leaderId
		 * @return
		 *
		 */
		public static function getTeamInfo(leaderId : Number) : TeamInfo
		{
			var data : TeamInfo;
			for (var i : int = 0; i < nearTeamsArr.length; i++)
			{
				data = nearTeamsArr[i];
				if (data.leaderId != leaderId)
					continue;

				return nearTeamsArr[i];
			}

			return null;
		}

		/**
		 * 通过ID请求队友位置，寻路到队友位置
		 * @param id
		 */
		public static function requestTeamMembPosById(id : Number) : void
		{
			selectedPlayerID = id;
			TeamSender.requestTeamMembPosById(id);
		}

		/**
		 * 自动寻路到队友位置
		 * @param mapID 场景id
		 * @param line 场景线路
		 * @param mx x坐标
		 * @param my y坐标
		 *
		 */
		public static function autoWalkToPoint(mapID : int, line : int, mx : int, my : int) : void
		{
			var sceneID : int;
			var posx : Number;
			var posy : Number;
			var vec : Vector.<TeamUnit> = teamMemberInfolist;
			var curTeamUint : TeamUnit;
			if (vec && vec.length > 0)
			{
				for (var i : int = 0; i < vec.length; i++)
				{
					if (vec[i].id == selectedPlayerID)
					{
						curTeamUint = vec[i];
					}
				}
			}

			if (curTeamUint == null)
				return;

			if (MainRoleManager.actorInfo.sceneSequence != curTeamUint.mapCountryId) //跟目标对象是否是同一个国家
			{
				var npcData : Q_scene_monster_area = MonsterDataManager.getSceneData(NpcCfgData.countryTransNPCId);
				if (npcData == null)
					return;
				var point : Point = MonsterDataManager.getMonsterPosition(npcData);
				sceneID = npcData.q_mapid;
				posx = point.x;
				posy = point.y;
			}
			else
			{
				sceneID = mapID;
				posx = mx;
				posy = my;
			}

			MainRoleSearchPathManager.walkToScene(sceneID, posx, posy, null, 200);
		}

		/**-----------------------------  经验模式、拾取模式、小队跟随 ------------------------------------------------------------------------------**/
		/**
		 * 设置队伍经验分配方式
		 * @param isBool (true[伤害分配]/false(平均))
		 *
		 */
		public static function sendSetTeamExpAllocate(isBool : Boolean) : void
		{
			TeamSender.requestSetTeamExpAllocate(isBool);
		}

		/**
		 * 设置队伍掉落分配方式
		 * @param type ( 0：KILLER--猎杀者模式、1：TURN--轮流拾取、2：FREE--自由拾取 )
		 *
		 */
		public static function sendSetTeamDropAllocate(type : int) : void
		{
			TeamSender.requestSetTeamDropAllocate(type);
		}

		/**
		 * 设置经验模式
		 * @param isBool (true[伤害分配]/false(平均))
		 *
		 */
		public static function setExpMode(isBool : Boolean) : void
		{
			teamExpAllocateBool = isBool;
			if (isBool)
				TeamManager.expIndex = 1;
			else
				TeamManager.expIndex = 0;
			EventManager.dispatchEvent(TeamEvent.TEAM_EXP_MODE);
		}

		/**
		 * 设置拾取模式
		 * @param  type ( 0：KILLER--猎杀者模式、1：TURN--轮流拾取、2：FREE--自由拾取 )
		 *
		 */
		public static function setPickUpMode(type : int) : void
		{
			switch (type)
			{
				case TeamDropAllocateType.KILLER:
					TeamManager.pickupIndex = 1;
					break;
				case TeamDropAllocateType.TURN:
					TeamManager.pickupIndex = 0;
					break;
				case TeamDropAllocateType.FREE:
					TeamManager.pickupIndex = 2;
					break;
				default:
					break;
			}
			EventManager.dispatchEvent(TeamEvent.TEAM_PICK_UP_MODE);
		}

		/**
		 * 队长广播请跟随，限定频率，最多1S一次
		 * @param isBool true(大家跟我走啊)/false(大家别跟我走啊)
		 *
		 */
		public static function sendTeamsBroadcastFollow(isFollowing : Boolean) : void
		{
			TeamSender.requestTeamsBroadcastFollow(isFollowing);
			if (!AppManager.isAppInScene(AppConstant.TEAM_FOLLOW_LEADER_PANEL))
				AppManager.showApp(AppConstant.TEAM_FOLLOW_LEADER_PANEL);
		}

		/**
		 * 队员跟随，限定频率，最多1S一次
		 * @param isBool true(大家跟我走啊)/false(大家别跟我走啊)
		 *
		 */
		public static function sendTeamsMemberFollow(isFollowing : Boolean) : void
		{
			TeamSender.requestTeamsMemberFollow(isFollowing);
		}

		/**
		 * 广播成功
		 * 1、小队跟随，其他队员弹出显示窗口;
		 * 2、队长取消跟随，关闭队长自己和队员的窗口
		 * @param isbool true(跟党走)/false(滚一边去)
		 *
		 */
		public static function teamLeaderFollwSuccess(isFollowing : Boolean) : void
		{
			if (isFollowing)
			{
				if (!TeamManager.isTeamLeader(MainRoleManager.actorID) && !MainRoleManager.actorInfo.isFollowing)
				{
					var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.TEAM_LEADER_FOLOOW);
					GameAlert.showAlert(alertSet,teamLeaderFollwSuccessClick);
				}
				NoticeManager.showNotify(LangTeam.TEAM_LEADER_FOLLOW_1);
			}
			else
			{
				removeALLTeamFollowPlayer();
				RoleStateUtil.walk(MainRoleManager.actor, MainRoleManager.actor.x, MainRoleManager.actor.z, 50); //停止跑动
				NoticeManager.showNotify(LangTeam.TEAM_LEADER_FOLLOW_4);
				EventManager.dispatchEvent(TeamEvent.TEAM_FOLLOW_LEADER, [null]);
			}
		}
		
		private static function teamLeaderFollwSuccessClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onOK();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					onCancel();
					break;
			}
		}
		
		/**
		 *  同意小队跟随
		 *
		 */
		private static function onOK() : void
		{
			sendTeamsMemberFollow(true);
			TimerServer.addLoop(walkToLeaderPos, 300);
		}

		/**
		 * 拒绝小队跟随
		 *
		 */
		private static function onCancel() : void
		{
			sendTeamsMemberFollow(false);
		}

		/**
		 * 队长收到队员跟随了
		 * @param isBool true(跟党走)/false(滚一边去)
		 *
		 */
		public static function teamMemberFollowSuccess(isFollowing : Boolean, name : String) : void
		{
			if (isFollowing)
				NoticeManager.showNotify(LangTeam.TEAM_LEADER_FOLLOW_2, name);
			else
				NoticeManager.showNotify(LangTeam.TEAM_LEADER_FOLLOW_3, name);

			setTeamPlayerIsFollowing(isFollowing, name);
			EventManager.dispatchEvent(TeamEvent.TEAM_FOLLOW_LEADER, [isFollowing, name]);
		}

		/**
		 * 删除一个小队跟随的队员
		 * @param name
		 *
		 */
		public static function removeTeamFollowPlayer(isFollowing : Boolean) : void
		{
			MainRoleManager.actorInfo.isFollowing = isFollowing;
		}

		/**
		 * 添加一个小队跟随的队员
		 * @param name
		 *
		 */
		public static function addTeamFollowPlayer(isFollowing : Boolean) : void
		{
			MainRoleManager.actorInfo.isFollowing = isFollowing;
			isReleaseSpell = false;
		}

		/**
		 * 取消队伍所有成员有小队跟随的状态
		 *
		 */
		public static function removeALLTeamFollowPlayer() : void
		{
			MainRoleManager.actorInfo.isFollowing = false;
		}

		/**
		 * 寻路到队长的位置,如果是在跟随状态（isFollowing），跟随队长跑
		 * 到达位置后，若队长在一定范围（可配置，暂定10米）内，则进入队伍跟随状态，若队长不在视野范围内，则结束自动寻路
		 *
		 */
		private static function walkToLeaderPos() : void
		{
			var teamMemberList : Vector.<TeamUnit> = teamMemberInfolist;
			if (teamMemberList == null)
				return;

			//组队第一个玩家的数据永远是队长的数据
			var leaderUint : TeamUnit = teamMemberList[0];
			if (leaderUint.id == MainRoleManager.actorID) //自己是队长，不需要跟随
				return;

			//先拿自己队伍的索引位置
			var myMemInfo : TeamUnit;
			for each (var memInfo : TeamUnit in teamMemberList)
			{
				if (memInfo.id == MainRoleManager.actorID)
					myMemInfo = memInfo
			}

			//队长的坐标点
			var posx : Number;
			var posy : Number;
			var leaderSceneRole : SceneRole = SceneManager.getSceneObjByID(leaderUint.id) as SceneRole; //队长
			if (leaderSceneRole != null)
			{
				posx = leaderSceneRole.position.x;
				posy = leaderSceneRole.position.z;
			}
			else
			{
				posx = leaderUint.mx;
				posy = leaderUint.my;
			}

			//计算自己与队长之间的距离
			var myData : HeroData = MainRoleManager.actorInfo;
			var mySceneRole : SceneRole = SceneManager.getSceneObjByID(myData.id) as SceneRole;
			var leaderPoint : Point = new Point(posx, posy); //队长的坐标
			var myPoint : Point = new Point(mySceneRole.position.x, mySceneRole.position.z);
			var distance : Number = Point.distance(leaderPoint, myPoint);
			//自己在队伍里面不跟随
			if (myData.isFollowing == false)
			{
				RoleStateUtil.walk(MainRoleManager.actor, MainRoleManager.actor.x, MainRoleManager.actor.z, 100 * myMemInfo.index); //停止跑动
				EventManager.removeEvent(UserMoveEvent.MOVE_THROUGH, walkToLeaderPos);
				return;
			}

			//自己操作了键盘或鼠标行走
			if (myData.isFollowing == true && KeyMoveManager.getInstance().isResponseKeyboardEvent() || SceneCursorHelper.getInstance().isResponseMouseEvent() || isReleaseSpell) //是否响应了键盘上、下、左、右事件、是否点击了地面行走、是否释放了技能
			{
				sendTeamsMemberFollow(false);
				RoleStateUtil.walk(MainRoleManager.actor, MainRoleManager.actor.x, MainRoleManager.actor.z, 100 * myMemInfo.index); //停止跑动
				EventManager.removeEvent(UserMoveEvent.MOVE_THROUGH, walkToLeaderPos);
				return;
			}

			if (leaderSceneRole == null) //看不到队长，先走到队长附近
			{
				MainRoleSearchPathManager.walkToScene(leaderUint.sceneId, posx, posy, null, 100 * myMemInfo.index);
			}
			else
			{
				if (distance <= DISTANCE) //若队长在一定范围（可配置，暂定10米）内，则进入队伍跟随状态，
					RoleStateUtil.walk(MainRoleManager.actor, leaderPoint.x, leaderPoint.y, 100 * myMemInfo.index); //跟着队长跑
				else
					MainRoleSearchPathManager.walkToScene(leaderUint.sceneId, leaderPoint.x, leaderPoint.y, null, 100 * myMemInfo.index); //寻路到队长的位置
			}
		}

		/**
		 * 设置成员跟随状态
		 * @param isFollowing
		 * @param name
		 *
		 */
		public static function setTeamPlayerIsFollowing(isFollowing : Boolean, name : String) : void
		{
			var teamMemberList : Vector.<TeamUnit> = teamMemberInfolist;
			if (teamMemberList == null)
				return;
			for (var i : int = 0; i < teamMemberList.length; i++)
			{
				if (teamMemberList[i].name == name)
					teamMemberList[i].isFollowing = isFollowing;
			}
		}

		/**
		 * 释放技能
		 *
		 */
		private static function onIsReleaseSpell() : void
		{
			isReleaseSpell = true;
		}
		
		/**
		 * 根据玩家武器id获取职业图标 
		 * @param raceId
		 * 
		 */		
		public static function updateJobIcon( raceId:int ):String
		{
			var raceString:String = "";
			switch( raceId )
			{
				case RaceId.ZHONG_JIAN://重剑
					raceString = AssetUrl.ZHONG_JIAN;
					break;
				case RaceId.BA_DAO://霸刀
					raceString = AssetUrl.BA_DAO;
					break;
				case RaceId.YIN_QIANG://银枪
					raceString = AssetUrl.YIN_QIANG;
					break;
				case RaceId.YU_SHAN://羽扇
					raceString = AssetUrl.YU_SHAN;
					break;
				case RaceId.FA_ZHANG://法杖
					raceString = AssetUrl.FA_ZHANG;
					break;
				case RaceId.SHEN_GONG://神弓
					raceString = AssetUrl.SHEN_GONG;
					break;
				case RaceId.KUANG_FU://狂斧
					raceString = AssetUrl.KUANG_FU;
					break;
				default:
					raceString = AssetUrl.QUAN_TOU;
					break;
			}
			return raceString;
		}

		/**-----------------------------   一些相关Getter Setter ------------------------------------------------------------------------------**/

		/**
		 * 获得队长的id
		 */
		public static function get leaderId() : Number
		{
			if (_teamInfo)
			{
				return _teamInfo.leaderId;
			}
			return 0;
		}

		/**
		 * 获得队伍成员总数
		 */
		public static function get memberCount() : int
		{
			if (_teamInfo)
			{
				return _teamInfo.memberCount;
			}
			return 0;
		}

		/** 选中的玩家的id **/
		public static function get selectedPlayerID() : Number
		{
			return selectedPlayerId;
		}

		/**
		 * @private
		 */
		public static function set selectedPlayerID(value : Number) : void
		{
			selectedPlayerId = value;
		}

		/** 经验模式索引（0：经验平局分配、1：伤害分配） **/
		public static function get expIndex() : int
		{
			return _expIndex;
		}

		/**
		 * @private
		 */
		public static function set expIndex(value : int) : void
		{
			_expIndex = value;
		}

		/** 拾取模式索引（0：轮流拾取、1：猎杀者模式、2：自由拾取） **/
		public static function get pickupIndex() : int
		{
			return _pickupIndex;
		}

		/**
		 * @private
		 */
		public static function set pickupIndex(value : int) : void
		{
			_pickupIndex = value;
		}

		/** 附近玩家---当前选中的玩家数据 **/
		public static function get curNearPlaerInfo() : TeamNearPlayerInfo
		{
			return _curNearPlaerInfo;
		}

		/**
		 * @private
		 */
		public static function set curNearPlaerInfo(value : TeamNearPlayerInfo) : void
		{
			_curNearPlaerInfo = value;
		}

		/** 附近队伍---当前选中的队伍数据 **/
		public static function get curTeamInfo() : TeamInfo
		{
			return _curTeamInfo;
		}

		/**
		 * @private
		 */
		public static function set curTeamInfo(value : TeamInfo) : void
		{
			_curTeamInfo = value;
		}

		/** 附近所有玩家数据（不筛选） **/
		public static function get allNearPlayerArr() : Array
		{
			return _allNearPlayerArr;
		}

		/**
		 * @private
		 */
		public static function set allNearPlayerArr(value : Array) : void
		{
			_allNearPlayerArr = value;
		}

		/**
		 * 通过队伍玩家id获取玩家的 HeroData
		 * @param id
		 * @return
		 *
		 */
		public static function getHeroDataById(id : Number) : HeroData
		{
			return _teamSceneRoleHashMap.getValue(id);
		}

		/** 是否释放了技能 **/
		public static function get isReleaseSpell() : Boolean
		{
			return _isReleaseSpell;
		}

		/**
		 * @private
		 */
		public static function set isReleaseSpell(value : Boolean) : void
		{
			_isReleaseSpell = value;
		}

	}
}