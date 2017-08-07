package com.rpgGame.app.ui.main.taskbar
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	public class TaskControl
	{
		/*public static static var _instance : TaskControl;
		
		public static function getInstance() : TaskControl
		{
		if (!_instance)
		{
		_instance = new TaskControl();
		}
		return _instance;
		}*/
		
		
		public function TaskControl()
		{
		}
		
		public static function showLeadPanel():void
		{
			/*if (!AppManager.isAppInScene(AppConstant.TASK_LEAD_PANEL))
			{
				AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
			}*/
			AppManager.showAppNoHide(AppConstant.TASK_LEAD_PANEL);
		}
		public static function hideLeadPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LEAD_PANEL);
		}
		public static function showLoopPanel():void
		{
			AppManager.showAppNoHide(AppConstant.TASK_LOOP_PANEL);
		}
		public static function hideLoopPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LOOP_PANEL);
		}
		public static function showGuildPanel():void
		{
			AppManager.showAppNoHide(AppConstant.TASK_GUILD_PANEL);
		}
		
		public static function hideGuildPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_GUILD_PANEL);
		}
		public static function showBagPanel():void
		{
			if (!AppManager.isAppInScene(AppConstant.ROLE_PANEL))
			{
				AppManager.showApp(AppConstant.ROLE_PANEL);
			}
			
		}
		public static function hideBagPanel():void
		{
			AppManager.hideApp(AppConstant.ROLE_PANEL);
			
		}
		
		public static function guideBut(num:int):void
		{
			var task:Vector.<TaskInfo>=TaskMissionManager.getGuideTaskInfo();
			var taskInfo:TaskInfo;
			var taskData:Q_mission_base;
			if(task.length>num)
			{
				taskInfo=task[num];
			}
			if(taskInfo)
			{
				taskData=TaskMissionCfgData.getTaskByID(taskInfo.taskModelId);
			}
			if(taskData&&taskData.q_emid!="")
			{Lyt.a("emid:"+taskData.q_emid);
				FunctionOpenManager.openAppPaneById(taskData.q_emid);
			}
			
		}
		/**目标按钮任务处理*/
		public static function killWalkBut(type:int,num:int,key:int):void
		{
			
			if(type==TaskType.MAINTYPE_MAINTASK&&TaskMissionManager.noMainTaskId!=0)//卡级
			{
				var add:int=1;
				if(FunctionOpenManager.checkOpenBuyFunId(EmFunctionID.EM_ZHANHUN))
				{
					add--;
				}
				add+=num;
				if(add==0)//打开战魂面板
				{
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_ZHANHUN);
				}
				else if(add==1)
				{
					var post:Array=TaskMissionCfgData.getSuggestPotByLevel(MainRoleManager.actorInfo.totalStat.level);
					if(post)
					{
						if(key==1)
						{
							TaskUtil.postTaskWalk(post,startFight,null,true);
						}
						else
						{
							TaskUtil.postTaskFly(post,0,TaskType.SUB_MONSTER);
						}
					}
				}
				return;
			}
			
			if(key==1&&type==TaskType.MAINTYPE_MAINTASK/*&&MainRoleManager.actorInfo.totalStat.level<=TaskAutoManager.AUTOLVE*/)//
			{
				TaskAutoManager.getInstance().startTaskAuto(type,num);
				return;
			}
			if(key==1&&(type==TaskType.MAINTYPE_TREASUREBOX||type==TaskType.MAINTYPE_GUILDDAILYTASK))//
			{
				TaskAutoManager.getInstance().startTaskAuto(type,num);
				return;
			}
			
			if(type==TaskType.MAINTYPE_DAILYTASK&&TaskMissionManager.dailyTaskData.q_emid!="")//支线打开面板任务
			{
				var emidArr:Array=TaskMissionManager.dailyTaskData.q_emid.split(",");
				if(emidArr.length>num)
				{
					FunctionOpenManager.openAppPaneById(emidArr[num]);
				}
				return;
			}
			if(type==TaskType.MAINTYPE_DAILYTASK&&TaskUtil.getSubtypeByType(type)==TaskType.SUB_HUBAO)//支线护宝任务
			{
				TaskUtil.npcTaskFly(TaskMissionManager.getTaskNpcAreaId(type),type,TaskType.SUB_HUBAO);
				return;
			}
			
			if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_USEITEM&&!TaskUtil.getIsfinishByType(type))//是使用道具任务且没有完成
			{
				showBagPanel();
				return;
			}
			if(key==2)
			{
				var postPath:Array=TaskMissionManager.getTaskPathingByType(type,num);
				if(postPath&&postPath.length>0)
				{
					TaskUtil.postTaskFly(postPath,type,TaskUtil.getSubtypeByType(type));
				}
				return;
			}
			
			if(TaskUtil.getIsfinishByType(type))//任务完成
			{
				if(type==TaskType.MAINTYPE_MAINTASK)//主任务且主任务完成
				{
					if(TaskMissionManager.getMainTaskHaveNpc())
					{
						if(key==1)
						{
							TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk);
						}
						else
						{
							TaskUtil.npcTaskFly(TaskMissionManager.getMainTaskNpcAreaId(),type);
						}
					}
					else
					{
						//showLeadPanel();主线任务没有回复npc不弹框了
						TaskSender.sendfinishTaskMessage(TaskMissionManager.mainTaskInfo.taskId);	
					}
				}
				else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
				{
					if(TaskMissionManager.getMainTaskHaveNpc())
					{
						if(key==1)
						{
							TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk);
						}
						else
						{
							TaskUtil.npcTaskFly(TaskMissionManager.getMainTaskNpcAreaId(),type);
						}
					}
					else
					{
						//showLeadPanel();主线任务没有回复npc不弹框了
						TaskSender.sendfinishTaskMessage(TaskMissionManager.mainTaskInfo.taskId);	
					}
				}
					
			}
			else
			{
				if(type==TaskType.MAINTYPE_TREASUREBOX)// 环式任务寻怪取刷新点
				{
					var monsterId:int=TaskMissionManager.getTreasuerMonsterId(num);
					if(key==1)
					{
						TaskUtil.monsterTaskWalk(monsterId,startFight);
					}
					else
					{
						TaskUtil.monsterTaskFly(monsterId,type);
					}
					
				}
				else if(type==TaskType.MAINTYPE_DAILYTASK&&TaskMissionManager.dailyTaskData.q_emid!="")//支线打开面板任务
				{
					var emidArr:Array=TaskMissionManager.dailyTaskData.q_emid.split(",");
					if(emidArr.length>num)
					{
						FunctionOpenManager.openAppPaneById(emidArr[num]);
					}					
				}
				else//主线和支线的怪取配置坐标点
				{
					var postPath:Array=TaskMissionManager.getPathingByType(type,num);
					if(key==1)
					{
						var modeid:int=TaskUtil.getMonsterByType(type,num);
						var obj:Object=new Object();
						obj.subType=TaskUtil.getSubtypeByType(type);
						obj.modeid=modeid;
						if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_GATHER)//采集任务寻路完成开始采集
						{
							TaskUtil.postTaskWalk(postPath,walkStartGather,obj);
						}
						else
						{
							TaskUtil.postTaskWalk(postPath,startFight,null,true);
						}
					}
					else
					{
						TaskUtil.postTaskFly(postPath,type);
					}
				}
			}
		}
		
		
		
		
		
		
		/**追踪面板上寻路完成*/
		public static function finishWalk(data :Object):void
		{		
			if(TaskMissionManager.mainTaskData!=null&&TaskMissionManager.isMainTaskNpc(TaskMissionManager.getMainTaskNpcAreaId()))
			{
				showLeadPanel();
			}
		}
		/**飞鞋完成*/
		public static function flyComplete():void
		{		
			HuBaoManager.instance().onHuBaoHandler();
			
			if(TaskMissionManager.flyTaskType>0)
			{
				if(TaskMissionManager.flyTaskType!=TaskType.MAINTYPE_DAILYTASK)
				{
					TaskAutoManager.getInstance().startTaskAuto(TaskMissionManager.flyTaskType,TaskMissionManager.flyMissionType);
					TaskMissionManager.flyTaskType=0;
					TaskMissionManager.flyMissionType=0;
				}
				
				/*if(TaskMissionManager.flyTaskType==TaskType.MAINTYPE_DAILYTASK&&TaskMissionManager.flyMissionType==TaskType.SUB_HUBAO)
				{
					
				}
				else
				{
					TaskAutoManager.getInstance().startTaskAuto(TaskMissionManager.flyTaskType,TaskMissionManager.flyMissionType);
					TaskMissionManager.flyTaskType=0;
					TaskMissionManager.flyMissionType=0;
				}*/
			}
		}
		public static function taskFlishOk(taskType:int):void
		{
			if(taskType==TaskType.MAINTYPE_MAINTASK)
			{
				TaskControl.showLeadPanel();
			}
			else if(taskType==TaskType.MAINTYPE_DAILYTASK)
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
			}
			else if(taskType==TaskType.MAINTYPE_TREASUREBOX)
			{
				TaskControl.showLoopPanel();
			}
			else if(taskType==TaskType.LIJIN_TASK)
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(taskType).taskId);	
			}
			if(taskType==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				TaskControl.showGuildPanel();
			}
		}
		public static function taskFlishNot(taskType:int,missionType:int):void
		{
			if(missionType==TaskType.SUB_MONSTER||missionType==TaskType.SUB_ITEM)
			{
				startFight();
			}
			else if(missionType==TaskType.SUB_GATHER)
			{
				var modeid:int=TaskUtil.getMonsterByType(taskType,TaskAutoManager.getInstance().taskTarget);
				startGather(modeid);
			}
			
		}
		
		
		/**采集寻路完成开始采集了*/
		public static function walkStartGather(data :Object):void
		{
			var modeid:int=data.modeid;
			startGather(modeid);
			
		}
		
		/**采集寻路完成开始采集了*/
		public static function startGather(modeid :int):void
		{
			var list : Vector.<SceneRole> =SceneManager.getSceneCollectList();
			list.sort(CastSpellHelper.onSortNearestRole);
			var collectData : SceneCollectData;
			for each(var rdata:SceneRole in list)
			{
				if(rdata!=null&&rdata.data!=null)
				{
					collectData = rdata.data as SceneCollectData;
					if(collectData!=null&&collectData.modelID==modeid)
					{
						WalkToRoleManager.walkToRole(rdata);
						return;
					}
				}
				
			}
		}
		
		/**寻路完成开始杀怪*/
		public static function startFight(modeid :Object=null):void
		{
			TrusteeshipManager.getInstance().startAutoFight();
		}
		
		
		/**领取奖励按钮*/
		public static function receiveRewordBut(type:int):void
		{
			if(type==1)//支线任务领取奖励
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.dailyTaskInfo.taskId);
			}
			else if(type==2)
			{
				showLoopPanel();
			}
			
		}
		
	}
}