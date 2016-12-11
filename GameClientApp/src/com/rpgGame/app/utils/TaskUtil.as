package com.rpgGame.app.utils
{
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.AreaMapData;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.collect.CollectCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.info.task.target.TaskAreaExplorationInfo;
	import com.rpgGame.coreData.info.task.target.TaskClientTaskInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.info.task.target.TaskStoryDungeonInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetGatherGoodsInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetMonsterGoodsInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetMonsterInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetReplyInfo;
	import com.rpgGame.coreData.info.task.target.TaskTargetUpgradeInfo;
	import com.rpgGame.coreData.info.task.target.TaskVehiclePlayerInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.ClientTaskType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.TaskTargetType;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto;

	/**
	 * 任务
	 * @author luguozheng
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class TaskUtil
	{

		/**
		 * 根据任务类型，获取描述字段			这个方法没做完，还要完善
		 * @param _targetInfo
		 * @param progressNum
		 * @return
		 *
		 */
		public static function progressUpdatedHandler(type : int, _targetInfo : BaseTaskTargetInfo, progressNum : int, taskId : int, isFlyBtn : Boolean, targetIndex : int = 0) : String
		{
			if (_targetInfo == null)
				return "";

			var info : String = "";
			var prefix : String = "";
			var content : String = "";
			var suffix : String = "";
			var centerInfo : String;
			var scenePos : String;
			var npcData : Q_monster;
			switch (_targetInfo.type)
			{
				case TaskTargetType.TASK_TARGET_LEVEL_UP:
					var upgradeInfo : TaskTargetUpgradeInfo = _targetInfo as TaskTargetUpgradeInfo;
					content = LanguageConfig.replaceStr("升级推荐:$", [upgradeInfo.upgradeLvl]);

					var index : int = Math.floor(upgradeInfo.upgradeRecommendMonsterIDArr.length * Math.random());
					var monsterInfo : String = LanguageConfig.replaceStr("<br/>推荐打怪:$", [RichTextCustomUtil.getTextLinkCode(MonsterDataManager.getMonsterName(upgradeInfo.upgradeRecommendMonsterIDArr[index]), StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_KILL_MONSTER_TYPE, upgradeInfo.upgradeRecommendMonsterIDArr[index] + "")]);

					content += monsterInfo;
					break;

				case TaskTargetType.TASK_TARGET_REPLY_NPC:
					var replyInfo : TaskTargetReplyInfo = _targetInfo as TaskTargetReplyInfo;

					npcData = MonsterDataManager.getData(replyInfo.npcId);
					content = LanguageConfig.replaceStr("任务回复:$", [RichTextCustomUtil.getTextLinkCode(npcData ? npcData.q_name : "未知", StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_NPC_NAME_TYPE, replyInfo.npcId + "")]);

					break;

				case TaskTargetType.TASK_TARGET_KILL_MONSTER:
					var monsterTargetInfo : TaskTargetMonsterInfo = _targetInfo as TaskTargetMonsterInfo;
					content = RichTextCustomUtil.getTextLinkCode(MonsterDataManager.getMonsterName(monsterTargetInfo.killMonsterId) + getProgress(progressNum, monsterTargetInfo.killMonsterCount), StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_KILL_MONSTER_TYPE, monsterTargetInfo.killMonsterId + "");
					content = LanguageConfig.replaceStr("击败:$", [content]);
					break;

				case TaskTargetType.TASK_TARGET_KILL_MONSTER_AND_COLLECT:
					var monsterCollectTargetInfo : TaskTargetMonsterGoodsInfo = _targetInfo as TaskTargetMonsterGoodsInfo;
					content = RichTextCustomUtil.getTextLinkCode(MonsterDataManager.getMonsterName(monsterCollectTargetInfo.dropGoodsMonsterId), StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_COLLECT_KILL_MONSTER_TYPE, monsterCollectTargetInfo.dropGoodsMonsterId + "");
					content = LanguageConfig.replaceStr("击败 $ 收集:$", [content, monsterCollectTargetInfo.dropGoodsName + getProgress(progressNum, monsterCollectTargetInfo.dropGoodsCount)]);
					break;

				case TaskTargetType.TASK_TARGET_GATHER:
					var gatherTargetInfo : TaskTargetGatherGoodsInfo = _targetInfo as TaskTargetGatherGoodsInfo;
					var collectInfo : CollectObjcetInfo = CollectCfgData.getRandomColloct(gatherTargetInfo.collectGoodsType);
					content = collectInfo.name + getProgress(progressNum, gatherTargetInfo.collectGoodsCount);
					content = RichTextCustomUtil.getTextLinkCode(content, StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_COLLECT_TYPE, taskId + "," + collectInfo.objectID + "," + gatherTargetInfo.collectGoodsType + "," + collectInfo.sceneID + "," + collectInfo.tileX + "," + collectInfo.tileY);
					content = LanguageConfig.replaceStr("采集:$", [content]);
					break;

				case TaskTargetType.TASK_FOLLOW_ESCORT:
					var escortInfo : TaskFollowEscortInfo = _targetInfo as TaskFollowEscortInfo;
					if (escortInfo.roleId > 0)
					{
						centerInfo = escortInfo.targetArea.centerX + "=" + escortInfo.targetArea.centerY;
						scenePos = RichTextCustomUtil.getTextLinkCode(escortInfo.targetArea.areaName, StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_SCENE_POS_TYPE, escortInfo.targetArea.sceneId + "," + centerInfo);
						content = "护送" + RichTextCustomUtil.getTextLinkCode(NpcCfgData.getNpcName(escortInfo.npcId), StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_FOLLOW_ESCORT_TYPE, escortInfo.npcId + "") + "到" + scenePos;
						isFlyBtn = false;
					}
					else
					{
						content = "与" + RichTextCustomUtil.getTextLinkCode(NpcCfgData.getNpcName(escortInfo.npcId), StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_NPC_DIAILOG_TYPE, escortInfo.npcId + "") + "对话，开始护送";
					}
					break;
				case TaskTargetType.TASK_AREA_EXPLORATION:
					var explorationInfo : TaskAreaExplorationInfo = _targetInfo as TaskAreaExplorationInfo;
					centerInfo = explorationInfo.targetArea.centerX + "=" + explorationInfo.targetArea.centerY;
					scenePos = RichTextCustomUtil.getTextLinkCode(explorationInfo.targetArea.areaName, StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_SCENE_POS_TYPE, explorationInfo.targetArea.sceneId + "," + centerInfo);
					content = scenePos; //"探索"
					isFlyBtn = false;
					break;
				case TaskTargetType.TASK_VEHICLE_PLAYER:
					var vehiclePlayerInfo : TaskVehiclePlayerInfo = _targetInfo as TaskVehiclePlayerInfo;
					npcData = MonsterDataManager.getData(vehiclePlayerInfo.npcId);
					content = LanguageConfig.replaceStr("找到$搭乘载具", [RichTextCustomUtil.getTextLinkCode(npcData ? npcData.q_name : "未知", StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_NPC_DIAILOG_TYPE, vehiclePlayerInfo.npcId + "")]);
					break;
				case TaskTargetType.TASK_FINISH_STORY_DUNGEON:
					var storyDungeonInfo : TaskStoryDungeonInfo = _targetInfo as TaskStoryDungeonInfo;
					npcData = MonsterDataManager.getData(storyDungeonInfo.npcId);
					content = LanguageConfig.replaceStr("找到$通关副本", [RichTextCustomUtil.getTextLinkCode(npcData ? npcData.q_name : "未知", StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_NPC_DIAILOG_TYPE, storyDungeonInfo.npcId + "")]);
					break;
				case TaskTargetType.TASK_CLIENT_TASK:
					var clientTaskInfo : TaskClientTaskInfo = _targetInfo as TaskClientTaskInfo;
					npcData = MonsterDataManager.getData(clientTaskInfo.npcId);
					switch (clientTaskInfo.clientTaskType)
					{
						case ClientTaskType.TASK_DIALOG_LEAVE_DUNGEON: //与$对话离开副本
							content = LanguageConfig.replaceStr("与$对话离开副本", [RichTextCustomUtil.getTextLinkCode(npcData ? npcData.q_name : "未知", StaticValue.COLOR_CODE_16, RichTextCustomLinkType.TASK_TO_NPC_DIAILOG_TYPE, clientTaskInfo.npcId + "")]);
							break;
					}
					break;

//				case TaskType.TASK_TARGET_DEDUCT_BACKPACK_GOODS:
//					var goodsTargetInfo:TaskTargetBagGoodsInfo = _targetInfo as TaskTargetBagGoodsInfo;
//					prefix = "需要物品:";
//					content = ItemCfgData.getItemName(goodsTargetInfo.depotGoodsId);
//					suffix = "(" + progressNum + "/" + goodsTargetInfo.depotGoodsCount + ")";
//					break;
//				case TaskType.TASK_TARGET_DUNGEON:
//					var dungeonTargetInfo:TaskTargetDungeonInfo = _targetInfo as TaskTargetDungeonInfo;
//					prefix = "进入副本:";
//					content = MapDataManager.getMapName(dungeonTargetInfo.dungeonID);
//					break;
//				case TaskType.TASK_TARGET_LAYER_STORY:
//					var layerStoryTargetInfo:TaskTargetLayerStory = _targetInfo as TaskTargetLayerStory;
//					prefix = "探索:";
//					content = layerStoryTargetInfo.content || MapDataManager.getMapName(layerStoryTargetInfo.sceneId);
//					break;
//				case TaskType.TASK_TARGET_FINISH_DUNGEON:
//					var finishDungeonTargetInfo:TaskTargetFinishDungeonInfo = _targetInfo as TaskTargetFinishDungeonInfo;
//					prefix = "通过副本:"
//					content = MapDataManager.getMapName(finishDungeonTargetInfo.finishDungeon);
//					suffix = "(" + progressNum + "/" + finishDungeonTargetInfo.finishTimes + ")";
//					isFlyBtn = false;
//					break;
//				case TaskType.TASK_TARGET_GU_JIAN_SHENG_JIE:
//					var guJianShengJieTargetInfo:TaskTargetGuJianShengJieInfo = _targetInfo as TaskTargetGuJianShengJieInfo;
//					content = "查看缺少的装备";
//					isFlyBtn = false;
//					break;
			}

			info = prefix + content + suffix;
			if (isFlyBtn)
			{
				info += RichTextCustomUtil.getImageLinkCode(AssetUrl.POSITION_FLY_TYPE_ICORES, RichTextCustomLinkType.TASK_FLY_TYPE, targetIndex + "," + type); //添加传送图标
			}

			return info;
		}

		public static function showProgressTip(_targetInfo : BaseTaskTargetInfo, progressNum : int) : String
		{
			if (_targetInfo == null)
				return "";

			var content : String = "";
			switch (_targetInfo.type)
			{
				//杀怪数量进度
				case TaskTargetType.TASK_TARGET_KILL_MONSTER:
					var monsterTargetInfo : TaskTargetMonsterInfo = _targetInfo as TaskTargetMonsterInfo;
					content = MonsterDataManager.getMonsterName(monsterTargetInfo.killMonsterId) + getProgress(progressNum, monsterTargetInfo.killMonsterCount);
					break;

				//杀死怪采集xxx进度
				case TaskTargetType.TASK_TARGET_KILL_MONSTER_AND_COLLECT:
					var monsterCollectTargetInfo : TaskTargetMonsterGoodsInfo = _targetInfo as TaskTargetMonsterGoodsInfo;
					content = monsterCollectTargetInfo.dropGoodsName + getProgress(progressNum, monsterCollectTargetInfo.dropGoodsCount);
					break;
				//采集数量进度
				case TaskTargetType.TASK_TARGET_GATHER:
					var gatherTargetInfo : TaskTargetGatherGoodsInfo = _targetInfo as TaskTargetGatherGoodsInfo;
					var collectInfo : CollectObjcetInfo = CollectCfgData.getRandomColloct(gatherTargetInfo.collectGoodsType);
					content = collectInfo.name + getProgress(progressNum, gatherTargetInfo.collectGoodsCount);
					break;
			}

			if (content)
				NoticeManager.showNotify(content);
			return content;
		}


		/**
		 *
		 * @param curProgress		小于0 当它完成
		 * @param allProgress
		 * @return
		 *
		 */
		private static function getProgress(curProgress : int, allProgress : int) : String
		{
			if (curProgress < 0)
			{
//				curProgress = allProgress;
				return "×" + allProgress;
			}
			return "（" + curProgress + "/" + allProgress + "）"
		}


		//------------------------------------------
		/**
		 * 回复任务
		 * @param npcId
		 *
		 */
		public static function replyNpcTask(npcId : int) : void
		{
			var npcData : Q_scene_monster_area = MonsterDataManager.getSceneData(npcId);
			if (npcData)
			{
				var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(npcId);
//			if( TouJingCfgData != null )
//			{
//				var toujingNpcId:int = TouJingCfgData.acceptNpcID;
//			}
				var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
				var searchRoleData : SearchRoleData = new SearchRoleData();
				searchRoleData.searchId = npcId;
				searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
				MainRoleSearchPathManager.walkToScene(npcData.q_mapid, pos.x, pos.y, function openPanel() : void
				{
					var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
					var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
					SceneRoleSelectManager.selectedRole = role;
					TaskManager.checkDialogToNpc(targerId);
				}, 200, searchRoleData);
			}
		}


		/**
		 * 杀怪任务
		 * 杀怪掉落任务
		 * @param monsterid
		 *
		 */
		public static function killMonsterTask(monsterId : int) : void
		{
			var monsterDataProto : Q_scene_monster_area = MonsterDataManager.getSceneData(monsterId);
			var monsterPos : Point = MonsterDataManager.getMonsterPosition(monsterDataProto);
			//这里应该是寻路过去然后杀怪
			MainRoleSearchPathManager.walkToScene(monsterDataProto.q_mapid, monsterPos.x, monsterPos.y, function KillMonseter() : void
			{
				NoticeManager.showNotify("可以开始自己打怪了");
			}, 200);
		}

		/**
		 * 采集
		 * @param taskId
		 * @param objectID
		 * @param sceneID
		 * @param posx
		 * @param posy
		 *
		 */
		public static function collectItemTask(taskId : int, objectID : int, collectGoodsType : int, sceneID : int, posx : int, posy : int) : void
		{
			MainRoleSearchPathManager.walkToScene(sceneID, posx, posy, null, 200);
		}

		/** 小腾翔卷轴功能,直接飞到某个地图某个地点
		 *
		 *
		 *  */
		public static function flyToPos(taskType : int, targetIndex : int = 0, isDazuo : int = 0, chanceTaskid : int = -1, callback : Function = null) : void
		{
			taskType = (isDazuo << 6) | (targetIndex << 3) | taskType;

			if (taskType != TaskTargetType.TASK_TYPE_FLY_CHANCE)
			{
				targetIndex = -1;
			}

			TaskSender.reqTaskTransport(taskType, chanceTaskid, false, null);
		}

		/**
		 * 跟随护送任务
		 * @param data
		 *
		 */
		public static function followEscortTask(npcId : int) : void
		{
			var escortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
			if (escortInfo)
			{
				var posX : Number;
				var posY : Number;
				var sceneRole : SceneRole = null;
				if (escortInfo.roleId > 0)
				{
					sceneRole = SceneManager.getSceneObjByID(escortInfo.roleId) as SceneRole;
				}
				else
				{
					sceneRole = SceneManager.getSceneNpcByModelId(npcId);
				}

				if (sceneRole)
				{
					posX = sceneRole.x;
					posY = sceneRole.z;
				}
				else
				{
					posX = escortInfo.rolePosX;
					posY = escortInfo.rolePosY;
				}
				var sceneId : int = MainRoleManager.actorInfo.mapID;
				var searchRoleData : SearchRoleData = new SearchRoleData();
				searchRoleData.searchId = npcId;
				searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
				MainRoleSearchPathManager.walkToScene(sceneId, posX, posY, function openPanel() : void
				{
					var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
					var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
					if (role)
					{
						SceneRoleSelectManager.selectedRole = role;
						var actor : SceneRole = MainRoleManager.actor;
						var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
						var npcData : MonsterData = role.data as MonsterData;
						var farDistance : int = npcData.farDistance;
						if (dist < farDistance * farDistance)
						{
							TaskManager.checkDialogToNpc(targerId);
						}
					}
				}, 200, searchRoleData);
			}
		}

		/**
		 * 到场景位置
		 * @param data
		 *
		 */
		public static function toScenePosTask(data : String) : void
		{
			var scenePosArr : Array = data.split(",");
			var sceneId : int = scenePosArr[0];
			var posArr : Array = String(scenePosArr[1]).split("=");
			var x : int = posArr[0];
			var y : int = posArr[1];
			MainRoleSearchPathManager.walkToScene(sceneId, x, y);
		}

		public static function tryCompleteSentTask() : void
		{
			if (!TaskManager.currentMainTaskInfo)
			{
				return;
			}
			var currentEscortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
			if (currentEscortInfo && currentEscortInfo.roleId > 0)
			{
				var escortInfo : TaskFollowEscortInfo;
				var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
				var mainCharInArea : Boolean = false;
				var sentRoleInArea : Boolean = false;
				var role : SceneRole = MainRoleManager.actor;
				var areaMapData : AreaMapData = otherAreaMap.getFlag(role.x, role.z);
				var flagObj : Object = areaMapData ? areaMapData.data : null;
				if (flagObj is TaskFollowEscortInfo)
				{
					escortInfo = flagObj as TaskFollowEscortInfo;
					if (currentEscortInfo == escortInfo)
					{
						mainCharInArea = true;
					}
				}
				role = SceneManager.getSceneObjByID(currentEscortInfo.roleId) as SceneRole;
				if (role)
				{
					areaMapData = otherAreaMap.getFlag(role.x, role.z);
					flagObj = areaMapData ? areaMapData.data : null;
					if (flagObj is TaskFollowEscortInfo)
					{
						escortInfo = flagObj as TaskFollowEscortInfo;
						if (currentEscortInfo == escortInfo)
						{
							sentRoleInArea = true;
						}
					}
				}
				if (mainCharInArea && sentRoleInArea)
				{
					TaskSender.reqTaskCompleteSentNpc(TaskManager.currentMainTaskInfo.id);
				}
			}
		}

		/**
		 * 到npc对话
		 * @param data
		 *
		 */
		public static function toNpcDiailog(npcId : int) : void
		{
			var npcData : Q_scene_monster_area = MonsterDataManager.getSceneData(npcId);
			if (npcData)
			{
				var sceneRole : SceneRole = SceneManager.getSceneNpcByModelId(npcId);
				var pos : Point = MonsterDataManager.getMonsterPosition(npcData);
				var posX : Number = pos.x;
				var posY : Number = pos.y;
				var sceneId : int = npcData.q_mapid;
				var searchRoleData : SearchRoleData = new SearchRoleData();
				searchRoleData.searchId = npcId;
				searchRoleData.targetData = (sceneRole ? sceneRole.data as MonsterData : null);
				MainRoleSearchPathManager.walkToScene(sceneId, posX, posY, function openPanel() : void
				{
					var targerId : Number = (searchRoleData.targetData ? searchRoleData.targetData.id : 0);
					var role : SceneRole = SceneManager.getScene().getSceneObjByID(targerId, SceneCharType.NPC) as SceneRole;
					if (role)
					{
						SceneRoleSelectManager.selectedRole = role;
						var actor : SceneRole = MainRoleManager.actor;
						var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
						var npcData : MonsterData = role.data as MonsterData;
						var farDistance : int = npcData.farDistance;
						if (dist < farDistance * farDistance)
						{
							TaskManager.checkDialogToNpc(targerId);
						}
					}
				}, 200, searchRoleData);
			}
		}

		public static function tryAddTaskIco(role : SceneRole) : void
		{
			if (role.type == SceneCharType.NPC)
			{
				var npcModelId : int = (role.data as MonsterData).modelID;
				if (!TaskManager.checkHasReplyNpcInStoryTask(npcModelId))
					return;
			}
			SpellAnimationHelper.addTargetEffect(role, RenderUnitID.TASK, RenderUnitType.TASK, EffectUrl.TASK_JUAN_ZHOU, BoneNameEnum.c_0_name_01, 0, null, false);
		}

		public static function tryRemoveTaskIco(role : SceneRole) : void
		{
			if (role.type == SceneCharType.NPC)
			{
				role.avatar.removeRenderUnitsByType(RenderUnitType.TASK);
			}
		}
	}
}
