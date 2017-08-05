package com.rpgGame.app.utils
{
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.AreaMapData;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.tips.TipManager;
	import com.rpgGame.core.view.ui.tip.implement.IBaseTipsInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.collect.CollectCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
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
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.task.bean.TaskInfo;
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import app.message.MonsterDataProto;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
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
		
		/**
		 * 返回任务怪ID
		 * @param npcId
		 *
		 */
		public static function getMainTaskMonsterId(ite:int) : int
		{
			var taskData:Q_mission_base;
			var finish:String;
			var finishArr:Array;
			var finishNum:int;
			var monsterId:int=-1;
			taskData=TaskMissionManager.mainTaskData;
			if(taskData!=null)
			{
				
				finish=taskData.q_finish_information_str;
				finishArr=JSONUtil.decode(finish);
				if(finishArr.length>ite)
				{
					finishArr=finishArr[ite];
					if(finishArr.length==2)
					{
						monsterId=int(finishArr[0]);
						return monsterId;
					}
					
				}
			}
			
			
			return -1;
		}
		/**根据任务类型和下标返回怪物或npcID*/
		public static function getMonsterByType(type : int,ite:int) : int
		{
			var taskData:Q_mission_base;
			var taskInfo:TaskInfo;
			var finish:String;
			var finishArr:Array;
			var finishNum:int;
			var monsterId:int=-1;
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				taskData=TaskMissionManager.mainTaskData;
				taskInfo=TaskMissionManager.mainTaskInfo;
				if(TaskMissionManager.getMainTaskIsFinish())//主线且完成任务，就返回任务npc
				{
					return TaskMissionManager.getMainTaskNpcModeId();//
				}
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				taskData=TaskMissionManager.dailyTaskData;
				taskInfo=TaskMissionManager.dailyTaskInfo;
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				taskData=TaskMissionManager.treasuerTaskData;
				taskInfo=TaskMissionManager.treasuerTaskInfo;
			}
			else
			{
				taskInfo=TaskMissionManager.getOtherTaskInfo(type);
				taskData=TaskMissionManager.getOtherTaskData(type);
				
			}
			if(taskData!=null&&taskInfo!=null)
			{
				if(taskInfo.taskSubRateInfolist.length>ite) 
				{
					return taskInfo.taskSubRateInfolist[ite].modelId;
				}
				
				
				finish=taskData.q_finish_information_str;
				finishArr=JSONUtil.decode(finish);
				if(finishArr&&finishArr.length>ite)
				{
					finishArr=finishArr[ite];
					if(finishArr.length==2)
					{
						monsterId=int(finishArr[0]);
						return monsterId;
					}
					
				}
			}
			
			
			return -1;
		}
		
		/**根据任务类型返回之类型*/
		public static function getSubtypeByType(type : int) : int
		{
			var taskData:Q_mission_base;
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				taskData=TaskMissionManager.mainTaskData;
				
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				taskData=TaskMissionManager.dailyTaskData;
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				taskData=TaskMissionManager.treasuerTaskData;
			}
			else
			{
				taskData=TaskMissionManager.getOtherTaskData(type);
			}
			
			if(taskData!=null)
			{
				return taskData.q_mission_type;
			}
			return -1;
		}
		/**根据任务类型返回是否完成*/
		public static function getIsfinishByType(type : int) : Boolean
		{
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				return TaskMissionManager.getMainTaskIsFinish();
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				return TaskMissionManager.getDailyTaskIsFinish();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				return TaskMissionManager.getTreasuerTaskIsFinish();
			}
			
			
			return false;
		}
		
		/**获取玩家与主线任务Npc距离*/
		public static function getDistfinishNpc() : int
		{
			if(TaskMissionManager.mainTaskData!=null)
			{
				var npcData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(TaskMissionManager.mainTaskData.q_finish_npc);
				if(npcData!=null)
				{
					if(npcData.q_mapid==SceneSwitchManager.currentMapId)
					{
						var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(npcData.q_center_x,npcData.q_center_y));
						
						return dist;
					}
					
				}
			}
			
			return -1;
		}
		
		/**获取玩家与护宝Npc距离*/
		public static function getDistHuBaoNpc() : int
		{
			var npcData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(HuBaoData.acceptNpc);
			if(npcData!=null)
			{
				if(npcData.q_mapid==SceneSwitchManager.currentMapId)
				{
					var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(npcData.q_center_x,npcData.q_center_y));
					
					return dist;
				}	
			}
			
			return -1;
		}
		
		
		/**
		 * 寻路Npc
		 * @param id 刷新的id
		 *
		 */
		public static function npcTaskWalk(id : int,onArrive:Function=null) : void
		{	
			var monsterData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(id);
			if (monsterData)
			{
				MainRoleSearchPathManager.walkToScene(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y,onArrive, 100);
			}
				
		}
		
		
		/**
		 * 寻路任务怪
		 * @param modeId
		 *
		 */
		public static function monsterTaskWalk(modeId : int,onArrive:Function=null) : void
		{
			
			var monsterData : Q_scene_monster_area = MonsterDataManager.getMonsterByModelId(modeId,SceneSwitchManager.currentMapId);
			if (monsterData)
			{
				MainRoleSearchPathManager.walkToScene(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y,onArrive, 100,null,true);
			}
		}
		/**
		 * 寻路任务点
		 * @param modeId
		 *
		 */
		public static function postTaskWalk(post :Array,onArrive:Function=null,data:Object=null,needSprite:Boolean=false) : void
		{
			
			if (post!=null&&post.length==3)
			{
				MainRoleSearchPathManager.walkToScene(post[0], post[1], post[2],onArrive, 100,data,needSprite);
			}
		}
		/**
		 * 寻路跳跃点
		 * @param modeId
		 *
		 */
		public static function postTaskJump(post :Array,onArrive:Function=null,data:Object=null,needSprite:Boolean=false) : void
		{
			
			if (post!=null&&post.length==3)
			{
				MainRoleSearchPathManager.walkToSceneAndJump(post[0], post[1], post[2],onArrive, 0,data,needSprite);
			}
		}
		
		/**
		 * 飞鞋Npc
		 * @param id 刷新的id
		 *
		 */
		public static function npcTaskFly(id : int,mainType : int) : void
		{
			
			var monsterData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(id);
			if (monsterData)
			{
				TaskMissionManager.flyTaskType=mainType;
				SceneSender.sceneMapTransport(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y);
			}
		}
		
		
		/**
		 * 飞鞋任务怪
		 * @param modeId
		 *
		 */
		public static function monsterTaskFly(modeId : int,mainType : int,onArrive:Function=null,noWalk:Function=null) : void
		{
			
			var monsterData : Q_scene_monster_area = MonsterDataManager.getMonsterByModelId(modeId,SceneSwitchManager.currentMapId);
			if (monsterData)
			{
				TaskMissionManager.flyTaskType=mainType;
				SceneSender.sceneMapTransport(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y);
			}
		}
		/**
		 * 飞鞋任务点
		 * @param modeId
		 *
		 */
		public static function postTaskFly(post :Array,mainType : int,missionType:int=0,onArrive:Function=null,noWalk:Function=null) : void
		{
			
			if (post!=null&&post.length==3)
			{
				TaskMissionManager.flyTaskType=mainType;
				TaskMissionManager.flyMissionType=missionType;
				SceneSender.sceneMapTransport(post[0], post[1], post[2]);
			}
		}
		/**
		 * 飞鞋处理
		 * @param npcId
		 *
		 */
		public static function TaskFly(npcId : int,onArrive:Function=null,noWalk:Function=null) : void
		{
			
			var monsterData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(npcId);
			if (monsterData)
			{
				var pos : Point = MonsterDataManager.getMonsterPosition(monsterData);
				//var targerPos:Vector3D=new Vector3D();
				SceneSender.sceneMapTransport(monsterData.q_mapid,pos.x,pos.y);
				//MainRoleSearchPathManager.walkToScene(npcData.q_mapid, pos.x, pos.y,onArrive, 100,null,noWalk);
			}
		}
		
		//------------------------------------------
		/**
		 * 回复任务
		 * @param npcId
		 *
		 */
		public static function replyNpcTask(npcId : int) : void
		{
			
			//var npcData : Q_scene_monster_area = MonsterDataManager.getSceneData(npcId);
			
			var npcData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(npcId);
			
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
					//TaskManager.checkDialogToNpc(targerId);
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
		
		public static function nearestTaskNpc(id : int,show:Boolean) : void
		{
			var list : Vector.<SceneRole> = SceneManager.getSceneRoleList();
			var find : Boolean = false;
			for each (var role : SceneRole in list)
			{
				if (role != null &&role.usable)
				{
					var monsterData : MonsterData = role.data as MonsterData;
					if (monsterData != null&&monsterData.distributeId==id)
					{
						if(show)
						{
							tryAddTaskMark(role);
						}		
						else
						{
							tryRemoveTaskMark(role);
						}
					}
				}
				
				
				
				
			}
			
		}
		
		
		
		public static function tryAddTaskMark(role : SceneRole) : void
		{
			if (role.type == SceneCharType.MONSTER)
			{
				var npcDistributeIdId : int = (role.data as MonsterData).distributeId;
				if (!TaskMissionManager.checkHasReplyNpcInStoryTask(npcDistributeIdId))
					return;
			}
			
			if(TaskMissionManager.getMainTaskIsFinish())
			{
				SpellAnimationHelper.addTargetEffect(role, RenderUnitID.TASKMARK, RenderUnitType.TASKMARK, EffectUrl.UI_WENHAO, BoneNameEnum.c_0_name_01, 0, null, false);
				
				//Render3DTextUtil.addHeadKillToTarget(role);
			}
			
		}
		public static function tryRemoveTaskMark(role : SceneRole) : void
		{
			if (role.type == SceneCharType.MONSTER)
			{
				role.avatar.removeRenderUnitsByType(RenderUnitType.TASKMARK);
			}
		}
		
		
		
		
		/**设置任务目标内容*/
		public static  function setGotargetInfo(mainType:int,missionType:int,describe:String,finisstr:String,subList:Vector.<TaskSubRateInfo>,txtButList:Vector.<SkinnableContainer>):void
		{
			return;
			var i:int,j:int,length:int;
			var text:String="";
			if(missionType==TaskType.SUB_CONVERSATION)
			{
				text=TaskMissionCfgData.getTaskDescribe(missionType,describe,TaskMissionManager.getTaskNpcModeId(mainType));
				setGotargetLabelText(missionType,txtButList[0],text);
			}
			else
			{
				var finiStr:Array;
				var informationList:Array=JSONUtil.decode(finisstr);;
				if(informationList&&informationList.length>0)
				{
					length=informationList.length;
					for(i=0;i<length;i++)
					{
						if(informationList[i]&&informationList[i]!=null)
						{
							
							var modeid:int=0;
							var count:int=0,finish:int;
							var modeArr:Array=informationList[i];
							if(modeArr.length==2)
							{
								modeid=int(modeArr[0]);
								finish=int(modeArr[1]);
							}
							if(subList[i]!=null)
							{
								modeid=subList[i].modelId;
								count=subList[i].num;
								finish=subList[i].maxNum;
							}
							text=TaskMissionCfgData.getTaskDescribe(missionType,describe,modeid);
							text+="<font color='#cfc6ae'>("+count+"/"+finish+")</font>";
							
							setGotargetLabelText(missionType,txtButList[i],text);
						}
					}
				}
			}
		}
		public static function setGotargetLabelText(type:int,but:SkinnableContainer,t:String):void
		{
			
			var rItme:Renwu_Item;
			if(but!=null&&but.skin!=null)
			{
				rItme=but.skin as Renwu_Item;
			}
			if(rItme!=null)
			{
				rItme.labelDisplay.width=300;
				rItme.labelDisplay.htmlText=t;
				rItme.labelDisplay.width=rItme.labelDisplay.textWidth+10;
				but.width=rItme.labelDisplay.textWidth+15;
				but.visible=true;
				rItme.btn_send.visible=true;
				if(type==0||type==5||type==6)
				{
					rItme.btn_send.visible=false;
				}
				
			}
			
			
		}
		
		public static function setTextEvet(but:SkinnableContainer):void
		{
			var rItme:Renwu_Item;
			if(but!=null&&but.skin!=null)
			{
				rItme=but.skin as Renwu_Item;
			}
			if(rItme!=null)
			{
				addLabelEvet(rItme.labelDisplay);
			}
		}
		public static function addLabelEvet(labelDisplay:Label):void
		{
			if(labelDisplay)
			{
				labelDisplay.mesh2DTraceContinaerName="isMouseOut";
				labelDisplay.addEventListener(TouchEvent.TOUCH, onTouch);
			}
			
		}
		public static function removeLabelEvet(labelDisplay:Label):void
		{
			if(labelDisplay)
			{
				labelDisplay.removeEventListener(TouchEvent.TOUCH, onTouch);
			}
			
		}
		
		private static var overClolor:int=16751616;
		private static function onTouch(e:TouchEvent):void
		{
			var target : Label  = e.currentTarget as Label;
			if(!target)
				return;
			var key:Array
			var overTouch : Touch;
			var endTouch : Touch;
			overTouch = e.getTouch(target, TouchPhase.HOVER);
			if (overTouch != null&&target.mesh2DTraceContinaerName=="isMouseOut")
			{
				target.mesh2DTraceContinaerName="isMouseOver:"+target.y+":"+target.color;//只为保存属性
				target.y-=1;
				target.color=overClolor;
				return;
			}
			overTouch = e.getTouch(target);
			endTouch = e.getTouch(target, TouchPhase.ENDED);
			if (overTouch == null||endTouch != null)
			{
				key=target.mesh2DTraceContinaerName.split(":");
				if(key.length==3)
				{
					target.mesh2DTraceContinaerName="isMouseOut";
					target.y=int(key[1]);
					target.color=int(key[2]);
				}
				
				return;
			}
			
		}
		
		/**设置奖励物品*/
		public static function setRewordInfo(rid:int,icoList:Vector.<IconCDFace>,icoBgList:Vector.<UIAsset>,show:Boolean=false):void
		{
			var rewordList:Array=TaskMissionCfgData.getRewordById(rid,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex);
			if(rewordList==null)return;
			var item:Q_item;
			var i:int,length:int,idd:int;
			length=rewordList.length;
			idd=0;
			for(i=0;i<length;i++)
			{
				if(rewordList[i].show==1||show)
				{
					item=ItemConfig.getQItemByID(rewordList[i].mod);
					if(item&&i<icoList.length)
					{
						icoList[idd].setIconResName(ClientConfig.getItemIcon(""+item.q_icon,IcoSizeEnum.ICON_42));
						icoList[idd].setSubString(rewordList[i].num);
						icoList[idd].visible=true;
						icoBgList[idd].visible=true;
						setItemTips(icoList[idd],item,int(rewordList[i].num));
						idd++;
					}
				}
				
				
			}
		}
		public static function setItemTips(grid:IconCDFace,qit:Q_item,num:int):void
		{
			
			var item:ItemInfo = new ItemInfo();
			item.itemModelId = qit.q_id;
			item.num = num;
			var info:ClientItemInfo=ItemUtil.convertClientItemInfo(item);
			FaceUtil.SetItemGrid(grid,info,true);
		}
		
		
		
		
		
		
		
		/////////////////////////////////////////////////////////////
		
		
		
		
		
		
		
		
		
		
		
	}
}
