package com.rpgGame.app.ui.main.Task
{
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.TaskType;
	
	import flash.utils.setTimeout;
	
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
			//EventManager.addEvent(UserMoveEvent.MOVE_END, moveEnd);
			EventManager.addEvent(MainPlayerEvent.PLAYER_DIE,playerDie);
		}
		
		/**移动完成*/
		private function moveEnd() : void
		{
			if(TaskMissionManager.currentMainTaskData==null)
			{
				return;
			}
			
			var npcData : Q_scene_monster_area = MonsterDataManager.getMonsterById(TaskMissionManager.currentMainTaskData.q_finish_npc);
			if(npcData!=null)
			{
				var dis : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, npcData.q_center_x, npcData.q_center_y);
				if(npcData.q_mapid==SceneSwitchManager.currentMapId&&dis<50000)
				{
					AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
				}
				else
				{
					AppManager.hideApp(AppConstant.TASK_LEAD_PANEL);
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
			
			if(TaskMissionManager.currentMainTaskData==null)
			{
				return;
			}
			
			var npcData : Q_scene_monster_area = MonsterDataManager.getMonsterById(TaskMissionManager.currentMainTaskData.q_finish_npc);
			if(npcData!=null&&npcData.q_mapid==SceneSwitchManager.currentMapId&&npcData.q_id==npcId)//点击是任务npc就弹出面板
			{
				AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
			}
			
		}
		
		/**接受任务信息初始化*/
		private function inforMation():void
		{
			
			
			if(TaskMissionManager.haveDailyTask||TaskMissionManager.haveTreasuerTask)
			{
				leadCont.show(false);
				loopCont.show(true);
				loopCont.loopTaskView();
			}
			else
			{
				leadCont.show(true);
				loopCont.show(false);
				leadCont.leadTaskView();
			}
			
			showNpcMark(true);
			
		}
		/**完成任务*/
		private function finishMation():void
		{
			leadCont.hideInfo();
			showNpcMark(false);
		}
		/**新任务*/
		private function newMation():void
		{
			effetCont.playNewtaskEffect();
			inforMation();
			
		}
		/**隐藏显示npc问号*/
		private function showNpcMark(value:Boolean):void
		{
			
			if(TaskMissionManager.currentMainTaskData!=null)
			{
				TaskUtil.nearestTaskNpc(TaskMissionManager.currentMainTaskData.q_finish_npc,value);
			}
		}
		/**任务进度改变*/
		private function changeMation():void
		{
			if(TaskMissionManager.haveDailyTask||TaskMissionManager.haveTreasuerTask)
			{
				//loopCont.loopTaskView();
			}
			else
			{
				leadCont.changeTaskView();
			}
			if(TaskMissionManager.currentMainTaskIsfinish)
			{
				effetCont.playFinishEffect();
			}
		}
		private function playerDie():void
		{
			AppManager.hideApp(AppConstant.TASK_LEAD_PANEL);
			AppManager.hideApp(AppConstant.TASK_LOOP_PANEL);
		}
		private function setViewData():void
		{
			
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
					case Renwu_Item(_skin.pri_killbut1.skin).btn_send:
						//L.l("btn_sendbtn_sendbtn_sendbtn_send");
						break;
					case Renwu_Item(_skin.pri_killbut1.skin).labelDisplay:
						//L.l("labelDisplaylabelDisplay");
						mainlineWalk(0);
						
						break;
					case Renwu_Item(_skin.sec_killbut1.skin).btn_send:
						//L.l("sec_killbut1");
						break;
					case Renwu_Item(_skin.sec_killbut1.skin).labelDisplay:
						
						break;
					case Renwu_Item(_skin.sec_killbut2.skin).btn_send:
						//L.l("sec_killbut2");
						break;
					case Renwu_Item(_skin.sec_killbut2.skin).labelDisplay:
						
						break;
					case _skin.sec_navi1:
						AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
						break;
					case _skin.sec_navi3:
						AppManager.showApp(AppConstant.TASK_LOOP_PANEL);
						break;
				}
		}
		/**主线按钮任务处理*/
		private function mainlineWalk(value:int):void
		{
			var i:int;
			var taskData:Q_mission_base;
			var finish:String;
			var finishArr:Array;
			var finishNum:int;
			var monsterId:int=-1;
			if(TaskMissionManager.currentMainTaskInfo!=null)
			{
				taskData=TaskMissionCfgData.getTaskByID(TaskMissionManager.currentMainTaskInfo.taskModelId);
			}
			if(taskData!=null)
			{
				if(TaskMissionManager.currentMainTaskIsfinish)//假如任务完成，直接去交任务 没有完成寻路到任务点
				{
					TaskUtil.finishNpcTask(taskData.q_finish_npc,finishWalk);
				}
				else
				{
					finish=taskData.q_finish_information_str;
					finishArr=finish.split(";");
					if(finishArr.length>value)
					{
						finish=finishArr[value];
						finishArr=finish.split(",");
						if(finishArr.length==2)
						{
							monsterId=int(finishArr[0]);
							finishNum=int(finishArr[1]);
							//然后查询怪物位置
							TaskUtil.finishNpcTask(monsterId);
						}
						
					}
				}
				
			}
			
		
			//TaskUtil.replyNpcTask(1);
		}
		/**追踪面板上寻路完成*/
		private function finishWalk(ref : WalkMoveStateReference):void
		{
			
			if(TaskMissionManager.currentMainTaskData!=null)
			{
				finishToNpc(TaskMissionManager.currentMainTaskData.q_finish_npc);
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