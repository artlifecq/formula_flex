package com.rpgGame.appModule.task
{

	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.mainui.renwu.Zhuxian_Renwu;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	
	public class TaskLeadPanel  extends SkinUIPanel
	{
		private var _skin :Zhuxian_Renwu;
		//private var titleLabel:Label;
		private var nameLabel:Label;
		private var navLabel:Label;
		private var speakLabel:Label;
		private var timerLabel:Label;
		private var okBut:Button;
		//private var icoBgList:Vector.<UIAsset>;
		//private var icoList:Vector.<IconCDFace>;
		private var icoListGroup:RewardGroup;
		private var timer:GameTimer;
		private var currtimer:int;
		private var initKey:Boolean=false;
		private var currtTaskId:long=new long();
		public function TaskLeadPanel()
		{
			_skin=new Zhuxian_Renwu();
			super(_skin);

			
		}
		
		private function init():void
		{
			nameLabel=_skin.lb_name;
			navLabel=_skin.lb_jiangli;
			speakLabel=_skin.lb_speak;
			timerLabel=_skin.lb_time;
			okBut=_skin.btn_ok;
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.ioc_0,RewardGroup.ALIN_LEFT,4,6,6);
			nameLabel.htmlText="";
			navLabel.htmlText="任务奖励";
			speakLabel.htmlText="";
			timerLabel.htmlText="";
			timer = new GameTimer("TaskLeadPanel", 1000, 0, onTimer);
			timer.stop();
		}
		private function onTimer() : void 
		{
			setTimeText();
		}
	
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target) {
				
				case this._skin.btn_ok:
					subFinishBut();
					break;
			}
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void 
		{
			if(!TaskMissionManager.haveMainTask)
			{
				return;
			}
			super.show(data, openTable, parentContiner);
			if(!initKey)
			{
				initKey=true;
				init();
			}
			if(currtTaskId.ToGID()!=TaskMissionManager.mainTaskInfo.taskId.ToGID())
			{
				if(currtimer>0)
				{
					subFinish(currtTaskId);
				}
				
				currtTaskId=TaskMissionManager.mainTaskInfo.taskId;
				setView();
				timeInit();
			}
					
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			//super.onStageResize(sw,sh);
			this.x=sw-this.width-254;
			this.y=(sh-this.height)/2+21;
		}
		override protected function onHide():void
		{
			super.onHide();
			timer.stop();
			currtimer=0;
			if(this.visible&&this.parent!=null&&TaskMissionManager.getMainTaskIsFinish())
			{
				icoListGroup.tweeRewardInBag();
				TweenLite.killDelayedCallsTo(subFinish);
				TweenLite.delayedCall(0.5, subFinish,[TaskMissionManager.mainTaskInfo.taskId]);
			}
		}
		
		
		
		private function subFinishBut():void
		{
			if(TaskMissionManager.mainTaskInfo!=null&&TaskMissionManager.getMainTaskIsFinish())
			{
				hide();
			}
		}
		
		private function subFinish(taskId:long):void
		{
			//okBut.isEnabled=false;
			TaskMissionManager.flashMainTaskId=taskId;
			TaskSender.sendfinishTaskMessage(taskId);
			
		}
		
		private function setView():void
		{
			hideView();
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			
			if(task!=null&&taskData!=null)
			{
				setTitle(taskData.q_party_name,taskData.q_name,taskData.q_deal_mission);
				//TaskUtil.setRewordInfo(taskData.q_reword_id,icoList,icoBgList,true);
				icoListGroup.setRewardByArray(TaskMissionCfgData.getRewordById(taskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
				icoListGroup.visible=true;
				/*if(TaskMissionManager.getMainTaskIsFinish())
				{
					okBut.isEnabled=true;
				}
				else
				{
					okBut.isEnabled=false;
				}*/
				
			}
			
		}
		/**设置标题详情*/
		private function setTitle(party:String,name:String,deal:String):void
		{
			nameLabel.htmlText=party+name;
			speakLabel.htmlText=TaskMissionCfgData.getSegmentTxtById(deal);
		}
		
		/**判断倒计时*/
		private function timeInit():void
		{
			if(TaskAutoManager.getInstance().isTaskRunning)
			{
				currtimer=GlobalSheetData.getSettingInfo(513)!=null?GlobalSheetData.getSettingInfo(513).q_int_value:5;
			}
			else
			{
				currtimer=GlobalSheetData.getSettingInfo(509)!=null?GlobalSheetData.getSettingInfo(509).q_int_value:10;
			}
			
			if(TaskMissionManager.getMainTaskIsFinish())
			{
				timer.start();
				
				setTimeText();
			}
			else
			{
				timer.stop();
				timerLabel.htmlText="任务未完成";
			}
		}
		
		/**设置倒计时文字*/
		private function setTimeText():void
		{
			timerLabel.htmlText=currtimer+"秒后自动领取奖励";
			if(currtimer==0)
			{
				timer.stop();
				subFinishBut();
			}
			currtimer--;
		}
		
		private function hideView():void
		{
			icoListGroup.visible=false;
		}
	}
}