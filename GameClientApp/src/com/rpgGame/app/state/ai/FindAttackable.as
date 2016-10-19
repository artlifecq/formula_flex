package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.state.ai.AIState;
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
				SceneRoleSelectManager.selectedRole = role;
				if (SceneRoleSelectManager.selectedRole == role)
				{
					var targerPos : Vector3D = role.position;
					RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 200, null, onArrive);
				}
			}
		}

		private function findAttackableTarget() : SceneRole
		{
			return findNearestMonster();
		}

		private function findNearestMonster() : SceneRole
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			roleList.sort(onSortNearestChar);
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					return role;
				}
			}
			return null;
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
			transition(AIStateType.ATTACK_TARGET);
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
	}
}
