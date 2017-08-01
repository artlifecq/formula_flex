package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.game.engine3D.state.StateMachine;
	import com.game.engine3D.state.StateReference;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.GirlPetFollowAnimator;
	import com.rpgGame.app.state.ai.pet.GirlPetFollowState;
	import com.rpgGame.app.state.ai.pet.GirlPetTransLockState;
	import com.rpgGame.core.state.ai.AINone;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.type.AIStateType;

	/**
	 *
	 * AI状态机
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 下午2:05:15
	 *
	 */
	public class AIStateMachine extends StateMachine
	{
		private var _role : SceneRole;

		public function AIStateMachine(role : SceneRole)
		{
			super(role);
		}

		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_role = _owner as SceneRole;
		}

		override public function transition(type : int, ref : StateReference = null, force : Boolean = false, allowQueue : Boolean = false, dumpTypes : Array = null) : Boolean
		{
			if (_role && _role.usable)
				return super.transition(type, ref, force, allowQueue, dumpTypes);
			return false;
		}

		override public function dispose() : void
		{
			_role = null;
			super.dispose();
		}

		public function get isNone() : Boolean
		{
			var state : IState = getCurrState(AIState);
			return state && (state.type == AIStateType.AI_NONE);
		}
		public function get isGrilPetTransLock() : Boolean
		{
			var state : IState = getCurrState(GirlPetTransLockState);
			return state && (state.type == AIStateType.AI_GIRL_TRANS_LOCK);
		}
		override protected function createState(type : int) : IState
		{
			var state : IState;
			switch (type)
			{
				case AIStateType.AI_NONE:
					state = new AINone();
					break;
				case AIStateType.FIND_ATTACKABLE:
					state = new FindAttackable();
					break;
				case AIStateType.ATTACK_TARGET:
					state = new AttackTarget();
					break;
				case AIStateType.ATTACK_WALK:
					state = new AIAttackWalk();
					break;
				case AIStateType.USE_ITEM:
					state = new AIUseItem();
					break;
				
				case AIStateType.TASK_WALK:
					state = new AItaskWalk();
					break;
				case AIStateType.TASK_OTHER_WALK:
					state = new AItaskOtherWalk();
					break;
				case AIStateType.TASK_GATHER:
					state = new AItaskGather();
					break;
				case AIStateType.FIGHTSOUL_ATTACE:
					state = new AIFightSoulAttack();
					break;
				case AIStateType.AI_GIRL_FOLLOW:
					state = new GirlPetFollowState();
					break;
			}
			if (!state)
			{
				throw new Error(_role.name + "-不存在的状态：" + type);
			}
			return state;
		}
	}
}
