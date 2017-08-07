package com.rpgGame.app.ui.main.taskbar
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.HuBaoManager;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.main.head.NpcSpeakBubble;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.NoMainTaskInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.Check;
	
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
			
			
		}
		override protected function onTouchTarget(target : DisplayObject) : void {
			CONFIG::netDebug {
				NetDebug.LOG("[MainUI] [onTouchTarget]:" + target.name);
			}
			if(target.name!=null)
			{
				var nameArr:Array=target.name.split("II");
				if(nameArr[0]=="KILL")//引导任务先特殊处理
				{
					if(nameArr[1]==TaskType.MAINTYPE_GUIDETASK)
					{
						TaskControl.guideBut(int(nameArr[2]));
					}
					else
					{
						killWalkBut(nameArr[1],nameArr[2],nameArr[3]);
					}
					return;
				}
				
			}
			switch (target) 
			{
				case this._skin.btn_open:
					// 打开
					setState(true);
					break;
				case this._skin.btn_close:
					// 关闭
					setState(false);
					break;
				case _skin.sec_subbut1:
					receiveRewordBut(1);
					break;
				/*case _skin.sec_subbut2:
				receiveRewordBut(2);
				break;*/
				case _skin.btnContinue:
					killWalkBut(1,0,1);
					break;
				
				
			}
		}
		/**目标按钮任务处理*/
		private function killWalkBut(type:int,num:int,key:int):void
		{
			TaskControl.killWalkBut(type,num,key);
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				loopCont.clearTreasuerCheck();
			}
		}
		
		
		override protected function onShow() : void
		{
			super.onShow();
			inforMation();
			addEvent();
			
		}
		
		
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
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
			EventManager.addEvent(TaskEvent.TASK_NO_MAIN,noMainTask);
			EventManager.addEvent(TaskEvent.TASK_DROP,dropTask);

			
			EventManager.addEvent(TaskEvent.TASK_CLICK_NPC,taskNpc);
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, moveReschange);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
			EventManager.addEvent(MainPlayerEvent.PLAYER_DIE,playerDie);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,levelChange);
			_skin.chkAuto.addEventListener(Event.CHANGE,checkChangeHandler)
			_skin.chkAuto1.addEventListener(Event.CHANGE,check1ChangeHandler)
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(TaskEvent.TASK_INFOR_MATION,inforMation);
			EventManager.removeEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.removeEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.removeEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			EventManager.removeEvent(TaskEvent.TASK_NO_MAIN,noMainTask);
			EventManager.removeEvent(TaskEvent.TASK_DROP,dropTask);
			EventManager.removeEvent(TaskEvent.TASK_CLICK_NPC,taskNpc);
			EventManager.removeEvent(UserMoveEvent.MOVE_THROUGH, moveReschange);
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
			EventManager.removeEvent(MainPlayerEvent.PLAYER_DIE,playerDie);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,levelChange);
			_skin.chkAuto.removeEventListener(Event.CHANGE,checkChangeHandler)
			_skin.chkAuto1.removeEventListener(Event.CHANGE,check1ChangeHandler)
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
		{
			if(TaskMissionManager.isTaskNpc(TaskType.MAINTYPE_MAINTASK,npcId))//如果是任务NPC就打开面板
			{
				TaskControl.showLeadPanel();
			}
			else if(TaskMissionManager.isTaskNpc(TaskType.MAINTYPE_GUILDDAILYTASK,npcId))
			{
				TaskControl.showGuildPanel();
			}
			else if(HuBaoData.isTaskNpc(npcId))
			{
				HuBaoSender.upCSClientDataMessage(npcId);
			}
			else //npc闲话
			{
				var role:SceneRole = SceneManager.getSceneObjByID(serverID.ToGID()) as SceneRole;
				if (role != null&& role.data !=null&&role.headFace!=null) 
				{
					var speak:String=MonsterDataManager.getNpcSpeak(npcId);
					if(speak!=null&&speak!="")
					{
						role.headFace.addChild(NpcSpeakBubble.speakBubble(speak));
					}
					
				}
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
				loopCont.clearTreasuerCheck();
				loopCont.clearGuildCheck();
				showNpcMark(false);
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				TaskControl.hideLoopPanel();
			}
			else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				TaskControl.hideGuildPanel();
			}
			
			
			TaskAutoManager.getInstance().walkOver=false;
		}
		/**新任务*/
		private function newMation(type:int):void
		{
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				if(TaskMissionManager.haveMainTask)
				{
					effetCont.playNewtaskEffect();
					TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_MAINTASK);
				}
				else
				{
					TaskAutoManager.getInstance().stopAll();
				}
				showNpcMark(true);
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				if(TaskMissionManager.haveTreasuerTask&&TaskMissionManager.treasuerCheck)
				{
					TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_TREASUREBOX)
				}
			}
			setViewShow();
			leadCont.leadTaskView();
			loopCont.loopTaskView(type);
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
			if(type==TaskType.MAINTYPE_MAINTASK&&TaskMissionManager.getMainTaskIsFinish()&&TaskMissionManager.getMainTaskHaveNpc())
			{
				showNpcMark(true);
			}			
		}
		/**任务卡级*/
		private function noMainTask():void
		{
			leadCont.show(false);
			loopCont.show(true);
			loopCont.setKajibutView();
		}
		/**放弃任务*/
		private function dropTask(type:int):void
		{
			leadCont.hideInfo();
			loopCont.hideTaskView(type);
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				TaskControl.hideLeadPanel();
				showNpcMark(false);
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				TaskControl.hideLoopPanel();
			}
			else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				TaskControl.hideGuildPanel();
			}
		}
		
		
		
		/**任务时等级变化*/
		private function levelChange():void
		{
			loopCont.setKajiGoter();
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
				TaskSender.sendfinishTaskMessage(TaskMissionManager.dailyTaskInfo.taskId);
			}
			//TaskControl.receiveRewordBut(type);
			
		}
		
		private function playerDie():void
		{
			TaskControl.hideLeadPanel();
			TaskControl.hideLoopPanel();
			
		}
		private function setViewShow():void
		{
			if(TaskMissionManager.isOnlyMainTask&&MainRoleManager.actorInfo.totalStat.level<=TaskAutoManager.PANLVE)//只有主线且等级小于新手期
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
		
		private function checkChangeHandler(e:Event):void
		{
			var check:Check = e.target as Check;
			loopCont.setTreasuerCheck(check.isSelected);
		}
		private function check1ChangeHandler(e:Event):void
		{
			var check:Check = e.target as Check;
			loopCont.setGuildCheck(check.isSelected);
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
			this.y = 273;
		}
	}
}