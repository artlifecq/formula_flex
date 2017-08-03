package com.rpgGame.app.ui.main.taskbar
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * 主线支线环式面板
	 * @author YT
	 * 
	 */	
	public class TaskLeadView
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var skinList:Array;
		
		private var titleLable:Label;
		private var navi1Lable:Label;
		private var navi2Lable:Label;
		private var navi3Lable:Label;
		private var priLabel:Label
		private var jindu:RenWu_jindu;
		private var killButList:Vector.<SkinnableContainer>;
		private var killLabelList:Vector.<Label>;
		private var icoBgList:Vector.<UIAsset>;
		//private var icoList:Vector.<IconCDFace>;
		private var icoListGroup:RewardGroup;
		public function TaskLeadView(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			
			init();
		}
		private function init():void
		{
			_skin.but_openBg.visible=false;
			_skin.btn_open.visible=false;
			_skin.btn_close.visible=true;
			_skin.task_effect.visible=true;
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.pri_ico0,RewardGroup.ALIN_CENTER,4,6,6,true,4);
			
			skinList=new Array();
			skinList.push(_skin.pri_navi0);
			skinList.push(_skin.pri_navi1_txt);
			skinList.push(_skin.pri_navi1);
			skinList.push(_skin.pri_probar);
			skinList.push(_skin.pri_navi2);
			skinList.push(_skin.pri_txt);
			skinList.push(_skin.pri_navi3);
			skinList.push(_skin.pri_killbut_1);
			skinList.push(_skin.pri_killbut_2);
			skinList.push(_skin.pri_killbut_3);
			skinList.push(icoListGroup);
			//skinList.push(_skin.pri_ico3);
			titleLable=_skin.pri_navi1_txt;
//			navi1Lable=_skin.pri_navi1_txt;
			jindu=_skin.pri_probar.skin as RenWu_jindu;
			killButList=new Vector.<SkinnableContainer>();
			killButList.push(_skin.pri_killbut_1);
			killButList.push(_skin.pri_killbut_2);
			killButList.push(_skin.pri_killbut_3);
			killLabelList=new Vector.<Label>();
			for(i=0;i<killButList.length;i++)
			{
				Renwu_Item(killButList[i].skin).labelDisplay.name="KILLII"+TaskType.MAINTYPE_MAINTASK+"II"+i+"II1";
				Renwu_Item(killButList[i].skin).btn_send.name="KILLII"+TaskType.MAINTYPE_MAINTASK+"II"+i+"II2";
				killLabelList.push(Renwu_Item(killButList[i].skin).labelDisplay);
				TaskUtil.setTextEvet(killButList[i]);
				killButList[i].visible=false;
			}
			/*for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
				TaskUtil.setTextEvet(killButList[i]);
			}*/
			/*killLabelList.push(Renwu_Item(_skin.pri_killbut_1.skin).labelDisplay);
			killLabelList.push(Renwu_Item(_skin.pri_killbut_2.skin).labelDisplay);
			killLabelList.push(Renwu_Item(_skin.pri_killbut_3.skin).labelDisplay);*/
		/*	kill1Label=Renwu_Item(_skin.pri_killbut1.skin).labelDisplay;
			kill2Label=Renwu_Item(_skin.pri_killbut2.skin).labelDisplay;
			kill3Label=Renwu_Item(_skin.pri_killbut3.skin).labelDisplay;*/
			priLabel=_skin.pri_txt;
			icoBgList=new Vector.<UIAsset>();
			icoBgList.push(_skin.pri_ico0);
			var i:int;
			/*icoList=new Vector.<IconCDFace>();
			
			for(i=0;i<icoBgList.length;i++)
			{
				var ico:IconCDFace=IconCDFace.create(IcoSizeEnum.ICON_42);
				ico.showCD=false;
				ico.x=icoBgList[i].x+3;
				ico.y=icoBgList[i].y+3;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				_skin.primary_box.addChild(ico);
			}*/
			
			
			
			
			
			
			
			
			titleLable.htmlText="";
