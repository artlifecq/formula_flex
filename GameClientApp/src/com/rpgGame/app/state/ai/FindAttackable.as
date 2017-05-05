package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;

	/**
	 *
	 * 查找可攻击对象
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 下午4:25:12
	 *
	 */
	public class FindAttackable extends AIState
	{
		public function FindAttackable()
		{
			super(AIStateType.FIND_ATTACKABLE);
		}

		override public function execute() : void
		{
			super.execute();
			gotoAttackMonster();
		}

		private function gotoAttackMonster() : void
		{
			if (SceneRoleSelectManager.selectedRole && SceneRoleSelectManager.selectedRole.usable && SceneRoleSelectManager.selectedRole.isInViewDistance)
			{
				if (!SceneRoleSelectManager.selectedRole.stateMachine.isDeadState)
				{
					transition(AIStateType.ATTACK_TARGET);
					return;
				}
			}
			var role : SceneRole = findAttackableTarget();
			if (role)
			{
				if(TrusteeshipManager.getInstance().isAutoFightRunning)
				{
					SceneRoleSelectManager.selectedRole = role;
				}
				else if(TrusteeshipManager.getInstance().isFightTargetRunning)
				{
					SceneRoleSelectManager.selectedRole = null;
				}
				TrusteeshipManager.getInstance().setRoleList(role);
				var monsterData : MonsterData = role.data as MonsterData;
				transition(AIStateType.AI_NONE);
				
				/*if (SceneRoleSelectManager.selectedRole == role)
				{
					var targerPos : Vector3D = role.position;
					RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 200, null, onArrive);
				}*/
			}
		}

		private function findAttackableTarget() : SceneRole
		{
			var role:SceneRole;
			/*if(TaskAutoManager.getInstance().isTaskRunning)
			{
				role=findNearestMonster(true);
			}
			else
			{
				role=findNearestMonster(false);
			}*/
			role=findNearestMonster(false);
			return role;
		}
		private var currDist:int;
		private function findNearestMonster(istask:Boolean=false) : SceneRole
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			//roleList.sort(onSortNearestChar);
			var rerlle:SceneRole;
			currDist=int.MAX_VALUE;
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				var monsterData : MonsterData = role.data as MonsterData;
				if (role &&monsterData&& role.usable && monsterData.monsterData.q_monster_type>=1&&monsterData.monsterData.q_monster_type<=3&& !role.stateMachine.isDeadState)//if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(role.x,role.z));
					var max:int=int(SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HOOK_TYPE)*50);
					if(dist<=max&&dist<currDist)
					{
						var modeState : int = FightManager.getFightRoleState(role);
						if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
						{
							if(istask)
							{
								if(TaskMissionManager.isMainTaskMonster(monsterData.modelID))
								{
									rerlle= role;
									currDist=dist;
								}
							}
							else
							{
								rerlle= role;
								currDist=dist;
							}
						}
					}
					
					
				}
			}
			if(rerlle==null&&istask)
			{
				rerlle=findNearestMonster(false);
			}
			return rerlle;
		}

		private function onSortNearestChar(roleA : SceneRole, roleB : SceneRole) : int
		{
			var disA : Number = Point.distance(new Point(MainRoleManager.actor.x, MainRoleManager.actor.z), new Point(roleA.x, roleA.z));
			var disB : Number = Point.distance(new Point(MainRoleManager.actor.x, MainRoleManager.actor.z), new Point(roleB.x, roleB.z));
			if (disA > disB)
				return 1;
			else
				return -1;
			return 0;
		}

		private function onArrive(ref : WalkMoveStateReference) : void
		{
			transition(AIStateType.AI_NONE);
		}

		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if (MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				if (!force)
					return false;
			}
			if (MainRoleManager.actor.stateMachine.isJumpRising)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBlinkMoving)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isBeatMoving)
			{
				return false;
			}
			if (!MainRoleManager.actor.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isAttackHarding)
			{
				return false;
			}
			if (MainRoleManager.actor.stateMachine.isLockCaseSpell)
			{
				return false;
			}
			return true;
		}
		
		public static function isFind():Boolean
		{
			var targetRoles:Vector.<SceneRole>=TrusteeshipManager.getInstance().getRoleList();
			if(targetRoles!=null&&targetRoles.length>0)
			{
				for each (var role : SceneRole in targetRoles)
				{
					if (role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
					{
						return false;
					}
				}
			}
			return true;
		}	
		
	}
}
