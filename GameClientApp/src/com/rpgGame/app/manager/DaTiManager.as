package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.DaTiSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.main.activityBar.DaTiIcon;
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.DaTiCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import app.message.ExamQuestionProto;
	
	import gs.TweenLite;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * @author Guodong.Zhang
	 * 创建时间：2016-6-23 上午11:30:26
	 * 答题数据管理器
	 */
	public class DaTiManager
	{
		/**正在进行或下一次答题的开始时间*/
		public static var startTime:Number = 0;
		/**正在进行或下一次答题的结束时间*/
		public static var endTime:Number = 0;
		/**当前答题结束时间*/
		public static var currentAnswerEndTime:Number = 0;
		public static var doubleScoreRemainCount:int;
		public static var removeWrongRemainCount:int;
		public static var followOtherRemainCount:int;
		
		public static var preQuestion:ExamQuestionProto;
		public static var preSelectedAnserIndex:int = -1;
		public static var preAnswerIsRight:Boolean;
		
		public static var currentQuestion:ExamQuestionProto;
		/**-1表示没有选*/
		public static var currentSelectedAnserIndex:int = -1;
		public static var currentAnswerIsRight:Boolean;
		
		public static var currentRank:ExamQuestionProto;
		/**成绩*/
		public static var score:int;
		public static var rightCount:int;
		public static var wrongCount:int;
		public static var ranking:int;
		public static var exp:int;
		public static var levelNotReach:Boolean;
		private static var _TimeData:TimeData;
		
		private static var _icon:Object;//DaTiIcon;
		
		public static function setup():void
		{
			//to do根据功能开启判断是否显示图标
			/*if(MainRoleManager.actorInfo.level < DaTiCfgData.requireLevel)
			{
				levelNotReach = true;
				EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,onMainRoleLevelUp);
				return;
			}
			else if(levelNotReach)
			{
				levelNotReach = false;
				EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,onMainRoleLevelUp);
			}*/
			preQuestion = null;
			preAnswerIsRight = false;
			preSelectedAnserIndex = -1;
			
			currentQuestion = null;
			currentAnswerIsRight = false;
			currentSelectedAnserIndex = -1;
			currentAnswerEndTime = 0;
			
			currentRank = null;
			score = 0;
			rightCount = 0;
			wrongCount = 0;
			ranking = 0;
			exp = 0;
			doubleScoreRemainCount = DaTiCfgData.doubleScoreMaxTimes;
			removeWrongRemainCount = DaTiCfgData.removeWrongAnswerTimes;
			followOtherRemainCount = DaTiCfgData.followMaxTimes;
			var currentTime:Number = SystemTimeManager.curtTm;
			var date:Date = startTimeData.getNextTime();
			startTime = date.getTime();
			var totalTime:int = DaTiCfgData.totalTime;
			var endTime:Number = startTime + totalTime;
			if(currentTime >= endTime)
			{
				startTime = startTime + TimeUtil.DAY_MICRO_SECONDS;
				endTime = startTime + DaTiCfgData.totalTime;
			}
			DaTiManager.startTime = startTime;
			DaTiManager.endTime = endTime;
			var iconDisplayTime:int = 10*60*1000;
			var iconStartTime:Number = startTime - iconDisplayTime;
			var alertStartTime:Number = startTime - 5000;
			if(currentTime < iconStartTime)
			{
				var delayIconTime:Number = (iconStartTime - currentTime)/1000;
				TweenLite.delayedCall(delayIconTime,showIcon);
			}
			else
			{
				showIcon();
			}
			if(currentTime < alertStartTime)
			{
				var delayAlertTime:Number = (alertStartTime - currentTime)/1000;
				TweenLite.delayedCall(delayAlertTime,showAlert);
			}
			else
			{
				showAlert();
			}
			if(currentTime > startTime + DaTiCfgData.waitTime)
			{
				DaTiSender.reqExamGetQuestion();
				DaTiSender.reqExamSelfData();
			}
		}
		
		private static function onMainRoleLevelUp():void
		{
			setup();
		}
		
		/**
		 * 显示答题活动图标
		 * 此方法为临时代码，以后会添加到活动图标集功能中
		 */
		public static function showIcon():void
		{
			if(_icon == null)
			{
//				_icon = new DaTiIcon();
			}
//			StarlingLayerManager.mainUILayer.addChild(_icon);
			_icon.onShow();
			Starling.current.nativeStage.addEventListener(Event.RESIZE, onStageResize);
			onStageResize();
		}
		
		public static function hideIcon():void
		{
			if(_icon != null && _icon.parent)
			{
				Starling.current.nativeStage.removeEventListener(Event.RESIZE, onStageResize);
				_icon.removeFromParent();
				_icon.onHide();
			}
		}
		
		/**
		 *
		 * @return
		 *
		 */
		public static function get startTimeData() : TimeData
		{
			if (_TimeData == null)
			{
				_TimeData = new TimeData(DaTiCfgData.startTime);
			}
			return _TimeData;
		}
		
		private static function showAlert():void
		{
			/*if(!AppManager.isAppInScene(AppConstant.DA_TI_PANEL))
			{
				GameAlert.showAlertUtil(LangAlertInfo.datiStartAlert,onShowAlertClick);
			}*/
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
			AppManager.showAppNoHide(AppConstant.DA_TI_PANEL);
		}
		
		private static function onStageResize(e : * = null) : void
		{
			var stageWidth:int = Starling.current.nativeStage.stageWidth;
			var stageHeight:int = Starling.current.nativeStage.stageHeight;
			_icon.x = stageWidth - 355;
			_icon.y = 65;
		}

	}
}