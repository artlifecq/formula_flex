package com.rpgGame.app.cmdlistener
{
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.AreaMapData;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.MazeSender;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.SceneCharacterEvent;
	import com.rpgGame.core.events.SceneInteractiveEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.ClientTrigger;
	import com.rpgGame.coreData.cfg.TriggerArea;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	import com.rpgGame.coreData.info.task.target.TaskAreaExplorationInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 角色状态侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-23 上午10:26:37
	 *
	 */
	public class RoleStateCmdListener extends BaseBean
	{
		private var _otherAreaMap : AreaMap;

		public function RoleStateCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			//注册场景交互事件
			EventManager.addEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, onSelectedSceneRoleHandler);
			EventManager.addEvent(SceneCharacterEvent.SCENE_CHAR_DEATH, onCharDeath);
			EventManager.addEvent(UserMoveEvent.MOVE_START, mainCharMoveThroughHandler);
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, mainCharMoveThroughHandler);
			EventManager.addEvent(UserMoveEvent.MOVE_END, mainCharMoveThroughHandler);
			EventManager.addEvent(UserMoveEvent.FOLLOW_MOVE_ENTER, followMainCharMoveThroughHandler);
			EventManager.addEvent(UserMoveEvent.FOLLOW_MOVE_THROUGH, followMainCharMoveThroughHandler);
			//
			finish();
		}

		private function onCharDeath(role : SceneRole) : void
		{
			if (role && role.usable)
			{
				if (role.isMainChar)
				{
					TrusteeshipManager.getInstance().stopFightTarget();
				}
			}
			if (SceneRoleSelectManager.mouseOverRole == role)
				SceneRoleSelectManager.mouseOverRole = null;
			if (SceneRoleSelectManager.selectedRole == role && SceneCharType.PLAYER != role.type)
				SceneRoleSelectManager.selectedRole = null;
		}

		private function mainCharMoveThroughHandler() : void
		{
			var actor : SceneRole = MainRoleManager.actor;
			if (!_otherAreaMap)
				_otherAreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaMapData : AreaMapData = _otherAreaMap.getFlag(actor.x, actor.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is SceneRole)
			{GameLog.addShow("----------触发场景物"+actor.x+","+actor.z);
				if ((flagObj as SceneRole).type == SceneCharType.TRANS)
				{GameLog.addShow("----------触发传送门了"+actor.x+","+actor.z);
					var trans : SceneRole = flagObj as SceneRole;
					if (!trans.isInViewDistance)
						return;
					var tranportData : SceneTranportData = trans.data as SceneTranportData;
					GameLog.addShow("[RoleStateCmdListener] [mainCharMoveThroughHandler]" + tranportData.id);
					switch (tranportData.type)
					{
						case RoleType.TYPE_TRANPORT_NORMAL:
							GameLog.addShow("----------TYPE_TRANPORT_NORMAL" +tranportData.id);
							SceneSender.transportChgMap(tranportData.id);
							break;
						case RoleType.TYPE_TRANPORT_MAZE:
							MazeSender.tryTrans(tranportData.id);
							break;
					}
				}
			}
			else if (flagObj is TaskFollowEscortInfo)
			{
				TaskUtil.tryCompleteSentTask();
			}
			else if (flagObj is TaskAreaExplorationInfo)
			{
				var explorationInfo : TaskAreaExplorationInfo = flagObj as TaskAreaExplorationInfo;
				if (TaskManager.currentMainTaskInfo)
				{
					TaskSender.reqTaskCompleteAreaSearch(TaskManager.currentMainTaskInfo.id);
				}
			}
			else if (flagObj is ClientTrigger)
			{
				var trigger : ClientTrigger = flagObj as ClientTrigger;
				ClientTriggerManager.ClientBytrigger(trigger.id);
			}
			else if (flagObj is TriggerArea)
			{
				var triggerArea : TriggerArea = flagObj as TriggerArea;
				//ClientTriggerManager.ClientBytrigger(triggerArea.areaId);
			}
			var dist : int = 0;
			var farDistance : int = 0;
			var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
			if (selectedRole)
			{
				if (selectedRole.type == SceneCharType.NPC)
				{
					dist = MathUtil.getDistanceNoSqrt(actor.x, actor.z, selectedRole.x, selectedRole.z);
					var npcData : MonsterData = selectedRole.data as MonsterData;
					farDistance = npcData.farDistance;
					if (dist > farDistance * farDistance)
					{
						hideApps();
					}
				}
				else if (selectedRole.type == SceneCharType.DROP_GOODS)
				{
					dist = MathUtil.getDistanceNoSqrt(actor.x, actor.z, selectedRole.x, selectedRole.z);
					var dropGoodsData : SceneDropGoodsData = selectedRole.data as SceneDropGoodsData;
					farDistance = dropGoodsData.farDistance;
					if (dist > farDistance * farDistance)
					{
						hideApps();
					}
				}

				if (!RoleStateUtil.isTargetInMyEye(selectedRole))
				{
					if (SceneRoleSelectManager.mouseOverRole == selectedRole)
						SceneRoleSelectManager.mouseOverRole = null;
					if (SceneRoleSelectManager.selectedRole == selectedRole)
						SceneRoleSelectManager.selectedRole = null;
					EventManager.dispatchEvent(SceneCharacterEvent.LEAVE_EYE, selectedRole);
				}
			}
			AreaMapManager.updateActorEnterAreaInfo();
		}

		private function followMainCharMoveThroughHandler(role : SceneRole) : void
		{
			if (!_otherAreaMap)
				_otherAreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaMapData : AreaMapData = _otherAreaMap.getFlag(role.x, role.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is TaskFollowEscortInfo)
			{
				var escortInfo : TaskFollowEscortInfo = flagObj as TaskFollowEscortInfo;
				if (role.id == escortInfo.roleId)
				{
					TaskUtil.tryCompleteSentTask();
				}
			}
		}

		private static function onSelectedSceneRoleHandler(role : SceneRole) : void
		{
			hideApps();
		}

		/**
		 * 切换选择关闭面板
		 *
		 */
		private static function hideApps() : void
		{
			AppManager.hideApp(AppConstant.TASK_DIAILOG_FUNC_PANEL);
			AppManager.hideApp(AppConstant.SHOP_PANEL);
			AppManager.hideApp(AppConstant.FAMILY_CREATE_AGREEMENT_PANEL);
			AppManager.hideApp(AppConstant.DROP_GOODS_LIST_PANEL);
		}
	}
}
