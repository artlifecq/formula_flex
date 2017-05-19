package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.pop.UIPopManager;
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
		private var _listCell:HashMap;
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
			EventManager.addEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.addEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			UIPopManager.showAlonePopUI(DungeonFightPop);
		}
		
		private function updateEndInfo(success:int,star:int):void
		{
			_skin.uiKill.visible = (success==1);
			stopTimer();
		}
		private function updateWaveInfoHandler(currentWaveId:int,killerCount:int):void
		{		
			var cell:KillInfoCell = _listCell.getValue(currentWaveId);
			if(cell==null)
				return ;
			cell.updateValue(currentWaveId,killerCount);
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
			dis = _currentDisTime-now+_currentStartTime;
			if(_currentStar ==3)
			{
				_skin.sec_time2.text = "三星通关倒计时："+TimeUtil.format3TimeType(dis);
			}else if(_currentStar ==2){
				_skin.sec_time2.text = "二星通关倒计时："+TimeUtil.format3TimeType(dis);
			}else{
				_skin.sec_time2.text = "一星通关倒计时："+TimeUtil.format3TimeType(dis);
			}
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
			var allList:Array = DailyZoneMonsterCfgData.getTypeList(dailyZoneId);
			_listCell = new HashMap();
			var index:int = 0;
			for each(var md:Q_dailyzone_monster in allList)
			{
				var cell:KillInfoCell = new KillInfoCell();
				cell.qdailyZoneData = md;
				_skin.targetcontent.addChild(cell);
				cell.x = 5;
				cell.y = 20*index;
				index++;
				_listCell.put(md.q_id,cell);
			}
			
			_data = DailyZoneCfgData.getZoneCfg(dailyZoneId);
			if(_data.q_combat_type ==1)
			{
				_skin.ui_head.styleName = "ui/mainui/fubenzhuizong/richangfuben/zhenqifuben.png";
			}else if(_data.q_combat_type ==2){
				_skin.ui_head.styleName = "ui/mainui/fubenzhuizong/richangfuben/zhuangbeifuben.png";
			}
			var itemInfos:Object = JSONUtil.decode( _data.q_special_rewards_show);
			var item:ItemInfo;
			for(var i:int = 0;i<_rewardIcons.length;i++)
			{
				if(!itemInfos.hasOwnProperty(i))
					break;
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				item.num = itemInfos[i]["num"];
				FaceUtil.SetItemGrid(_rewardIcons[i],ItemUtil.convertClientItemInfo(item), true);
			}
			_skin.uiKill.visible = false;
			var arr:Array = _data.q_star_condition.split(",");
			_lastList = new Array();
			for each(var str:String  in arr)
			{
				_lastList.push(int(str));
			}
		}
		override protected function onHide():void
		{
			stopTimer();
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,updatedailyZoneInfo);
			EventManager.removeEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,updatedailyZoneTime);
			EventManager.removeEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			EventManager.removeEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,updateEndInfo);
			_skin.targetcontent.removeChildren(0,-1,true);
			_listCell = null;
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