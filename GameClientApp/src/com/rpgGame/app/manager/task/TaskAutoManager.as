package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import flash.utils.getTimer;
	
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
		private var _isOtherTaskRunning : Boolean;
		private var _isAutoing:Boolean=false;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _taskTarget:int=0;
		private var _otherType:int;
		public static var AUTOLVE:int=100;
		public static var AUTOMAIN:int=60000;//拉主线任务时间
		public static var AUTOTREASEUER:int=120000;//拉环式任务时间
		public function TaskAutoManager()
		{
			
			_gTimer = new GameTimer("TaskAutoManager", 500, 0, onUpdate);
			_isTaskRunning = false;
			_isOtherTaskRunning =false;
			_isBroken = false;
			
			AppDispather.instance.addEventListener( AppEvent.APP_HIDE, onApphide );
			EventManager.addEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
			_gTimer.reset();
			_gTimer.start();
			_techSta=getTimer();
			if(GlobalSheetData.getSettingInfo(511)!=null)
			{
				//AUTOLVE=GlobalSheetData.getSettingInfo(511).q_int_value;
			}
			if(GlobalSheetData.getSettingInfo(512)!=null)
			{
				AUTOMAIN=GlobalSheetData.getSettingInfo(512).q_int_value*1000;
			}
			if(GlobalSheetData.getSettingInfo(521)!=null)
			{
				AUTOTREASEUER=GlobalSheetData.getSettingInfo(521).q_int_value*1000;
			}
		}
		private function onApphide( ev:AppEvent ):void
		{
			if(ev.appInfo.appName=="role.RolePanel"&&TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_USEITEM&&!TaskMissionManager.getMainTaskIsFinish())
			{
				stopTaskAuto();
			}
		}
		/**任务进度改变*/
		private function changeMation(type:int):void
		{
			if (!_isTaskRunning&&!_isOtherTaskRunning)
				return;
			setTaskChange();
		}
		
		public function startSwitchTaskAuto(tar:int=0) : void
		{
			if(!_isAutoing)return;
			startTaskAuto(tar);
		}
		
		public function startTaskAuto(tar:int=0) : void
		{
			
			testStopKey=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			_taskTarget=tar;
			_otherType=1;
			changeSub();
			TrusteeshipManager.getInstance().stopAll();
			SceneRoleSelectManager.selectedRole=null;
			if(!_isTaskRunning)
			{
				_isTaskRunning = true;
				_isOtherTaskRunning=false;
				_isAutoing=true;
				_isBroken = false;
				TweenLite.killDelayedCallsTo(onDelayedUnbroken);
				onUpdate(true);
			}
			
			
		}
		public function startOtherTaskAuto(type:int,tar:int=0) : void
		{
			
			testStopKey=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			_taskTarget=tar;
			_otherType=type;
			//changeSub();
			TrusteeshipManager.getInstance().stopAll();
			SceneRoleSelectManager.selectedRole=null;
			if(!_isOtherTaskRunning)
			{
				
				_isOtherTaskRunning = true;
				_isTaskRunning=false;
				_isAutoing=true;
				_isBroken = false;
				TweenLite.killDelayedCallsTo(onDelayedUnbroken);
				onUpdate(true);
			}
			
		}
		public function broken() : void
		{
			if (!_isTaskRunning&&!_isOtherTaskRunning)
				return;
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(0.5, onDelayedUnbroken);
		}
		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}
		public function stopSwitchAll() : void
		{
			_isAutoing=_isTaskRunning||_isOtherTaskRunning;
			stopAll();
		}
		public function stopAll() : void
		{
			TrusteeshipManager.getInstance().stopAll();
			GatherAutoManager.getInstance().stopGatherAuto();
			stopTaskAuto();
			//EventManager.dispatchEvent(TaskEvent.AUTO_WALK_STOP);
		}
		public function stopTaskAuto() : void
		{
			_stateMachine.transition(AIStateType.AI_NONE);
			if (!_isTaskRunning&&!_isOtherTaskRunning)
			return;
			_isBroken = false;
			_isTaskRunning = false;
			_isOtherTaskRunning= false;
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
			
			if (!_isTaskRunning&&!_isOtherTaskRunning)
			{
				techState();
				return;
			}
			if (_isBroken)
				return;
			if (_isTaskRunning)
			{
				_stateMachine.transition(AIStateType.TASK_WALK, null, force);
			}
			else if(_isOtherTaskRunning)
			{
				_stateMachine.transition(AIStateType.TASK_OTHER_WALK, null, force);
			}
			
		}
		
		
		private var _techSta:int=0;
		private function techState():void
		{
			if(testStopKey)
				return;
			if(MainRoleManager.actorInfo.totalStat.level>AUTOLVE)
				return;
			if(MapDataManager.getMapInfo(MainRoleManager.actorInfo.mapID).mapType!=EnumMapType.MAP_TYPE_NORMAL)
				return;
			if(MainRoleManager.actor.stateMachine.isIdle||(TrusteeshipManager.getInstance().isAutoing))//站着的时候拉，挂机的时候也拉
			{
				if(TaskMissionManager.treasuerCheck&&TaskMissionManager.haveTreasuerTask)
				{
					if((getTimer()-_techSta)>=AUTOTREASEUER)
					{
						_techSta=getTimer();
						startOtherTaskAuto(TaskType.MAINTYPE_TREASUREBOX);
					}
				}
				else if(TaskMissionManager.haveMainTask)
				{
					if((getTimer()-_techSta)>=AUTOMAIN)
					{
						_techSta=getTimer();
						startTaskAuto();
					}
					
				}
			}
			else
			{
				_techSta=getTimer();
			}
		}
		
		public function get isTasking():Boolean
		{
			return _isTaskRunning||_isOtherTaskRunning;
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
			if (!_isTaskRunning&&!_isOtherTaskRunning)
				return;
			
			var missionType:int=TaskMissionManager.getTaskMissionType(otherType);
			if(missionType==TaskType.SUB_GATHER||missionType==TaskType.SUB_USEITEM)
			{
				GatherAutoManager.getInstance().setGatherChange();
			}
			if(TaskMissionManager.getTaskSubIsFinish(otherType,_taskTarget))
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
			if(TaskMissionManager.getTaskSubIsFinish(otherType,_taskTarget))
			return;
			_taskTarget=0;
			var i:int,length:int;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(otherType);
			if(taskData!=null)
			{
				var information:String=taskData.q_finish_information_str;
				var informationList:Array=JSONUtil.decode(information);
				length=informationList.length;
				for(i=0;i<length;i++)
				{
					if(TaskMissionManager.getTaskSubIsFinish(otherType,i))
					{
						_taskTarget=i;
						break;
					}
				}
			}
			
			
		}
		
		public function taskLevel(level:int):void
		{
			if(level==-1)
			{
				testStopKey=true;
			}
			else if(level==0)
			{
				AUTOLVE=GlobalSheetData.getSettingInfo(511).q_int_value;
				testStopKey=false;
			}
			else
			{
				AUTOLVE=level;
				testStopKey=false;
			}
			
		}

		public function get otherType():int
		{
			return _otherType;
		}

		public function set otherType(value:int):void
		{
			_otherType = value;
		}

		private var testStopKey:Boolean=false;
		
	}
}