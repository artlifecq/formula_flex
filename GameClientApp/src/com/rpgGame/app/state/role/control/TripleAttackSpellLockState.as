package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;

	/**
	 *
	 * 场景投放技能锁定状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-09 上午11:25:12
	 *
	 */
	public class TripleAttackSpellLockState extends ControlState
	{
		
		private var _lockTween : TweenLite;
		private static var index:int=0;
		public function TripleAttackSpellLockState()
		{
			super(RoleStateType.CONTROL_TRIPLE_ATTACK_LOCK);
		}
		override public function enter():void
		{
			super.enter();
			index++;
			trace(" enter TripleAttackSpellLockState+========================"+index);
		}
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				
				//_lockTween = TweenLite.delayedCall(5, onUnlock);
			}
		}

		private function onUnlock() : void
		{
			removeSelf();
		}
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			return true;
		}
		override public function leave() : void
		{
			trace(" leave TripleAttackSpellLockState+========================"+index);
			super.leave();
			if (_lockTween)
			{
				_lockTween.kill();
				_lockTween = null;
			}
		}

		override public function dispose() : void
		{
			
			if (_lockTween)
			{
				_lockTween.kill();
				_lockTween = null;
			}
			super.dispose();
		}
	}
}
