package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.TaoNiEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.country.CountryTaoNiCfgData;
	import com.rpgGame.coreData.type.activity.ActivityOpenStateType;
	import com.rpgGame.coreData.type.activity.ActivityType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.activityBar.ActivityBarSkin;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;

	/**
	 *
	 * 活动条
	 * @author L.L.M.Sunny
	 * 创建时间：2016-09-05 下午3:05:12
	 *
	 */
	public class ActivityBar extends SkinUI
	{
		private var _activityBar : ActivityBarSkin;
		private var _activityBtnGroups : HashMap;

		private var touZhuInfo : ActivityTouZhuInfo;

		public function ActivityBar()
		{
			_activityBar = new ActivityBarSkin();
			super(_activityBar);

			initBar();
		}

		public function resize(sWidth : int, sHeight : int) : void
		{
			x = sWidth - _activityBar.width - 220;
			y = 0;
		}

		private function initBar() : void
		{
			_activityBtnGroups = new HashMap();
			_activityBtnGroups.add(ActivityType.TAO_NI, new ActivityBtnGroup(ActivityType.TAO_NI, _activityBar.groupTaoni, _activityBar.btnTaoni, _activityBar.lbTimeTaoni, onActivityClick, CountryTaoNiCfgData.timeData, CountryTaoNiCfgData.duration));

			touZhuInfo = new ActivityTouZhuInfo();
			addChild(touZhuInfo);

			touZhuInfo.x = _activityBar.width - touZhuInfo.width;
			touZhuInfo.y = 50;

			if (ClientConfig.isBanShu)
			{
				_activityBar.btnDailyTask.visible = false;
				_activityBar.btnCountryWar.visible = false;
				_activityBar.groupRacing.visible = false;
			}
			if (ClientConfig.isStable)
			{
				_activityBar.btnDailyTask.visible = false;
				_activityBar.btnCountryWar.visible = false;
				_activityBar.groupRacing.visible = false;
			}
		}

		private function onActivityClick(btnGroup : ActivityBtnGroup) : void
		{
			if (btnGroup.activityType == ActivityType.TAO_NI)
			{
//				CountryTaoNiManager.walkToActivityScene();
			}
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			var btnGroups : Array = _activityBtnGroups.getValues();
			for each (var btnGroup : ActivityBtnGroup in btnGroups)
			{
				if (btnGroup.button == target)
				{
					btnGroup.clickButton();
					return;
				}
			}

			switch (target)
			{
				case _activityBar.btnCountryWar:
					break;

				case _activityBar.btnDailyTask:
					AppManager.showApp(AppConstant.DAILY_TASK_PANEL);
					break;
			}
		}

		override protected function onShow() : void
		{
			EventManager.addEvent(ActivityEvent.OPEN_ACTIVITY, onOpenActivityGroup);
			EventManager.addEvent(ActivityEvent.CLOSE_ACTIVITY, onCloseActivityGroup);
			EventManager.addEvent(TaoNiEvent.TAO_NI_STATUS_CHANGE, onTaoNiStatusChange);
			TimerServer.addLoop(onTimeTick, 1000);
			onTaoNiStatusChange();
			onTimeTick();
		}

		private function onOpenActivityGroup(activityType : int, openTime : Number) : void
		{
			var btnGroup : ActivityBtnGroup = _activityBtnGroups.getValue(activityType);
			if (btnGroup)
			{
				btnGroup.open(openTime);
			}
		}

		private function onCloseActivityGroup(activityType : int) : void
		{
			var btnGroup : ActivityBtnGroup = _activityBtnGroups.getValue(activityType);
			if (btnGroup)
			{
				btnGroup.close();
			}
		}

		private function onTaoNiStatusChange() : void
		{
//			_activityBar.taoniSurplusNpcTxt.text = CountryTaoNiManager.surplusNpcCount + "";
		}

		private function onTimeTick() : void
		{
			var currTime : Number = SystemTimeManager.curtTm;
			var btnGroups : Array = _activityBtnGroups.getValues();
			for each (var btnGroup : ActivityBtnGroup in btnGroups)
			{
				var openStateType : int = btnGroup.updateTime(currTime);
				if (openStateType == ActivityOpenStateType.CLOSE)
				{
					btnGroup.close();
				}
				else
				{
					btnGroup.open();
				}
			}
		}
	}
}
