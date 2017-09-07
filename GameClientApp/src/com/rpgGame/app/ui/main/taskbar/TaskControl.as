package com.rpgGame.app.ui.main.taskbar
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.RankTopSender;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import flash.geom.Point;
	
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
			if(taskData)
			{
				if(taskData.q_emid!="")
				{
					FunctionOpenManager.openPanelByFuncID(int(taskData.q_emid));
				}
				else if(taskData.q_mission_type==TaskType.SUB_HUBAO)//护宝
				{
					var monsterData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(taskData.q_finish_npc);
					if (monsterData)
					{
						///TaskMissionManager.flyTaskType=taskData.q_mission_mainType;
						///TaskMissionManager.flyMissionType=taskData.q_mission_type;
						SceneSender.sceneMapTransport(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y,25,false,null,0,0)
					}
				}
			}
			
		}
		/**目标按钮任务处理*/
		public static function killWalkBut(type:int,num:int,key:int):void
		{
			
			if(type==TaskType.MAINTYPE_MAINTASK&&TaskMissionManager.noMainTaskId!=0)//卡级
			{
				var add:int=1;
				if(FunctionOpenManager.checkOpenByFunId(EmFunctionID.EM_ZHANHUN))
				{
					add--;
				}
				add+=num;
				if(add==0)//打开战魂面板
				{
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_ZHANHUN);
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
			if(key==1&&(type==TaskType.MAINTYPE_MAINTASK||type==TaskType.MAINTYPE_TREASUREBOX||type==TaskType.MAINTYPE_GUILDDAILYTASK||type==TaskType.LIJIN_TASK))//
			{
				TaskAutoManager.getInstance().startTaskAuto(type,num);
				return;
			}
			
			if(type==TaskType.MAINTYPE_DAILYTASK)//支线打开面板任务
			{
				if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_HUBAO)//护宝任务
				{
					var postfPath:Array=TaskMissionManager.getTaskPathingByType(type,0);
					TaskUtil.postTaskFly(postfPath,type,TaskType.SUB_HUBAO,0);
				}
				else if(TaskMissionManager.dailyTaskData.q_emid!="")
				{
					TaskAutoManager.getInstance().taskType=TaskType.MAINTYPE_DAILYTASK;
					var emidArr:Array=TaskMissionManager.dailyTaskData.q_emid.split(",");
					if(emidArr.length>num)
					{
						FunctionOpenManager.openPanelBypanelId(int(emidArr[num]));
					}
				}
				return;
			}
			
			if(type==TaskType.MAINTYPE_WORSHIP)//膜拜任务任务
			{
				TaskAutoManager.getInstance().taskType=TaskType.MAINTYPE_WORSHIP;
				RankTopSender.reqRankListTopInfo(RankListType.All_COMBATPOWER_TYPE);
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
		}
		
		
		
		
		
		
		/**追踪面板上寻路完成*/
		public static function finishWalk(data :Object):void
		{		
			if(TaskMissionManager.mainTaskData!=null&&TaskMissionManager.isMainTaskNpc(TaskMissionManager.getMainTaskNpcAreaId()))
			{
				showLeadPanel();
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