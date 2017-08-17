package com.rpgGame.app.manager.yunBiao
{
	import com.game.engine3D.utils.TimeUtil;
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.YunBiaoSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.info.yunBiao.GeRenYunBiaoHelpInfo;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import flash.utils.Dictionary;
	
	import org.client.mainCore.manager.EventManager;

	public class GeRenBiaoCheState extends BiaoCheStateBase
	{
		/** 检查运镖的npc id，最后一个是交镖的 **/
		public var _checkYunBiaoNpcId:Vector.<int>;
		/** 运镖押金 **/
		public var _yaJin:Dictionary;
		/** 国运开始时间 **/
		public var _guoYunConfigStartTime:int;
		/** 国运结束时间 **/
		public var _guoYunConfigEndTime:int;
		
		public var _arrGuoYunStartTime:Array = [0, 0, 0];

		/** 品质的数量 **/
		private var _qualityCount:int;

		private var _vipTimes:Dictionary;
		
		private var _dicEnemy:Dictionary = new Dictionary(); 
		
		private var _arrPrizeCount:Array = [];
		/** vip奖励加成 **/
		public var _vipAwardsMulti:Vector.<Number> = new Vector.<Number>();

		/** 每天允许最大运镖次数 **/
		private var _maxYunBiaoTimes:int;
		
		/** 求助列表 **/
		public var _helpList:Vector.<GeRenYunBiaoHelpInfo> = new Vector.<GeRenYunBiaoHelpInfo>();

		override protected function onYunBiaoTimeOut() : void
		{
			checkPoint = 0;
			isFarAwar = false;
			GameAlert.showAlertUtil(LangYunBiao.YUN_BIAO_GE_REN_YUN_BIAO_TIME_OUT);
			destoryFinishTimer();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		private var _preShowHelpTime:Number = 0;
		
		override public function set isHited($value:Boolean) : void
		{
			super.isHited = $value;
			
			if ($value)
			{
				var now:Number = SystemTimeManager.curtTm;
				if ((now - _preShowHelpTime) >= (2 * TimeUtil.MINUTE_MICRO_SECONDS))
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
						EnumFunctionMessageBarIcoType.GE_REN_YUN_BIAO_HELP);
				}
			} else
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
					EnumFunctionMessageBarIcoType.GE_REN_YUN_BIAO_HELP);
			}
		}

		/**
		 * 获取当前求助列表 
		 * @return 返回当前求助列表
		 * @author 康露 2015年1月29日
		 */
		public function getHelpList() : Vector.<GeRenYunBiaoHelpInfo>
		{
			_helpList = _helpList.filter(filterHelpList);
			return _helpList;
		}
		
		private function filterHelpList(item:GeRenYunBiaoHelpInfo, index:int, vector:Vector.<GeRenYunBiaoHelpInfo>) : Boolean
		{
			return item.time > (SystemTimeManager.curtTm-2*TimeUtil.MINUTE_MICRO_SECONDS);
		}
		
		private function onFinishHelpInfo($helpInfo:GeRenYunBiaoHelpInfo) : void
		{
			updateHuBiaoInfo();
			if (null != $helpInfo)
			{
				$helpInfo.endTimer.destroy();
				$helpInfo.endTimer = null;
			}
		}
		
		/**
		 * 移除指定玩家的求助信息 
		 * @param $heroId 需要被移除求助信息的玩家id
		 * @author 康露 2015年1月30日
		 */
		public function removeHelpInfo($heroId:Number) : void
		{
			_helpList = getHelpList();
			var len:int = _helpList.length;
			for (var idx:int=0; idx<len; idx++)
			{
				var info:GeRenYunBiaoHelpInfo = _helpList[idx];
				if (null == info)
					continue;
				if (info.heroId == $heroId)
				{
					_helpList.splice(idx, 1);
					updateHuBiaoInfo();
					break;
				}
			}
		}

		public function addHelpInfo($heroName:String, $heroId:Number, $sceneId:int, $globalId:int) : void
		{
			var helpInfo:GeRenYunBiaoHelpInfo = new GeRenYunBiaoHelpInfo(SystemTimeManager.curtTm, $heroName, $heroId, $sceneId, $globalId);
/*			helpInfo.endTimer = GameTimerManager.createTimer("addHelpInfo"+$heroName, 2*TimeUtil.MINUTE_MICRO_SECONDS, 1, null, onFinishHelpInfo, true, null, [helpInfo]);
			helpInfo.endTimer.start();*/
			_helpList.push(helpInfo);
			_helpList = getHelpList();
			
			updateHuBiaoInfo();
		}
		
		public function updateHuBiaoInfo() : void
		{
			var len:int = getHelpList().length;
			
			if (len > 0)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
						EnumFunctionMessageBarIcoType.GE_REN_HU_BIAO, len);
			} else
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
					EnumFunctionMessageBarIcoType.GE_REN_HU_BIAO);
			}
		}

		override public function reset() : void
		{
			limitTime = 0;
			isFarAwar = false;
			removeAllEnemy();
			destoryFinishTimer();
		}
		
		private static var _arrNoticed:Array = [false, false, false, false];
		
		/** 国运开始时间 **/
		public function setGuoYunStartTime($guoYunStartTime:Number, $countryId:int) : void
		{
			_arrGuoYunStartTime[$countryId] = $guoYunStartTime;
			if ($guoYunStartTime == 0)
				return;

			if (_arrNoticed[$countryId])
				return;

			var endTime:Number = $guoYunStartTime + TimeUtil.HOUR_MICRO_SECONDS;
			if (SystemTimeManager.curtTm >= endTime)
				return;

//			NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_12, CountryCityManager.getCountryNamebyCountryId($countryId));
			_arrNoticed[$countryId] = true;
/*			if ($countryId == MainRoleManager.actorInfo.countryId && OpenFunctionManager.isOpenFunction(FunctionType.FUNC_YUN_BIAO))
			{
				EventManager.dispatchEvent(ActivityStartNoteEvent.ADD, EnumActivityStartNoteType.GUO_JIA_YUN_BIAO,false, endTime);
			}*/
		}
		
		public function resetGuoYunStartTime() : void
		{
			_arrGuoYunStartTime = [0, 0, 0];
		}

		/**
		 * 添加一个敌人  
		 * @param $enemyId 敌人id
		 * @author 康露 2015年1月4日 
		 */
		public function addEnemy($enemyId:Number) : void
		{
			_dicEnemy[$enemyId] = true;
			addFaceIcon($enemyId);
		}
		
		public function addFaceIcon($enemyId:Number) : void
		{
			return;// 策划说不用加了 by 康露 2015年1月9日
/*			var sceneChar:SceneChar = Scene.scene.getSceneObjByID($enemyId, SceneCharType.PLAYER) as SceneChar;
			if (null == sceneChar)
			{
				return;
			}
			if(MainManager.isBanShuPass)
			{
				sceneChar.headFace.addTopDisplayIcon(new JieBiaoIcon(), EnumHeadFaceIconID.JIE_BIAO_ICON);
			}*/
		}
		
		/**
		 * 移除一个敌人 
		 * @param $enemyId 敌人id
		 * @author 康露 2015年1月4日
		 */
		public function delEnemy($enemyId:Number) : void
		{
			delete _dicEnemy[$enemyId];
			delFaceIcon($enemyId);			
		}
		
		public function delFaceIcon($enemyId:Number) : void
		{
/*			var sceneChar:SceneChar = Scene.scene.getSceneObjByID($enemyId, SceneCharType.PLAYER) as SceneChar;
			if (null == sceneChar)
			{
				return;
			}
			sceneChar.headFace.removeTopIconByID(EnumHeadFaceIconID.JIE_BIAO_ICON);*/
		}
		
		public function isEnemy($enemyId:Number) : Boolean
		{
			return Boolean(_dicEnemy[$enemyId]);
		}

		/**
		 * 获取剩余的运镖次数 
		 * @author 康露 2014年12月27日
		 */
		override public function getLeftTimes() : int
		{
			var vipLv:int = MainRoleManager.actorInfo.vipLv;
			return Math.max(0, _maxYunBiaoTimes + uint(_vipTimes[vipLv]) - yunBiaoTimes); 
		}
		
		override public function getTotalTimes() : int
		{
			return _maxYunBiaoTimes + uint(_vipTimes[MainRoleManager.actorInfo.vipLv]);
		}
		
		public function init($yunBiaoConfig:*, $vipConfig:Array) : void
		{
			_checkYunBiaoNpcId = new Vector.<int>();
			_yaJin = new Dictionary();
			getNpcId = $yunBiaoConfig.getYunBiaoNpcId;
			
			var idx:int = 0;
			var len:int = $yunBiaoConfig.checkYunBiaoNpcId.length;
			for (idx=0; idx<len; idx++)
			{
				_checkYunBiaoNpcId.push($yunBiaoConfig.checkYunBiaoNpcId[idx]);
			}
			checkPoint = 0;
			_checkYunBiaoNpcId.push($yunBiaoConfig.submitYunBiaoNpcId);
			len = $yunBiaoConfig.yaJinLevel.length;
			for (idx=0; idx<len; idx++)
			{
				_yaJin[$yunBiaoConfig.yaJinLevel[idx]] = $yunBiaoConfig.yaJin[idx];
			}
			len = $vipConfig.length;
			_vipAwardsMulti.length = 0;
			_vipAwardsMulti.push(100);
//			for (idx=0; idx<len; idx++)
//			{
//				if (($vipConfig[idx] as VipProto).hasYunBiaoPrizeCoef)
//				{
//					_vipAwardsMulti.push(($vipConfig[idx] as VipProto).yunBiaoPrizeCoef + 100);
//				} else
//				{
//					_vipAwardsMulti.push(100);
//				}
//			}
			
			_qualityCount = $yunBiaoConfig.qualityCount;
			_maxYunBiaoTimes = $yunBiaoConfig.yunBiaoTimes;
			
			_vipTimes = new Dictionary();
//			len = $vipConfig.length;
//			for (idx=0; idx<len; idx++)
//			{
//				var vipConfig:VipProto = $vipConfig[idx];
//				_vipTimes[idx+1] = vipConfig.yunBiaoTimes; 
//			}
			
			if ($yunBiaoConfig.hasGuoYunStartTime)
			{
				_guoYunConfigStartTime = $yunBiaoConfig.guoYunStartTime;
			}
			if ($yunBiaoConfig.hasGuoYunEndTime)
			{
				_guoYunConfigEndTime = $yunBiaoConfig.guoYunEndTime;
			}

			len = $yunBiaoConfig.biaoCheQualityPrizeCount.length;
			for (idx=0; idx<len; idx++)
			{
				_arrPrizeCount.push($yunBiaoConfig.biaoCheQualityPrizeCount[idx]);
			}
			
			callUpCdTime = $yunBiaoConfig.personalYunBiaoCallHelpCd;
			
//			EventManager.addEvent(UserEvent.USER_DAILY_DATA_CLEAR, resetGuoYunStartTime);
			
			// 设置9点的定时器，如果没有开启过，那么自动开启
/*			var timeNow:Number = TimeUtil.getTodayMicroSecond(SystemTimeManager.curtTm);
			var timeNine:Number = TimeUtil.HOUR_MICRO_SECONDS * $yunBiaoConfig.guoYunEndTime;
			if (null != _autoGuoYunTimer)
			{
				_autoGuoYunTimer.destroy();
			}
			_autoGuoYunTimer = GameTimerManager.createTimer("autoGuoYunTimer", (timeNine + TimeUtil.DAY_MICRO_SECONDS - timeNow) % TimeUtil.DAY_MICRO_SECONDS, 1, checkAutoGuoYun);
			_autoGuoYunTimer.start();*/
		}

		private var _autoGuoYunTimer:GameTimer = null;
		private function checkAutoGuoYun() : void
		{
			// 设置9点的定时器，如果没有开启过，那么自动开启
/*			var timeNow:Number = TimeUtil.getTodayMicroSecond(SystemTimeManager.curtTm);
			var timeNine:Number = TimeUtil.HOUR_MICRO_SECONDS * _guoYunConfigEndTime;
			if (null != _autoGuoYunTimer)
			{
				_autoGuoYunTimer.destroy();
			}
			_autoGuoYunTimer = GameTimerManager.createTimer("autoGuoYunTimer", (timeNine + TimeUtil.DAY_MICRO_SECONDS - timeNow) % TimeUtil.DAY_MICRO_SECONDS, 1, checkAutoGuoYun);
			_autoGuoYunTimer.start();
			
			var len:int = _arrGuoYunStartTime.length;
			for (var idx:int=0; idx<len; idx++)
			{
				var time:Number = _arrGuoYunStartTime[idx];
				if (0 == time)
				{// 还没开启运镖，自动开启
					setGuoYunStartTime(SystemTimeManager.curtTm, idx);
					if( idx == CountryCityManager.getSelfCountryId() )
					{
						if (OpenFunctionManager.isOpenFunction(FunctionType.FUNC_YUN_BIAO))
						{
							var alertId:int = GameAlert.showConfirmNoCover("你的国家开启了1小时的国运时间，<font color='#FF0000'>运镖奖励增加50%</font>，是否立即前往？", "国运", true, onGuoYunOk);
							TweenLite.delayedCall(TimeUtil.HOUR_MICRO_SECONDS/TimeUtil.SECOND_MICRO_SECONDS, onGuoYunTimeOver, [alertId]);
						}
					}
					else if ( CountryCityManager.isFriendCountry(idx) == false )
					{
						var countryName:String = CountryCityManager.getCountryNamebyCountryId(idx);
						NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_9, countryName, countryName);
					}
				}
			}*/
		}
		
		private static function onGuoYunTimeOver($alertId:int) : void
		{
//			GameAlert.hideNoCovarAlert($alertId);
		}
		
		private function onGuoYunOk() : void
		{
//			var getNpcId:int = getNpcId;
//			var npc:MonsterDataProto = MonsterDataManager.getData(getNpcId);
//			if (null == npc)
//				return;
//			EventManager.dispatchEvent(MapEvent.NPC_MAP_TRANS_TO,getNpcId);
		}

		public function getPrizeCount($quality:int) : int
		{
			return _arrPrizeCount[$quality];
		}
		
		public function getSubmitYunBiaoNpcId() : int
		{
			return _checkYunBiaoNpcId[_checkYunBiaoNpcId.length-1];
		}
		
		public function removeAllEnemy() : void
		{
			for (var enemyId:* in _dicEnemy)
			{
				delFaceIcon(Number(enemyId));
			}
			_dicEnemy = new Dictionary();
		}
		
		public function yunBiaoHelp() : void
		{
			_preShowHelpTime = SystemTimeManager.curtTm;
			YunBiaoSender.yunBiaoHelp();
		}

		override protected function onUpdateBiaoCheState() : void
		{
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_BIAO_CHE_STATE);
		}
	}
}
