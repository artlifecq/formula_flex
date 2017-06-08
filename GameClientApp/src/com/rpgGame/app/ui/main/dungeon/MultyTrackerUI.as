package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.clientConfig.Q_zone_multy;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.FuBen_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;

	/**
	 *多人副本追踪 
	 * @author YT
	 * 
	 */	
	public class MultyTrackerUI extends DungeonTrackerUI
	{
		private var _skin:FuBen_Skin;
		private var skinList:Array;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico1List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var killButList:Vector.<SkinnableContainer>;
		private var zoneId:int=0;
		private var remainTime:int;
		private var alertOk:AlertSetInfo;
		public function MultyTrackerUI()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			init();
			
		}
		override protected function onShow() : void
		{
			addEvent();
			enterZone();
//			GameAlert.showAlert(alertOk,onAlert);
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case Renwu_Item2(_skin.killbut_0.skin).labelDisplay:
					touchBut(0);
					break;
				case Renwu_Item2(_skin.killbut_1.skin).labelDisplay:
					touchBut(1);
					break;
				case Renwu_Item2(_skin.killbut_2.skin).labelDisplay:
					touchBut(2);
					break;
				case Renwu_Item2(_skin.killbut_3.skin).labelDisplay:
					touchBut(3);
					break;
				case Renwu_Item2(_skin.killbut_4.skin).labelDisplay:
					touchBut(4);
					break;
				case _skin.sec_subbut1:
					
					zoneOutToGame();
					break;
			}
			
			
		}
		private function touchBut(id:int):void
		{
			//walkWave(DungeonManager.getStageWave(id));
			walkWave(id);
		}
		/**寻路完成开始杀怪*/
		private function startFight(value:*):void
		{
			TrusteeshipManager.getInstance().startAutoFight();
		}
		private function initShow():void
		{
			_skin.lbHeadName.text="";
			_skin.sec_navi1.htmlText="";
			_skin.lbMiaoshu.htmlText="";
			_skin.sec_info.text="";
			for(var i:int=0;i<icoBg1List.length;i++)
			{
				icoBg1List[i].visible=false;
				ico1List[i].visible=false;
				icoBg2List[i].visible=false;
				ico2List[i].visible=false;
			}
		}
		
		
		private function addEvent():void
		{
			EventManager.addEvent(DungeonEvent.ENTER_ZONE,enterZone);//进入副本
			EventManager.addEvent(DungeonEvent.OUT_ZONE,outZone);//退出
			EventManager.addEvent(DungeonEvent.ZONE_STAGE_CHANGE,setTageChange);//副本状态
			EventManager.addEvent(DungeonEvent.ZONE_REMAIN_TIME,setTime);//副本时间
			EventManager.addEvent(DungeonEvent.ZONE_SKILL_INFOS,setKillInfo);//击杀列表
			EventManager.addEvent(DungeonEvent.ZONE_SKILL_INFO,setKillInfo);//击杀列表
			EventManager.addEvent(DungeonEvent.ZONE_OUT_RESULT,setOutResult);//击杀列表
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(DungeonEvent.ENTER_ZONE,enterZone);//进入副本
			EventManager.removeEvent(DungeonEvent.OUT_ZONE,outZone);//退出
			EventManager.removeEvent(DungeonEvent.ZONE_STAGE_CHANGE,setTageChange);//副本状态
			EventManager.removeEvent(DungeonEvent.ZONE_REMAIN_TIME,setTime);//副本时间
			EventManager.removeEvent(DungeonEvent.ZONE_SKILL_INFOS,setKillInfo);//击杀列表
			EventManager.removeEvent(DungeonEvent.ZONE_SKILL_INFO,setKillInfo);//击杀列表
			EventManager.removeEvent(DungeonEvent.ZONE_OUT_RESULT,setOutResult);//击杀列表
			TimerServer.remove(updateTime);
			TweenLite.killDelayedCallsTo(walkTo);
		}
		
		private function enterZone():void
		{
			//initShow();
			if(DungeonManager.curryZoneId==0||zoneId==DungeonManager.curryZoneId)
			{
				return;
			}
			
			zoneId=DungeonManager.curryZoneId;
			setTitle();
			setReword();
			setTageText();
			setKillInfo();
			setTime();
			setUisite();
			if(DungeonManager.zoneStage==1)
			{
				UIPopManager.showAlonePopUI(DungeonFightPop);
			}
			
		}
		private function outZone():void
		{
			_skin.task_box.visible=false;
		}
		private function setTageChange():void
		{
			enterZone();
			setTageText();
			setUisite();
			autoWalk();
		}
		private function autoWalk():void
		{
			TweenLite.killDelayedCallsTo(walkTo);
			TweenLite.delayedCall(1, walkTo);
		}
		private function walkTo():void
		{
			walkWave(DungeonManager.getKillNoAllID());
		}
		
		private function walkWave(id:int):void
		{
			TweenLite.killDelayedCallsTo(walkTo);
			var pos:Point=DungeonManager.getStagePos(id);
			if(pos)
			{//L.l("寻路到："+pos.x+":"+ pos.y);
				MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, pos.x, pos.y,finishWalk, 100,null,finishWalk);
			}
		}
		private function finishWalk(data:Object):void
		{
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}
		private function setTitle():void
		{
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zoneId);
			if(zoneData==null)return;
			_skin.lbHeadName.text=zoneData.q_name;
			_skin.head_left.x=(_skin.lbHeadName.x+_skin.lbHeadName.width/2-_skin.lbHeadName.textWidth/2-_skin.head_left.width-7);
			_skin.head_right.x=(_skin.lbHeadName.x+_skin.lbHeadName.width/2+_skin.lbHeadName.textWidth/2+_skin.head_left.width+7);
		}
		
		private function setTageText():void
		{//L.l("[阶段"+DungeonManager.zoneStage);
			
			
			if(DungeonManager.zoneStage==0)
			{
				_skin.sec_navi1.visible=false;
				_skin.lbMiaoshu.visible=false;
				return;
			}
			_skin.sec_navi1.htmlText="[阶段"+DungeonManager.zoneStage+"]";
			_skin.lbMiaoshu.htmlText=DungeonManager.getZoneStageDesc();
			_skin.sec_navi1.visible=true;
			_skin.lbMiaoshu.visible=true;
			
		}
		private function setKillInfo():void
		{
			var i:int=0;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			//getMonsterModeidByAreaid
			var killList:Vector.<KillMonsterInfo>=DungeonManager.killInfos;
			var rItme:Renwu_Item2;
			var qzm:Q_dailyzone_monster;
			if(killList&&killList.length>0)
			{
				for(i=0;i<killList.length;i++)
				{
					qzm=DailyZoneMonsterCfgData.getZoneCfg(killList[i].monsterModelId);
					if(qzm&&i<killButList.length)
					{
						rItme=killButList[i].skin as Renwu_Item2;
						rItme.labelDisplay.htmlText="击杀：<u>"+MonsterDataManager.getMonsterName(qzm.q_monsterId)+"</u><font color='#cfc6ae'>("+killList[i].count+"/"+qzm.q_monsterNum+")</font>";
						killButList[i].visible=true;
					}
					
				}
			}
			
			setUisite();
		}
		/**设置任务目标内容*/
		public function setGoalInfo(type:int,describe:String,finisstr:String,subList:Vector.<TaskSubRateInfo>,txtButList:Vector.<SkinnableContainer>):void
		{
			var finiStr:Array;
			var informationList:Array=finisstr.split(";");
			var i:int,j:int,length:int;
			length=informationList.length;
			for(i=0;i<length;i++)
			{
				if(informationList[i]&&informationList[i]!="")
				{
					var text:String="";
					var modeid:int=0;
					var count:int=0,finish:int;
					var modeArr:Array=informationList[i].split(",");
					if(modeArr.length==2)
					{
						modeid=int(modeArr[0]);
						finish=int(modeArr[1]);
					}
					if(subList[i]!=null)
					{
						modeid=subList[i].modelId;
						count=subList[i].num;
					}
					if(modeid!=0)
					{
						text=TaskMissionCfgData.getTaskDescribe(type,describe,modeid);
					}
					if(type!=TaskType.SUB_CONVERSATION)
					{
						text+="<font color='#cfc6ae'>("+count+"/"+finish+")</font>";
					}
					
					setGotargetLabelText(txtButList[i],text);
					
				}
				
			}
			
			
		}
		public function setGotargetLabelText(but:SkinnableContainer,t:String):void
		{
			
			var rItme:Renwu_Item2;
			if(but!=null&&but.skin!=null)
			{
				rItme=but.skin as Renwu_Item2;
			}
			if(rItme!=null)
			{
				rItme.labelDisplay.width=300;
				rItme.labelDisplay.htmlText=t;
				rItme.labelDisplay.width=rItme.labelDisplay.textWidth+2;
				but.visible=true;
			}
		}
		/**设置奖励物品*/
		private function setReword():void
		{
			var zoneData:Q_zone=ZoneCfgData.getZoneCfg(zoneId);
			var multyData:Q_zone_multy=ZoneMultyCfgData.getZoneMultyByID(zoneId);
			if(zoneData==null||multyData==null)return;
			var passReward:Array=JSONUtil.decode(multyData.q_all_reward);
			var i:int;
			var ico:IconCDFace; 
			var item:Q_item;
			if(passReward&&passReward.length>0)
			{
				for(i=0;i<passReward.length;i++)
				{
					if(i<ico1List.length&&passReward[i]!=null)
					{
						item=ItemConfig.getQItemByID(passReward[i].mod);
						ico=ico1List[i];
						if(item!=null&&ico!=null)
						{
							ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
							ico.visible=true;
							icoBg1List[i].visible=true;
							TaskUtil.setItemTips(ico,item,passReward[i].num);
						}
					}
				}
			}
			
			
			var reward:Array=JSONUtil.decode(multyData.q_prob_reward);
			if(reward==null||reward.length==0)return;
			for(i=0;i<reward.length;i++)
			{
				if(i<ico2List.length&&reward[i]!=null)
				{
					item=ItemConfig.getQItemByID(reward[i].mod);
					ico=ico2List[i];
					if(item!=null&&ico!=null)
					{
						ico.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
						ico.visible=true;
						icoBg2List[i].visible=true;
						TaskUtil.setItemTips(ico,item,reward[i].num);
					}
				}
			}
			
		}
		
		private function setTime():void
		{
			var rTime:int=DungeonManager.remainTime;
			if(rTime<=0){
				_skin.sec_info.text="未开始挑战!";
			}else{
				remainTime=rTime/1000;
				_skin.sec_info.text="副本剩余时间："+TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.sec_info.text=TimeUtil.format3TimeType(remainTime);
			if(remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		private function setOutResult():void
		{
			//AppManager.showApp(AppConstant.MULTY_EXITTIME_PANL);
			//AppManager.showApp(AppConstant.SWORD_RESULT_FAIL);
		}
		
		private function zoneOutToGame():void
		{
			GameAlert.showAlert(alertOk,onAlert);
		}
		private function onAlert(gameAlert:GameAlert):void
		{
			if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE)
			{
				DungeonSender.zoneOutToGame();
			}
			
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
			
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			
			
			for(i=0;i<4;i++)
			{
				if(icoBg1List[i].visible==true)
				{
					icoBg1List[i].y=icoBg1List[0].y;
					ico1List[i].y=icoBg1List[0].y-6;
				}
			}
			for(i=4;i<icoBg1List.length;i++)
			{
				if(icoBg1List[i].visible==true)
				{
					icoBg1List[i].y=icoBg1List[4].y;
					ico1List[i].y=icoBg1List[4].y-6;
				}
			}
			for(i=0;i<4;i++)
			{
				if(icoBg2List[i].visible==true)
				{
					icoBg2List[i].y=icoBg2List[0].y;
					ico2List[i].y=icoBg2List[0].y-6;
				}
			}
			for(i=4;i<icoBg2List.length;i++)
			{
				if(icoBg2List[i].visible==true)
				{
					icoBg2List[i].y=icoBg2List[4].y;
					ico2List[i].y=icoBg2List[4].y-6;
				}
			}
			
			
		}
		private function init():void
		{
			
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.lbMiaoshu);
			skinList.push(_skin.killbut_0);
			skinList.push(_skin.killbut_1);
			skinList.push(_skin.killbut_2);
			skinList.push(_skin.killbut_3);
			skinList.push(_skin.killbut_4);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_ico1_0);
			skinList.push(_skin.sec_ico1_4);
			skinList.push(_skin.sec_navi3);
			skinList.push(_skin.sec_ico2_0);
			skinList.push(_skin.sec_ico2_4);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut1);
			var i:int;
			killButList=new Vector.<SkinnableContainer>();
			for(i=0;i<5;i++)
			{
				killButList.push(_skin["killbut_"+i]);
				TaskUtil.addLabelEvet(_skin["killbut_"+i].skin.labelDisplay);
				
			}
			
			var ico:IconCDFace;
			icoBg1List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg1List.push(_skin["sec_ico1_"+i]);
			}
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg1List.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg1List[i].x-6;
				ico.y=icoBg1List[i].y-6;
				ico.visible=false;
				icoBg1List[i].visible=false;
				ico1List.push(ico);
				_skin.task_box.addChild(ico);
			}
			icoBg2List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg2List.push(_skin["sec_ico2_"+i]);
			}
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg2List.length;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg2List[i].x-6;
				ico.y=icoBg2List[i].y-6;
				ico.visible=false;
				icoBg2List[i].visible=false;
				ico2List.push(ico);
				_skin.task_box.addChild(ico);
			}
			setUisite();
			alertOk=new AlertSetInfo(LangAlertInfo.ZONE_EXIT_SURE);
		}
	}
}