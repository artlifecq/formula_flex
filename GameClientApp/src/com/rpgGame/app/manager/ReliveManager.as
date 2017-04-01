package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.manager.trade.TradeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.ReliveSender;
	import com.rpgGame.app.sender.TradeSender;
	import com.rpgGame.app.ui.UIModel;
	import com.rpgGame.app.ui.alert.DungeonRelivePanel;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.cfg.ReliveCfgData;
	import com.rpgGame.coreData.enum.ReliveShowType;
	import com.rpgGame.coreData.enum.SceneReliveEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.scene.DieInfo;
	import com.rpgGame.coreData.info.scene.ReliveCostData;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.type.ReliveType;
	
	import app.message.AmountType;
	import app.message.HeroReliveClientProto;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;
	
	/**
	 * 复活管理类
	 * @author Mandragora
	 * 
	 */	
	public class ReliveManager
	{
		private static var _curDieInfo:DieInfo;
		
		//		private static var _gTime:GameTimer;
		/**当前原地复活次数**/
		private static var _originReliveTimes:int = 0;
		/**今天总共原地复活的次数**/
		private static var _totalOriginReliveTimes:int = 0;
		/**原地完美复活的次数**/
		private static var _originPerfectReliveTimes:int = 0;
		/**今天原地完美复活的次数**/
		private static var _totalOriginPerfectReliveTimes:int = 0;
		/**原地复活折扣到期时间**/
		private static var _originReliveDiscountTime : Number;
		/**原地复活折扣**/
		private static var _originReliveDiscount : int;
		/**完美原地复活折扣到期时间**/
		private static var _prefectReliveDiscountTime:Number;
		/**完美原地复活折扣到期时间**/
		private static var _prefectReliveDiscount:int;
		/** 挂机自动复活时间 (现在填的是10S)**/
		public static var trusteeshipReliveTime : Number = 10000;
		
		private static const RELIVE_TYPE : String = "relive_model";
		
		public function ReliveManager()
		{
		}
		
		//-------------------折扣------------------
		
		public static function setOriginReliveDiscount(time:Number,discount:int):void
		{
			_originReliveDiscount = discount;
			_originReliveDiscountTime = time;
		}
		
		public static function setPrefectReliveDiscount(time:Number,discount:int):void
		{
			_prefectReliveDiscount = discount;
			_prefectReliveDiscountTime = time;
		}
		
		//----------------------------------------
		
		public static function init():void
		{
			//			_gTime = new GameTimer("ReliveManager", 1000, 1);
			//			_gTime.onComplete = timeComplete;
		}
		
		public static function resetDaily():void
		{
			_originReliveTimes = 0;
			_totalOriginReliveTimes = 0;
			_originPerfectReliveTimes = 0;
			_totalOriginPerfectReliveTimes = 0;
		}		
		//---------------------------------------
		
		/**
		 * 得到复活的地图名称
		 * @return 
		 * 
		 */		
		public static function getSaveRelivePlace():String
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if( sceneData == null )
				return "未知";
			
			if( !sceneData.isNormalScene )
			{	
				//不是普通场景
				return "副本里复活还没做";
			}
			return normalSceneRelive( sceneData );
		}
		
		/**
		 * 普通场景死亡，走这个流程
		 * @return 
		 * 
		 */		
		private static function normalSceneRelive( normal:SceneData ):String
		{
			var mycountry:int = MainRoleManager.actorInfo.countryId;
			var sceneSequence:int = MainRoleManager.actorInfo.sceneSequence;
			if(MainRoleManager.isInCountryWar)//国战
			{
//				return CountryWarStatusManager.getCurrentReliveSceneName();
			}
			if( mycountry == sceneSequence )//死在自己国家
				return MapDataManager.getMapName( normal.selfCountryDeathReturnSceneId );
			
			if( sceneSequence <= 0 )
				return "未知";
			
			//死在别人的国家
			return MapDataManager.getMapName( normal.otherCountryDeathReturnSceneId );
		}
		
		
		
		//----------------------------------------
		
		public static function hasFreeOriginTime():Boolean
		{
			return _totalOriginReliveTimes < ReliveCfgData.originReliveCost.freeTimes;
		}
		
		public static function hasFreePerfectTime():Boolean
		{
			return _totalOriginPerfectReliveTimes < ReliveCfgData.prefectReliveCost.freeTimes;
		}
		
		public static function hasOriginDiscount():Boolean
		{
			trace(SystemTimeManager.curtTm);
			trace("原地复活折扣时间",_originReliveDiscountTime);
			return SystemTimeManager.curtTm<_originReliveDiscountTime;
		}
		
		public static function hasPrefectDiscount():Boolean
		{
			trace(SystemTimeManager.curtTm);
			trace("完美复活折扣时间",_prefectReliveDiscountTime);
			return SystemTimeManager.curtTm<_prefectReliveDiscountTime;
		}
		/**剩余次数**/
		public static function getHaveFreePrefectTime():int
		{
			return ReliveCfgData.prefectReliveCost.freeTimes - _totalOriginPerfectReliveTimes ;
		}
		
		/**剩余次数**/
		public static function getHaveFreeOriginTime():int
		{
			return ReliveCfgData.originReliveCost.freeTimes - _totalOriginReliveTimes ;
		}
		
		/**
		 * 原地复活 的消耗
		 * @return 
		 * 
		 */		
		public static function getOriginReliveInfo():Number
		{
			var cost:int = getReliveInfoType( ReliveCfgData.originReliveCost, _originReliveTimes);
			var discount : Number = hasOriginDiscount()?originReliveDiscount*0.01:1;
			return Math.round(cost  * MainRoleManager.actorInfo.relive_coeff / 100*discount);
		}
		/**
		 * 完美复活 的消耗
		 * @return 
		 * 
		 */		
		public static function getPerfectReliveInfo():int
		{
			var cost:int = getReliveInfoType( ReliveCfgData.prefectReliveCost, _originPerfectReliveTimes );
			var discount : Number = hasPrefectDiscount()?prefectReliveDiscount*0.01:1;
			return  Math.round(cost * MainRoleManager.actorInfo.relive_coeff / 100);
		}
		
		public static function getFreeReliveTime():int
		{
			return ReliveCfgData.originReliveCost.freeTimes;
		}
		
		private static function getReliveInfoType( costData : ReliveCostData, reliveTime:int ):int
		{
			if( costData == null )
				return -1;
			var amount : AmountInfo = costData.getCostAmountInfoByIndex(reliveTime);
			if(!amount)
			{
				NoticeManager.showNotify("你看到这个提示，就要告诉策划们加配置了！！！，复活了"+reliveTime+"次");
				return 0;
			}
			return amount.getAmountByType(AmountType.MONEY);//这里现在只有所有的消耗，没有做军费补贴和折扣卷还有等级百分比，之后再加了。
		}
		
		
		//---------------------------------------
		/**
		 * 1秒后打开复活面板
		 * 
		 */		
		private static function timeComplete():void
		{
			//			_gTime.reset();
			//			_gTime.stop();
			
			//			showRelivePanel();
			var mapdata : SceneData =  MapDataManager.getMapInfo(SceneSwitchManager.currentMapId);
			if(mapdata)
			{
				switch(mapdata.sceneReliveType)
				{
					case SceneReliveEnum.DUNGEON_SCENE:
						DungeonRelivePanel.showRelivePanel(mapdata.reliveCd + SystemTimeManager.curtTm,showRelivePanel);
						break;
					case SceneReliveEnum.NORMAL_SCENE:
						showRelivePanel();
						break;	
				}
			}else
				showRelivePanel();
		}
		
		private static function reliveUiChange():void
		{
			//人物死亡，关闭偷经任务面板
			AppManager.hideApp( AppConstant.TOU_JING_PANEL );
			//关闭交易
			if( TradeManager.isTrading )//有交易才发送
				TradeSender.cancelTrade();
		}
		
		private static function showRelivePanel():void
		{
			AppManager.showAppNoHide( AppConstant.RELIVE_PANEL );
			if(_curDieInfo.trusteeshipReliveTime)
				TimerServer.add(autoOriginRelive,trusteeshipReliveTime);
			UIModel.instence.showModel(RELIVE_TYPE);
		}
		
		/**
		 * 关闭面板
		 * 
		 */		
		public static function hideRelivePanel():void
		{
			AppManager.hideApp( AppConstant.RELIVE_PANEL);
			UIModel.instence.hideModel(RELIVE_TYPE);
		}
		
		/**
		 * 复活成功后按照复活方式更新数据
		 * @param type
		 * 
		 */		
		public static function changeReliveTime(type:int):void
		{
			switch(type)
			{
				case ReliveType.RELIVE_TYPE_0:
					_originReliveTimes = 0;
					_originPerfectReliveTimes = 0;
					break;
				case ReliveType.RELIVE_TYPE_1:
					if(!hasFreeOriginTime())	
						_originReliveTimes ++;
					_totalOriginReliveTimes ++;
					break;
				case ReliveType.RELIVE_TYPE_2:
					if(!hasFreePerfectTime())
						_originPerfectReliveTimes ++;
					_totalOriginPerfectReliveTimes ++;
					break;
			}
			TimerServer.remove(autoOriginRelive);
			UIModel.instence.hideModel(RELIVE_TYPE);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,EnumFunctionMessageBarIcoType.RELIVE_TYPE);
			tempDieInfo = null;
		}
		
		//--------------
		/**
		 * 设置英雄数据
		 * @param heroRelive
		 * 
		 */		
		public static function setHeroData( heroRelive:HeroReliveClientProto ):void
		{
			if( heroRelive == null )
				return;
			
			_originReliveTimes = heroRelive.originReliveTimes;
			_totalOriginReliveTimes = heroRelive.totalOriginReliveTimes;
			_originPerfectReliveTimes = heroRelive.originPerfectReliveTimes;
			_totalOriginPerfectReliveTimes = heroRelive.totalOriginPerfectReliveTimes;
			var reliveTime : Number = heroRelive.autoTownReliveTime?heroRelive.autoTownReliveTime.toNumber():0;
			var originDiscount : int = heroRelive.originReliveDiscount;
			var originDiscountTime1 : Number = heroRelive.originReliveDiscountEndTime?heroRelive.originReliveDiscountEndTime.toNumber():0;
			var prefectDiscount : int = heroRelive.originPerfectReliveDiscount;
			var prefectDiscountTime1 : Number = heroRelive.originPerfectReliveDiscountEndTime?heroRelive.originPerfectReliveDiscountEndTime.toNumber():0;
			trace("原地复活折扣时间",originDiscountTime1);
			setOriginReliveDiscount(originDiscountTime1,originDiscount);
			trace("完美复活折扣时间",prefectDiscountTime1);
			setPrefectReliveDiscount(prefectDiscountTime1,prefectDiscount);
			
			trace("复活时间"+TimeUtil.changeTimeToSpecStr(reliveTime))
			if(SystemTimeManager.curtTm < reliveTime)
			{
				trace("服务器尝试让我复活");
				tempDieInfo.reliveTimes = reliveTime;
				if(heroRelive.canXinChunGe)
					tempDieInfo.reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_1;
				else if(heroRelive.canShangBuQi&& heroRelive.canPaoDeKuai)
					tempDieInfo.reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_4;
				else if(heroRelive.canShangBuQi)
					tempDieInfo.reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_2;
				else if(heroRelive.canPaoDeKuai)
					tempDieInfo.reliveOption = ReliveShowType.RELIVE_OTHER_TYPE_3;
				else
					tempDieInfo.reliveOption = ReliveShowType.RELIVE_NORMAL_TYPE;
			}
		}
		
		private static var tempDieInfo : DieInfo = new DieInfo();
		/**进入游戏的时候检测玩家是不是挂了，如果挂了就把面板给他打开**/
		public static function checkPlayerDie():void
		{
			if(!tempDieInfo)
				return;
			if(tempDieInfo.reliveTimes!=0)
				onRecSceneYouAreDead(tempDieInfo);
		}
		
		//-------------------------------------消息相关
		
		/**
		 * 请求复活
		 */
		public static function reqReliveMsg( type:int ) : void
		{
			ReliveSender.reqSceneRequestRelive( type );
		}
		
		
		
		//-*----------------------------------------
		/**
		 * 人物死亡
		 * @param dieInfo
		 * 
		 */		
		public static function onRecSceneYouAreDead( dieInfo:DieInfo ):void
		{
			_curDieInfo = dieInfo;
			if( _curDieInfo == null )
				return;
			reliveUiChange();
			//			_gTime.start();
			timeComplete();
		}
		
		private static function autoOriginRelive():void
		{
			if(!_curDieInfo.trusteeshipReliveTime)
			{
				trace("没有挂机复活时间怎么启用的？");
				return;
			}
			if(!TrusteeshipManager.getInstance().isAutoFightRunning)
			{
				trace("没有挂机怎么启动的？");
				return;
			}
			var amount : AmountInfo = MainRoleManager.actorInfo.amountInfo;
			var mineMoney : int = amount.getAmountByType(AmountType.MONEY);
			if(mineMoney >= getOriginReliveInfo() || hasFreeOriginTime())
			{
				ReliveSender.reqSceneRequestRelive(ReliveType.RELIVE_TYPE_1);
				return;
			}else
				trace("挂机原地复活失败了");
		}
		
		/**
		 * 英雄将要完美复活广播, 客户端根据复活时刻在英雄对象身上显示倒计时. 如果英雄id是自己, 则关闭复活面板
		 * varint64 英雄id
		 * varint64 复活时刻
		 */
		public static function onRecPerfectReliveBroadcast( heroId:Number, reliveTime:Number ):void
		{
			
			var player:SceneRole = SceneManager.getSceneObjByID(heroId) as SceneRole;
			if( player == null )
				return;
			
			var numberRes:String = FightFaceHelper.NUMBER_RED2;
			var time:int;
			var reliveGameTime:GameTimer = new GameTimer( "Relive" + heroId.toString() );
			reliveGameTime.onUpdate = function timeUpdate():void
			{
				time = reliveTime - SystemTimeManager.curtTm;
				if( time < 0 )
				{
					reliveGameTime.stop();
					reliveGameTime.destroy();
					reliveGameTime = null;
					return;
				}
				
				FightFaceHelper.showAttackFace(player.boneNameContainer, "", numberRes, time, null, null, FightFaceHelper.tweenTypeEnemyHpDecrease, null, null, 1, 0.8);
			}
			
			reliveGameTime.start();
		}
		
		
		
		
		
		//-----------------------------------------------
		public static function get curDieInfo():DieInfo
		{
			return _curDieInfo;
		}
		
		/**当前原地复活次数**/
		public static function get originReliveTimes():int
		{
			return _originReliveTimes;
		}
		
		public static function autoHideRelive():void
		{
			if(MainRoleManager.actorInfo.totalStat.hp > 0)
			{
				hideRelivePanel();
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,EnumFunctionMessageBarIcoType.RELIVE_TYPE);
			}
		}
		
		/**今天总共原地复活的次数**/
		public static function get totalOriginReliveTimes():int
		{
			return _totalOriginReliveTimes;
		}
		
		/**原地完美复活的次数**/
		public static function get originPerfectReliveTimes():int
		{
			return _originPerfectReliveTimes;
		}
		
		/**今天原地完美复活的次数**/
		public static function get totalOriginPerfectReliveTimes():int
		{
			return _totalOriginPerfectReliveTimes;
		}
		
		/**原地复活折扣到期时间**/
		public static function get originReliveDiscountTime():Number
		{
			return _originReliveDiscountTime;
		}
		
		/**原地复活折扣**/
		public static function get originReliveDiscount():int
		{
			return _originReliveDiscount;
		}
		
		/**完美原地复活折扣到期时间**/
		public static function get prefectReliveDiscountTime():Number
		{
			return _prefectReliveDiscountTime;
		}
		
		/**完美原地复活折扣到期时间**/
		public static function get prefectReliveDiscount():int
		{
			return _prefectReliveDiscount;
		}
	}
}
