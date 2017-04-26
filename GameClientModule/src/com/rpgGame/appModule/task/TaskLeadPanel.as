package com.rpgGame.appModule.task
{

	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.Zhuxian_Renwu;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	
	public class TaskLeadPanel  extends SkinUIPanel
	{
		private var _skin :Zhuxian_Renwu;
		private var titleLabel:Label;
		private var nameLabel:Label;
		private var navLabel:Label;
		private var speakLabel:Label;
		private var timerLabel:Label;
		private var okBut:Button;
		private var icoBgList:Vector.<UIAsset>;

		private var icoList:Vector.<IconCDFace>;
		private var timer:GameTimer;
		private var currtimer:int;
		private const TIMERDATA:int=15//倒计时时间
		

		public function TaskLeadPanel()
		{
			_skin=new Zhuxian_Renwu();
			super(_skin);

			init();
		}
		
		private function init():void
		{
			titleLabel=_skin.lbl_title;
			nameLabel=_skin.lb_name;
			navLabel=_skin.lb_jiangli;
			speakLabel=_skin.lb_speak;
			timerLabel=_skin.lb_time;
			okBut=_skin.btn_ok;
			icoBgList=new Vector.<UIAsset>();
			icoBgList.push(_skin.ioc_0);
			icoBgList.push(_skin.ioc_1);
			icoBgList.push(_skin.ioc_2);
			icoBgList.push(_skin.ioc_3);
			icoBgList.push(_skin.ioc_4);
			icoBgList.push(_skin.ioc_5);

			icoList=new Vector.<IconCDFace>();
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_42);

				ico.x=icoBgList[i].x+6;
				ico.y=icoBgList[i].y+6;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				this.addChild(ico);
			}
			
			//titleLabel.htmlText="主线任务";
			//nameLabel.htmlText="第一章:新手村";
			//navLabel.htmlText="任务奖励";
			//speakLabel.htmlText="狗贼宇文拓在会稽郡释放万灵血阵，会稽镇一夜之间只剩血光一片，他们聚集在此欲找官府讨要说法，却遭官兵残杀。";
			//timerLabel.htmlText="10秒后自动领取奖励";
			titleLabel.htmlText="主线任务";
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
					subFinish();
					break;
			}
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
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
			super.hide();
			timer.stop();
			currtimer=TIMERDATA;
		}
		
		
		
		private function subFinish():void
		{
			if(TaskMissionManager.mainTaskInfo!=null&&TaskMissionManager.getMainTaskIsFinish()&&this.visible&&this.parent!=null)
			{
				//hide();
				okBut.isEnabled=false;
				TaskSender.SendfinishTaskMessage(TaskMissionManager.mainTaskInfo.taskId);	
			}
			
			
		}
		
		
		
		private function setView():void
		{
			hideView();
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			
			if(task!=null&&taskData!=null)
			{
				setTitle(taskData.q_party_name,taskData.q_name,taskData.q_deal_mission);
				TaskUtil.setRewordInfo(taskData.q_reword_id,icoList,icoBgList,true);
				
				if(TaskMissionManager.getMainTaskIsFinish())
				{
					okBut.isEnabled=true;
				}
				else
				{
					okBut.isEnabled=false;
				}
				
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
			if(TaskMissionManager.getMainTaskIsFinish())
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
		
		/**设置倒计时文字*/
		private function setTimeText():void
		{
			if(this.visible&&this.parent!=null)
			{
				timerLabel.htmlText=currtimer+"秒后自动领取奖励";
				if(currtimer==0)
				{
					timer.stop();
					subFinish();
				}
				currtimer--;
			}
			else
			{
				timer.stop();
			}
		}
		
		private function hideView():void
		{
			var i:int,length:int;
			length=icoList.length;
			for(i=0;i<length;i++)
			{
				icoList[i].visible=false;
				icoBgList[i].visible=false;
				
			}
		}
	}
}