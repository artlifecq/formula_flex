package com.rpgGame.app.ui.scene.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
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
		private var _ico:IconCDFace;
		public function ExpTracjerBar():void
		{
			_skin = new JingYan_Skin();
			super(_skin);
			_ico=new IconCDFace(IcoSizeEnum.ICON_42);
			_ico.selectImgVisible=false;
			_ico.bindBg(_skin.sec_ico1_0);
			_skin.container.addChild(_ico);
			/*updatedailyZoneInfo(11);
			updatedailyZoneTime(SystemTimeManager.curtTm/1000+1800);*/
		}
		
		private function initView():void
		{
			var arr:Array=JSONUtil.decode(_data.q_rewards_show);
			var exp:int=0;
			
			if(arr)
			{
				arr=arr[2];
				for(var i:int=0;i<arr.length;i++)
				{
					if(arr[i].mod==1)
						exp+=arr[i].num;
				}
			}
			var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(1,exp);
			FaceUtil.SetItemGrid(_ico,itemInfo);
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
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();		
		}
		
		public function advanceTime(time:Number):void
		{
			var now:int = SystemTimeManager.curtTm/1000;
			var dis:int = _endTime-now;
			_skin.sec_time.text = "副本倒计时："+TimeUtil.format3TimeType(dis);
			if(dis<=30)
				_skin.sec_time.color = 0xd02525;
			else
				_skin.sec_time.color = 0xe8c958;
			if(dis<=0)
			{
				stopTimer();
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
			_endTime = SystemTimeManager.curtTm/1000+_data.q_zone_time;
			advanceTime(0);
			TrusteeshipManager.getInstance().startAutoFight();
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