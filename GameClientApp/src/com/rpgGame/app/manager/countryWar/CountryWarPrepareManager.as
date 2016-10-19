package com.rpgGame.app.manager.countryWar
{
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.main.activityBar.CountryWarIcon;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.country.CountryWarEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.country.countryWar.CountryWarInfoData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * 国战活动准备阶段管理器
	 * GuoDong.Zhang
	 * 2016-7-18
	 */
	public class CountryWarPrepareManager
	{
		public static var levelNotReach:Boolean;
		private static var _icon:CountryWarIcon;
		
		public static function setup():void
		{
			if(MainRoleManager.actorInfo.level < CountryWarCfgData.PLAYER_JOIN_MIN_LEVEL)
			{
				if(!levelNotReach)
				{
					levelNotReach = true;
					EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,onMainRoleLevelUp);
				}
				return;
			}
			else if(levelNotReach)
			{
				levelNotReach = false;
				EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,onMainRoleLevelUp);
			}
			if(!tryShowIcon())
			{
				EventManager.addEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE,onCountryWarsInfoUpdate);
			}
		}
		
		/**
		 * 国战活动图标
		 * 此方法为临时代码，以后会添加到活动图标集功能中
		 */
		public static function showCountryWarIcon():void
		{
			if(_icon == null)
			{
				_icon = new CountryWarIcon();
			}
			StarlingLayerManager.mainUILayer.addChild(_icon);
			_icon.onShow();
			Starling.current.nativeStage.addEventListener(Event.RESIZE, onStageResize);
			onStageResize();
		}
		
		public static function hideCountryWarIcon():void
		{
			if(_icon != null && _icon.parent)
			{
				Starling.current.nativeStage.removeEventListener(Event.RESIZE, onStageResize);
				_icon.removeFromParent();
				_icon.onHide();
			}
			EventManager.addEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE,onCountryWarsInfoUpdate);
		}
		
		public static function tryShowIcon():Boolean
		{
			var selfCountryWarInfo:CountryWarInfoData = CountryWarManager.getSelfCountryWarInfo();
			if(selfCountryWarInfo)
			{
				var remainStarTime:Number = selfCountryWarInfo.warStartTime - SystemTimeManager.curtTm;
				if(remainStarTime > 0)
				{
					var remainShowIconTime:Number = remainStarTime - CountryWarCfgData.ICON_COUNT_DOWN_TIME;
					if(remainShowIconTime > 0)
					{
						TweenLite.delayedCall(remainShowIconTime/1000,showCountryWarIcon);
					}
					else
					{
						showCountryWarIcon();
					}
					TweenLite.delayedCall(remainStarTime/1000,showAlert);
				}
				else
				{
					showCountryWarIcon();
					showAlert();
				}
				return true;
			}
			else
			{
				
			}
			return false;
		}
		
		private static function onStageResize(e : * = null) : void
		{
			var stageWidth:int = Starling.current.nativeStage.stageWidth;
			var stageHeight:int = Starling.current.nativeStage.stageHeight;
			_icon.x = stageWidth - 455;
			_icon.y = 65;
		}
		
		public static function showAlert():void
		{
			var enemyCountryName:String = CountryWarManager.getSelfEnemyCountryName();
			GameAlert.showAlertUtil(LangAlertInfo.COUNTRY_WAR_START,onShowAlertClick,enemyCountryName);
			AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_TOP_BAR_PANEL);
			var selfCountryWarInfo:CountryWarInfoData = CountryWarManager.getSelfCountryWarInfo();
			if(selfCountryWarInfo)
			{
				var attackCountryName:String = CountryManager.getCountryName(selfCountryWarInfo.attackCountry);
				var defenceCountryName:String = CountryManager.getCountryName(selfCountryWarInfo.defenceCountry);
				NoticeManager.showHint(EnumHintInfo.COUNTRY_WAR_NOTICE_16,[attackCountryName,defenceCountryName]);
				if(MainRoleManager.isInCountryWar)
				{
					AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_RIGHT_BAR_PANEL);
					AppManager.showAppNoHide(AppConstant.COUNTRY_WAR_BOTTOM_BAR_PANEL);
					MainUIManager.hideTaskBar();
				}
			}
		}
		
		private static function onShowAlertClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
				{
					sureToJoin();
					break;
				}
			}
		}
		
		private static function sureToJoin():void
		{
			CountryWarSelfRelatedManager.tryJoinCountryWar();
		}
		
		private static function onCountryWarsInfoUpdate():void
		{
			if(tryShowIcon())
			{
				EventManager.removeEvent(CountryWarEvent.COUNTRY_WARS_INFO_UPDATE,onCountryWarsInfoUpdate);
			}
		}
		
		private static function onMainRoleLevelUp():void
		{
			setup();
		}
		
	}
}