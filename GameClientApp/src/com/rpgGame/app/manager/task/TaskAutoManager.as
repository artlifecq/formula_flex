package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;
	
	/**
	*
	* 自动任务托管管理器
	* @author L.L.M.Sunny
	* 创建时间：2015-7-1 上午10:02:16
	*
	*/
	public class TaskAutoManager
	{
		private static var _instance : TaskAutoManager;
		
		
		private var _gTimer : GameTimer;
		private var _isTaskRunning : Boolean;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		public function TaskAutoManager()
		{
			_gTimer = new GameTimer("TaskAutoManager", 200, 0, onUpdate);
			_isTaskRunning = false;
			_isBroken = false;
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
		}
		
		
		public function startTaskAuto() : void
		{
			
			_gTimer.start();
			_isTaskRunning = true;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_stateMachine.transition(AIStateType.AI_NONE);
			onUpdate(true);
		}
		public function broken() : void
		{
			if (!_isTaskRunning)
				return;
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(0.5, onDelayedUnbroken);
		}
		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}
		public function stopFightTarget() : void
		{
			if (!_isTaskRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			stop();
		}
		private function stop() : void
		{
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isTaskRunning = false;
			_gTimer.reset();
			_gTimer.stop();
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
			if (MainRoleManager.actor.stateMachine.isPrewarWaiting)
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR);
			else
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}

		private function onUpdate(force : Boolean = false) : void
		{
			if (!_isTaskRunning)
				return;
			if (_isBroken)
				return;
			_stateMachine.transition(AIStateType.ATTACK_WALK, null, force);
		}
		
		public function get isTaskRunning():Boolean
		{
			return _isTaskRunning;
		}
		
		public function set isTaskRunning(value:Boolean):void
		{
			_isTaskRunning = value;
		}
		
		public static function getInstance() : TaskAutoManager
		{
			if (!_instance)
			{
				_instance = new TaskAutoManager();
			}
			return _instance;
		}
	}
}