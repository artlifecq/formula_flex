package com.rpgGame.app.manager.country
{
	import com.rpgGame.app.manager.SceneCameraLensEffectManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.NpcSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaoNiEvent;
	import com.rpgGame.coreData.cfg.country.CountryTaoNiCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangTaoNi;
	import com.rpgGame.coreData.type.activity.ActivityType;

	import flash.utils.Dictionary;

	import app.message.TaoNiDungeonProto.TaoNiStageProto;

	import gs.TweenLite;

	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 国家讨逆管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-3 上午10:02:16
	 *
	 */
	public class CountryTaoNiManager
	{
		/**
		 * 副本结束时间
		 */
		private static var _dungeonEndTime : Number = 0;
		/**
		 * 当前阶段的结束时间
		 */
		private static var _currStageEndTime : Number = 0;
		/**
		 * 当前阶段
		 */
		private static var _currStage : int = 0;
		/**
		 * 当前阶段第几波
		 */
		private static var _currLevel : int = 0;
		/**
		 * 下一波的时间，如果为0表示没有下一波
		 */
		private static var _nextLevelTime : Number = 0;
		private static var _monsterKilledById : Dictionary = new Dictionary();

		private static var _activityOpenTime : Number = 0;
		private static var _activitySceneId : int = 0;
		private static var _surplusNpcCount : int = 0;

		public function CountryTaoNiManager()
		{
		}

		public static function setup() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_START, onSwitchStart);
		}

		private static function onSwitchStart() : void
		{
			TweenLite.killDelayedCallsTo(showDaoJiShiEffect);
		}

		private static function showDaoJiShiEffect(playToTime : int = 0) : void
		{
			SceneCameraLensEffectManager.playDaoJiShiEffect(playToTime);
		}

		/**
		 * 剩余npc数量
		 * @return
		 *
		 */
		public static function get surplusNpcCount() : int
		{
			return _surplusNpcCount;
		}

		public static function get activityOpenTime() : Number
		{
			return _activityOpenTime;
		}

		/**
		 * 讨逆活动的场景
		 * @return
		 *
		 */
		public static function get activitySceneId() : int
		{
			return _activitySceneId;
		}

		public static function get monsterKilledById() : Dictionary
		{
			return _monsterKilledById;
		}

		public static function get currStageEndTime() : Number
		{
			return _currStageEndTime;
		}

		public static function get nextLevelTime() : Number
		{
			return _nextLevelTime;
		}

		public static function get dungeonEndTime() : Number
		{
			return _dungeonEndTime;
		}

		public static function get currStage() : int
		{
			return _currStage;
		}

		public static function get currStageData() : TaoNiStageProto
		{
			return CountryTaoNiCfgData.getTaoNiStageProto(_currStage);
		}

		public static function get currStageMonsterCountById() : Dictionary
		{
			return CountryTaoNiCfgData.getMonsterCountById(_currStage);
		}

		private static function clearMonsterKilled() : void
		{
			for (var id : Object in _monsterKilledById)
			{
				_monsterKilledById[id] = null;
				delete _monsterKilledById[id];
			}
		}

		public static function setDungeonData(buffer : ByteBuffer) : void
		{
			_dungeonEndTime = buffer.readVarint64();
			_currStageEndTime = buffer.readVarint64();
			_currStage = buffer.readVarint32();
			_currLevel = buffer.readVarint32();
			_nextLevelTime = buffer.readVarint64();

			clearMonsterKilled();
			while (buffer.bytesAvailable)
			{
				var monsterId : int = buffer.readVarint32();
				var monsterCount : int = buffer.readVarint32();
				_monsterKilledById[monsterId] = monsterCount;
			}

			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_STAGE_CHANGE);
			NoticeManager.showNotify(LangTaoNi.TAO_NI_ENTER_DUNGEON);

			TweenLite.killDelayedCallsTo(showDaoJiShiEffect);
			var currTime : Number = SystemTimeManager.curtTm;
			var nextTime : int = 0;
			if (_currStage == 1)
			{
				if (_currLevel == 0)
				{
					nextTime = (_nextLevelTime - currTime) * 0.001;
				}
			}
			else if (_currStage < CountryTaoNiCfgData.maxStage)
			{
				nextTime = (_currStageEndTime - currTime) * 0.001;
			}

			if (nextTime > 0)
			{
				var delaySecond : int = nextTime - 10;
				if (delaySecond < 0 && delaySecond > -10)
				{
					showDaoJiShiEffect(-delaySecond);
				}
				else if (delaySecond > 0)
				{
					TweenLite.delayedCall(delaySecond, showDaoJiShiEffect);
				}
			}
		}

		public static function setStatus(buffer : ByteBuffer) : void
		{
			_activityOpenTime = buffer.readVarint64();
			_activitySceneId = buffer.readVarint32();
			var npcCount : int = buffer.readVarint32();
			var enteredNpcCount : int = buffer.readVarint32();
			_surplusNpcCount = buffer.readVarint32();
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_STATUS_CHANGE);
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, ActivityType.TAO_NI, _activityOpenTime);
		}

		public static function startDungeon() : void
		{
			NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_START_INFO);
		}

		public static function endDungeon() : void
		{
			_activityOpenTime = 0;
			_activitySceneId = 0;
			_surplusNpcCount = 0;
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_STATUS_CHANGE);
			EventManager.dispatchEvent(ActivityEvent.CLOSE_ACTIVITY, ActivityType.TAO_NI);
			NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_END_INFO);
		}

		public static function stageChanged(buffer : ByteBuffer) : void
		{
			_currStage = buffer.readVarint32();
			_currStageEndTime = buffer.readVarint64();
			_currLevel = 0;
			_nextLevelTime = buffer.readVarint64();
			clearMonsterKilled();
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_STAGE_CHANGE);
			NoticeManager.showNotify(LangTaoNi.TAO_NI_ENTER_NEW_STAGE);

			TweenLite.killDelayedCallsTo(showDaoJiShiEffect);
			var currTime : Number = SystemTimeManager.curtTm;
			var nextTime : int = 0;
			if (_currStage < CountryTaoNiCfgData.maxStage)
			{
				nextTime = (_currStageEndTime - currTime) * 0.001;
			}

			if (nextTime > 0)
			{
				var delaySecond : int = nextTime - 10;
				if (delaySecond < 0 && delaySecond > -10)
				{
					showDaoJiShiEffect(-delaySecond);
				}
				else if (delaySecond > 0)
				{
					TweenLite.delayedCall(delaySecond, showDaoJiShiEffect);
				}
			}
		}

		public static function newWave(buffer : ByteBuffer) : void
		{
			_currLevel = buffer.readVarint32();
			_nextLevelTime = buffer.readVarint64();
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_STAGE_CHANGE);
			NoticeManager.showNotify(LangTaoNi.TAO_NI_ENTER_NEW_WAVE);
		}

		public static function killMonsterChanged(buffer : ByteBuffer) : void
		{
			var monsterConfigId : int = buffer.readVarint32();
			var killCount : int = buffer.readVarint32();
			_monsterKilledById[monsterConfigId] = killCount;
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_MONSTER_KILL_CHANGE);
		}

		public static function enterTaoNi(npcId : Number, dialogIndex : int) : void
		{
			if (TeamManager.isHaveTeam())
			{
				if (TeamManager.isTeamLeader(MainRoleManager.actorID))
				{
					doEnterTaoNi(npcId, dialogIndex);
				}
				else
				{
					NoticeManager.showNotify(LangTaoNi.TAO_NI_ENTER_SCENE_NOT_IS_TEAM_LEADER);
				}
			}
			else
			{
				var gameAlert : AlertSetInfo = new AlertSetInfo(LangTaoNi.TAO_NI_ENTER_SCENE_ALERT_INFO);
				GameAlert.showAlert(gameAlert, onAlertEnterTaoNi, npcId, dialogIndex);
			}
		}

		private static function onAlertEnterTaoNi(gameAlert : GameAlert, npcId : Number, dialogIndex : int) : void
		{
			if (gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				doEnterTaoNi(npcId, dialogIndex);
			}
		}

		private static function doEnterTaoNi(npcId : Number, dialogIndex : int) : void
		{
			NpcSender.clickNpc(npcId, dialogIndex);
		}

		public static function walkToActivityScene() : void
		{
			var currentScene : SceneData = MapDataManager.currentScene;
			if (_activitySceneId > 0 && currentScene && currentScene.isNormalScene)
			{
				MainRoleSearchPathManager.gotoTargetData.setData(_activitySceneId);
				MainRoleSearchPathManager.walkToScene(_activitySceneId);
			}
		}
	}
}
