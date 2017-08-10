package com.rpgGame.app.ui.scene
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.sender.TaskSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LijinCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daysdown_gold;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_mission_section;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_Skin;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_Tips;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	/**
	 * 天降礼金追踪
	 * @author YT
	 * 
	 */	
	public class LijinTrackerUI extends SceneTrackerUI
	{
		
		private var _skin:Active_LiJin_Skin;
		private var _tipsSkin:Active_LiJin_Tips;
		private var tips:Sprite;
		private var tween:TweenMax;
		private var skinList:Array;
		
		/*private var ico1List:Vector.<IconCDFace>;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;*/
		private var icoList1Group:RewardGroup;
		private var icoList2Group:RewardGroup;
		private var killButList:Vector.<SkinnableContainer>;
		private var dieIdList:Vector.<int>;
		private var alertOk:AlertSetInfo;
		private var taskAutoKey:Boolean=false;
		public function LijinTrackerUI()
		{
			_skin=new Active_LiJin_Skin();
			_tipsSkin=new Active_LiJin_Tips();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			tips=_tipsSkin.toSprite();
			tips.visible=false;
			_skin.qiang_box.addChild(tips);
			tips.x=-225;
			tips.y=50;
			var i:int;
			
			icoList1Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico1_0,RewardGroup.ALIN_CENTER,4,6,6);
			icoList2Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico2_0,RewardGroup.ALIN_CENTER,4,6,6);
			
			
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbRenWu);
			skinList.push(_skin.killbut0);
			skinList.push(_skin.killbut1);
			skinList.push(_skin.killbut2);
			skinList.push(icoList1Group);
			skinList.push(_skin.sec_navi0);
			skinList.push(icoList2Group);
			skinList.push(_skin.sec_subbut1);
			
			killButList=new Vector.<SkinnableContainer>();
			for(i=0;i<3;i++)
			{
				killButList.push(_skin["killbut"+i]);
				Renwu_Item(_skin["killbut"+i].skin).btn_send.visible=false;
				TaskUtil.setTextEvet(killButList[i]);
			}
			
			_skin.lbTime1.text="00:00:00";
			_skin.grpshuaxin.visible=false;
			_skin.grpto.visible=false;
			alertOk=new AlertSetInfo(LangAlertInfo.LIJIN_EXIT_SURE);
			
			setUisite();
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btn_qiang_close":
					setQiangBoxState(false);
					break;
				case "btn_qiang_open":
					setQiangBoxState(true);
					break;
				case "sec_subbut1"://自动任务
					taskAuto(true);
					break;
				case "sec_subbut2"://离开场景
					//AppManager.showApp(AppConstant.ACTIVETY_LIJIN_RESULT);
					outToGame();
					break;
				case "lbPaiHang"://排行榜
					//AppManager.showApp(AppConstant.ACTIVETY_LIJIN_SCORES);
					SpecialActivitySender.reqLijinRankInfo();
					break;
				case "lbTo":// 前往刷怪点
					gotoMonsterSite();
					break;
				case Renwu_Item(_skin.killbut0.skin).labelDisplay.name:// 
					killWalkBut(0,1);
					break;
				case Renwu_Item(_skin.killbut1.skin).labelDisplay.name:// 
					killWalkBut(1,1);
					break;
				case Renwu_Item(_skin.killbut2.skin).labelDisplay.name:// 
					killWalkBut(2,1);
					break;
				case Renwu_Item(_skin.killbut0.skin).btn_send.name:// 
					killWalkBut(0,2);
					break;
				case Renwu_Item(_skin.killbut1.skin).btn_send.name:// 
					killWalkBut(1,2);
					break;
				case Renwu_Item(_skin.killbut2.skin).btn_send.name:// 
					killWalkBut(2,2);
					break;
			}
		}
		override protected function onShow() : void
		{
			super.onShow();
			addEvent();
			//setKill();
			//setReword();
			//setUisite();
			//setQianduoType();
			_skin.lbTime1.text="00:00:00";
			_skin.grpshuaxin.visible=false;
			_skin.grpto.visible=false;
			_skin.sec_navi0.visible=false;
			hideReword();
			hideGotargetInfo();
			setCashgift(0);
			setTipsText();
			allFilish();;
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			icoList1Group.clear();
			icoList1Group=null;
			icoList2Group.clear();
			icoList2Group=null;
			if(tween)tween.kill();
			tween=null;
			alertOk=null;
		}
		private function addEvent():void
		{
			//EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			//TaskUtil.addLabelEvet(_skin.lbDuiHua);
			TaskUtil.addLabelEvet(_skin.lbName);
			TaskUtil.addLabelEvet(_skin.lbName2);
			TaskUtil.addLabelEvet(_skin.lbPaiHang);
			TaskUtil.addLabelEvet(_skin.lbTo);
			_skin.lbName2.addEventListener(TouchEvent.TOUCH, onTouchTips);
			_skin.lbName.addEventListener(TouchEvent.TOUCH, onTouchTips);
			EventManager.addEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,setCashgift);
			EventManager.addEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,setTime);
			EventManager.addEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,setQianduoType);
			
			EventManager.addEvent(TaskEvent.TASK_INFOR_MATION,inforMation);
			EventManager.addEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.addEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.addEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
			
		}
		private function removeEvent():void
		{
			//EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			//TaskUtil.removeLabelEvet(_skin.lbDuiHua);
			TaskUtil.removeLabelEvet(_skin.lbName);
			TaskUtil.removeLabelEvet(_skin.lbName2);
			TaskUtil.removeLabelEvet(_skin.lbPaiHang);
			TaskUtil.removeLabelEvet(_skin.lbTo);
			_skin.lbName2.removeEventListener(TouchEvent.TOUCH, onTouchTips);
			_skin.lbName.removeEventListener(TouchEvent.TOUCH, onTouchTips);
			EventManager.removeEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,setCashgift);
			EventManager.removeEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,setTime);
			EventManager.removeEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,setQianduoType);
			
			EventManager.removeEvent(TaskEvent.TASK_INFOR_MATION,inforMation);
			EventManager.removeEvent(TaskEvent.TASK_FINISH_MATION,finishMation);
			EventManager.removeEvent(TaskEvent.TASK_NEW_MATION,newMation);
			EventManager.removeEvent(TaskEvent.TASK_CHANGE_MATION,changeMation);
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
			
		}
		
		private var isMouseOut : Boolean = true;
		private function onTouchTips(e:TouchEvent):void
		{
			var target : Label  = e.currentTarget as Label;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null&&target!= null )
			{
				isMouseOut = true;
				tips.visible=false;
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null&&target!= null && isMouseOut)
			{
				isMouseOut = false;
				tips.visible=true;
			}
		}
		
		private function killWalkBut(num:int,key:int):void
		{
			if(isAllFilish())
			{
				var post:Array=new Array();
				var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.LIJIN_TASK);
				if(taskData!=null&&taskData.q_pathing!="")
				{
					
					var path:String=taskData.q_pathing;
					var pashArr:Array=path.split(";");
					if(pashArr.length>num)
					{
						path=pashArr[num];
						if(path!=null&&path!="")
						{
							pashArr=path.split(",");
							if(pashArr.length==3)
							{
								post.push(int(pashArr[0]));
								post.push(int(pashArr[1]));
								post.push(int(pashArr[2]));
							}
						}
					}
					if(post.length==3)
					{
						if(num==0&&key==1)
						{
							TrusteeshipManager.getInstance().startAutoFightToPos(post,1,-1);
						}
						else if(num==0&&key==2)
						{
							TaskUtil.postTaskFly(post,TaskType.LIJIN_TASK,TaskType.SUB_MONSTER);
						}
					}
				}
				
				
			}
			else
			{
				TaskControl.killWalkBut(TaskType.LIJIN_TASK,num,key);
			}
			
			
		}
		
		
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			if(rTime<0){
				_skin.lbTime1.text="未开始!";
			}else{
				remainTime=rTime;
				_skin.lbTime1.text=TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.lbTime1.text=TimeUtil.format3TimeType(remainTime);
			if(remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		private var remain2Time:int;
		private function setTime2(time:int):void
		{
			var rTime:int=time;
			if(rTime<0){
				_skin.lbTime.text="";
			}else{
				remain2Time=rTime;
				_skin.lbTime.text=TimeUtil.format3TimeType(remain2Time);
				TimerServer.remove(updateTime2);
				TimerServer.addLoop(updateTime2,1000);
			}
		}
		
		private function updateTime2():void
		{
			remain2Time--;
			_skin.lbTime.text=TimeUtil.format3TimeType(remain2Time);
			if(remain2Time==0){
				TimerServer.remove(updateTime2);
			}
		}
		
		/**设置奖励物品*/
		private function setReword():void
		{
			hideReword();
			var task:TaskInfo=TaskMissionManager.getOtherTaskInfo(TaskType.LIJIN_TASK);
			var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.LIJIN_TASK);
			
			if(task!=null&&taskData!=null)
			{//L.l("任务："+task.taskModelId);
				//setNavView(TaskType.MAINTYPE_TREASUREBOX,taskData.q_party_name,taskData.q_name,TaskMissionManager.getTreasuerTaskIsFinish(),navi3,subBut2);
				setGotargetInfo();
				icoList1Group.setRewardByArray(TaskMissionCfgData.getRewordById(taskData.q_reword_id,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
				icoList1Group.visible=true;
				var reward:Object=TaskMissionManager.getTaskExtraReward(TaskType.LIJIN_TASK);
				_skin.sec_navi0.visible=false;
				if(reward!=null)
				{
					//TaskUtil.setRewordInfo(reward.r,ico2List,icoBg2List);
					icoList2Group.setRewardByArray(TaskMissionCfgData.getRewordById(reward.r,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex));
					icoList2Group.visible=true;
					
					setExtraLabel(task.loopNumber,reward.l);
				}
			}
			setUisite();
		}
		private function hideReword():void
		{
			icoList1Group.visible=false;
			icoList2Group.visible=false;
			
		}
		private function setGotargetInfo():void
		{
			
			var task:TaskInfo=TaskMissionManager.getOtherTaskInfo(TaskType.LIJIN_TASK);
			var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.LIJIN_TASK);
			if(task!=null&&taskData!=null)
			{
				TaskUtil.setGotargetInfo(taskData.q_mission_mainType,taskData.q_mission_type,taskData.q_finish_describe,taskData.q_finish_information_str,task.taskSubRateInfolist,killButList);
			}
			
		}
		private function hideGotargetInfo():void
		{
			var i:int;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
		}
		
		private function setExtraLabel(loopNumber:int,num:int):void
		{
			//_skin.sec_navi0.htmlText="【完成<font color='#ff0000'>("+num+"/"+15+")</font>环额外奖励】";
			_skin.sec_navi0.htmlText="【当前"+(loopNumber+1)+"环 完成<font color='#ff0000'>"+num+"</font>环额外奖励】";
			_skin.sec_navi0.visible=true;
			
		}
		/**设置抢夺阶段*/
		private function setQianduoType(monsterNum:int,refresh:int,dieList:Vector.<int>):void
		{
			dieIdList=dieList;
			if(monsterNum>0&&refresh>0)
			{
				_skin.grpshuaxin.visible=true;
				_skin.grpto.visible=false;
				setTime2(refresh);
				
			}
			else if(monsterNum>0&&refresh==0)
			{
				_skin.grpshuaxin.visible=false;
				_skin.grpto.visible=true;
				_skin.lbTo.visible=true;
				_skin.lbName.htmlText="盗宝小怪 <font color='#e8c958'>(剩余"+monsterNum+")</font>";
				
			}
			else if(monsterNum==0&&refresh==0)
			{
				_skin.grpshuaxin.visible=false;
				_skin.grpto.visible=true;
				_skin.lbTo.visible=false;
				_skin.lbName.htmlText="盗宝小怪 <font color='#e8c958'>(剩余"+monsterNum+")</font><font color='#e8c958'>已抢夺完毕</font>";
			}
			
		}
		/**虚拟到怪物点*/
		private function gotoMonsterSite():void
		{
			var monsteIdList:Array=LijinCfgData.getIdList();
			if(monsteIdList==null||dieIdList==null)return;
			var newIdList:Array=new Array();
			var i:int,j:int;
			var have:Boolean=false;
			for(i=0;i<monsteIdList.length;i++)
			{
				have=false;
				for(j=0;j<dieIdList.length;j++)
				{
					if(monsteIdList[i]==dieIdList[j])
					{
						have=true;
						break;
					}
				}
				if(!have)
				{
					newIdList.push(monsteIdList[i]);
				}
			}
			var mid:int=0;
			var goldData:Q_daysdown_gold;
			var minGold:Q_daysdown_gold;
			var currDist:int=int.MAX_VALUE;
			var dist:int;
			for(i=0;i<newIdList.length;i++)
			{
				goldData=LijinCfgData.getDaysdownGold(newIdList[i]);
				if(goldData)
				{
					dist = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(goldData.q_move_x,-Math.abs(goldData.q_move_y)));
					if(dist<currDist)
					{
						mid=newIdList[i];
						minGold=goldData;
						currDist=dist;
					}
				}
			}
			if(minGold)
			{//L.l("寻路到："+mid+"怪");
				MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, minGold.q_move_x, -Math.abs(minGold.q_move_y),finishWalk, 100);
			}
			
		}
		private function finishWalk(data:Object):void
		{
			//TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}
		
		/**设置获得元宝*/
		private function setCashgift(num:int):void
		{
			_skin.numLiJin.label=""+num;
			
		}
		/**设置tips文字*/
		private function setTipsText():void
		{
			_tipsSkin.lbName.htmlText="盗宝小怪";
			_tipsSkin.lbTip.htmlText="1.活动开启则出现第一波盗宝小怪，<br>第<font color='#5DBD37'>5、10、15</font>分钟刷新。<br>2.攻击盗宝小怪必掉礼金。<br>3.击杀盗宝小怪额外获得<font color='#5DBD37'>5-10礼金</font>。";
		}
		private function setIcon(icon:IconCDFace,tiemId:int,num:int,bg:UIAsset=null):void
		{
			var item:Q_item=ItemConfig.getQItemByID(tiemId);
			if(item!=null&&icon!=null)
			{
				icon.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_42));
				icon.visible=true;
				if(bg)
				{
					bg.visible=true;
				}
				TaskUtil.setItemTips(icon,item,num);
			}
			
		}
		
		private function outToGame():void
		{
			GameAlert.showAlert(alertOk,onAlert);
		}
		private function onAlert(gameAlert:GameAlert):void
		{
			if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE)
			{
				DungeonSender.reqQuitDungeon();
			}
			
		}
		
		
		////////////////////////环式任务相关/////////////////////////////////////
		
		/**接受任务信息初始化*/
		private function inforMation():void
		{//L.l("任务信息初始化");
			setReword();
			flishTask();
		}
		/**完成任务*/
		private function finishMation(type:int):void
		{
			//L.l("完成任务22");
			TaskAutoManager.getInstance().stopAll();
			tweeReward();
			hideReword();
			hideGotargetInfo();
			
		}
		/**新任务*/
		private function newMation(type:int):void
		{//L.l("新任务");
			setReword();
			taskAuto();
			allFilish();
		}
		
		/**任务进度改变*/
		private function changeMation(type:int):void
		{//L.l("任务进度改变");
			setGotargetInfo();
			flishTask();
		}
		private function flishTask():void
		{
			if(TaskMissionManager.getTaskIsFinishByType(TaskType.LIJIN_TASK))
			{
				TaskSender.sendfinishTaskMessage(TaskMissionManager.getTaskInfoByType(TaskType.LIJIN_TASK).taskId);
			}
		}
		/**飞鞋完成*/
		private function flyComplete():void
		{
			TaskControl.flyComplete();
		}
		
		private function allFilish():void
		{
			if(isAllFilish())
			{
				var taskData:Q_mission_base=TaskMissionManager.getOtherTaskData(TaskType.LIJIN_TASK);
				if(taskData!=null)
				{
					GrayFilter.gray(_skin.sec_subbut1);
					_skin.sec_subbut1.isEnabled=false;
					TaskUtil.setGotargetLabelText(true,killButList[0],taskData.q_finish_describe);
					
				}
			}
			else
			{
				GrayFilter.unGray(_skin.sec_subbut1);
				_skin.sec_subbut1.isEnabled=true;
			}
			
			
			
		}
		private function isAllFilish():Boolean
		{
			var task:TaskInfo=TaskMissionManager.getTaskInfoByType(TaskType.LIJIN_TASK);
			if(task!=null)
			{
				
				var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(task.loopRewardId);
				if(taskSection)
				{
					var taskList:Array=JSONUtil.decode(taskSection.q_mission_randomid);
					if(taskList&&taskList.length>0&&taskList[taskList.length-1]==task.taskModelId)
					{
						return true;
					}
				}
			}
			return false
		}
		private function tweeReward():void
		{
			var i:int;
			icoList1Group.tweeRewardInBag();
			if(TaskMissionManager.getTaskExtraRewardIsFlish(TaskType.LIJIN_TASK))
			{
				icoList2Group.tweeRewardInBag();
			}
		}
		
		
		private function taskAuto(key:Boolean=false):void
		{
			if(taskAutoKey||key)
			{
				taskAutoKey=true;
				TaskAutoManager.getInstance().startTaskAuto(TaskType.LIJIN_TASK);
			}
			
		}
		
		
		private function setQiangBoxState(state:Boolean):void
		{
			if(tween){
				tween.kill();
			}
			if(state){
				tween=TweenMax.to(_skin["qiang_box"],0.5,{x:0});
			}else{
				tween=TweenMax.to(_skin["qiang_box"],0.5,{x:_skin["qiang_box"].width});
			}
			_skin["btn_qiang_close"].visible = state;
			_skin["btn_qiang_open"].visible = !state;
		}
		
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			_skin.lbTime1.y=_skin.sec_navi1.y;
			_skin.sec_subbut2.y=_skin.sec_subbut1.y;
			_skin.btn_qiang_close.y=_skin.btn_qiang_open.y=_skin.qiang_box.y=_skin.ui_bg.height+5;
		}
	}
}