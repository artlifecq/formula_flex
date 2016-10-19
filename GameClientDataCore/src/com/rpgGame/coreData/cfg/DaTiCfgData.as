package com.rpgGame.coreData.cfg
{
	import app.message.ExamConfig;
	import app.message.ExtraPrize;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 答题配置管理
	 * @author GuoDong.Zhang
	 * 
	 */
	public class DaTiCfgData
	{
		public static const ANSWER_PREFIX_ARR:Array = ["A.","B.","C.","D."];
		/**题目答案的最大数量*/
		public static const ANSWER_MAX_COUNT:int = 4;
		/**开始提示显示时间，单位毫秒*/
		public static var waitTime:int;
		/**每题答题时间，单位毫秒*/
		public static var answerTime:int;
		/**展示答案时间，单位毫秒*/
		public static var showAnswerTime:int;
		/**总题目个数*/
		public static var questionCount:int; 
		/**双倍积分最大使用次数*/
		public static var doubleScoreMaxTimes:int;
		/**排错最大使用次数*/
		public static var removeWrongAnswerTimes:int;
		/**从善最大使用次数*/
		public static var followMaxTimes:int;
		public static var currentScore:int;
		public static var currentRanking:int;
		/**开始时间 TimeData*/
		public static var startTime:String;
		/**答题总时间， 单位毫秒*/
		public static var totalTime:int;
		private static var _extraPercentVec:Vector.<int>;
		
		public static function setConfig(config:ExamConfig):void
		{
			waitTime = config.waitTime;
			answerTime = config.answerTime;
			showAnswerTime = config.showAnswerTime;
			questionCount = config.questionCount;
			doubleScoreMaxTimes = config.doubleScoreMaxTimes;
			removeWrongAnswerTimes = config.removeWrongAnswerTimes;
			followMaxTimes = config.followMaxTimes;
			startTime = config.startTime;
			totalTime = questionCount*(answerTime + showAnswerTime) + waitTime;
			
			_extraPercentVec = new Vector.<int>();
			if(config.extraPercent)
			{
				var len:int = config.extraPercent.length;
				if(len > 0)
				{
					var i:int;
					var extraProto:ExtraPrize;
					var map:HashMap = new HashMap();
					for(i = 0; i < len; i++)
					{
						extraProto = config.extraPercent[i];
						map.add(extraProto.rank - 1,extraProto);
					}
					var totalCount:int = extraProto.rank;
					var percent:int;
					for(i = totalCount - 1; i >= 0; i--)
					{
						extraProto = map.getValue(i);
						if(extraProto)
						{
							percent = extraProto.extraPercent;
						}
						_extraPercentVec.unshift(percent);
					}
				}
			}
		}
		
		/**
		 * 获得额外奖励百分数不含%
		 * @return 
		 * 
		 */
		public static function getExtraPercent(index:int):int
		{
			if(index < _extraPercentVec.length)
			{
				return _extraPercentVec[index];
			}
			return 0;
		}
		
	}
}