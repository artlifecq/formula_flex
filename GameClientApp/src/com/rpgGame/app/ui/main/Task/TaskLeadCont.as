package com.rpgGame.app.ui.main.Task
{
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * 主线支线环式面板
	 * @author YT
	 * 
	 */	
	public class TaskLeadCont
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var titleLable:Label;
		private var navi1Lable:Label;
		private var navi2Lable:Label;
		private var navi3Lable:Label;
		private var killLabel:Label;
		private var priLabel:Label
		private var jindu:RenWu_jindu;
		private var icoBgList:Vector.<UIAsset>;
		private var icoList:Vector.<BgIcon>;
		public function TaskLeadCont(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			
			init();
		}
		private function init():void
		{
			titleLable=_skin.pri_title;
			navi1Lable=_skin.pri_navi1;
			navi2Lable=_skin.pri_navi2;
			navi3Lable=_skin.pri_navi3;
			jindu=_skin.pri_probar.skin as RenWu_jindu;
			killLabel=Renwu_Item(_skin.pri_killbut.skin).labelDisplay;
			priLabel=_skin.pri_txt;
			icoBgList=new Vector.<UIAsset>();
			icoBgList.push(_skin.pri_ico0);
			icoBgList.push(_skin.pri_ico1);
			icoBgList.push(_skin.pri_ico2);
			icoBgList.push(_skin.pri_ico3);
			icoBgList.push(_skin.pri_ico4);
			icoBgList.push(_skin.pri_ico5);
			icoList=new Vector.<BgIcon>();
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				var ico:BgIcon=new BgIcon(IcoSizeEnum.ICON_48);
				ico.x=icoBgList[i].x-6;
				ico.y=icoBgList[i].y-6;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				_skin.primary_box.addChild(ico);
			}
			
			
			titleLable.htmlText="第一章:新手村";
			navi1Lable.htmlText="章节任务";
			navi2Lable.htmlText="任务描述";
			navi3Lable.htmlText="任务进度";
			jindu.labelDisplay.text="40%";
			jindu.pro_jindu.maximum=100;
			jindu.pro_jindu.value=40;
			priLabel.htmlText="听闻有刺客密谋造反，请速速追捕嫌犯";
			killLabel.htmlText="击杀：<u>少林杖僧</u><font color='#cfc6ae'>(2/10)</font>";
			
			
			/*
			icoList[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_48));
			icoList[0].visible=true;
			icoBgList[0].visible=true;
			icoList[1].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_48));
			icoList[1].visible=true;
			icoBgList[1].visible=true;*/
			
			
		}
		
		public function show(key:Boolean):void
		{
			_skin.primary_box.visible=key;
		}
		
		
		public function leadTaskView():void
		{
			var task:TaskInfo;
			var taskData:Q_mission_base;
			task=TaskMissionManager.currentMainTaskInfo;
			if(task!=null)
			{
				taskData=TaskMissionCfgData.getTaskByID(task.taskModelId);
			}
			if(taskData!=null)
			{
				titleLable.htmlText="第"+taskData.q_party_id+"章:"+taskData.q_party_name;
				var i:int;
				var finiStr:Array;
				var finiList:Array=taskData.q_finish_information_str.split(";");
				
				if(taskData.q_mission_type==TaskType.SUB_CONVERSATION)
				{
					
					jindu.labelDisplay.text="0%";
					jindu.pro_jindu.maximum=1;
					jindu.pro_jindu.value=0;
					priLabel.htmlText=taskData.q_describe;
					killLabel.htmlText=TaskMissionCfgData.getTaskDescribe(taskData.q_finish_describe,finiList[0]);
				}
				else
				{
					var max:int,current:int,percent:int;
					
					for(i=0;i<finiList.length;i++)
					{
						finiStr=finiList[i].split(",");
						if(finiStr.length==2)
						{
							
						}
						
					}
					//max=
					jindu.labelDisplay.text="0%";
					jindu.pro_jindu.maximum=1;
					jindu.pro_jindu.value=0;
					priLabel.htmlText=taskData.q_describe;
					killLabel.htmlText=taskData.q_finish_describe+"<font color='#cfc6ae'>(2/10)</font>";
				}
			
				
				//jindu.labelDisplay.text="40%";
				
				
			}
			
		}
		
		
	}
}