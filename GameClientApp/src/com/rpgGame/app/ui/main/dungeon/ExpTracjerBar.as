package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.JingYan_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	public class ExpTracjerBar extends DungeonTrackerUI implements IAnimatable
	{
		private var _skin:JingYan_Skin;
		private var _dailyZoneId:int;
		private var _data:Q_daily_zone;
		private var _totalWaveCount:int;
		private var _totalMonsterCount:int;
		private var _waveInfo:Dictionary;
		private var _endTime:int;
		private var _disTime:Number;
		public function ExpTracjerBar():void
		{
			_skin = new JingYan_Skin();
			super(_skin);
			/*updatedailyZoneInfo(11);
			updatedailyZoneTime(SystemTimeManager.curtTm/1000+1800);*/
		}
		
		override protected function onShow() : void
		{
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.addEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.addEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			UIPopManager.showAlonePopUI(DungeonFightPop);
		}
		
		private function updateEndInfo(success:int,star:int):void
		{
			stopTimer();
		}
		private function updateWaveInfoHandler(currentWaveId:int,killerCount:int):void
		{
			_waveInfo[currentWaveId] = killerCount;
			refeashInfo();
		}
		private function updatedailyZoneTime(lastTime:Number):void
		{
			_endTime = lastTime/1000;
			
			Starling.juggler.add(this);
		}
		
		public function advanceTime(time:Number):void
		{
			var now:int = SystemTimeManager.curtTm/1000;
			var dis:int = _endTime-now;
			_skin.sec_time.text = "副本倒计时："+TimeUtil.format3TimeType(dis);
			if(dis<=0)
			{
				stopTimer();
			}
		}
		private function updatedailyZoneInfo(dailyZoneId:int):void
		{
			_dailyZoneId = dailyZoneId;
			_data = DailyZoneCfgData.getZoneCfg(dailyZoneId);
			var allLength:Array = DailyZoneMonsterCfgData.getTypeList(dailyZoneId);
			
			for each(var md:Q_dailyzone_monster in allLength)
			{
				_totalMonsterCount +=md.q_monsterNum;
			}
			_totalWaveCount = allLength.length;
			
			_waveInfo = new Dictionary();
			refeashInfo();
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
			var percent:Number = count/_totalMonsterCount;
			_skin.pro_bar.value = _skin.pro_bar.maximum*percent;
			_skin.lbNum.text = count.toString()+"/"+_totalMonsterCount;
		}
		override protected function onHide():void
		{
			stopTimer();
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.removeEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.removeEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
		}
		
		private function stopTimer():void
		{
			if(Starling.juggler.contains(this))
			{
				Starling.juggler.remove(this);
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					DungeonSender.reqQuitDungeon();
					break;
			}
		}
	}
}