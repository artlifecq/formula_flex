package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
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
		private var navi1:Label;
		private var navi2:Label;
		private var navi3:Label;
		private var killBut1List:Vector.<SkinnableContainer>;
		private var killLabel1List:Vector.<Label>;
		private var killBut2List:Vector.<SkinnableContainer>;
		private var killLabel2List:Vector.<Label>;
		private var killBut3List:Vector.<SkinnableContainer>;
		private var killLabel3List:Vector.<Label>;
		private var extraLabel:Label;
		private var ico1BgList:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var ico2BgList:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var subBut1:Button;
		private var subBut2:Button;
		public function TaskLoopView(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			init();
		}
		private function init():void
		{
			var i:int;
			scrollInit();
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.sec_killbut1_1);
			skinList.push(_skin.sec_killbut1_2);
			skinList.push(_skin.sec_killbut1_3);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_killbut2_1);
			skinList.push(_skin.sec_killbut2_2);
			skinList.push(_skin.sec_killbut2_3);
			skinList.push(_skin.sec_ico1_0);
			skinList.push(_skin.sec_ico1_3);
			skinList.push(_skin.sec_subbut1);
			skinList.push(_skin.sec_navi3);
			skinList.push(_skin.sec_killbut3_1);
			skinList.push(_skin.sec_killbut3_2);
			skinList.push(_skin.sec_killbut3_3);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_ico2_0);
			skinList.push(_skin.sec_ico2_3);
			skinList.push(_skin.sec_subbut2);
			
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
				killLabel1List.push(Renwu_Item(killBut1List[i].skin).labelDisplay);
			}
			killBut2List=new Vector.<SkinnableContainer>();
			killBut2List.push(_skin.sec_killbut2_1);
			killBut2List.push(_skin.sec_killbut2_2);
			killBut2List.push(_skin.sec_killbut2_3);
			killLabel2List=new Vector.<Label>();
			for(i=0;i<killBut2List.length;i++)
			{
				killLabel2List.push(Renwu_Item(killBut2List[i].skin).labelDisplay);
			}
			killBut3List=new Vector.<SkinnableContainer>();
			killBut3List.push(_skin.sec_killbut3_1);
			killBut3List.push(_skin.sec_killbut3_2);
			killBut3List.push(_skin.sec_killbut3_3);
			killLabel3List=new Vector.<Label>();
			for(i=0;i<killBut3List.length;i++)
			{
				killLabel3List.push(Renwu_Item(killBut3List[i].skin).labelDisplay);
			}
			
			
			extraLabel=_skin.sec_info;
			subBut1=_skin.sec_subbut1;
			subBut2=_skin.sec_subbut2;
			
			var ico:IconCDFace
			ico1BgList=new Vector.<UIAsset>();
			ico1BgList.push(_skin.sec_ico1_0);
			ico1BgList.push(_skin.sec_ico1_1);
			ico1BgList.push(_skin.sec_ico1_2);
			ico1BgList.push(_skin.sec_ico1_3);
			ico1BgList.push(_skin.sec_ico1_4);
			ico1BgList.push(_skin.sec_ico1_5);
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<ico1BgList.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.x=ico1BgList[i].x-6;
				ico.y=ico1BgList[i].y-6;
				//ico.visible=false;
				//ico1BgList[i].visible=false;
				ico1List.push(ico);
				scrollBox.addChild(ico);
			}
			ico2BgList=new Vector.<UIAsset>();
			ico2BgList.push(_skin.sec_ico2_0);
			ico2BgList.push(_skin.sec_ico2_1);
			ico2BgList.push(_skin.sec_ico2_2);
			ico2BgList.push(_skin.sec_ico2_3);
			ico2BgList.push(_skin.sec_ico2_4);
			ico2BgList.push(_skin.sec_ico2_5);
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<ico2BgList.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.x=ico2BgList[i].x-6;
				ico.y=ico2BgList[i].y-6;
				//ico.visible=false;
				//ico2BgList[i].visible=false;
				ico2List.push(ico);
				scrollBox.addChild(ico);
			}
			
			
			
			
			
			navi1.htmlText="[主线]第一章 <u>新手村</u><font color='#8b8d7b'>(未完成)</font>";
			navi2.htmlText="[支线]强化装备<font color='#8b8d7b'>(未完成)</font>";
			navi3.htmlText="[环式]<u>采矿</u><font color='#ffffff'>(10/20)</font><font color='#8b8d7b'>(未完成)</font>";
			
			/*kill1Label.htmlText="交谈：<u>项少龙交谈</u><font color='#cfc6ae'>(0/30)</font>";
			kill2Label.htmlText="击杀：<u>击杀强盗</u><font color='#cfc6ae'>(0/10)</font>";
			kill3Label.htmlText="采集：<u>采集铁矿</u><font color='#cfc6ae'>(0/20)</font>";
			extraLabel.htmlText="完成<font color='#ff0000'>38</font>环可获得额外奖励：";*/
			
			
		/*	ico1List[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_48));
			ico1List[0].visible=true;
			ico1BgList[0].visible=true;
			ico2List[0].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_48));
			ico2List[0].visible=true;
			ico2BgList[0].visible=true;*/
			
			//_skin.sec_killbut1
			//viewSet();
			
			hideMainTaskView();
			hideDailyTaskView();
			hideTreasuerTaskView();
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
			
			
			
			
			
			scrollBox.y=0;
			scrollBar.addChild(scrollBox);
			
			
			
			
		}
		
		public function show(key:Boolean):void
		{
			_skin.secondary_box.visible=key;
			if(!key)
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
			}
			else if(type==1)
			{
				setMainTaskView();
			}
			else if(type==2)
			{
				setDailyTaskView();
			}
			else if(type==3)
			{
				setTreasuerTaskView();
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
			}
			else if(type==1)
			{
				setMainTaskView();
			}
			else if(type==2)
			{
				upDailyTaskView();
			}
			else if(type==3)
			{
				upTreasuerTaskView();
			}
			
		}
		public function hideTaskView(type:int=0):void
		{
			if(!_skin.secondary_box.visible)return;
			if(type==0||!isInit)
			{
				hideMainTaskView();
				hideDailyTaskView();
				hideTreasuerTaskView();
			}
			else if(type==1)
			{
				hideMainTaskView();
			}
			else if(type==2)
			{
				hideDailyTaskView();
			}
			else if(type==3)
			{
				hideTreasuerTaskView();
			}
		}
		
		
		
		/**设置主线任务显示*/
		public function setMainTaskView():void
		{
			hideMainTaskView();
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_MAINTASK,taskData.q_party_name,taskData.q_name,TaskMissionManager.getMainTaskIsFinish(),navi1);
				if(taskData.q_mission_type!=TaskType.SUB_CONVERSATION&&TaskMissionManager.getMainTaskIsFinish()&&TaskMissionManager.getMainTaskHaveNpc())
				{
					setSubbutView(MonsterDataManager.getMonsterModeidByAreaid(taskData.q_finish_npc),killBut1List);
				}
				else
				{
					TaskUtil.setGotargetInfo(taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut1List);
				}
				
			}
			else
			{
				setKadianNavView("任务等级达到{0}级",navi1);
				
				setKadianbutView(killBut1List);
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
				killBut1List[i].visible=false;
			}
			
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
				TaskUtil.setGotargetInfo(taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut2List);
				TaskUtil.setRewordInfo(taskData.q_reword_id,ico1List,ico1BgList);
				
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
			for(i=0;i<ico1BgList.length;i++)
			{
				ico1BgList[i].visible=false;
				ico1List[i].visible=false;
			}
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
				TaskUtil.setGotargetInfo(taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut2List);
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
				setNavView(TaskType.MAINTYPE_TREASUREBOX,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),navi3,subBut2);
				TaskUtil.setGotargetInfo(taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut3List);
				var reward:Object=TaskMissionManager.getTreasuerTaskExtraReward();
				if(reward!=null)
				{
					TaskUtil.setRewordInfo(reward.r,ico2List,ico2BgList);
					setExtraLabel(reward.l);
				}
				
				
				
			}
			setUisite();
		}
		/**设置支线环式隐藏*/
		public function hideTreasuerTaskView():void
		{
			navi3.visible=false;
			var i:int;
			for(i=0;i<killBut3List.length;i++)
			{
				killBut3List[i].visible=false;
			}
			for(i=0;i<ico2BgList.length;i++)
			{
				ico2BgList[i].visible=false;
				ico2List[i].visible=false;
			}
			subBut2.visible=false;
			extraLabel.visible=false;
		}
		/**更新环式任务显示*/
		public function upTreasuerTaskView():void
		{
			var task:TaskInfo=TaskMissionManager.treasuerTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.treasuerTaskData;
			if(task!=null&&taskData!=null)
			{
				setNavView(TaskType.MAINTYPE_TREASUREBOX,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),navi3,subBut2);
				TaskUtil.setGotargetInfo(taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killBut3List);
				setUisite();
			}
			
		}
		private function setNavView(type:int,party:String,name:String,isFinish:Boolean,nav:Label,subBut:Button=null):void
		{
			nav.visible=true;
			
			
			if(type==1)
			{
				nav.htmlText="[主线]";
			}
			else if(type==2)
			{
				nav.htmlText="[支线]";
			}
			else if(type==3)
			{
				nav.htmlText="[环式]";
			}
			nav.htmlText+=party+name;
			if(type==3)
			{
				nav.htmlText+="<font color='#ffffff'>("+TaskMissionManager.treasuerTaskInfo.loopNumber+"/"+TaskMissionManager.getTreasuerAllNum()+")</font>";
			}
			
			if(isFinish)
			{
				nav.htmlText+="<font color='#55bd15'>(已完成)</font>";
				if(subBut!=null)
				{
					//subBut.isEnabled=true;
					subBut.visible=true;
				}
			}
			else
			{
				nav.htmlText+="<font color='#8b8d7b'>(未完成)</font>";
				if(subBut!=null)
				{
					//subBut.isEnabled=false;
					subBut.visible=false;
				}
			}
		}
		
		/**主线任务完成后收成一条目标*/
		private function setSubbutView(npcid:int,killButList:Vector.<SkinnableContainer>):void
		{
			var i:int;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			var text:String="回复:<u>"+MonsterDataManager.getMonsterName(npcid)+"</u>";
			TaskUtil.setGotargetLabelText(TaskType.MAINTYPE_MAINTASK,killButList[0],text);
			setUisite();
		}
		/**处理卡点*/
		private function setKadianNavView(name:String,nav:Label):void
		{
			//nav.htmlText="[主线]"+name+"<font color='#8b8d7b'>(未完成)</font>";
			
		}
		
		/**处理卡点显示*/
		private function setKadianbutView(killButList:Vector.<SkinnableContainer>):void
		{/*
			var i:int;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			var text:String="回复:<u>"+MonsterDataManager.getMonsterName(npcid)+"</u>";
			TaskUtil.setGotargetLabelText(TaskType.MAINTYPE_MAINTASK,killButList[0],text);
			setUisite();*/
		}
		
		
		
		private function setExtraLabel(num:int):void
		{
			extraLabel.htmlText="完成<font color='#ff0000'>"+num+"</font>环可获得额外奖励：";
			extraLabel.visible=true;
			
		}
		
		
		
		public function hideInfo():void
		{
			navi1.visible=false;
			navi2.visible=false;
			navi3.visible=false;
			var i:int;
			for(i=0;i<killBut1List.length;i++)
			{
				killBut1List[i].visible=false;
			}
			for(i=0;i<killBut2List.length;i++)
			{
				killBut2List[i].visible=false;
			}
			for(i=0;i<killBut3List.length;i++)
			{
				killBut3List[i].visible=false;
			}
			for(i=0;i<ico1BgList.length;i++)
			{
				ico1BgList[i].visible=false;
				ico1List[i].visible=false;
			}
			for(i=0;i<ico2BgList.length;i++)
			{
				ico2BgList[i].visible=false;
				ico2List[i].visible=false;
			}
			
			extraLabel.visible=false;
			subBut1.visible=false;
			subBut2.visible=false;
			
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
			for(i=0;i<3;i++)
			{
				ico1BgList[i].y=ico1BgList[0].y;
				ico1List[i].y=ico1BgList[0].y-6;
			}
			for(i=3;i<ico1BgList.length;i++)
			{
				ico1BgList[i].y=ico1BgList[3].y;
				ico1List[i].y=ico1BgList[3].y-6;
			}
			for(i=0;i<3;i++)
			{
				ico2BgList[i].y=ico2BgList[0].y;
				ico2List[i].y=ico2BgList[0].y-6;
			}
			for(i=3;i<ico2BgList.length;i++)
			{
				ico2BgList[i].y=ico2BgList[3].y;
				ico2List[i].y=ico2BgList[3].y-6;
			}
			if(count>=0)
			{
				scrollBack.height=skinList[count].y+skinList[count].height+3;
			}
			
			scrollBar.addChild(scrollBack);
			scrollBar.addChild(scrollBox);
			
			
			
		}
		
		
		
		
		

	}
}