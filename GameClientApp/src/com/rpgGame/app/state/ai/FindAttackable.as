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
	import com.rpgGame.coreData.role.HeroData;
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
					//transition(AIStateType.ATTACK_TARGET);
					return;
				}
			}
			var role : SceneRole = findAttackableTarget();
			if (role)
			{
				
				SceneRoleSelectManager.selectedRole = role;
				TrusteeshipManager.getInstance().setRoleList(role);
				var monsterData : MonsterData = role.data as MonsterData;
				//transition(AIStateType.AI_NONE);
			}
		}

		private function findAttackableTarget() : SceneRole
		{
			var role:SceneRole;
			if(role==null&&TaskAutoManager.getInstance().isTaskRunning)//任务中先搜寻任务怪
			{
				role=findNearestTaskMonster();
			}
			if(role==null)//再搜寻怪物
			{
				role=findNearestMonster();
			}
			if(role==null)//再搜寻可攻击玩家
			{
				role=findNearestPlayer();
			}
			return role;
		}
		private var currDist:int;
		/**搜寻视野中可攻击最近的玩家*/
		private function findNearestPlayer() : SceneRole
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.PLAYER);
			var rerlle:SceneRole;
			currDist=int.MAX_VALUE;
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				var heroData : HeroData = role.data as HeroData;
				var modeState : int = FightManager.getFightRoleState(role);
				if (role &&heroData&& role.usable &&!role.stateMachine.isDeadState&&modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)//if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(role.x,role.z));
					var max:int=TrusteeshipManager.getInstance().findDist;
					if(dist<=max&&dist<currDist)
					{
						rerlle= role;
						currDist=dist;
					}
					
					
				}
			}
			return rerlle;
		}
		/**搜寻视野中可攻击最近的任务怪物*/
		private function findNearestTaskMonster() : SceneRole
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			var rerlle:SceneRole;
			currDist=int.MAX_VALUE;
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				var monsterData : MonsterData = role.data as MonsterData;
				var modeState : int = FightManager.getFightRoleState(role);
				if (role &&monsterData&& role.usable && monsterData.monsterData.q_monster_type>=1&&monsterData.monsterData.q_monster_type<=3&& !role.stateMachine.isDeadState&&(modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND))//if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					if(TaskMissionManager.isTaskMonster(monsterData.modelID,TaskAutoManager.getInstance().taskType))
					{
						var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(role.x,role.z));
						var max:int=TrusteeshipManager.getInstance().findDist;
						if(dist<=max&&dist<currDist)
						{
							rerlle= role;
							currDist=dist;
						}
					}
					
				}
			}
			/*if(rerlle==null&&istask)
			{
				rerlle=findNearestMonster(false);
			}*/
			return rerlle;
		}
		/**搜寻视野中可攻击最近的怪物*/
		private function findNearestMonster() : SceneRole
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			var rerlle:SceneRole;
			currDist=int.MAX_VALUE;
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				var monsterData : MonsterData = role.data as MonsterData;
				var modeState : int = FightManager.getFightRoleState(role);
				if (role &&monsterData&& role.usable && monsterData.monsterData.q_monster_type>=1&&monsterData.monsterData.q_monster_type<=3&& !role.stateMachine.isDeadState&&modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)//if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(role.x,role.z));
					var max:int=TrusteeshipManager.getInstance().findDist;
					if(dist<=max&&dist<currDist)
					{
						rerlle= role;
						currDist=dist;
					}
				}
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
		
		
		
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if(TrusteeshipManager.getInstance().getHasRole()&&SceneRoleSelectManager.selectedRole !=null)
			{
				if (!force)
					return false;
			}
			
			if (MainRoleManager.actor.stateMachine.isWalkMoving)
			{
				if (!force)
					return false;
			}
			
			return true;
		}
	}
}
