package com.rpgGame.app.ui.scene.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.JingYan_Skin;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	public class ExpTracjerBar extends DungeonTrackerUI
	{
		private var _skin:JingYan_Skin;
		private var _dailyZoneId:int;
		private var _data:Q_daily_zone;
		private var _totalWaveCount:int;
		private var _totalMonsterCount:int;
		private var _waveInfo:Dictionary;
		//private var _ico:IconCDFace;
		private var icoList1Group:RewardGroup;
		private var icoList2Group:RewardGroup;
		public function ExpTracjerBar():void
		{
			_skin = new JingYan_Skin();
			super(_skin);
			icoList1Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico1_0,RewardGroup.ALIN_CENTER,4,6,6,true,1);
			icoList2Group=new RewardGroup(IcoSizeEnum.ICON_42,_skin.sec_ico2_0,RewardGroup.ALIN_CENTER,4,6,6,true,4);
			
			
		}
		private function initView():void
		{
			var rewardList:Array=JSONUtil.decode(_data.q_rewards_show);
			if(rewardList!=null&&rewardList.length>0)
			{
				var expReward:String="";
				var otherReward:String="";
				for(var i:int=0;i<rewardList.length;i++)
				{
					if(rewardList[i].mod==1)
					{
						expReward="["+JSONUtil.encode(rewardList[i])+"]"
					}
					else
					{
						if(otherReward=="")
						{
							otherReward="["+JSONUtil.encode(rewardList[i]);
						}
						else
						{
							otherReward+=","+JSONUtil.encode(rewardList[i]);
						}
					}
				}
				if(otherReward!="")
				{
					otherReward+="]";
				}
				
				icoList1Group.setRewardByJsonStr(expReward);
				icoList1Group.visible=true;
				icoList2Group.setRewardByJsonStr(otherReward);
				icoList2Group.visible=true;
				
			}
			
		}
		
		override protected function onShow() : void
		{			
			super.onShow();
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.addEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.addEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			UIPopManager.showAlonePopUI(DungeonFightPop);
		}
		override protected function onHide():void
		{
			super.onHide();
			stopTimer();
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.removeEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.removeEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
		}
		private function updateEndInfo(success:int,star:int):void
		{
			TrusteeshipManager.getInstance().stopAutoFight();
			stopTimer();
		}
		
		private var waveId:int=0;
		private function updateWaveInfoHandler(currentWaveId:int,killerCount:int):void
		{
			if(waveId!=0&&killerCount==0)
			{
				var killList:Array = DailyZoneMonsterCfgData.getTypeList(_data.q_zone_id,_data.q_id);
				var qzm:Q_dailyzone_monster;
				for(var i:int=0;i<killList.length;i++)
				{
					qzm=killList[i];
					if(qzm.q_id==currentWaveId)
					{
						var pos:Point=new Point(qzm.q_move_x,qzm.q_move_y);
						if(pos!=null)
						{
							TrusteeshipManager.getInstance().startAutoFightToPos([SceneSwitchManager.currentMapId,pos.x,pos.y]);
						}
						break;
					}
					
				}
			}
			waveId=currentWaveId;
			_waveInfo[currentWaveId] = killerCount;
			refeashInfo();
		}
		
		private function updatedailyZoneTime(lastTime:Number):void
		{
			_endTime = lastTime/1000;
			currentStateEnd();
			//TrusteeshipManager.getInstance().findDist=1000;
			//TrusteeshipManager.getInstance().startAutoFight();		
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
			var arr:Array = JSONUtil.decode( _data.q_star_condition);
			_lastList = new Array();
			for each(var str:String  in arr)
			{
				_lastList.push(int(str));
			}
			_endTime = SystemTimeManager.curtTm/1000+_data.q_zone_time;
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
					_currentStartTime = _endTime-_data.q_zone_time;
					_currentDisTime = _data.q_zone_time- _lastList[3];
					break;
				default:
					stopTimer();
					break;
			}
		}
		
		
		
		private function updatedailyZoneInfo(dailyZoneId:int):void
		{
			_dailyZoneId = dailyZoneId;
			_data = DailyZoneCfgData.getZoneCfg(dailyZoneId);
			initView();
			var allLength:Array = DailyZoneMonsterCfgData.getTypeList(_data.q_zone_id,_data.q_id);
			
			for each(var md:Q_dailyzone_monster in allLength)
			{
				_totalMonsterCount +=md.q_monsterNum;
			}
			_totalWaveCount = allLength.length;
			
			_waveInfo = new Dictionary();
			refeashInfo();
			initLastTime();
			setTime();
		}
		private var remainTime:int;
		/**设置倒计时*/
		private function setTime():void
		{
			var rTime:int=_data.q_zone_time;
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
		private function refeashInfo():void
		{
			var wave:int =0;
			var count:int = 0;
			for(var key:int in _waveInfo)
			{
				wave++;
				count += _waveInfo[key];
			}
			_skin.killName.text = wave.toString()+"/"+_totalWaveCount;
			_skin.killNum.text = count.toString()+"/"+_totalMonsterCount;
		}
		
		
		private function stopTimer():void
		{
			TimerServer.remove(updateTime);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					DungeonSender.reqQuitDungeon(sceneId);
					break;
			}
		}
	}
}