//			navi1Lable.htmlText="章节进度";
//			navi2Lable.htmlText="任务描述";
//			navi3Lable.htmlText="任务进度";
			jindu.labelDisplay.text="0%";
			jindu.pro_jindu.maximum=100;
			jindu.pro_jindu.value=0;
			priLabel.htmlText="";
			//killLabel.htmlText="击杀：<u>少林杖僧</u><font color='#cfc6ae'>(2/10)</font>";
			
			
			/*
			icoList[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_48));
			icoList[0].visible=true;
			icoBgList[0].visible=true;
			icoList[1].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_48));
			icoList[1].visible=true;
			icoBgList[1].visible=true;*/
			
			hideInfo();
		}
		
		public function show(key:Boolean):void
		{
			_skin.primary_box.visible=key;
		}
		
		
		
		public function hideInfo():void
		{
			titleLable.htmlText="";
			jindu.labelDisplay.text="";
			jindu.pro_jindu.maximum=100;
			jindu.pro_jindu.value=0;
			priLabel.htmlText="";
			var i:int;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			/*for(i=0;i<icoBgList.length;i++)
			{
				icoBgList[i].visible=false;
				icoList[i].visible=false;
			}*/
			icoListGroup.visible=false;
		}
		
		public function hideKillBut():void
		{
			
			var i:int;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			
		}
		
		
		public function leadTaskView():void
		{
			if(!_skin.primary_box.visible)return;
			hideInfo();
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			
			if(task!=null&&taskData!=null)
			{
				setTitle(taskData.q_party_name,taskData.q_name,taskData.q_describe);
				setParcent(taskData.q_party_id,taskData.q_node_id);
				setTaskButView(taskData.q_mission_mainType,taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist);
				//TaskUtil.setRewordInfo(taskData.q_reword_id,icoList,icoBgList);
				icoListGroup.setRewardByArray(TaskMissionCfgData.getRewordById(taskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
				icoListGroup.visible=true;
				setUisite();
			}
			
		}
		public function upleadTaskView():void
		{
			
			if(!_skin.primary_box.visible)return;
			var task:TaskInfo=TaskMissionManager.mainTaskInfo;
			var taskData:Q_mission_base=TaskMissionManager.mainTaskData;
			
			if(task!=null&&taskData!=null)
			{
				setTaskButView(taskData.q_mission_mainType,taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist);
				
			}
			
		}
		public function leadTaskFilish():void
		{
			if(!_skin.primary_box.visible)return;
			//icoListGroup.tweeRewardInBag(2);
		}
		private var title:String;
		/**设置标题详情*/
		private function setTitle(party:String,name:String,describe:String):void
		{
			title=party+name;
			titleLable.htmlText=title;
			priLabel.height=300;
			priLabel.htmlText=describe;
			priLabel.height=priLabel.textHeight;
		}
		/**设置完成进度*/
		private function setParcent(pid:int,nid:int):void
		{
			var count:uint=TaskMissionCfgData.getPartyCountByPid(pid);
			nid-=1;
			var parcent:int=int((nid/count)*100);
			jindu.labelDisplay.text=parcent+"%";
			jindu.pro_jindu.maximum=count;
			jindu.pro_jindu.value=nid;
			
		}
		
		private function setTaskButView(mainType,int,type:int,describe:String,information:String,sub:Vector.<TaskSubRateInfo>):void
		{
			if(type!=TaskType.SUB_CONVERSATION&&TaskMissionManager.getMainTaskIsFinish()&&TaskMissionManager.getMainTaskHaveNpc())
			{
				titleLable.htmlText=title+"<font color='#00ff0c'>(已完成)</font>";
				setSubbutView(TaskMissionManager.getTaskNpcModeId(mainType));
			}
			else
			{
				titleLable.htmlText=title+"<font color='#ff0d0d'>(未完成)</font>";
				TaskUtil.setGotargetInfo(mainType,type,describe,information,sub,killButList);
			}
			setUisite();
		}
		
		private function setSubbutView(npcid:int):void
		{
			hideKillBut();
			var text:String="<font color='#eaeabc'>回复：</font><u>"+MonsterDataManager.getMonsterName(npcid)+"</u>";
			TaskUtil.setGotargetLabelText(TaskType.SUB_CONVERSATION,killButList[0],text);
			
		}
		
		
	
		
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible==true)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			
			_skin.btnContinue.y=skinList[count].y+skinList[count].height+15;
			_skin.uibg.height=_skin.btnContinue.y+_skin.btnContinue.height+15;
			
			
			/*for(i=0;i<3;i++)
			{
				if(icoBgList[i].visible==true)
				{
					icoBgList[i].y=icoBgList[0].y;
					icoList[i].y=icoBgList[0].y+3;
				}
			}
			for(i=3;i<icoBgList.length;i++)
			{
				if(icoBgList[i].visible==true)
				{
					icoBgList[i].y=icoBgList[3].y;
					icoList[i].y=icoBgList[3].y+3;
				}
			}
			*/
			
			
		}
		
		
		
	}
}