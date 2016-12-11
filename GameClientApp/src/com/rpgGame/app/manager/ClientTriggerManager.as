package com.rpgGame.app.manager
{
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.StoryDungeonSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.cfg.ClientDialogCfgData;
	import com.rpgGame.coreData.cfg.ClientSceneEffectCfgData;
	import com.rpgGame.coreData.cfg.ClientTriggerCfgData;
	import com.rpgGame.coreData.cfg.collect.CollectCfgData;
	import com.rpgGame.coreData.clientConfig.ClientDialog;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	import com.rpgGame.coreData.clientConfig.ClientTrigger;
	import com.rpgGame.coreData.enum.EnumClientTriggerType;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.info.task.target.TaskAreaExplorationInfo;
	import com.rpgGame.coreData.lang.LangStoryDungeon;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.TaskTargetType;
	
	import flash.utils.Dictionary;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 客户端触发管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-12 上午10:26:37
	 *
	 */
	public class ClientTriggerManager
	{
		private static var _createEffectTrigger : ClientTrigger = null;
		private static var _createCollectTrigger : ClientTrigger = null;
		private static var _gatherGoodsTrigger : ClientTrigger = null;
		private static var _plotDialogTrigger : ClientTrigger = null;
		private static var _killStatistic : Dictionary = null;
		private static var _isTrigging : Dictionary = null;

		public function ClientTriggerManager()
		{
		}

		public static function setup() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}

		public static function sceneClear() : void
		{
			_isTrigging = new Dictionary(true);
			_killStatistic = new Dictionary(true);
			removePlotDialog();
		}

		private static function onSwitchCmp() : void
		{
//			if (CountryManager.isAtMyCountry())
//			{
//				triggerCreateSceneEffect(_createEffectTrigger);
//				triggerCreateSceneCollect(_createCollectTrigger);
//				triggerPlotDialog(_plotDialogTrigger);
//			}
		}

		public static function triggerById(triggerId : int, roleId : Number = 0) : Boolean
		{
			if (_isTrigging[triggerId])
			{
				return false;
			}
			var triggerData : ClientTrigger = ClientTriggerCfgData.getData(triggerId);
			if (triggerData)
			{
				_isTrigging[triggerId] = true;

				var sceneData : SceneData = MapDataManager.currentScene;
				if (sceneData.isStoryDungeonScene)
				{
					if (triggerData.serverTriggerId > 0)
					{
						StoryDungeonSender.runEvent(triggerData.serverTriggerId);
					}
				}

				switch (triggerData.triggerType)
				{
					case EnumClientTriggerType.SCENE_BORN_EFFECT: //触发生成场景特效 
						triggerCreateSceneEffect(triggerData);
						break;
					case EnumClientTriggerType.PLOT_DIALOG: //触发剧情对话 
						triggerPlotDialog(triggerData);
						break;
					case EnumClientTriggerType.ADD_NPC: //触发添加NPC 
						triggerAddNpc(triggerData);
						break;
					case EnumClientTriggerType.REMOVE_NPC: //触发移除NPC 
						triggerRemoveNpc(triggerData);
						break;
					case EnumClientTriggerType.SCENE_BORN_COLLECT: //触发生成场景采集物 
						triggerCreateSceneCollect(triggerData);
						break;
					case EnumClientTriggerType.BUBBLE_DIALOG: //冒泡对话 
						triggerBubbleDialog(triggerData, roleId);
						break;
				}

				if (triggerData.chainTriggerId > 0)
				{
					if (triggerData.chainTriggerDelay > 0)
					{
						TweenLite.delayedCall(triggerData.chainTriggerDelay * 0.001, triggerById, [triggerData.chainTriggerId]);
					}
					else
					{
						triggerById(triggerData.chainTriggerId);
					}
				}
			}
			return true;
		}

		public static function taskTrigger(targetInfo : BaseTaskTargetInfo) : void
		{
			if (targetInfo && targetInfo.triggerId > 0)
			{
				var isTrigger : Boolean = triggerById(targetInfo.triggerId);
				if (isTrigger)
				{
					var triggerData : ClientTrigger = ClientTriggerCfgData.getData(targetInfo.triggerId);
					if (triggerData)
					{
						switch (targetInfo.type)
						{
							case TaskTargetType.TASK_TARGET_GATHER: //采集任务
								if (triggerData.triggerType == EnumClientTriggerType.TARGET_ADD_EFFECT) //触发目标添加特效
								{
									_gatherGoodsTrigger = triggerData;
									var collects : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.COLLECT);
									for each (var role : SceneRole in collects)
									{
										addTriggerCollectEffect(role);
									}
								}
								break;
							case TaskTargetType.TASK_AREA_EXPLORATION: //区域探索
								var explorationInfo : TaskAreaExplorationInfo = targetInfo as TaskAreaExplorationInfo;
								break;
						}
					}
				}
			}
		}

		/**
		 * 死亡触发
		 * @param target
		 *
		 */
		public static function deathTrigger(target : SceneRole) : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (sceneData.isStoryDungeonScene)
			{
				var currMapId : int = MainRoleManager.actorInfo.mapID;
				if (target && target.usable)
				{
					var data : RoleData = target.data as RoleData;
					if (data)
					{
						if (target.type == SceneCharType.MONSTER)
						{
							var triggerList : Vector.<ClientTrigger> = ClientTriggerCfgData.getSceneTriggerList(currMapId);
							for each (var trigger : ClientTrigger in triggerList)
							{
								if (trigger.targetType == EnumClientTriggerType.KILL_STATISTIC && trigger.targetType == data.type)
								{
									var killCount : Object = _killStatistic[trigger.targetType];
									if (killCount == null)
									{
										killCount = _killStatistic[trigger.targetType] = 0;
									}
									killCount += 1;
									_killStatistic[trigger.targetType] = killCount;
									if (killCount >= trigger.killedCount)
									{
										NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_KILL_STATISTIC_MONSTER, MainRoleManager.actorInfo.name, killCount, data.name);

										_killStatistic[trigger.targetType] = null;
										delete _killStatistic[trigger.targetType];
									}
									break;
								}
							}

							if ((data is MonsterData) && (data as MonsterData).isBoss)
							{
								NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_KILL_STATISTIC_BOSS, MainRoleManager.actorInfo.name, data.name);
							}
						}
						else if (target.type == SceneCharType.PROTECT_NPC)
						{
							var curHP : Number = (target.data as RoleData).totalStat.hp;
							var maxHP : Number = (target.data as RoleData).totalStat.life;
							var rate : Number = curHP / maxHP;
							if (rate <= 0.5)
							{
								NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_PROTECT_NPC_LIFE, data.name);
							}
						}
					}
				}
			}
		}

		private static function createSceneEffect(effectData : ClientSceneEffect) : void
		{
			var bornPosArr : Array = effectData.bornPos.split(";");
			var len : int = bornPosArr.length;
			for (var i : int = 0; i < len; i++)
			{
				var xyArr : Array = String(bornPosArr[i]).split("=");
				var x : int = xyArr[0];
				var y : int = xyArr[1];
				SceneRoleManager.getInstance().createSceneEffect(effectData, i + 1, SceneCharType.SCENE_EFFECT + "_" + effectData.id, x, y);
			}
		}

		public static function addTriggerCollectEffect(role : SceneRole) : void
		{
			if (!_gatherGoodsTrigger)
				return;
			var currMapId : int = MainRoleManager.actorInfo.mapID;
			if (_gatherGoodsTrigger.sceneId == currMapId)
			{
				var data : SceneCollectData = role.data as SceneCollectData;
				if (data.collectType == _gatherGoodsTrigger.targetType)
				{
					SpellAnimationHelper.addTargetEffect(role, RenderUnitID.TARGET_EFFECT, RenderUnitType.TARGET_EFFECT, _gatherGoodsTrigger.targetAddEffectRes, null, 0, null, false);
				}
			}
		}

		private static function triggerCreateSceneEffect(triggerData : ClientTrigger) : void
		{
			_createEffectTrigger = triggerData;
			if (_createEffectTrigger)
			{
				var currMapId : int = MainRoleManager.actorInfo.mapID;
				if (_createEffectTrigger.sceneId == currMapId)
				{
					var sceneEffectIds : Array = _createEffectTrigger.sceneEffectIds.split(";");
					for each (var sceneEffectId : String in sceneEffectIds)
					{
						var effectData : ClientSceneEffect = ClientSceneEffectCfgData.getData(int(sceneEffectId));
						if (effectData && effectData.sceneID == currMapId)
						{
							createSceneEffect(effectData);
						}
					}
				}
			}
		}

		private static function triggerCreateSceneCollect(triggerData : ClientTrigger) : void
		{
			_createCollectTrigger = triggerData;
			if (_createCollectTrigger)
			{
				var currMapId : int = MainRoleManager.actorInfo.mapID;
				if (_createCollectTrigger.sceneId == currMapId)
				{
					var collectList : Vector.<CollectObjcetInfo> = CollectCfgData.getListBySceneID(currMapId);
					for each (var info : CollectObjcetInfo in collectList)
					{
						if (info.isDynamicCreate && info.type == _createCollectTrigger.targetType)
						{
							var collectData : SceneCollectData = new SceneCollectData();
							collectData.setInfoData(info);
							SceneRoleManager.getInstance().createCollect(collectData);
						}
					}
				}
			}
		}

		private static function triggerBubbleDialog(triggerData : ClientTrigger, roleId : Number) : void
		{
			if (!triggerData)
			{
				return;
			}
			_isTrigging[triggerData.id] = null;
			delete _isTrigging[triggerData.id];

			var clientDialog : ClientDialog = triggerData.dialogId > 0 ? ClientDialogCfgData.getData(triggerData.dialogId) : null;
			if (clientDialog)
			{
				var sceneRole : SceneRole = SceneManager.getSceneObjByID(roleId) as SceneRole;
				if (sceneRole)
				{
					if (sceneRole.headFace is HeadFace)
					{
						var contents : Array = clientDialog.content.split("|");
						if (clientDialog.contentWeight)
						{
							var contentWeights : Array = clientDialog.contentWeight.split("|");
							var randomKey : int = Math.random() * 100;
							var len : int = contents.length;
							var weight : int = 0;
							var index : int = -1;
							for (var i : int = 0; i < len; i++)
							{
								var tempWeight : int = int(contentWeights[i]);
								if (tempWeight > randomKey && tempWeight > weight)
								{
									index = i;
									weight = tempWeight;
								}
							}
							if (index > -1)
							{
								(sceneRole.headFace as HeadFace).addWordFrame(contents[index], clientDialog.duration);
							}
						}
						else
						{
							(sceneRole.headFace as HeadFace).addWordFrame(contents[0], clientDialog.duration);
						}
					}
				}
			}
		}

		private static function triggerPlotDialog(triggerData : ClientTrigger) : void
		{
			_plotDialogTrigger = triggerData;
			if (_plotDialogTrigger)
			{
				var currMapId : int = MainRoleManager.actorInfo.mapID;
				if (_plotDialogTrigger.sceneId == currMapId)
				{
					var sceneData : SceneData = MapDataManager.currentScene;
					if (sceneData.isStoryDungeonScene)
					{
						StoryDungeonSender.frozenDungeon(true);
					}
					playDialog(_plotDialogTrigger.dialogId);
				}
			}
		}

		private static function playDialog(dialogId : int) : void
		{
			TweenLite.killDelayedCallsTo(playDialog);
			var clientDialog : ClientDialog = dialogId > 0 ? ClientDialogCfgData.getData(dialogId) : null;
			if (clientDialog)
			{
				if (clientDialog.isBubble)
				{
					AppManager.hideApp(AppConstant.NPC_PLOT_DIALOG_PANEL);
					var sceneRole : SceneRole;
					if (clientDialog.npcModelId > 0)
					{
						var sceneRoles : Vector.<SceneRole> = SceneManager.getSceneRolesByModelId(clientDialog.npcModelId);
						for each (sceneRole in sceneRoles)
						{
							if (sceneRole.headFace is HeadFace)
								(sceneRole.headFace as HeadFace).addWordFrame(clientDialog.content, clientDialog.duration);
						}
					}
					else
					{
						sceneRole = MainRoleManager.actor;
						if (sceneRole.headFace is HeadFace)
							(sceneRole.headFace as HeadFace).addWordFrame(clientDialog.content, clientDialog.duration);
					}
				}
				else
				{
					AppManager.showAppNoHide(AppConstant.NPC_PLOT_DIALOG_PANEL, clientDialog);
				}
				TweenLite.delayedCall(clientDialog.duration * 0.001, onPlayDialogComplete, [clientDialog]);
			}
			else
			{
				var nextTriggerId : int = _plotDialogTrigger ? _plotDialogTrigger.nextTriggerId : 0;
				var nextTriggerDelay : int = _plotDialogTrigger ? _plotDialogTrigger.nextTriggerDelay : 0;
				removePlotDialog();
				if (nextTriggerId > 0)
				{
					if (nextTriggerDelay > 0)
					{
						TweenLite.delayedCall(nextTriggerDelay * 0.001, triggerById, [nextTriggerId]);
					}
					else
					{
						triggerById(nextTriggerId);
					}
				}
			}
		}

		private static function onPlayDialogComplete(clientDialog : ClientDialog) : void
		{
			_isTrigging[clientDialog.id] = null;
			delete _isTrigging[clientDialog.id];
			playDialog(clientDialog.nextDialog);
		}

		private static function removePlotDialog() : void
		{
			if (_plotDialogTrigger)
			{
				TweenLite.killDelayedCallsTo(playDialog);
				AppManager.hideApp(AppConstant.NPC_PLOT_DIALOG_PANEL);
				var sceneData : SceneData = MapDataManager.currentScene;
				if (sceneData.isStoryDungeonScene)
				{
					StoryDungeonSender.frozenDungeon(false);
				}
				_isTrigging[_plotDialogTrigger.id] = null;
				delete _isTrigging[_plotDialogTrigger.id];
				_plotDialogTrigger = null;
			}
		}

		private static function triggerAddNpc(triggerData : ClientTrigger) : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (sceneData.isStoryDungeonScene)
			{
				NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_NEXT_MONSTER_ENTER);
			}
		}

		private static function triggerRemoveNpc(triggerData : ClientTrigger) : void
		{
			var roleIds : Array = [];
			var roles : Vector.<SceneRole> = SceneManager.getSceneRolesByModelId(triggerData.targetType);
			for each (var role : SceneRole in roles)
			{
				roleIds.push(role.id);
			}
			StoryDungeonSender.removeMonsterObjEvent(triggerData.id, roleIds);
		}

		/**
		 * 清理任务触发
		 *
		 */
		public static function clearTaskTrigger() : void
		{
			var currMapId : int = MainRoleManager.actorInfo.mapID;
			if (_createEffectTrigger)
			{
				if (_createEffectTrigger.sceneId == currMapId)
				{
					var sceneEffectIds : Array = _createEffectTrigger.sceneEffectIds.split(";");
					for each (var sceneEffectId : String in sceneEffectIds)
					{
						var effectData : ClientSceneEffect = ClientSceneEffectCfgData.getData(int(sceneEffectId));
						if (effectData)
						{
							SceneManager.getScene().removeSceneObjByType(SceneCharType.SCENE_EFFECT + "_" + effectData.id);
						}
					}
				}
				_isTrigging[_createEffectTrigger.id] = null;
				delete _isTrigging[_createEffectTrigger.id];
				_createEffectTrigger = null;
			}
			if (_createCollectTrigger)
			{
				if (_createCollectTrigger.sceneId == currMapId)
				{
					var sceneCollects : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.COLLECT);
					for each (var sceneCollect : SceneRole in sceneCollects)
					{
						var sceneCollectData : SceneCollectData = sceneCollect.data as SceneCollectData;
						if (sceneCollectData.collectType == _createCollectTrigger.targetType)
						{
							SceneManager.getScene().removeSceneObj(sceneCollect);
						}
					}
				}
				_isTrigging[_createCollectTrigger.id] = null;
				delete _isTrigging[_createCollectTrigger.id];
				_createCollectTrigger = null;
			}

			if (_gatherGoodsTrigger)
			{
				if (_gatherGoodsTrigger.sceneId == currMapId)
				{
					var gatherCollects : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.COLLECT);
					for each (var gatherCollect : SceneRole in gatherCollects)
					{
						var gatherCollectData : SceneCollectData = gatherCollect.data as SceneCollectData;
						if (gatherCollectData.collectType == _gatherGoodsTrigger.targetType)
						{
							gatherCollect.avatar.removeRenderUnitsByType(RenderUnitType.TARGET_EFFECT);
						}
					}
				}
				_isTrigging[_gatherGoodsTrigger.id] = null;
				delete _isTrigging[_gatherGoodsTrigger.id];
				_gatherGoodsTrigger = null;
			}

			if (_plotDialogTrigger)
			{
				if (_plotDialogTrigger.sceneId == currMapId)
				{
					removePlotDialog();
				}
			}
		}
	}
}
