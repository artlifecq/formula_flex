package com.rpgGame.app.ui.scene.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_zone;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.SkinnableContainer;
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.ZhenQi_Skin;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	import utils.TimerServer;

	/**
	 * 真气和装备副本追踪
	 * @author YT
	 * 创建时间：2017-8-12 下午12:08:28
	 */
	public class ZhenqiTrackerUI  extends DungeonTrackerUI
	{
		private var _skin:ZhenQi_Skin;
		private var skinList:Array;
		private var icoList1Group:RewardGroup;
		private var killButList:Vector.<SkinnableContainer>;
		private var alertOk:AlertSetInfo;
		
		private var dailyZoneId:int=0;
		private var dailyData:Q_daily_zone;
		private var killNumList:HashMap;
		
		public function ZhenqiTrackerUI()
		{
			_skin = new ZhenQi_Skin();
			super(_skin);
			init();
		}
		
		override protected function onShow() : void
		{
			super.onShow();
			addEvent();
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			clear();
			
		}
		override protected function autoWalk():void
		{
			walkNextWave();
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
			var killList:Array = DailyZoneMonsterCfgData.getTypeList(dailyData.q_zone_id,dailyData.q_id);
			var qzm:Q_dailyzone_monster;
			var pos:Point
			if(id<killList.length)
			{
				qzm=killList[id];
			}
			if(qzm!=null)
			{
				TrusteeshipManager.getInstance().startAutoFightToPos([SceneSwitchManager.currentMapId,qzm.q_move_x,qzm.q_move_y]);
			}
		}
		
		
		/**寻下一波未完成的怪*/
		private function walkNextWave():void
		{
			var killList:Array = DailyZoneMonsterCfgData.getTypeList(dailyData.q_zone_id,dailyData.q_id);
			var qzm:Q_dailyzone_monster;
			for(var i:int=0;i<killList.length;i++)
			{
				qzm=killList[i];
				if(killNumList.getValue(qzm.q_id)<qzm.q_monsterNum)
				{
					touchBut(i);
					return;
				}
				
			}
			
		}
		
		private function zoneOutToGame():void
		{
			DungeonSender.reqQuitDungeon();
		}
		private function addEvent():void
		{
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);//更新日常副本信息
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);//更新日常副本时间
			EventManager.addEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);//更新副本结束信息
			EventManager.addEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);//更新副本波次信息
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.removeEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			EventManager.removeEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			TimerServer.remove(updateTime);
			//TweenLite.killDelayedCallsTo(walkTo);
			for(var i:int=0;i<killButList.length;i++)
			{
				TaskUtil.removeLabelEvet(_skin["killbut_"+i].skin.labelDisplay);
			}
		}
		/**更新日常副本信息*/
		private function updatedailyZoneInfo(zoneId:int):void
		{
			dailyZoneId= zoneId;
			dailyData = DailyZoneCfgData.getZoneCfg(dailyZoneId);
			if(dailyData==null)
				return;
			initLastTime();
			setView();
			setKillInfo();
			setTime();
			/*
			advanceTime(0);*/
			//			TrusteeshipManager.getInstance().startAutoFight();
			setUisite();
		}
		/**更新时间*/
		private function updatedailyZoneTime(lastTime:Number):void
		{
			_endTime = lastTime/1000;
			currentStateEnd();
			setTime();
		}
		/**更新击杀数量*/
		private function updateWaveInfoHandler(currentWaveId:int,killerCount:int):void
		{	
			
			var killList:Array = DailyZoneMonsterCfgData.getTypeList(dailyData.q_zone_id,dailyData.q_id);
			var rItme:Renwu_Item2;
			var qzm:Q_dailyzone_monster;
			for(var i:int=0;i<killList.length;i++)
			{
				qzm=killList[i];
				if(qzm.q_id==currentWaveId)
				{
					setKillLable(killButList[i],qzm.q_id,qzm.q_monsterId,killerCount,qzm.q_monsterNum)
					if(killerCount>=qzm.q_monsterNum)
					{
						walkNextWave();
					}
					return;
				}
				
			}
		}
		
		private function updateEndInfo(success:int,star:int):void
		{
			_skin.uiKill.visible = (success==1);
			stopTimer();
		}
		
		/**设置界面信息*/
		private function setView():void
		{
			if(dailyData.q_combat_type ==1)
			{
				_skin.headName.text="真气副本";
			}else if(dailyData.q_combat_type ==2){
				_skin.headName.text="装备副本";
			}
			icoList1Group.setRewardByJsonStr(dailyData.q_rewards_client);
			icoList1Group.visible=true;
			_skin.uiKill.visible = false;
			
			
		}
		/**设置击杀目标*/
		private function setKillInfo():void
		{
			var i:int=0;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			killNumList=new HashMap();
			var killList:Array = DailyZoneMonsterCfgData.getTypeList(dailyData.q_zone_id,dailyData.q_id);
			
			var qzm:Q_dailyzone_monster;
			if(killList&&killList.length>0)
			{
				for(i=0;i<killList.length;i++)
				{
					qzm=killList[i];
					if(qzm&&i<killButList.length)
					{
						setKillLable(killButList[i],qzm.q_id,qzm.q_monsterId,0,qzm.q_monsterNum)
					}
					
				}
			}
			setUisite();
		}
		private function setKillLable(killBut:SkinnableContainer,qid:int,monsterId:int,countNum:int,allNum:int):void
		{
			var rItme:Renwu_Item2;
			killNumList.add(qid,countNum);
			rItme=killBut.skin as Renwu_Item2;
			if(countNum>=allNum)
			{
				//GrayFilter.gray(killBut);
				rItme.labelDisplay.htmlText="<font color='#8b8d7b'>击杀：<u>"+MonsterDataManager.getMonsterName(monsterId)+"</u>("+killNumList.getValue(qid)+"/"+allNum+")</font>";
			}
			else
			{
				//GrayFilter.unGray(killBut);
				rItme.labelDisplay.htmlText="<font color='#eaeabc'>击杀：</font><u>"+MonsterDataManager.getMonsterName(monsterId)+"</u><font color='#eaeabc'>("+killNumList.getValue(qid)+"/"+allNum+")</font>";
			}
			killBut.visible=true;
		}
		private var remainTime:int;
		/**设置倒计时*/
		private function setTime():void
		{
			var rTime:int=dailyData.q_zone_time;
			if(rTime<=0){
				_skin.sec_time.text="未开始挑战!";
			}else{
				remainTime=rTime;
				_skin.sec_time.text="副本剩余时间："+TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		private function updateTime():void
		{
			updataStarTime();
			remainTime--;
			_skin.sec_time.text="副本剩余时间："+TimeUtil.format3TimeType(remainTime);
			if(remainTime<=30)
				_skin.sec_time.color = 0xd02525;
			else
				_skin.sec_time.color = 0xe8c958;
			if(remainTime==0)
			{
				stopTimer();
			}
		}
		
		private var _endTime:int;
		private var _currentStartTime:Number;
		private var _currentDisTime:Number;
		private var _currentStar:int ;
		private var _lastList:Array;
		/**星级倒计时*/
		private function updataStarTime():void
		{
			var now:int = SystemTimeManager.curtTm/1000;
			var dis:int = _currentDisTime-now+_currentStartTime;
			_skin.pro_bar.value = _skin.pro_bar.maximum*percent;
			if(_currentStar ==3)
			{
				_skin.sec_time2.text = "三星通关倒计时："+TimeUtil.format3TimeType(dis);
			}else if(_currentStar ==2){
				_skin.sec_time2.text = "二星通关倒计时："+TimeUtil.format3TimeType(dis);
			}else{
				_skin.sec_time2.text = "一星通关倒计时："+TimeUtil.format3TimeType(dis);
			}
			
			if(dis<=30)
				_skin.sec_time2.color = 0xd02525;
			else
				_skin.sec_time2.color = 0xe8c958;
			var percent:Number = dis/_currentDisTime;
			if(percent<=0)
			{
				percent = 0;
				currentStateEnd();
			}
			_skin.pro_bar.value = _skin.pro_bar.maximum*percent;
			
		}
		private function initLastTime():void
		{
			var arr:Array = JSONUtil.decode( dailyData.q_star_condition);
			_lastList = new Array();
			for each(var str:String  in arr)
			{
				_lastList.push(int(str));
			}
			_endTime = SystemTimeManager.curtTm/1000+dailyData.q_zone_time;
			currentStateEnd();
		}
		private function currentStateEnd():void
		{
			var now:int = SystemTimeManager.curtTm/1000;
			var dis:int = _endTime-now;
			for(var i:int = 1;i<4;i++)
			{
				if(dis >=_lastList[i])
				{
					_currentStar = i;
				}
			}
			switch(_currentStar)
			{
				case 1:
					_currentStartTime = _endTime - _lastList[2];
					_currentDisTime =  _lastList[2] - _lastList[1];
					break;
				case 2:
					_currentStartTime = _endTime- _lastList[3];
					_currentDisTime = _lastList[3] - _lastList[2];
					break;
				case 3:
					_currentStartTime = _endTime-dailyData.q_zone_time;
					_currentDisTime = dailyData.q_zone_time- _lastList[3];
					break;
				default:
					stopTimer();
					break;
			}
		}
		
		private function stopTimer():void
		{
			TimerServer.remove(updateTime);
		}
		private function init():void
		{
			icoList1Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico1_0,RewardGroup.ALIN_CENTER,4,6,6);
			
			skinList=new Array();
			skinList.push(_skin.navi0);
			skinList.push(_skin.killbut_0);
			skinList.push(_skin.killbut_1);
			skinList.push(_skin.killbut_2);
			skinList.push(_skin.killbut_3);
			skinList.push(_skin.killbut_4);
			skinList.push(_skin.navi1);
			skinList.push(icoList1Group);
			skinList.push(_skin.sec_time);
			skinList.push(_skin.sec_time2);
			skinList.push(_skin.per_group);
			skinList.push(_skin.sec_subbut1);
			
			var i:int;
			killButList=new Vector.<SkinnableContainer>();
			for(i=0;i<5;i++)
			{
				killButList.push(_skin["killbut_"+i]);
				TaskUtil.addLabelEvet(_skin["killbut_"+i].skin.labelDisplay);
				
			}
			
			
			setUisite();
			alertOk=new AlertSetInfo(LangAlertInfo.ZONE_EXIT_SURE);
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
			_skin.uiKill.y=_skin.navi1.y-30;
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			
		}
		private function clear():void
		{
			var i:int,lenth:int;
			var iocn:IconCDFace;
			skinList=null;
			icoList1Group.clear();
			icoList1Group=null;
			killButList=null;
			iocn=null;
			GameAlert.closeAlert(LangAlertInfo.ZONE_EXIT_SURE);
			alertOk=null;
			_skin.dispose();
			_skin=null;
		}
	}
}