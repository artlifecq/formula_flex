package com.rpgGame.appModule.task
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.Huanshi_Renwu;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class TaskLoopPanel  extends SkinUIPanel
	{
		protected var _skin :Huanshi_Renwu;
		private var planLabel:Label;
		private var nav1Label:Label;
		private var nav2Label:Label;
		private var money1Label:Label;
		private var money2Label:Label;
		private var timerLabel:Label;
		private var icoList1Group:RewardGroup;
		private var icoList2Group:RewardGroup;
		private var timer:GameTimer;
		private var currtimer:int;
		private var TIMERDATA:int=15;//倒计时时间
		private var TwoData:int;
		private var ThereData:int;
		private var selectId:int=1;
		private var initKey:Boolean=false;
		public function TaskLoopPanel()
		{
			_skin=new Huanshi_Renwu();
			super(_skin);
		}
		
		private function init():void
		{
			planLabel=_skin.lb_wancheng;
			nav1Label=_skin.lab_navi1;
			nav2Label=_skin.lab_navi2;
			money1Label=_skin.lb_yuanbao;
			money2Label=_skin.lb_yinliang;
			timerLabel=_skin.lb_time;
			
			var i:int;
			var ico:IconCDFace;
			
			icoList1Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.ioc_1_0,RewardGroup.ALIN_LEFT,4,6,6);
			icoList2Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.ioc_2_0,RewardGroup.ALIN_LEFT,4,6,6);
			
			planLabel.htmlText="";
			nav1Label.htmlText="本环任务奖励：";
			nav2Label.htmlText="";
			timerLabel.htmlText="";
			money1Label.text="";
			money2Label.text="";
			
			var mach:String=GlobalSheetData.getSettingInfo(508).q_string_value;
			var machArr:Array;
			if(mach!=null&&mach!="")
			{
				machArr=mach.split(",");
			}
			if(machArr!=null&&machArr.length==2)
			{
				TwoData=machArr[0];
				ThereData=machArr[1];
			}
			
			TIMERDATA=GlobalSheetData.getSettingInfo(509).q_int_value;
			timer = new GameTimer("TaskLoopPanel", 1000, 0, onTimer);
			timer.stop();
		}
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			switch (target) {
				
				case this._skin.one_but:
					subFinishBut(1);
					break;
				case this._skin.two_but:
					subFinishBut(2);
					break;
				case this._skin.three_but:
					subFinishBut(3);
					break;
			}
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			if(!initKey)
			{
				initKey=true;
				init();
			}
			selectId=1;
			setView();
			timeInit()	
			
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			//super.onStageResize(sw,sh);
			this.x=sw-this.width-254;
			this.y=(sh-this.height)/2+21;
		}
		override public function hide():void 
		{
			timer.stop();
			currtimer=TIMERDATA;
			subFinish();
			super.hide();
		}
		private function onTimer() : void 
		{
			setTimeText();
		}
		/**设置倒计时文字*/
		private function setTimeText():void
		{
			
			if(this.visible&&this.parent!=null)
			{
				timerLabel.htmlText=currtimer+"秒后自动领取奖励";
				if(currtimer==0)
				{
					timer.stop();
					subFinishBut(1);
				}
				currtimer--;
			}
			else
			{
				timer.stop();
			}
			
		}
		/**判断倒计时*/
		private function timeInit():void
		{
			
			if(TaskMissionManager.getTreasuerTaskIsFinish())
			{
				timer.start();
				currtimer=TIMERDATA;
				setTimeText();
			}
			else
			{
				timer.stop();
				timerLabel.htmlText="任务未完成";
			}
		}
		private function subFinishBut(type:int):void
		{
			selectId=type;
			hide();
			
		}
		private function subFinish():void
		{
			if(TaskMissionManager.treasuerTaskInfo!=null&&TaskMissionManager.getTreasuerTaskIsFinish()&&this.visible&&this.parent!=null)
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.treasuerTaskInfo.taskId,selectId);
			}
				
		}
		private var loopNumber:int=-1;
		private function setView():void
		{
			if(loopNumber!=TaskMissionManager.treasuerTaskInfo.loopNumber)
			{
				hideView();
				loopNumber=TaskMissionManager.treasuerTaskInfo.loopNumber;
				setPlanText();
				setReward();
				setkExtraReward();
				setMoney();
			}

			
		}
		private function setPlanText():void
		{
			planLabel.htmlText="已完成环数：第"+TaskMissionManager.treasuerTaskInfo.loopNumber+"/"+TaskMissionManager.getTreasuerAllNum()+"环";
		}
		private function setReward():void
		{
			icoList1Group.setRewardByArray(TaskMissionCfgData.getRewordById(TaskMissionManager.treasuerTaskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
			icoList1Group.visible=true;
		}
		private function setkExtraReward():void
		{
			var reward:Object=TaskMissionManager.getTreasuerTaskExtraReward();
			nav2Label.htmlText="今日完成<font color='#5DBD37'>"+reward.l+"</font>环后，额外奖励";
			icoList2Group.setRewardByArray(TaskMissionCfgData.getRewordById(reward.r,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
			icoList2Group.visible=true;
		}
		
	
		private function setMoney():void
		{
			money1Label.text=""+ThereData;
			money2Label.text=""+TwoData;
		}
		
		private function hideView():void
		{
			icoList1Group.visible=false;
			icoList2Group.visible=false;
			planLabel.htmlText="";
			nav2Label.htmlText="";
			timerLabel.htmlText="";
			money1Label.text="";
			money2Label.text="";
			
		}
	}
}