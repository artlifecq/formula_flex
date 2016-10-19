package com.rpgGame.app.manager.yunBiao
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.core.events.YunBiaoEvent;
	
	import org.client.mainCore.manager.EventManager;

	public class BiaoCheStateBase
	{
		public var _preFarAwayNoticeTime:Number = 0;

		/** 品质，帮会运镖就是国内、国外 **/
		public var quality:int;

		/** 镖车状态，0表示摧毁状态 **/
		public var lifePercentage:int;
		/** 运镖最迟完成时间 **/
		public var limitTime:Number = 0;
		
		public var callUpFinishTime:Number;
		
		/** 镖车所在场景id **/
		public var sceneId:int;
		/** 镖车坐标x **/
		public var posX:int;
		/** 镖车坐标y **/
		public var posY:int;
//		/** 镖车状态 **/
//		public var _state:int;
		/** 正在被攻击 **/
		private var _isHited:Boolean;
		/** 远离 **/
		public var isFarAwar:Boolean;

		/** 当前要检查的npc序号 **/
		public var checkPoint:int;
		
		/** 镖车等级 **/
		public var biaoCheLevel:int;

		/** 运镖次数 **/
		public var yunBiaoTimes:int; 

		/** 运镖结束时间 **/
		private var _finishTimer:GameTimer = null;
		
		/** 领取帮会运镖的npc id **/
		public var getNpcId:int;
		
		public var callUpCdTime:Number = 0;
		
		public function get isHited() : Boolean
		{
			return _isHited;
		}
		
		public function set isHited($value:Boolean) : void
		{
			_isHited = $value;
		}

		public function destoryFinishTimer() : void
		{
			if (null != _finishTimer)
			{
				_finishTimer.destroy();
				_finishTimer = null;
			}
		}
		
		protected function onYunBiaoTimeOut() : void
		{
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
//			ClientSettingManager.reqSetClientBoolValue(EnumClientBoolSetting.HAVE_GOT_BIAO_CHE, true);
		}
		
		public function reset() : void
		{
		}

		/** 运镖开始 **/
		protected function onYunBiaoStart() : void
		{
		}

		public function onRequestYunbiaoSucceed($yunBiaoInfo:*, $addTimes:Boolean) : void
		{
			quality = $yunBiaoInfo.quality;
			lifePercentage = $yunBiaoInfo.lifePercentage;
			
			checkPoint = $yunBiaoInfo.checkPoint;
			
			biaoCheLevel = $yunBiaoInfo.biaoCheLevel;
			
			sceneId = $yunBiaoInfo.sceneId;
			posX = $yunBiaoInfo.x;
			posY = $yunBiaoInfo.y;
//			_state = $yunBiaoInfo.state;
			isFarAwar = $yunBiaoInfo.isFarAway;
			isHited = $yunBiaoInfo.isHited;
			if ($addTimes)
			{
				yunBiaoTimes ++;
				onYunBiaoStart();
			}
			
			limitTime = $yunBiaoInfo.limitTime.toNumber();
			destoryFinishTimer();
/*			var leftTime:Number = limitTime - SystemTimeManager.curtTm;
			if (leftTime > 0)
			{
				_finishTimer = GameTimerManager.createTimer("onRequestYunbiaoSucceed"+$yunBiaoInfo.biaoCheType.toString(), leftTime, 1, onYunBiaoTimeOut);
				_finishTimer.start();
			}*/
			
			callUpFinishTime = $yunBiaoInfo.nextCallHelpTime.toNumber();
		}
		
		/**
		 * 获取剩余的运镖次数 
		 * @author 康露 2014年12月27日
		 */
		public function getLeftTimes() : int
		{
			return 1;
		}
		
		public function getTotalTimes() : int
		{
			return 1;
		}
		
		protected var _hitResetTimer:GameTimer = null;
		
		private function destoryHitResetTimer() : void
		{
			if (null == _hitResetTimer)
				return;
			_hitResetTimer.destroy();
			_hitResetTimer = null;
		}
		
		protected function onUpdateBiaoCheState() : void
		{
			
		}
		
		protected function resetHitState() : void
		{
			isHited = false;
			destoryHitResetTimer();
			onUpdateBiaoCheState();
		}
		
		protected function resetBiaoCheHitted() : void
		{
			resetHitState();
		}
		
		public function setBiaoCheHitted() : void
		{
			if (null != _hitResetTimer)
			{
				_hitResetTimer.destroy();
			}
/*			_hitResetTimer = GameTimerManager.createTimer("hit_reset_timer", 5000, 1, null, resetHitState);
			_hitResetTimer.start();
			NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_11);*/

			isHited = true;
		}
		
		public function updateBiaoCheState($sceneId:int, $x:int, $y:int, $isFarAway:Boolean, $isHited:Boolean) : void
		{
			sceneId = $sceneId;
			posX = $x;
			posY = $y;
			
/*			var now:Number = SystemTimeManager.curtTm;
			if ($isFarAway)
			{
				if (now - _preFarAwayNoticeTime > 20000)
				{
					NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_7);
					_preFarAwayNoticeTime = now;
				}
			}*/
			
			destoryHitResetTimer();

			isFarAwar = $isFarAway;
			if ($isHited)
			{
				setBiaoCheHitted();
			} else
			{
				resetBiaoCheHitted();
			}
		}
	}
}
