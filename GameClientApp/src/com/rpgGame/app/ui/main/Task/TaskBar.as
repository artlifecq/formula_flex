package com.rpgGame.app.ui.main.Task
{
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.type.TaskType;
	
	import flash.geom.Point;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.DisplayObject;

	public class TaskBar extends SkinUI
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var leadCont:TaskLeadView;
		private var loopCont:TaskLoopView;
		private var effetCont:TaskEffectView;
		private var barTweenMax:TweenMax;
		private var initX:Number;
		public function TaskBar()
		{
			_skin=new RenWuZhuiZong_Skin();
			super(_skin);
			init();
			addEvent();
			
		}
		override protected function onTouchTarget(target : DisplayObject) : void {
			CONFIG::netDebug {
				NetDebug.LOG("[MainUI] [onTouchTarget]:" + target.name);
			}
				switch (target) {
					case this._skin.btn_open:
						// 打开
						setState(true);
						break;
					case this._skin.btn_close:
						// 关闭
						setState(false);
						break;
					case Renwu_Item(_skin.pri_killbut1.skin).labelDisplay:
						killWalkBut(1,0,1);
						break;
					case Renwu_Item(_skin.pri_killbut2.skin).labelDisplay:
						killWalkBut(1,1,1);
						break;
					case Renwu_Item(_skin.pri_killbut3.skin).labelDisplay:
						killWalkBut(1,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_1.skin).labelDisplay:
						killWalkBut(1,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_2.skin).labelDisplay:
						killWalkBut(1,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_3.skin).labelDisplay:
						killWalkBut(1,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_1.skin).labelDisplay:
						killWalkBut(2,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_2.skin).labelDisplay:
						killWalkBut(2,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_3.skin).labelDisplay:
						killWalkBut(2,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_1.skin).labelDisplay:
						killWalkBut(3,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_2.skin).labelDisplay:
						killWalkBut(3,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_3.skin).labelDisplay:
						killWalkBut(3,2,1);
						break;
					
					case Renwu_Item(_skin.pri_killbut1.skin).btn_send:
						killWalkBut(1,0,2);
						break;
					case Renwu_Item(_skin.pri_killbut2.skin).btn_send:
						killWalkBut(1,1,2);
						break;
					case Renwu_Item(_skin.pri_killbut3.skin).btn_send:
						killWalkBut(1,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_1.skin).btn_send:
						killWalkBut(1,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_2.skin).btn_send:
						killWalkBut(1,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_3.skin).btn_send:
						killWalkBut(1,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_1.skin).btn_send:
						killWalkBut(2,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_2.skin).btn_send:
						killWalkBut(2,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_3.skin).btn_send:
						killWalkBut(2,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_1.skin).btn_send:
						killWalkBut(3,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_2.skin).btn_send:
						killWalkBut(3,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_3.skin).btn_send:
						killWalkBut(3,2,2);
						break;
					
					case _skin.sec_subbut1:
						receiveRewordBut(1);
						break;
					case _skin.sec_subbut2:
						receiveRewordBut(2);
						break;
				}
		}
		
		private function init():void
		{
			initX=_skin.task_box.x;
			leadCont=new TaskLeadView(_skin);
			loopCont=new TaskLoopView(_skin);
			effetCont=new TaskEffectView(_skin);
			/*leadCont.show(false);
			loopCont.show(true);
			leadCont.show(true);
			loopCont.show(false);*/
		}
		private function addEvent():void
		{
			EventManager.addEvent(TaskEvent.TASK_INFOR_MATION,inforMation);
			EventManager.addEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.addEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.addEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			
			//EventManager.addEvent(TaskEvent.TASK_FINISH_NPC,finishNpc);
			EventManager.addEvent(TaskEvent.TASK_CLICK_NPC,taskNpc);
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, moveReschange);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
			EventManager.addEvent(MainPlayerEvent.PLAYER_DIE,playerDie);
			
			
		}
		
		private var panlIsopen:Boolean=false;
		/**玩家移动*/
		private function moveReschange() : void
		{
			if(panlIsopen)
			{
				var dist:int =TaskUtil.getDistfinishNpc();
				if(dist>200)
				{
					hideLeadPanel();
				}				
			}
			
		}
		
		/**点击npc寻路完成*/
		private function taskNpc(npcId:int):void
		{
			
			finishToNpc(npcId);
			
		}
		/**移动完成*/
		private function finishToNpc(npcId:int) : void
		{
			
			if(TaskMissionManager.mainTaskData!=null)
			{
				var npcData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(TaskMissionManager.getMainTaskNpcAreaId());
				if(npcData!=null&&npcData.q_mapid==SceneSwitchManager.currentMapId&&npcData.q_monster_model==npcId)//点击是任务npc就弹出面板
				{
					showLeadPanel();
				}
			}
		}
		/**飞鞋完成*/
		private function flyComplete():void
		{
			var dist:int =TaskUtil.getDistfinishNpc();
			if(dist>=0&&dist<200)
			{
				showLeadPanel();
			}
			
			
		}
		/**接受任务信息初始化*/
		private function inforMation():void
		{
			setViewShow();
			leadCont.leadTaskView();
			loopCont.loopTaskView();
			showNpcMark(true);
			
			
		}
		/**完成任务*/
		private function finishMation(type:int):void
		{
			effetCont.playFinishEffect();
			leadCont.hideInfo();
			loopCont.hideTaskView(type);
			setViewShow();
			leadCont.leadTaskView();
			loopCont.loopTaskView();
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				hideLeadPanel();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				hideLoopPanel();
			}
			showNpcMark(false);
		}
		/**新任务*/
		private function newMation(type:int):void
		{
			effetCont.playNewtaskEffect();
			setViewShow();
			leadCont.leadTaskView();
			loopCont.loopTaskView(type);
			showNpcMark(true);
			
		}
		/**隐藏显示npc问号*/
		private function showNpcMark(value:Boolean):void
		{
			
			if(TaskMissionManager.mainTaskData!=null)
			{
				TaskUtil.nearestTaskNpc(TaskMissionManager.getMainTaskNpcModeId(),value);
			}
		}
		/**任务进度改变*/
		private function changeMation(type:int):void
		{
			leadCont.upleadTaskView();
			loopCont.upLoopTaskView(type);
			if(type==1&&TaskMissionManager.getMainTaskIsFinish())
			{
				if(TaskMissionManager.getMainTaskHaveNpc())
				{
					showNpcMark(true);
				}
				else
				{
					showLeadPanel();
				}
			}
			
		}
		
		
		private function playerDie():void
		{
			hideLeadPanel();
			hideLoopPanel();
			
		}
		private function setViewShow():void
		{
			if(TaskMissionManager.isOnlyDailyTask)//只有主线//if(TaskMissionManager.isOnlyDailyTask)//只有主线
			{
				leadCont.show(true);
				loopCont.show(false);
			}
			else
			{
				
				leadCont.show(false);
				loopCont.show(true);
			}
		}
		
		private function showLeadPanel():void
		{
			AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
			panlIsopen=true;
		}
		private function hideLeadPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LEAD_PANEL);
			panlIsopen=false;
		}
		private function showLoopPanel():void
		{
			AppManager.showApp(AppConstant.TASK_LOOP_PANEL);
		}
		private function hideLoopPanel():void
		{
			AppManager.hideApp(AppConstant.TASK_LOOP_PANEL);
		}
		private function showBagPanel():void
		{
			if (!ClientConfig.isBanShu)
			{
				AppManager.showApp(AppConstant.ROLE_PANEL);
			}
				
		}
		
		
		/**主线按钮任务处理*/
		/*private function mainlineWalkBut(ite:int):void
		{
			if(TaskMissionManager.getMainTaskIsFinish())
			{
				TaskUtil.monsterTaskWalk(TaskMissionManager.mainTaskData.q_finish_npc,finishWalk,noWalk);
			}
			else
			{
				var monsterId:int=TaskUtil.getMonsterTaskId(1,ite);
				if(monsterId>=0)
				{
					TaskUtil.monsterTaskWalk(monsterId);
				}
			}
		}*/
		/**目标按钮任务处理*/
		private function killWalkBut(type:int,num:int,key:int):void
		{
			CollectManager.show("caiji",2000,null);
			return;
			
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
						TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk,noWalk);
					}
					else
					{
						TaskUtil.npcTaskFly(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk,noWalk);
					}
				}
				else
				{
					showLeadPanel();
				}
			}
			else
			{
				if(type==TaskType.MAINTYPE_TREASUREBOX)
				{
					var monsterId:int=TaskMissionManager.getTreasuerMonsterId(num);
					if(key==1)
					{
						TaskUtil.monsterTaskWalk(monsterId);
					}
					else
					{
						TaskUtil.monsterTaskFly(monsterId);
					}
					
				}
				else
				{
					var post:Array=TaskMissionManager.getPathingByType(type,num);
					if(key==1)
					{
						TaskUtil.postTaskWalk(post);
					}
					else
					{
						TaskUtil.postTaskFly(post);
					}
					
				}
				
			}
		
			
			/*if(TaskUtil.getSubtypeByType(type)==TaskType.SUB_USEITEM&&!TaskUtil.getIsfinishByType(type))//是使用道具任务且没有完成
			{
				showBagPanel();
			}
			else 
			{
				var monsterId:int=TaskUtil.getMonsterByType(type,ite);
				if(type==TaskType.MAINTYPE_MAINTASK&&TaskMissionManager.getMainTaskIsFinish())
				{
					if(TaskMissionManager.getMainTaskHaveNpc())
					{
						TaskUtil.monsterTaskWalk(monsterId,finishWalk,noWalk);
					}
					else
					{
						showLeadPanel();
					}
					
				}
				else
				{
					TaskUtil.monsterTaskWalk(monsterId);
				}
				
			}*/
			
			/*if(monsterId>=0)
			{
				if(type==1&&TaskMissionManager.getMainTaskIsFinish())
				{
					
				}
				else
				{
					TaskUtil.monsterTaskWalk(monsterId);
				}
				
			}	*/
			
		}
		/**追踪面板上寻路完成*/
		private function finishWalk(ref : WalkMoveStateReference):void
		{
			
			if(TaskMissionManager.mainTaskData!=null)
			{
				finishToNpc(TaskMissionManager.getMainTaskNpcModeId());
			}
		}
		
		/**追踪面板已在npc前面不用寻路*/
		private function noWalk(role:SceneRole):void
		{
			
			if(TaskMissionManager.mainTaskData!=null)
			{
				finishToNpc(TaskMissionManager.getMainTaskNpcModeId());
			}
		}
		
		/**领取奖励按钮*/
		private function receiveRewordBut(type:int):void
		{
			if(type==1)//支线任务领取奖励
			{
				TaskSender.SendfinishTaskMessage(TaskMissionManager.dailyTaskInfo.taskId);
				loopCont.hideDailyTaskView();
			}
			else if(type==2)
			{
				showLoopPanel();
			}
			
		}
		
	
		/**追踪栏开启关闭操作*/
		private function setState(isOpen : Boolean) : void {
			if (barTweenMax) {
				barTweenMax.kill();
			}
			var targetX : int;
			_skin.task_box.visible=true;
			if(isOpen)
			{
				targetX=initX;
				_skin.but_openBg.visible=false;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX});
			}
			else
			{
				targetX=initX+_skin.task_box.width;
				barTweenMax=TweenMax.to(_skin.task_box,0.5,{x:targetX,onComplete :onCompFun});
			}
			
			
			_skin.btn_close.visible = isOpen;
			_skin.btn_open.visible = !isOpen;
		}
		private function onCompFun() : void 
		{
			_skin.but_openBg.visible=true;
			_skin.task_box.visible=false;
		}
		public function resize(w : int, h : int) : void {
			this.x = w - this._skin.width;
			this.y = (h - this._skin.height)>>1;
			CONFIG::netDebug{
				NetDebug.LOG("[TaskBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
			}
		}
	}
}