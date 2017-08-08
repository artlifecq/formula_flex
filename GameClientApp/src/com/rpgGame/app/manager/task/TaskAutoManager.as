package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.app.AppManager;
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
		//private var _isOtherTaskRunning : Boolean;
		//private var _isAutoing:Boolean=false;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _taskTarget:int=0;
		private var _otherType:int;
		public static var AUTOLVE:int=100;
		public static var AUTOMAIN:int=60000;//拉主线任务时间
		public static var AUTOTREASEUER:int=120000;//拉环式任务时间
		public static var PANLVE:int=30;//任务面板切换等级
		
		public function TaskAutoManager()
		{
			
			_gTimer = new GameTimer("TaskAutoManager", 500, 0, onUpdate);
			_isTaskRunning = false;
			_isBroken = false;
			
			AppDispather.instance.addEventListener( AppEvent.APP_HIDE, onApphide );
			
			EventManager.addEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.addEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			
			
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
			
			resetTechTime();
			AUTOLVE=GlobalSheetData.getSettingInfo(511)!=null?GlobalSheetData.getSettingInfo(511).q_int_value:100;
			AUTOMAIN=GlobalSheetData.getSettingInfo(512)!=null?GlobalSheetData.getSettingInfo(512).q_int_value*1000:10*1000;
			AUTOTREASEUER=GlobalSheetData.getSettingInfo(521)!=null?GlobalSheetData.getSettingInfo(521).q_int_value*1000:20*1000;
			PANLVE=GlobalSheetData.getSettingInfo(533)!=null?GlobalSheetData.getSettingInfo(533).q_int_value:30;
			
		}
		private function onApphide( ev:AppEvent ):void
		{
			if(ev.appInfo.appName=="role.RolePanel"&&TaskMissionManager.getMainTaskMissionType()==TaskType.SUB_USEITEM&&!TaskMissionManager.getMainTaskIsFinish())
			{
				stopTaskAuto();
			}
		}
		
		public function startSwitchTaskAuto(tar:int=0) : void
		{
			resetTechTime();
			_gTimer.reset();
			_gTimer.start();
			/*return;
			if(!_isAutoing)
				startTaskAuto(tar);*/
		}
		
		public function startTaskAuto(type:int,tar:int=0) : void
		{
			
			testStopKey=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			_otherType=type;
			_taskTarget=tar;
			changeSub();
			TrusteeshipManager.getInstance().stopAll();
			SceneRoleSelectManager.selectedRole=null;
			resetTechTime();
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
		public function stopSwitchAll() : void
		{
			stop();
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
			if (!_isTaskRunning)
				return;
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
			techState();
			if (!_isTaskRunning)
			{
				
				return;
			}
			if (_isBroken)
				return;
			if (_isTaskRunning)
			{
				_stateMachine.transition(AIStateType.TASK_WALK, null, force);
			}
			
		}
		public var jumpOver:Boolean=false;
		public var actTaskMonster:Boolean=false;
		private var _techTime:int=0;
		private function resetTechTime():void
		{
			_techTime=getTimer();
		}
		private function techState():void
		{
			if(testStopKey)
				return;
			if(MainRoleManager.actorInfo.totalStat.level>AUTOLVE)
				return;
			if(MapDataManager.getMapInfo(MainRoleManager.actorInfo.mapID).mapType!=EnumMapType.MAP_TYPE_NORMAL)
				return;
			
			if(istech())
			{
				if(TaskMissionManager.treasuerCheck&&TaskMissionManager.haveTreasuerTask)
				{
					if((getTimer()-_techTime)>=AUTOTREASEUER)
					{
						resetTechTime();
						startTaskAuto(TaskType.MAINTYPE_TREASUREBOX);
					}
				}
				else if(TaskMissionManager.haveMainTask&&TaskMissionManager.flashMainTaskId!=TaskMissionManager.mainTaskInfo.taskId)
				{
					if((getTimer()-_techTime)>=AUTOMAIN)
					{
						resetTechTime();Lyt.a("startTaskAuto1");
						startTaskAuto(TaskType.MAINTYPE_MAINTASK);
					}
					
				}
			}
			else
			{
				resetTechTime();
			}
			
			
			
		}
		private var traceKey:int;
		private function istech():Boolean
		{
			if(isOpenPanel())
			{//Lyt.a("istech-1");
				//if(traceKey!=-1){Lyt.a("istech-1");traceKey=-1;}
				return false;
			}
			if(TrusteeshipManager.getInstance().isAutoing&&!actTaskMonster)
			{//if(traceKey!=1){Lyt.a("istech1");traceKey=1;}
				return true;
			}
			if(MainRoleManager.actor.stateMachine.isIdle&&!isTasking)
			{//if(traceKey!=2){Lyt.a("istech2");traceKey=2;}
				return true;
			}
			if(MainRoleManager.actor.stateMachine.isIdle&&isTasking)
			{//if(traceKey!=3){Lyt.a("istech3");traceKey=3;}
				return true;
			}
			//if(traceKey!=-2){Lyt.a("istech-2");traceKey=-2;}
			return false;
		}
		
		/**新任务*/
		private function newMation(type:int):void
		{
			TaskAutoManager.getInstance().jumpOver=false;
			_stateMachine.transition(AIStateType.AI_NONE);
		}
		
		
		/**任务进度改变*/
		private function changeMation(type:int):void
		{
			if(TaskMissionManager.getTaskIsFinishByType(type))
			{
				if(!isTaskRunning||type!=otherType)
				{
					taskKilled(type);
				}
			}
			if(isTaskRunning)
			{
				setTaskChange();
			}
			
			
		}
		
		public function setTaskChange():void
		{
			if(TaskMissionManager.getTaskSubIsFinish(otherType,taskTarget))
			{
				//taskFlishArr[_taskTarget]=true;
				//Lyt.a("setTaskChange:"+otherType+":"+taskTarget);
				changeSub();
				TrusteeshipManager.getInstance().stopAll();
				GatherAutoManager.getInstance().stopGatherAuto();
				SceneRoleSelectManager.selectedRole=null;
				TweenLite.killDelayedCallsTo(startTaskAuto);
				TweenLite.delayedCall(1, startTaskAuto,[otherType]);
			}
			var missionType:int=TaskMissionManager.getTaskMissionType(otherType);
			if(missionType==TaskType.SUB_GATHER||missionType==TaskType.SUB_USEITEM)
			{
				GatherAutoManager.getInstance().setGatherChange();
			}
			
			
		}
		
		private function changeSub():void
		{
			if(TaskMissionManager.getTaskIsFinishByType(otherType))
				return;
			_taskTarget=0; 
			var i:int,length:int;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(otherType);
			if(taskData!=null)
			{
				var information:String=taskData.q_finish_information_str;
				var informationList:Array=JSONUtil.decode(information);
				if(informationList)
				{
					length=informationList.length;
					for(i=0;i<length;i++)
					{
						if(!TaskMissionManager.getTaskSubIsFinish(otherType,i))
						{
							_taskTarget=i;
							break;
						}
					}
				}
				
			}
		}
		
		public function taskFilshed(taskType:int):void
		{
			switch(taskType)
			{
				case TaskType.MAINTYPE_MAINTASK:
					TaskMissionManager.getTaskHaveNpc(taskType)?TaskControl.showLeadPanel():TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
				case TaskType.MAINTYPE_DAILYTASK:
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
				case TaskType.MAINTYPE_TREASUREBOX:
					TaskControl.showLoopPanel();
					break;
				case TaskType.MAINTYPE_GUILDDAILYTASK:
					TaskMissionManager.getTaskHaveNpc(taskType)?TaskControl.showGuildPanel():TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
					break;
				case TaskType.LIJIN_TASK:
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
					break;
			}
		}
		public function taskKilled(taskType:int):void
		{
			switch(taskType)
			{
				case TaskType.MAINTYPE_MAINTASK:
					if(!TaskMissionManager.getTaskHaveNpc(taskType))
					{
						TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					}
					break;
				case TaskType.MAINTYPE_DAILYTASK:
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
				case TaskType.MAINTYPE_TREASUREBOX:
					TaskControl.showLoopPanel();
					break;
				case TaskType.MAINTYPE_GUILDDAILYTASK:
					if(!TaskMissionManager.getTaskHaveNpc(taskType))
					{
						TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					}
					break;
				case TaskType.LIJIN_TASK:
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
					break;
			}
		}
		
		private function isOpenPanel():Boolean
		{
			if (AppManager.isAppInScene(AppConstant.TASK_LEAD_PANEL))
			{
				return true;
			}
			if (AppManager.isAppInScene(AppConstant.TASK_LOOP_PANEL))
			{
				return true;
			}
			if (AppManager.isAppInScene(AppConstant.TASK_GUILD_PANEL))
			{
				return true;
			}
			return false;
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
		public function get isTasking():Boolean
		{
			return _isTaskRunning;
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