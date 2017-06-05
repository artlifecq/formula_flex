package com.rpgGame.app.ui.main.taskbar
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.type.TaskType;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
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
						TaskControl.killWalkBut(1,0,1);
						break;
					case Renwu_Item(_skin.pri_killbut2.skin).labelDisplay:
						TaskControl.killWalkBut(1,1,1);
						break;
					case Renwu_Item(_skin.pri_killbut3.skin).labelDisplay:
						TaskControl.killWalkBut(1,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_1.skin).labelDisplay:
						TaskControl.killWalkBut(1,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_2.skin).labelDisplay:
						TaskControl.killWalkBut(1,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut1_3.skin).labelDisplay:
						TaskControl.killWalkBut(1,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_1.skin).labelDisplay:
						TaskControl.killWalkBut(2,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_2.skin).labelDisplay:
						TaskControl.killWalkBut(2,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut2_3.skin).labelDisplay:
						TaskControl.killWalkBut(2,2,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_1.skin).labelDisplay:
						TaskControl.killWalkBut(3,0,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_2.skin).labelDisplay:
						TaskControl.killWalkBut(3,1,1);
						break;
					case Renwu_Item(_skin.sec_killbut3_3.skin).labelDisplay:
						TaskControl.killWalkBut(3,2,1);
						break;
					
					case Renwu_Item(_skin.pri_killbut1.skin).btn_send:
						TaskControl.killWalkBut(1,0,2);
						break;
					case Renwu_Item(_skin.pri_killbut2.skin).btn_send:
						TaskControl.killWalkBut(1,1,2);
						break;
					case Renwu_Item(_skin.pri_killbut3.skin).btn_send:
						TaskControl.killWalkBut(1,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_1.skin).btn_send:
						TaskControl.killWalkBut(1,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_2.skin).btn_send:
						TaskControl.killWalkBut(1,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut1_3.skin).btn_send:
						TaskControl.killWalkBut(1,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_1.skin).btn_send:
						TaskControl.killWalkBut(2,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_2.skin).btn_send:
						TaskControl.killWalkBut(2,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut2_3.skin).btn_send:
						TaskControl.killWalkBut(2,2,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_1.skin).btn_send:
						TaskControl.killWalkBut(3,0,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_2.skin).btn_send:
						TaskControl.killWalkBut(3,1,2);
						break;
					case Renwu_Item(_skin.sec_killbut3_3.skin).btn_send:
						TaskControl.killWalkBut(3,2,2);
						break;
					
					case _skin.sec_subbut1:
						receiveRewordBut(1);
						break;
					case _skin.sec_subbut2:
						receiveRewordBut(2);
						break;
					case _skin.btnContinue:
						TaskControl.killWalkBut(1,0,1);
						break;
					
					
				}
		}
		
		private function init():void
		{
			initX=_skin.task_box.x;
			leadCont=new TaskLeadView(_skin);
			loopCont=new TaskLoopView(_skin);
			effetCont=new TaskEffectView(_skin);
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
				if(dist>200&&!TaskAutoManager.getInstance().isTaskRunning)
				{
					TaskControl.hideLeadPanel();
				}				
			}
			
		}
		
		/**点击npc寻路完成*/
		private function taskNpc(npcId:int,serverID:long):void
		{GameLog.addShow("点击npc寻路完成");//L.l
			if(TaskMissionManager.isMainTaskNpc(npcId))//如果是任务NPC就打开面板
			{GameLog.addShow("showLeadPanel");
				TaskControl.showLeadPanel();
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
			leadCont.hideInfo();
			loopCont.hideTaskView(type);
			//setViewShow();
			//leadCont.leadTaskView();
			//loopCont.loopTaskView();
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				effetCont.playFinishEffect();
				TaskControl.hideLeadPanel();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				TaskControl.hideLoopPanel();
			}
			
			
			showNpcMark(false);
		}
		/**新任务*/
		private function newMation(type:int):void
		{
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				if(TaskMissionManager.haveMainTask)
				{
					effetCont.playNewtaskEffect();
					TaskAutoManager.getInstance().startTaskAuto();
				}
				else
				{
					TaskAutoManager.getInstance().stopAll();
				}
			}
			
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
				TaskUtil.nearestTaskNpc(TaskMissionManager.getMainTaskNpcAreaId(),value);
			}
		}
		/**任务进度改变*/
		private function changeMation(type:int):void
		{
			leadCont.upleadTaskView();
			loopCont.upLoopTaskView(type);
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				if(TaskMissionManager.getMainTaskIsFinish())
				{
					if(TaskMissionManager.getMainTaskHaveNpc())
					{
						showNpcMark(true);
					}
					else
					{
						
						TaskControl.showLeadPanel();
					}
				}
				TaskAutoManager.getInstance().setTaskChange();
			}
			
		}
		/**飞鞋完成*/
		public static function flyComplete():void
		{
			TaskControl.flyComplete();
		}
		/**领取奖励按钮*/
		private function receiveRewordBut(type:int):void
		{
			if(type==1)//支线任务领取奖励
			{
				loopCont.hideDailyTaskView();
			}
			TaskControl.receiveRewordBut(type);
			
		}
		
		private function playerDie():void
		{
			TaskControl.hideLeadPanel();
			TaskControl.hideLoopPanel();
			
		}
		private function setViewShow():void
		{
			if(TaskMissionManager.isOnlyMainTask&&MainRoleManager.actorInfo.totalStat.level<=TaskAutoManager.AUTOLVE)//只有主线且等级小于新手期
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