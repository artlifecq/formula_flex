package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	* 自动任务托管管理器
	* @author YT
	*/
	public class TaskAutoManager
	{
		private static var _instance : TaskAutoManager;
		public static function getInstance() : TaskAutoManager
		{
			if (!_instance)
			{
				_instance = new TaskAutoManager();
			}
			return _instance;
		}

		
		private var _gTimer : GameTimer;
		private var _isTaskRunning : Boolean;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _taskTarget:int=0;
		public static var AUTOLVE:int=30;
		public static var AUTOIDE:int=90;
		public function TaskAutoManager()
		{
			if(GlobalSheetData.getSettingInfo(511)!=null)
			{
				AUTOLVE=GlobalSheetData.getSettingInfo(511).q_int_value;
			}
			if(GlobalSheetData.getSettingInfo(512)!=null)
			{
				AUTOIDE=GlobalSheetData.getSettingInfo(512).q_int_value*2;
			}
			_gTimer = new GameTimer("TaskAutoManager", 500, 0, onUpdate);
			_isTaskRunning = false;
			_isBroken = false;
			AppDispather.instance.addEventListener( AppEvent.APP_HIDE, onApphide );
			
		}
		private function onApphide( ev:AppEvent ):void
		{
			if(ev.appInfo.appName=="role.RolePanel"&&TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_USEITEM&&!TaskMissionManager.getMainTaskIsFinish())
			{
				stopTaskAuto();
			}
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
			_gTimer.reset();
			_gTimer.start();
		}
		
		
		public function startTaskAuto(tar:int=0) : void
		{
			testStopKey=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			_taskTarget=tar;
			changeSub();
			TrusteeshipManager.getInstance().stopAll();
			if(!_isTaskRunning)
			{
				_isTaskRunning = true;
				_isBroken = false;
				TweenLite.killDelayedCallsTo(onDelayedUnbroken);
				onUpdate(true);
			}
			
			
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
		public function stopTaskAuto() : void
		{
			TrusteeshipManager.getInstance().stopAll();
			GatherAutoManager.getInstance().stopGatherAuto();
			/*if (!_isTaskRunning)
				return;*/
			_isBroken = false;
			_isTaskRunning = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			//stop();
		}
		public function stop() : void
		{
			_gTimer.reset();
			_gTimer.stop();
			
		}

		private function onUpdate(force : Boolean = false) : void
		{
			
			if (!_isTaskRunning)
			{
				techState();
				return;
			}
				
			if (_isBroken)
				return;
			
			_stateMachine.transition(AIStateType.TASK_WALK, null, force);
		}
		
		
		private var _techSta:int=0;
		private function techState():void
		{
			if(testStopKey)
				return;
			if(!TaskMissionManager.haveMainTask)
				return;
			if(MainRoleManager.actorInfo.totalStat.level>AUTOLVE)
				return;
			if(MainRoleManager.actor.stateMachine.isIdle)
			{
				_techSta++;
				if(_techSta>=AUTOIDE)
				{
					_techSta=0;
					startTaskAuto();
				}
			}
			else
			{
				_techSta=0;
			}
		}
		
		
		public function get isTaskRunning():Boolean
		{
			return _isTaskRunning;
		}
		
		public function set isTaskRunning(value:Boolean):void
		{
			_isTaskRunning = value;
		}
		
		
		public function get taskTarget():int
		{
			return _taskTarget;
		}

		public function set taskTarget(value:int):void
		{
			_taskTarget = value;
		}
		
		public function setTaskChange():void
		{
			if (!_isTaskRunning)
				return;
			if(TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_GATHER||TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_USEITEM)
			{
				GatherAutoManager.getInstance().setGatherChange();
			}
			if(TaskMissionManager.getMainTaskSubIsFinish(_taskTarget))
			{
				//taskFlishArr[_taskTarget]=true;
				changeSub();
				TrusteeshipManager.getInstance().stopAll();
				GatherAutoManager.getInstance().stopGatherAuto();
				SceneRoleSelectManager.selectedRole=null;
				_stateMachine.transition(AIStateType.AI_NONE);
			}
			
		}
		
		private function changeSub():void
		{
			if(!TaskMissionManager.getMainTaskSubIsFinish(_taskTarget))
			return;
			_taskTarget=0;
			var i:int,length:int;
			length=TaskMissionManager.getMainTaskSubNum();
			for(i=0;i<length;i++)
			{
				if(!TaskMissionManager.getMainTaskSubIsFinish(i))
				{
					_taskTarget=i;
					break;
				}
			}
			
		}
		
		public function taskLevel(level:int):void
		{
			if(level<0)
			{
				AUTOLVE=GlobalSheetData.getSettingInfo(511).q_int_value;
			}
			else
			{
				AUTOLVE=level;
				
			}
			testStopKey=false;
		}
		private var testStopKey:Boolean=true;
		
	}
}