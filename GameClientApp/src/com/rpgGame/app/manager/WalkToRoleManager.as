package com.rpgGame.app.manager
{
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.graphics.StallHeadFace;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.ctrl.ControlAutoPick;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneDropGoodsManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 走向角色管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:02:16
	 *
	 */
	public class WalkToRoleManager
	{
		public function WalkToRoleManager()
		{
		}
		
		public static function walkToRole(role : SceneRole) : Boolean
		{
			if (!role || !role.usable)
				return false;
			var ret:Boolean=false;
			var targerPos : Vector3D = role.position.clone();
			targerPos.y = targerPos.z;
			targerPos.z = 0;
			switch (role.type)
			{
				case SceneCharType.PLAYER:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role);
					break;
				case SceneCharType.MONSTER:
					ret=wakMonster(role,targerPos);
					break;
				case SceneCharType.LIANG_CANG:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role, onArriveMonster);
					break;
				case SceneCharType.NPC:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role, onArriveNpc);
					break;
				case SceneCharType.PROTECT_NPC:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role, onArriveNpc);
					break;
				case SceneCharType.COLLECT:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role, onArriveCollect);
					break;
				case SceneCharType.DROP_GOODS:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, ControlAutoPick.AUTO_DIRECT_SEND_PICK, role, onArriveDropGoods);
					break;
				case SceneCharType.STALL:
					ret=MainRoleSearchPathManager.jumpWalkToPos(MainRoleManager.actor, targerPos, 100, role, onWalkToStall);
					break;
				case SceneCharType.SCULPTURE:
					ret=RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 100, role, walkToSculpture);
					break;
			}
			return ret;
		}
		
		
		private static function walkToSculpture(ref : WalkMoveStateReference) : void
		{
//			FunctionOpenManager.openAppPaneById(EmFunctionID.EM_WORSHIP,ref.data);
			RankListManager.instance.requestworshop(ref.data as SceneRole);
		}
		private static function onWalkToStall(ref : WalkMoveStateReference):void
		{
			var role : SceneRole = ref.data as SceneRole;
			if (role == null || !role.usable)
				return;
			if(role.type == SceneCharType.STALL)
			{
				var stallData : StallData = role.data as StallData;
				if(stallData)
				{
					StallManager.seeStallPlayerId = stallData.playerId;
					StallManager.setSeeStallPlayer(stallData.playerId);
					AppManager.showAppNoHide(AppConstant.STALL_PANEL);
					if(role.headFace is StallHeadFace)
						(role.headFace as StallHeadFace).addAndUpdateStallBg();
				}
			}
		}
		
		
		
		private static function wakMonster(role : SceneRole,targerPos : Vector3D) : void
		{
			if (role == null || !role.usable)
				return;
			
			var monsterData : MonsterData = role.data as MonsterData;
			if (monsterData == null)
				return;
			var modeState : int = FightManager.getFightRoleState(role);
			if (monsterData.monsterData.q_monster_type>=1&&monsterData.monsterData.q_monster_type<=3&&modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
			{
				
				TrusteeshipManager.getInstance().stopAll();
				SceneRoleSelectManager.selectedRole=role;
				TrusteeshipManager.getInstance().startFightSelected();
				/*var dst:int=MainRoleManager.actorInfo.spellList.getShortcutSpellDistance();
				RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, dst, role, waikOver,null,null,waikOver);
				function waikOver():void
				{
				var targetRoles : Vector.<SceneRole>=new Vector.<SceneRole> ();
				targetRoles.push(role);
				TrusteeshipManager.getInstance().startFightTarget(targetRoles);
				}*/
			}
			else
			{
				RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 100, role, onArriveMonster);
			}
			
			
		}
		private static function onArriveMonster(ref : WalkMoveStateReference) : void
		{
			var role : SceneRole = ref.data as SceneRole;
			walkComplet(role);
			
			//如果这只怪是猪，那么是不能杀的，请求抓猪
			//			if (TouZhuCfgData.isZhuMonster(monsterData.modelID))
			//			{
			//				TouZhuManager.reqStratTouZhu(monsterData.id);
			//				return;
			//			}
		}
		private static function noWalk( role : SceneRole) : void
		{
			walkComplet(role);
			
		}
		/**寻路完成*/
		private static function walkComplet( role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			
			var monsterData : MonsterData = role.data as MonsterData;
			if (monsterData == null)
				return;
			if(monsterData.monsterData.q_monster_type==4)
			{
				EventManager.dispatchEvent(TaskEvent.TASK_CLICK_NPC,monsterData.distributeId,monsterData.serverID);//交任务用------YT
			}
			
		}
		
		
		
		private static function onArriveNpc(ref : WalkMoveStateReference) : void
		{
			var role : SceneRole = ref.data as SceneRole;
			if (role == null || !role.usable)
				return;
			
			var actor : SceneRole = MainRoleManager.actor;
			var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
			var npcData : MonsterData = role.data as MonsterData;
			var farDistance : int = npcData.farDistance;
			if (dist < farDistance * farDistance)
			{
				TaskManager.checkDialogToNpc(role.id);
			}
			
			
		}
		/**
		 * 采集物
		 * @param ref
		 */
		private static function onArriveCollect(ref : WalkMoveStateReference) : void
		{
			var role : SceneRole = ref.data as SceneRole;
			onCollect(role);
		}
		/**
		 * 采集物
		 *
		 */
		public static function onCollect(role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			var actor : SceneRole = MainRoleManager.actor;
			var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
			var collectData : SceneCollectData = role.data as SceneCollectData;
			var farDistance : int = 300;
			if (dist < farDistance * farDistance)
			{
				var wideStr:String=GlobalSheetData.getSettingInfo(834).q_string_value;
				var wideArr:Array=wideStr.split("-");
				if(wideArr.length==2&&collectData.modelID>=int(wideArr[0])&&collectData.modelID<=int(wideArr[1]))//任务采集物id范围
				{
					if(TaskMissionManager.isGatherItem(collectData.modelID))//如果是任务采集物就采集
					{
						TaskSender.sendStartGatherMessage(collectData.serverID);
					}
					
				}
				else
				{
					if(collectData.faction==MainRoleManager.actorInfo.faction||collectData.faction==0||collectData.modelID==2263)//祝福石特殊处理
					{
						TaskSender.sendStartGatherMessage(collectData.serverID);
					}else{
						NoticeManager.showNotifyById(60103);
					}
				}
				
			}
		}
		
		/**
		 * 掉落物
		 * @param ref
		 *
		 */
		private static function onArriveDropGoods(ref : WalkMoveStateReference) : void
		{
			var role : SceneRole = ref.data as SceneRole;
			if (role == null || !role.usable)
				return;
			
			TrusteeshipManager.getInstance().autoPickCtrl.isArrivePk=true;
			var actor : SceneRole = MainRoleManager.actor;
			var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
			var dropGoodsData : SceneDropGoodsData = role.data as SceneDropGoodsData;
			//var farDistance : int = dropGoodsData.farDistance;
			//	if (dist < farDistance * farDistance)
			{
				/*if (dropGoodsData.isMount)
				MountManager.collectMountItem(dropGoodsData.id, dropGoodsData.name);
				else*/
				SceneDropGoodsManager.selectedDropGoods(dropGoodsData);
			}
		}
		
		private static function onDropGoods(role : SceneRole):void
		{
			if (role == null || !role.usable)
				return;
			TrusteeshipManager.getInstance().autoPickCtrl.isArrivePk=true;
			var actor : SceneRole = MainRoleManager.actor;
			var dist : int = MathUtil.getDistanceNoSqrt(actor.x, actor.z, role.x, role.z);
			var dropGoodsData : SceneDropGoodsData = role.data as SceneDropGoodsData;
			var farDistance : int = dropGoodsData.farDistance;
			if (dist < farDistance * farDistance)
			{
				/*if (dropGoodsData.isMount)
				MountManager.collectMountItem(dropGoodsData.id, dropGoodsData.name);
				else*/
				SceneDropGoodsManager.selectedDropGoods(dropGoodsData);
			}
		}
		
//		public static function walkToTranport(trans : SceneRole) : void
//		{
//			var transId : int = trans.id;
//			var data : SceneTransportProto = TranportsDataManager.getData(transId);
//			if (data)
//			{
//				var polygon : Vector.<Point> = TranportsDataManager.getPolygon(data);
//				var center : Point = MathUtil.getPolygonCenter(polygon);
//				RoleStateUtil.walk(MainRoleManager.actor, center.x, center.y);
//			}
//		}
	}
}
