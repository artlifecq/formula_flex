package com.rpgGame.app.manager.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.WelcomeManager;
	import com.rpgGame.app.manager.chat.ChatManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppDispather;
	import com.rpgGame.core.app.AppEvent;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.type.chat.EnumChatChannelType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	* 自动任务托管管理器
	* @author YT
	*/
	public class TaskAutoManager
	{
		
		public static var AUTOLVE:int=100;
		public static var AUTODUNGEON:int=200000;//拉主线任务时间
		public static var AUTOMAIN:int=60000;//拉主线任务时间
		public static var AUTOTREASEUER:int=120000;//拉环式任务时间
		public static var PANLVE:int=30;//任务面板切换等级
		public static var FLYTIME:int=5;//任务面板切换等级
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
		private var _isTaskRunning : Boolean=false;
		private var _taskType:int;
		private var _taskTarget:int=0;
		private var _missionType:int
		private var _isBroken : Boolean=false;
		public var jumpOver:Boolean=false;
		private var techTime:Number;
		public var actTaskMonster:Boolean=false;
		
		public function TaskAutoManager()
		{
			_gTimer = new GameTimer("TaskAutoManager", 1000, 0, onUpdate);
		}
		public function setup(role : SceneRole) : void
		{
			AUTOLVE=GlobalSheetData.getSettingInfo(511)!=null?GlobalSheetData.getSettingInfo(511).q_int_value:100;
			AUTOMAIN=GlobalSheetData.getSettingInfo(512)!=null?GlobalSheetData.getSettingInfo(512).q_int_value*1000:10*1000;
			AUTOTREASEUER=GlobalSheetData.getSettingInfo(521)!=null?GlobalSheetData.getSettingInfo(521).q_int_value*1000:20*1000;
			PANLVE=GlobalSheetData.getSettingInfo(533)!=null?GlobalSheetData.getSettingInfo(533).q_int_value:30;
			FLYTIME=GlobalSheetData.getSettingInfo(534)!=null?GlobalSheetData.getSettingInfo(534).q_int_value:5;
			AUTODUNGEON=GlobalSheetData.getSettingInfo(535)!=null?GlobalSheetData.getSettingInfo(535).q_int_value*1000:20000;
			
			
			AppDispather.instance.addEventListener( AppEvent.APP_HIDE, onApphide );
			EventManager.addEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.addEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			EventManager.addEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.addEvent(MapEvent.MAP_FLY_COMPLETE,flyComplete);
			EventManager.addEvent(UserMoveEvent.MOVE_ENTER, resetTechTime);
			EventManager.addEvent(MapEvent.MAP_CLICK, resetTechTime);
			resetTechTime();
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
		}
		public function stopSwitchAll() : void
		{
			stop();
		}
		public function startTaskAuto(type:int,tar:int=0) : void
		{
			broken();
			_taskType=type;
			_taskTarget=tar;
			missionType=TaskMissionManager.getTaskDataByType(taskType).q_mission_type;
			changeSub();
			TrusteeshipManager.getInstance().stopAll();
			_isTaskRunning = true;
			resetTechTime();
			taskWalk();
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
			_taskType=0;
			_taskTarget=0;
			_isTaskRunning = false;
			//stop();
		}
		public function stop() : void
		{
			_gTimer.reset();
			_gTimer.stop();
			
		}

		
		private function resetTechTime():void
		{
			techTime=SystemTimeManager.curtTm;
		}
		private function onUpdate():void
		{
			
//			return ;
			if(istech())
			{
				if(TaskMissionManager.treasuerCheck&&TaskMissionManager.haveTreasuerTask)
				{
					if((SystemTimeManager.curtTm-techTime)>=AUTOTREASEUER)
					{
						startTaskAuto(TaskType.MAINTYPE_TREASUREBOX);
					}
				}
				else if(TaskMissionManager.guildCheck&&TaskMissionManager.haveGuildTask)
				{
					if((SystemTimeManager.curtTm-techTime)>=AUTOTREASEUER)
					{
						startTaskAuto(TaskType.MAINTYPE_GUILDDAILYTASK);
					}
				}
				else if(TaskMissionManager.haveMainTask&&TaskMissionManager.flashMainTaskId!=TaskMissionManager.mainTaskInfo.taskId)
				{
					if((SystemTimeManager.curtTm-techTime)>=AUTOMAIN)
					{
						startTaskAuto(TaskType.MAINTYPE_MAINTASK);
					}
					
				}
			}
			else
			{
				resetTechTime();
			}
		}
		private function istech():Boolean
		{
			if(testStopKey)
			{
				return false;
			}
			if(MainRoleManager.actorInfo.totalStat.level>AUTOLVE)
			{
				return false;
			}
			if(!WelcomeManager.isDestory)//处在欢迎页阶段的时候不拉
			{
				return false;
			}
			if(MapDataManager.getMapInfo(MainRoleManager.actorInfo.mapID).mapType!=EnumMapType.MAP_TYPE_NORMAL)
			{
				return false;
			}
			if(TaskMissionManager.noMainTaskId>0)
			{
				return false;
			}
			
			if(HuBaoManager.instance().ishuing)//押镖状态不拉
			{
				return false;
			}
			
			if(taskType==TaskType.MAINTYPE_WORSHIP&&AppManager.isAppInScene(AppConstant.WORSHIP_PANLE))
			{
				return false;
			}
			if(taskType==TaskType.MAINTYPE_DAILYTASK)
			{
				if(AppManager.isHaveAppShowing())
				{
					return false;
				}
				else
				{
					taskType=0;
				}
			}
			if(missionType==TaskType.SUB_QUIT_ZONE&&AppManager.isAppInScene(AppConstant.MULTY_PANL))
			{
				return false;
			}
			if(isOpenPanel())
			{//Lyt.a("istech-1");
				//if(traceKey!=-1){Lyt.a("istech-1");traceKey=-1;}
				return false;
			}
			if(TrusteeshipManager.getInstance().isAutoing&&!actTaskMonster)
			{//if(traceKey!=1){Lyt.a("istech1");traceKey=1;}
				actTaskMonster=false;
				return true;
			}
			if(MainRoleManager.actor.stateMachine.isIdle)
			{//if(traceKey!=2){Lyt.a("istech2");traceKey=2;}
				return true;
			}
			//if(traceKey!=-2){Lyt.a("istech-2");traceKey=-2;}
			return false;
		}
		/**飞鞋完成*/
		private function flyComplete():void
		{
			EventManager.dispatchEvent(TaskEvent.AUTO_WALK_STOP);
			HuBaoManager.instance().onHuBaoHandler();
			if(TaskMissionManager.flyTaskType>0)
			{
				var postPath:Array=TaskMissionManager.getTaskPathingByType(TaskMissionManager.flyTaskType,0);
				if(postPath[0]==SceneSwitchManager.currentMapId&&Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(postPath[1],-Math.abs(postPath[2])))<100)
				{
					taskType=TaskMissionManager.flyTaskType;
					missionType=TaskMissionManager.flyMissionType;
					TaskMissionManager.flyTaskType=0;
					TaskMissionManager.flyMissionType=0;
					TweenLite.killDelayedCallsTo(flyOnArrive);
					TweenLite.delayedCall(1, flyOnArrive);
				}
			}
		}
		private function flyOnArrive():void
		{
			if(TaskMissionManager.getTaskIsFinishByType(taskType))
			{
				taskFilshed();
			}
			else
			{
				gotoTaskonArrive();
			}
		}
		/**新任务*/
		private function newMation(type:int):void
		{
			jumpOver=false;
			//taskWalk();
			if(!isTaskRunning)
			{
				startTaskAuto(type);
			}
			
		}
		/**完成任务*/
		private function finishMation(type:int):void
		{
			stopAll();
		}
		/**任务进度改变*/
		private function changeMation(type:int):void
		{
			if(TaskMissionManager.getTaskIsFinishByType(type))
			{
				if(!isTaskRunning||type!=taskType)
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
			if(missionType==TaskType.SUB_GATHER||missionType==TaskType.SUB_USEITEM)
			{
				GatherAutoManager.getInstance().setGatherChange();
			}
			if(TaskMissionManager.getTaskSubIsFinish(taskType,taskTarget))
			{
				changeSub();
				TrusteeshipManager.getInstance().stopAll();
				GatherAutoManager.getInstance().stopGatherAuto();
				SceneRoleSelectManager.selectedRole=null;
				startTaskAuto(taskType);
				
			}
			//var missionType:int=TaskMissionManager.getTaskMissionType(taskType);
			
			
			
		}
		
		private function changeSub():void
		{
			if(TaskMissionManager.getTaskIsFinishByType(taskType))
				return;
			_taskTarget=0; 
			var i:int,length:int;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(taskType);
			if(taskData!=null)
			{
				var information:String=taskData.q_finish_information_str;
				var informationList:Array=JSONUtil.decode(information);
				if(informationList)
				{
					length=informationList.length;
					for(i=0;i<length;i++)
					{
						if(!TaskMissionManager.getTaskSubIsFinish(taskType,i))
						{
							_taskTarget=i;
							break;
						}
					}
				}
				
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
		public function taskWalk() : void
		{
			
			if(TaskMissionManager.getTaskIsFinishByType(taskType))
			{
				if(TaskMissionManager.getTaskHaveNpc(taskType))
				{
					walkORjump(1);
				}
				else
				{
					taskFilshed();
				}
			}
			else
			{
				walkORjump(2);
			}
		}
		private function walkORjump(key:int):void
		{
			if((taskType==TaskType.MAINTYPE_TREASUREBOX&&TaskMissionManager.treasuerCheck)||(taskType==TaskType.MAINTYPE_GUILDDAILYTASK&&TaskMissionManager.guildCheck))//环式或帮会任务
			{
				if(Mgr.vipMgr.isVip||BackPackManager.instance.haveItemById(601))//vip或有飞鞋
				{
					var postPath:Array=TaskMissionManager.getTaskPathingByType(taskType,0);
					if(postPath&&postPath.length>0)
					{
						TaskUtil.postTaskFly(postPath,taskType,TaskUtil.getSubtypeByType(taskType));
						return;
					}
				}
			}
			
			
			var post:Array;
			if(!jumpOver)//新任务没跳才跳
			{
				post=TaskMissionManager.getJumpPos(taskType);
			}
			
			switch(key)
			{
				case 1:
					if(post!=null)
					{
						TaskUtil.postTaskJump(post,gotoNpc);
					}
					else
					{
						gotoNpc();
					}
					break;
				case 2:
					if(post!=null)
					{
						TaskUtil.postTaskJump(post,gotoTask);
					}
					else
					{
						gotoTask();
					}
					break;
			}
			
		}
		
		private function gotoNpc(data :Object=null):void
		{
			TaskUtil.npcTaskWalk(TaskMissionManager.getTaskNpcAreaId(taskType),onArrive);
			
		}
		
		
		private function gotoTask(data :Object=null):void
		{
			
			var postPath:Array=TaskMissionManager.getTaskPathingByType(taskType,taskTarget);
			switch(missionType)
			{
				case TaskType.SUB_CONVERSATION:
					TaskUtil.postTaskWalk(postPath,onArrive);
					break;
				case TaskType.SUB_MONSTER:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive,null,true);
					break;
				case TaskType.SUB_ITEM:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive,null,true);
					break;
				case TaskType.SUB_GATHER:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive);
					break;
				case TaskType.SUB_USEITEM:
					GatherAutoManager.getInstance().startGatherAuto(TaskUtil.getMonsterByType(taskType,taskTarget));
					break;
				case TaskType.SUB_SPEAK:
					TaskUtil.postTaskWalk(postPath,gotoTaskonArrive);
					break;
				case TaskType.SUB_QUIT_ZONE:
					FunctionOpenManager.openPanelBypanelId(int(TaskMissionManager.getTaskDataByType(taskType).q_emid));
					TweenLite.killDelayedCallsTo(teamMatchVote);
					TweenLite.delayedCall(5, teamMatchVote);
					break;
				default:
					FunctionOpenManager.openPanelBypanelId(int(TaskMissionManager.getTaskDataByType(taskType).q_emid));
					break;
			}
			
		}
		private function gotoTaskonArrive(data :Object=null):void
		{
			
			jumpOver=true;
			SceneRoleSelectManager.selectedRole=null;
			switch(missionType)
			{
				case TaskType.SUB_CONVERSATION:
					
					break;
				case TaskType.SUB_MONSTER:
					TrusteeshipManager.getInstance().startAutoFight();
					break;
				case TaskType.SUB_ITEM:
					TrusteeshipManager.getInstance().startAutoFight();
					break;
				case TaskType.SUB_GATHER:
					var modeid:int=TaskUtil.getMonsterByType(taskType,taskTarget);
					GatherAutoManager.getInstance().startGatherAuto(modeid,taskType);
					break;
				case TaskType.SUB_USEITEM:
					
					break;
				case TaskType.SUB_SPEAK:
					var speak:String=TaskMissionCfgData.substitute(TaskMissionManager.getOtherTaskData(taskType).q_describe,MainRoleManager.actorInfo.guildName);
					//ChatManager.reqSendChat(speak,EnumChatChannelType.CHAT_CHANNEL_WORLD);
					TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
			}
			
		}
		private function onArrive(data :Object) : void
		{
			taskFilshed();
		}
		private function taskFilshed():void
		{
			switch(taskType)
			{
				case TaskType.MAINTYPE_MAINTASK:
					TaskMissionManager.getTaskHaveNpc(taskType)?TaskControl.showLeadPanel():TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
					break;
				case TaskType.MAINTYPE_DAILYTASK:
					//TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
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
		private function taskKilled(taskType:int):void
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
					//TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);
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
		public function broken() : void
		{
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(1, onDelayedUnbroken);
		}
		private function teamMatchVote():void
		{
			if(DungeonManager.teamZid==0&&AppManager.isAppInScene(AppConstant.MULTY_PANL))
			{
				var zid:int=TaskUtil.getMonsterByType(taskType,0);
				DungeonSender.reqTeamMatchVote(zid,1);
				EventManager.dispatchEvent(DungeonEvent.ZONE_TEAM_TIME,0);
			}
			
		}
		
		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}
		
		
		/////////////////////////////////////////////////////////////////////////////
		public function taskLevel(level:int):void
		{
			if(level==-1)
			{
				testStopKey=true;
				NoticeManager.textNotify(NoticeManager.CHAT_GONGGAO,"关闭拉自动任务");
			}
			else if(level==0)
			{
				AUTOLVE=GlobalSheetData.getSettingInfo(511).q_int_value;
				testStopKey=false;
				NoticeManager.textNotify(NoticeManager.CHAT_GONGGAO,"开启拉自动任务："+AUTOLVE);
			}
			else
			{
				AUTOLVE=level;
				testStopKey=false;
				NoticeManager.textNotify(NoticeManager.CHAT_GONGGAO,"开启拉自动任务："+AUTOLVE);
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
		public function get taskType():int
		{
			return _taskType;
		}

		public function set taskType(value:int):void
		{
			_taskType = value;
		}

		public function get missionType():int
		{
			return _missionType;
		}

		public function set missionType(value:int):void
		{
			_missionType = value;
		}

		public function get isBroken():Boolean
		{
			return _isBroken;
		}

		public function set isBroken(value:Boolean):void
		{
			_isBroken = value;
		}


		private var testStopKey:Boolean=false;
		
	}
}