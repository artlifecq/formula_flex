package com.rpgGame.coreData.info.fulidating
{
	
	
	public class SignVO extends Object
	{
		public static const REWARD_NUM:Vector.<int> = Vector.<int>([ 2 , 5 , 10 , 17 , 26 ]);
		
		// 本月剩余补签次数
		public var signAddNum: int;
		// 本月累计签到次数
		public var monthSignSum: int;
		// 历史累计签到次数
		public var historySignSum: int;
		// 提前签到次数
		public var strikeSignSum: int;
		//首签奖励领取  1领取 0未领
		public var firstAward: int;	
		//VIP奖励领取  1领取 0未领
		public var vipAward: int;
		// 已经签到过的号数(1-31)集合
		public var dayList: Vector.<int> = new Vector.<int>();
		// 已经领取的累计签到天数奖励集合
		private var _getedSignReward: Vector.<int> = new Vector.<int>();
		public var nextGetRewardNum:int = 0;
		private var _haveReward:Boolean = false;
		
		private var _openServerTime:Date;
		
		public function SignVO()
		{
			super();
		}
		
		public function get signNum():int
		{
			return dayList.length;
		}
		
		public function get haveReward():Boolean
		{
			return _haveReward;
		}
		
		public function get getedSignReward():Vector.<int>
		{
			return _getedSignReward;
		}
		
		public function set getedSignReward( value:Vector.<int> ):void
		{
			_getedSignReward = value;
			var len:int = REWARD_NUM.length;
			var curIdx:int = -1;
			for (var i:int = 0; i < len; i++) 
			{
				if(_getedSignReward.indexOf( REWARD_NUM[i] ) == -1)
				{
					curIdx = i;
					break;
				}
			}
			if(curIdx != -1)
			{
				_haveReward = true;
				nextGetRewardNum = REWARD_NUM[curIdx];
			}else
			{
				nextGetRewardNum = REWARD_NUM[REWARD_NUM.length - 1];
				_haveReward = false;
			}
		}
		
		public function dayIsSign( day:int ):Boolean
		{		
			return dayList.indexOf( day ) != -1;
		}
		
		public function get openServerTime():Date
		{
			return _openServerTime;
		}
		
		public function set openServerTime(value:Date):void
		{ 
			_openServerTime=value;
		}
	}
}