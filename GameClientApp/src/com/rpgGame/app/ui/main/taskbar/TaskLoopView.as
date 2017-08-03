package com.rpgGame.app.ui.main.taskbar
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.task.bean.NoMainTaskInfo;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.themes.GuiThemeStyle;
	
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.mainui.renwu.RenWuTitle_Skin;
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.Shape;

	public class TaskLoopView
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var skinList:Array;
		
		private var scrollBar :ScrollContainer;
		private var scrollBox:Group;
		private var scrollBack : Shape;
		private var navi1:SkinnableContainer;
		private var navi2:SkinnableContainer;
		private var navi3:SkinnableContainer;
		private var killBut1List:Vector.<SkinnableContainer>;
		private var killLabel1List:Vector.<Label>;
		private var killBut2List:Vector.<SkinnableContainer>;
		private var killLabel2List:Vector.<Label>;
		private var killBut3List:Vector.<SkinnableContainer>;
		private var killLabel3List:Vector.<Label>;
		private var killBut4List:Vector.<SkinnableContainer>;
		private var killLabel4List:Vector.<Label>;
		
		private var extraLabel:Label;
		/*private var ico1BgList:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var ico2BgList:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;*/
		private var icoList1Group:RewardGroup;
		private var icoList2Group:RewardGroup;
		private var icoList3Group:RewardGroup;
		private var subBut1:Button;
		//private var subBut2:Button;
		private var guideLabelList:Vector.<Label>;
		
		public function TaskLoopView(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			init();
		}
		private function init():void
		{
			var i:int;
			scrollInit();
			icoList1Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico1_0,RewardGroup.ALIN_CENTER,4,6,6,true,4);
			icoList2Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico2_0,RewardGroup.ALIN_CENTER,4,6,6,true,4);
			icoList3Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico3_0,RewardGroup.ALIN_CENTER,4,6,6,true,4);
			
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbInfo);
			skinList.push(_skin.sec_txt);
			skinList.push(_skin.sec_killbut1_1);
			skinList.push(_skin.sec_killbut1_2);
			skinList.push(_skin.sec_killbut1_3);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_killbut2_1);
			skinList.push(_skin.sec_killbut2_2);
			skinList.push(_skin.sec_killbut2_3);
			skinList.push(icoList1Group);
			skinList.push(_skin.sec_subbut1);
			skinList.push(_skin.sec_navi3);
			skinList.push(_skin.sec_killbut3_1);
			skinList.push(_skin.sec_killbut3_2);
			skinList.push(_skin.sec_killbut3_3);
			skinList.push(_skin.sec_info);
			skinList.push(icoList2Group);
			skinList.push(_skin.sec_navi4);
			skinList.push(_skin.sec_killbut4_1);
			skinList.push(_skin.sec_killbut4_2);
			skinList.push(_skin.sec_killbut4_3);
			skinList.push(icoList3Group);
			
			
			
			
			//skinList.push(_skin.sec_subbut2);
		/*	navi1=RenWuTitle_Skin(_skin.sec_navi1.skin).sec_navi1;
			navi2=RenWuTitle_Skin(_skin.sec_navi2.skin).sec_navi1;
			navi3=RenWuTitle_Skin(_skin.sec_navi3.skin).sec_navi1;*/
			navi1=_skin.sec_navi1;
			navi2=_skin.sec_navi2;
			navi3=_skin.sec_navi3;
			killBut1List=new Vector.<SkinnableContainer>();
			killBut1List.push(_skin.sec_killbut1_1);
			killBut1List.push(_skin.sec_killbut1_2);
			killBut1List.push(_skin.sec_killbut1_3);
			killLabel1List=new Vector.<Label>();
			for(i=0;i<killBut1List.length;i++)
			{
				Renwu_Item(killBut1List[i].skin).labelDisplay.name="KILLII"+TaskType.MAINTYPE_MAINTASK+"II"+i+"II1";
				Renwu_Item(killBut1List[i].skin).btn_send.name="KILLII"+TaskType.MAINTYPE_MAINTASK+"II"+i+"II2";
				killLabel1List.push(Renwu_Item(killBut1List[i].skin).labelDisplay);
				TaskUtil.setTextEvet(killBut1List[i]);
			}
			killBut2List=new Vector.<SkinnableContainer>();
			killBut2List.push(_skin.sec_killbut2_1);
			killBut2List.push(_skin.sec_killbut2_2);
			killBut2List.push(_skin.sec_killbut2_3);
			killLabel2List=new Vector.<Label>();
			for(i=0;i<killBut2List.length;i++)
			{
				Renwu_Item(killBut2List[i].skin).labelDisplay.name="KILLII"+TaskType.MAINTYPE_DAILYTASK+"II"+i+"II1";
				Renwu_Item(killBut2List[i].skin).btn_send.name="KILLII"+TaskType.MAINTYPE_DAILYTASK+"II"+i+"II2";
				killLabel2List.push(Renwu_Item(killBut2List[i].skin).labelDisplay);
				TaskUtil.setTextEvet(killBut2List[i]);
			}
			killBut3List=new Vector.<SkinnableContainer>();
			killBut3List.push(_skin.sec_killbut3_1);
			killBut3List.push(_skin.sec_killbut3_2);
			killBut3List.push(_skin.sec_killbut3_3);
			killLabel3List=new Vector.<Label>();
			for(i=0;i<killBut3List.length;i++)
			{
				Renwu_Item(killBut3List[i].skin).labelDisplay.name="KILLII"+TaskType.MAINTYPE_TREASUREBOX+"II"+i+"II1";
				Renwu_Item(killBut3List[i].skin).btn_send.name="KILLII"+TaskType.MAINTYPE_TREASUREBOX+"II"+i+"II2";
				killLabel3List.push(Renwu_Item(killBut3List[i].skin).labelDisplay);
				TaskUtil.setTextEvet(killBut3List[i]);
			}
			killBut4List=new Vector.<SkinnableContainer>();
			killBut4List.push(_skin.sec_killbut4_1);
			killBut4List.push(_skin.sec_killbut4_2);
			killBut4List.push(_skin.sec_killbut4_3);
			killLabel4List=new Vector.<Label>();
			for(i=0;i<killBut4List.length;i++)
			{
				Renwu_Item(killBut4List[i].skin).labelDisplay.name="KILLII"+TaskType.MAINTYPE_GUILDDAILYTASK+"II"+i+"II1";
				Renwu_Item(killBut4List[i].skin).btn_send.name="KILLII"+TaskType.MAINTYPE_GUILDDAILYTASK+"II"+i+"II2";
				killLabel4List.push(Renwu_Item(killBut4List[i].skin).labelDisplay);
				TaskUtil.setTextEvet(killBut4List[i]);
			}
			
			
			extraLabel=_skin.sec_info;
			subBut1=_skin.sec_subbut1;
			//subBut2=_skin.sec_subbut2;
			_skin.chkAuto.isSelected=false;
			_skin.chkAuto1.isSelected=false;
			guideLabelList=new Vector.<Label>();
			
			hideInfo();
		}
		
		private function scrollInit():void
		{
			
			scrollBar=_skin.scroll_bar;
			scrollBox=_skin.scroll_box;
			scrollBar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			scrollBar.verticalScrollPolicy = Scroller.SCROLL_POLICY_AUTO;
			scrollBar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			scrollBack = new Shape();
			scrollBack.graphics.beginFill(0x00FF00);
			scrollBack.graphics.drawRoundRect(0, 0, 100, 100);
			scrollBack.graphics.endFill();
			scrollBack.visible=false;
			scrollBox.addChild(scrollBack);
			GuiThemeStyle.setScrollerStyle(scrollBar, org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack);
			scrollBar.x=scrollBox.x;
			scrollBar.y=scrollBox.y;
			scrollBar.width=scrollBox.width;
			scrollBox.x=0;
			scrollBox.y=0;
			scrollBar.addChild(scrollBox);
		}
		
		public function show(key:Boolean):void
		{
			_skin.secondary_box.visible=key;
			if(key)
			{
				_skin.scroll_bar.visible=true;
				_skin.scroll_box.visible=true;
				_skin.uibg.height=335;
			}
			else
			{
				isInit=false;
			}
		}
		public function get isShow():Boolean
		{
			return _skin.secondary_box.visible;
		}
		
		private var isInit:Boolean=false;
		public function loopTaskView(type:int=0):void
		{
			if(!_skin.secondary_box.visible)return;
			
			if(type==0||!isInit)
			{
				isInit=true;
				setMainTaskView();
				setDailyTaskView();
				setTreasuerTaskView();
				setGuildTaskView();
				setGuideTaskView();
			}
			else if(type==TaskType.MAINTYPE_MAINTASK)
			{
				setMainTaskView();
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				setDailyTaskView();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				setTreasuerTaskView();
			}
			else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				setGuildTaskView()
			}
			else if(type==TaskType.MAINTYPE_GUIDETASK)
			{
				setGuideTaskView();
			}
		}
		public function upLoopTaskView(type:int=0):void
		{
			if(!_skin.secondary_box.visible)return;
			if(type==0)
			{
				setMainTaskView();
				upDailyTaskView();
				upTreasuerTaskView();
				upGuildTaskView();
			}
			else if(type==TaskType.MAINTYPE_MAINTASK)
			{
				setMainTaskView();
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				upDailyTaskView();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				upTreasuerTaskView();
			}
			else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				upGuildTaskView()
			}
			else if(type==TaskType.MAINTYPE_GUIDETASK)
			{
				setGuideTaskView();
			}
		}
		public function hideTaskView(type:int=0):void
		{
			if(!_skin.secondary_box.visible)return;
			if(type==0||!isInit)
			{
				hideInfo();
			}
			else if(type==TaskType.MAINTYPE_MAINTASK)
			{
				hideMainTaskView();
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				hideDailyTaskView();
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				hideTreasuerTaskView();
			}
			else if(type==TaskType.MAINTYPE_GUILDDAILYTASK)
			{
				hideGuildTaskView()
			}
			else if(type==TaskType.MAINTYPE_GUIDETASK)
			{
				hideGuideTaskView();
			}
			setUisite();
		}
		
		/**设置主线任务显示*/
		public function setMainTaskView():void
		{
			hideMainTaskView();
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_MAINTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getMainTaskIsFinish(),navi1,null,taskData.q_describe);
				if(taskData.q_mission_type!=TaskType.SUB_CONVERSATION&&TaskMissionManager.getMainTaskIsFinish()&&TaskMissionManager.getMainTaskHaveNpc())
				{
					setSubbutView(MonsterDataManager.getMonsterModeidByAreaid(taskData.q_finish_npc),killBut1List);
				}
				else
				{
					TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut1List);
				}
				
				TipTargetManager.show( _skin.sec_navi1, TargetTipsMaker.makeTips( TipType.TASK_LEAD_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id}));
				
			}
			setUisite();
		}
		/**设置主线任务隐藏*/
		public function hideMainTaskView():void
		{
			navi1.visible=false;
			var i:int;
			for(i=0;i<killBut1List.length;i++)
			{
				killBut1List[i].x=12;
				killBut1List[i].visible=false;
			}
			_skin.sec_txt.visible=false;
			_skin.sec_navi1.visible=false;
			_skin.lbInfo.visible=false;
			_skin.sec_tuijian.visible=false;
		}
		
		/**设置支线任务显示*/
		public function setDailyTaskView():void
		{
			hideDailyTaskView();
			var task:TaskInfo=TaskMissionManager.dailyTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.dailyTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_DAILYTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getDailyTaskIsFinish(),navi2,subBut1);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut2List);
				//TaskUtil.setRewordInfo(taskData.q_reword_id,ico1List,ico1BgList);
				icoList1Group.setRewardByArray(TaskMissionCfgData.getRewordById(taskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
				icoList1Group.visible=true;
				TipTargetManager.show( _skin.sec_navi2, TargetTipsMaker.makeTips( TipType.TASK_LEAD_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id}));
				
			}
			setUisite();
		}
		/**设置支线任务隐藏*/
		public function hideDailyTaskView():void
		{
			navi2.visible=false;
			var i:int;
			for(i=0;i<killBut2List.length;i++)
			{
				killBut2List[i].visible=false;
			}
			icoList1Group.visible=false;
			
			subBut1.visible=false;
		}
		
		/**更新支线任务显示*/
		public function upDailyTaskView():void
		{
			var task:TaskInfo=TaskMissionManager.dailyTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.dailyTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_DAILYTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getDailyTaskIsFinish(),navi2,subBut1);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut2List);
				setUisite();
			}
			
		}
		
		
		/**设置环式任务显示*/
		public function setTreasuerTaskView():void
		{
			hideTreasuerTaskView()
			var task:TaskInfo=TaskMissionManager.treasuerTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.treasuerTaskData;
			
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_TREASUREBOX,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),navi3);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut3List);
				var reward:Object=TaskMissionManager.getTreasuerTaskExtraReward();
				if(reward!=null)
				{
					//TaskUtil.setRewordInfo(reward.r,ico2List,ico2BgList);
					icoList2Group.setRewardByArray(TaskMissionCfgData.getRewordById(reward.r,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
					icoList2Group.visible=true;
					setExtraLabel(reward.l);
				}
				
				TipTargetManager.show( _skin.sec_navi3, TargetTipsMaker.makeTips( TipType.TASK_LOOP_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id,loopRewardId:task.loopRewardId,loopNumber:task.loopNumber}));
			}
			_skin.auto.visible=true;
			setUisite();
		}
		/**设置环式隐藏*/
		public function hideTreasuerTaskView():void
		{
			navi3.visible=false;
			_skin.auto.visible=false;
			var i:int;
			for(i=0;i<killBut3List.length;i++)
			{
				killBut3List[i].visible=false;
			}
			
			icoList2Group.visible=false;
			//subBut2.visible=false;
			extraLabel.visible=false;
		}
		/**更新环式任务显示*/
		public function upTreasuerTaskView():void
		{
			var task:TaskInfo=TaskMissionManager.treasuerTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.treasuerTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_TREASUREBOX,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),navi3);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut3List);
				TipTargetManager.show( _skin.sec_navi3, TargetTipsMaker.makeTips( TipType.TASK_LOOP_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id,loopRewardId:task.loopRewardId,loopNumber:task.loopNumber}));
				setUisite();
			}
			
		}
		
		/**设置帮会任务显示*/
		public function setGuildTaskView():void
		{
			hideGuildTaskView()
			var task:TaskInfo=TaskMissionManager.getOtherTaskInfo(TaskType.MAINTYPE_GUILDDAILYTASK)
			var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.MAINTYPE_GUILDDAILYTASK)
			
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_GUILDDAILYTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(), _skin.sec_navi4);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut4List);
				icoList3Group.setRewardByArray(TaskMissionCfgData.getRewordById(taskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
				icoList3Group.visible=true;
				TipTargetManager.show( _skin.sec_navi4, TargetTipsMaker.makeTips( TipType.TASK_GUILD_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id}));
			}
			_skin.auto1.visible=true;
			setUisite();
		}
		
		/**设置帮会隐藏*/
		public function hideGuildTaskView():void
		{
			_skin.sec_navi4.visible=false;
			_skin.auto1.visible=false;
			var i:int;
			for(i=0;i<killBut4List.length;i++)
			{
				killBut4List[i].visible=false;
			}
			
			icoList3Group.visible=false;
		}
		/**更新帮会任务显示*/
		public function upGuildTaskView():void
		{
			var task:TaskInfo=TaskMissionManager.getOtherTaskInfo(TaskType.MAINTYPE_GUILDDAILYTASK)
			var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.MAINTYPE_GUILDDAILYTASK)
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_GUILDDAILYTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),_skin.sec_navi4);
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut4List);
				TipTargetManager.show( _skin.sec_navi4, TargetTipsMaker.makeTips( TipType.TASK_LEAD_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id,loopRewardId:task.loopRewardId,loopNumber:task.loopNumber}));
				setUisite();
			}
		}
		
		
		/**设置引导任务显示*/
		public function setGuideTaskView():void
		{
			hideGuideTaskView()
			var task:Vector.<TaskInfo>=TaskMissionManager.getGuideTaskInfo();
			var taskData:Q_mission_base;
			var glabe:Label;
			if(task!=null)
			{
				for(var i:int=0;i<task.length;i++)
				{
					if(i<guideLabelList.length)
					{
						glabe=guideLabelList[i];
					}
					else
					{
						glabe=new Label();
						guideLabelList.push(glabe);
						skinList.push(glabe);
						scrollBox.addChild(glabe);
					}
					glabe.name="KILLII"+TaskType.MAINTYPE_GUIDETASK+"II"+i;
					glabe.x=_skin.sec_navi1.x;
					glabe.visible=true;
					taskData=TaskMissionCfgData.getTaskByID(task[i].taskModelId);
					glabe.htmlText="<font color='#ffea00'>【"+taskData.q_name+"】</font>"+taskData.q_finish_describe+"("+task[i].taskSubRateInfolist[0].num+"/"+task[i].taskSubRateInfolist[0].maxNum+")";
				}
			}
			setUisite();
		}
	
		/**设置引导任务隐藏*/
		public function hideGuideTaskView():void
		{
			var i:int;
			for(i=0;i<guideLabelList.length;i++)
			{
				guideLabelList[i].visible=false;
			}
		}
		
		
		private function setNavView(type:int,party:String,name:String,isFinish:Boolean,navSkin:SkinnableContainer,subBut:Button=null,describe:String=""):void
		{
			navSkin.visible=true;
			var nav:Label=RenWuTitle_Skin(navSkin.skin).sec_navi1;
			if(type==TaskType.MAINTYPE_MAINTASK&&describe!="")
			{
				_skin.sec_txt.height=300;
				_skin.sec_txt.htmlText=describe;
				_skin.sec_txt.height=_skin.sec_txt.textHeight;
				_skin.sec_txt.visible=true;
			}
			var lead:String="";
			var end:String="";
			switch(type)
			{
				case TaskType.MAINTYPE_MAINTASK:
					lead="<font color='#ffea00'>【主线】</font>";
					end=isFinish?"<font color='#00ff0c'>(已完成)</font>":"<font color='#ff0d0d'>(未完成)</font>";
					break;
				case TaskType.MAINTYPE_DAILYTASK:
					lead="<font color='#ffea00'>【支线】</font>";
					end=isFinish?"<font color='#00ff0c'>(已完成)</font>":"<font color='#ff0d0d'>(未完成)</font>";
					break;
				case TaskType.MAINTYPE_TREASUREBOX:
					lead="<font color='#ffea00'>【环式】</font>";
					end="<font color='#eaeabc'>("+TaskMissionManager.treasuerTaskInfo.loopNumber+"/"+TaskMissionManager.getTreasuerAllNum()+")</font>";
					break;
				case TaskType.MAINTYPE_GUILDDAILYTASK:
					lead="<font color='#ffea00'>【帮派】</font>";
					end="<font color='#eaeabc'>("+TaskMissionManager.getOtherTaskInfo(type).loopNumber+"/"+TaskMissionCfgData.getPartyCountByPid(TaskMissionManager.getOtherTaskData(type).q_party_id)+")</font>";
					break;
			}
			nav.htmlText=lead+party+name+end;
			if(subBut!=null)
			{
				subBut.visible=isFinish;
			}
			
		}
		
		/**主线任务完成后收成一条目标*/
		private function setSubbutView(npcid:int,killButList:Vector.<SkinnableContainer>):void
		{
			var text:String="<font color='#eaeabc'>回复：</font><u>"+MonsterDataManager.getMonsterName(npcid)+"</u>";
			TaskUtil.setGotargetLabelText(TaskType.SUB_CONVERSATION,killButList[0],text);
			setUisite();
		}
		
		/**处理卡点显示*/
		public function setKajibutView(taskId: int,noInfo: Vector.<NoMainTaskInfo>):void
		{
			if(!_skin.secondary_box.visible)return;
			var i:int;
			_skin.sec_txt.visible=false;
			_skin.sec_navi1.visible=true;
			_skin.lbInfo.visible=true;
			_skin.sec_tuijian.visible=true;
			var nav:Label=RenWuTitle_Skin(_skin.sec_navi1.skin).sec_navi1;
			for(i=0;i<killBut1List.length;i++)
			{
				killBut1List[i].x=52;
				killBut1List[i].visible=false;
			}
			var taskData:Q_mission_base=TaskMissionCfgData.getTaskByID(taskId);
			if(taskData!=null)
			{
				nav.htmlText="<font color='#ffea00'>【主线】</font>"+taskData.q_party_name+taskData.q_name;
				_skin.lbInfo.htmlText="本任务需要"+taskData.q_needLevel+"级才能接取";
				TipTargetManager.show( _skin.sec_navi1, TargetTipsMaker.makeTips( TipType.TASK_LEAD_TIP,{name:taskData.q_party_name+taskData.q_name,rewordid:taskData.q_reword_id}));
				
			}
			setKajiGoter();
			
			setUisite();
		}
		/**处理卡点显示*/
		public function setKajiGoter():void
		{
			if(!_skin.secondary_box.visible)return;
			if(!_skin.lbInfo.visible)return;
			var text:String="";
			var add:int=0;
			if(FunctionOpenManager.checkOpenBuyFunId(EmFunctionID.EM_ZHANHUN))
			{
				text="<u>战魂</u>"
				TaskUtil.setGotargetLabelText(add,killBut1List[add],text);
				add++;
			}
			text="<u>推荐挂机点</u>"
			TaskUtil.setGotargetLabelText(10,killBut1List[add],text);
		}
		
		
		private function setExtraLabel(num:int):void
		{
			extraLabel.htmlText="完成<font color='#00ff33'>"+num+"</font>环可获得额外奖励：";
			extraLabel.visible=true;
			
		}
		public function setTreasuerCheck(check:Boolean):void
		{
			TaskMissionManager.treasuerCheck=check;
			TaskAutoManager.getInstance().stopTaskAuto();
			if(check)
			{
				TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_TREASUREBOX);
			}
			NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, check?"开启自动进行环式任务":"取消自动进行环式任务");
		}
		public function clearTreasuerCheck():void
		{
			_skin.chkAuto.isSelected=false;
		}
		public function setGuildCheck(check:Boolean):void
		{
			TaskMissionManager.guildCheck=check;
			TaskAutoManager.getInstance().stopTaskAuto();
			if(check)
			{
				TaskAutoManager.getInstance().startTaskAuto(TaskType.MAINTYPE_GUILDDAILYTASK);
			}
			NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP, check?"开启自动进行帮派任务":"取消自动进行帮派任务");
		}
		public function clearGuildCheck():void
		{
			_skin.chkAuto1.isSelected=false;
		}
		
		
		
		public function hideInfo():void
		{
			hideMainTaskView();
			hideDailyTaskView();
			hideTreasuerTaskView();
			hideGuideTaskView();
			hideGuildTaskView()
		}
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=-1;
			for(i=0;i<skinList.length;i++)
			{
				if(skinList[i].visible==true)
				{
					if(count==-1)
					{
						skinList[i].y=0;
					}
					else
					{
						skinList[i].y=skinList[count].y+skinList[count].height+3;
					}
					
					count=i;
				}
				else
				{
					skinList[i].y=0;
				}
			}
			_skin.sec_tuijian.y=killBut1List[0].y+3;
			_skin.auto.visible=_skin.sec_navi3.visible;
			_skin.auto.y=_skin.sec_navi3.y+1;
			_skin.auto.x=_skin.sec_navi3.x+RenWuTitle_Skin(_skin.sec_navi3.skin).sec_navi1.textWidth+3;
			_skin.auto1.visible=_skin.sec_navi4.visible;
			_skin.auto1.y=_skin.sec_navi4.y+1;
			_skin.auto1.x=_skin.sec_navi4.x+RenWuTitle_Skin(_skin.sec_navi4.skin).sec_navi1.textWidth+3;
			
			if(count>=0)
			{
				scrollBack.height=skinList[count].y+skinList[count].height+10;
			}
			
			scrollBar.addChild(scrollBack);
			scrollBar.addChild(scrollBox);
			
			
			
		}
		
		
		
		
		

	}
}