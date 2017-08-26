package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	
	import gs.TweenLite;
	
	/**
	 * 自动采集 和任务使用物品管理类
	 * @author YT
	 * 
	 */	
	public class GatherAutoManager
	{
		private static var _instance : GatherAutoManager;
		public static function getInstance() : GatherAutoManager
		{
			if (!_instance)
			{
				_instance = new GatherAutoManager();
			}
			return _instance;
		}
		
		
		private var _gTimer : GameTimer;
		private var _isGatherRunning : Boolean;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _gatherTarget:int=0;
		private var _otherType:int;
		public function GatherAutoManager()
		{
			_gTimer = new GameTimer("GatherAutoManager", 500, 0, onUpdate);
			_isGatherRunning = false;
			_isBroken = false;
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
		}
		
		
		public function startGatherAuto(tar:int=0,taskType:int=1) : void
		{
			_gatherTarget=tar;
			_otherType=taskType;
			_stateMachine.transition(AIStateType.AI_NONE);
			//changeSub();
			//TrusteeshipManager.getInstance().stopAutoFight();
			//TrusteeshipManager.getInstance().stopFightTarget();
			if(!_isGatherRunning)
			{
				_gTimer.start();
				_isGatherRunning = true;
				_isBroken = false;
				TweenLite.killDelayedCallsTo(onDelayedUnbroken);
				onUpdate(true);
			}
			
			
		}
		public function broken() : void
		{
			if (!_isGatherRunning)
				return;
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(0.5, onDelayedUnbroken);
		}
		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}
		public function stopGatherAuto() : void
		{
			if (!_isGatherRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			stop();
		}
		private function stop() : void
		{
			_isBroken = false;
			_isGatherRunning = false;
			_gTimer.reset();
			_gTimer.stop();
			_stateMachine.transition(AIStateType.AI_NONE);
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
		}
		
		private function onUpdate(force : Boolean = false) : void
		{
			if (!_isGatherRunning)
				return;
			if (_isBroken)
				return;
			
			_stateMachine.transition(AIStateType.TASK_GATHER, null, force);
		}
		
		public function get isGatherRunning():Boolean
		{
			return _isGatherRunning;
		}
		
		public function set isGatherRunning(value:Boolean):void
		{
			_isGatherRunning = value;
		}
		
		
		public function get gatherTarget():int
		{
			return _gatherTarget;
		}
		
		public function set gatherTarget(value:int):void
		{
			_gatherTarget = value;
		}
		
		public function setGatherChange():void
		{
			if (!_isGatherRunning)
				return;
			
			var missionType:int=TaskMissionManager.getTaskMissionType(otherType);
			if(missionType==TaskType.SUB_GATHER)
			{
				if(!TaskMissionManager.getTaskIsFinishByType(otherType))
				{
					_stateMachine.transition(AIStateType.AI_NONE);
				}
				
			}
			else if(missionType==TaskType.SUB_USEITEM)
			{
				if(TaskMissionManager.getTaskIsFinishByType(otherType))
				{
					TaskControl.hideBagPanel();
				}
				else
				{
					_stateMachine.transition(AIStateType.AI_NONE);
				}
			}
			
		}
		
		private function changeSub():void
		{
			
		}

		public function get otherType():int
		{
			return _otherType;
		}

		public function set otherType(value:int):void
		{
			_otherType = value;
		}

	}
}


