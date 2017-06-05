package com.rpgGame.app.ui.main.taskbar
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.TaskType;

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
		
		public static var panlIsopen:Boolean=false;
		public static function showLeadPanel():void
		{
			if (!AppManager.isAppInScene(AppConstant.TASK_LEAD_PANEL))
			{
				AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
				panlIsopen=true;
			}
			
		}
		public static function hideLeadPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LEAD_PANEL);
			panlIsopen=false;
		}
		public static function showLoopPanel():void
		{
			AppManager.showApp(AppConstant.TASK_LOOP_PANEL);
		}
		public static function hideLoopPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LOOP_PANEL);
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
		/**目标按钮任务处理*/
		public static function killWalkBut(type:int,num:int,key:int):void
		{
			if(key==1&&type==TaskType.MAINTYPE_MAINTASK&&MainRoleManager.actorInfo.totalStat.level<=TaskAutoManager.AUTOLVE)//
			{
				TaskAutoManager.getInstance().startTaskAuto(num);
				return;
			}
			
			if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_USEITEM&&!TaskUtil.getIsfinishByType(type))//是使用道具任务且没有完成
			{
				showBagPanel();
			}
			else if(type==TaskType.MAINTYPE_MAINTASK&&TaskMissionManager.getMainTaskIsFinish())//主任务且主任务完成
			{
				if(TaskMissionManager.getMainTaskHaveNpc())
				{
					if(key==1)
					{
						TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk);
					}
					else
					{
						TaskUtil.npcTaskFly(TaskMissionManager.getMainTaskNpcAreaId());
					}
				}
				else
				{
					showLeadPanel();
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
						TaskUtil.monsterTaskFly(monsterId);
					}
					
				}
				else//主线和支线的怪取配置坐标点
				{
					var post:Array=TaskMissionManager.getPathingByType(type,num);
					if(key==1)
					{
						var modeid:int=TaskUtil.getMonsterByType(type,num);
						var obj:Object=new Object();
						obj.subType=TaskUtil.getSubtypeByType(type);
						obj.modeid=modeid;
						if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_GATHER)//采集任务寻路完成开始采集
						{
							TaskUtil.postTaskWalk(post,walkStartGather,obj);
						}
						else
						{
							TaskUtil.postTaskWalk(post,startFight);
						}
					}
					else
					{
						TaskUtil.postTaskFly(post);
					}
				}
			}
		}
		/**追踪面板上寻路完成*/
		public static function finishWalk(data :Object):void
		{
			
			if(TaskMissionManager.mainTaskData!=null)
			{
				finishToNpc(TaskMissionManager.getMainTaskNpcModeId());
			}
		}
		/**移动完成*/
		public static function finishToNpc(npcId:int) : void
		{
			if(TaskMissionManager.isMainTaskNpc(npcId))
			{
				showLeadPanel();
			}
			
			
		}
		/**飞鞋完成*/
		public static function flyComplete():void
		{
			var dist:int =TaskUtil.getDistfinishNpc();
			if(dist>=0&&dist<100)
			{
				showLeadPanel();
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
		public static function startFight(modeid :int):void
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