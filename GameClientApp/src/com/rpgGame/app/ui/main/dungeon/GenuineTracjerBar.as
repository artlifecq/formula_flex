package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.ZhenQi_Skin;
	
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	
	public class GenuineTracjerBar extends DungeonTrackerUI implements IAnimatable
	{
		private var _skin:ZhenQi_Skin;
		private var _dailyZoneId:int;
		private var _targetTrack:TargetTrack;
		private var _rewardIcons:Vector.<IconCDFace>;
		private var _data:Q_daily_zone;
		private var _endTime:int;
		private var _currentStartTime:Number;
		private var _currentDisTime:Number;
		private var _currentStar:int ;
		private var _lastList:Array;
		public function GenuineTracjerBar():void
		{
			_skin = new ZhenQi_Skin();
			super(_skin);
			initView();
			/*updatedailyZoneInfo(7);
			updatedailyZoneTime(SystemTimeManager.curtTm/1000+_data.q_zone_time);*/
		}
		
		private function initView():void
		{
			_rewardIcons = new Vector.<IconCDFace>();
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_0,IcoSizeEnum.ICON_42,1,3,3));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_1,IcoSizeEnum.ICON_42,1,3,3));
			_rewardIcons.push(FaceUtil.creatIconCDFaceByUIAsset(_skin.sec_ico1_2,IcoSizeEnum.ICON_42,1,3,3));
		}
		
		override protected function onShow() : void
		{
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.addEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.addEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			TrusteeshipManager.getInstance().findDist = 10000;
			UIPopManager.showAlonePopUI(DungeonFightPop);
		}
		
		private function updateEndInfo(success:int,star:int):void
		{
			_skin.uiKill.visible = (success==1);
			stopTimer();
		}
		private function updatedailyZoneTime(lastTime:Number):void
		{
			_endTime = lastTime/1000;
			currentStateEnd();
			Starling.juggler.add(this);
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
		public function advanceTime(time:Number):void
		{
			var now:int = SystemTimeManager.curtTm/1000;
			var dis:int = _endTime-now;
			_skin.sec_time.text = "副本倒计时："+TimeUtil.format3TimeType(dis);
			if(dis<=30)
				_skin.sec_time.color = 0xd02525;
			else
				_skin.sec_time.color = 0xe8c958;
			dis = _currentDisTime-now+_currentStartTime;
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
			if(percent<0)
			{
				percent = 0;
			}
			_skin.pro_bar.value = _skin.pro_bar.maximum*percent;
			
			if(percent ==0)
			{
				currentStateEnd();
			}
		}
		private function updatedailyZoneInfo(dailyZoneId:int):void
		{
			_dailyZoneId = dailyZoneId;
			_targetTrack = new TargetTrack(_skin.targetcontent,_dailyZoneId,5);
			_data = DailyZoneCfgData.getZoneCfg(dailyZoneId);
			if(_data.q_combat_type ==1)
			{
				_skin.ui_head.styleName = "ui/mainui/fubenzhuizong/richangfuben/zhenqifuben.png";
			}else if(_data.q_combat_type ==2){
				_skin.ui_head.styleName = "ui/mainui/fubenzhuizong/richangfuben/zhuangbeifuben.png";
			}
			var itemInfos:Object = JSONUtil.decode( _data.q_rewards_client);
			var item:ItemInfo;
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				if(!itemInfos.hasOwnProperty(i))
					break;
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				FaceUtil.SetItemGrid(_rewardIcons[i],ItemUtil.convertClientItemInfo(item), true);
			}
			_skin.uiKill.visible = false;
			var arr:Array = JSONUtil.decode( _data.q_star_condition);
			_lastList = new Array();
			for each(var str:String  in arr)
			{
				_lastList.push(int(str));
			}
			_endTime = SystemTimeManager.curtTm/1000+_data.q_zone_time;
			currentStateEnd();
			advanceTime(0);
			TrusteeshipManager.getInstance().startAutoFight();
		}
		override protected function onHide():void
		{
			stopTimer();
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.removeEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			_skin.targetcontent.removeChildren(0,-1,true);
			TrusteeshipManager.getInstance().findDist = 0;
			_targetTrack.onHide();
			_targetTrack = null;
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