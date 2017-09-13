package com.rpgGame.netData.activities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活动信息
	 */
	public class ActivityInfo extends Bean {
	
		//活动id
		private var _activityId: int;
		
		//活动类型(与充值有关)
		private var _activityType: int;
		
		//活动名称
		private var _activityName: String;
		
		//活动奖励(json)
		private var _activityReward: String;
		
		//是否领取，0已经领取，1可领取， 2不可领取
		private var _status: int;
		
		//已经领取次数
		private var _rewardTimes: int;
		
		//总共可重复领取次数
		private var _repeatTimes: int;
		
		//活动结束剩余时间(秒)
		private var _overTime: int;
		
		//活动内容介绍
		private var _info: String;
		
		//活动ICON
		private var _resflag: String;
		
		//活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
		private var _top: int;
		
		//是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
		private var _icon: String;
		
		//活动所在的分页标签
		private var _fenye: String;
		
		//完成进度分子
		private var _numerator: int;
		
		//完成进度分母
		private var _denominator: int;
		
		//主面板类型
		private var _mainPanelType: int;
		
		//主面板类型
		private var _subPanelType: int;
		
		//开始时间
		private var _startTime: int;
		
		//结束时间
		private var _endTime: int;
		
		//奖励领取条件
		private var _exchange: String;
		
		//其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
		private var _other: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//活动类型(与充值有关)
			writeInt(_activityType);
			//活动名称
			writeString(_activityName);
			//活动奖励(json)
			writeString(_activityReward);
			//是否领取，0已经领取，1可领取， 2不可领取
			writeInt(_status);
			//已经领取次数
			writeInt(_rewardTimes);
			//总共可重复领取次数
			writeInt(_repeatTimes);
			//活动结束剩余时间(秒)
			writeInt(_overTime);
			//活动内容介绍
			writeString(_info);
			//活动ICON
			writeString(_resflag);
			//活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
			writeInt(_top);
			//是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
			writeString(_icon);
			//活动所在的分页标签
			writeString(_fenye);
			//完成进度分子
			writeInt(_numerator);
			//完成进度分母
			writeInt(_denominator);
			//主面板类型
			writeInt(_mainPanelType);
			//主面板类型
			writeInt(_subPanelType);
			//开始时间
			writeInt(_startTime);
			//结束时间
			writeInt(_endTime);
			//奖励领取条件
			writeString(_exchange);
			//其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
			writeString(_other);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//活动类型(与充值有关)
			_activityType = readInt();
			//活动名称
			_activityName = readString();
			//活动奖励(json)
			_activityReward = readString();
			//是否领取，0已经领取，1可领取， 2不可领取
			_status = readInt();
			//已经领取次数
			_rewardTimes = readInt();
			//总共可重复领取次数
			_repeatTimes = readInt();
			//活动结束剩余时间(秒)
			_overTime = readInt();
			//活动内容介绍
			_info = readString();
			//活动ICON
			_resflag = readString();
			//活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
			_top = readInt();
			//是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
			_icon = readString();
			//活动所在的分页标签
			_fenye = readString();
			//完成进度分子
			_numerator = readInt();
			//完成进度分母
			_denominator = readInt();
			//主面板类型
			_mainPanelType = readInt();
			//主面板类型
			_subPanelType = readInt();
			//开始时间
			_startTime = readInt();
			//结束时间
			_endTime = readInt();
			//奖励领取条件
			_exchange = readString();
			//其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
			_other = readString();
			return true;
		}
		
		/**
		 * get 活动id
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 活动id
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
		}
		
		/**
		 * get 活动类型(与充值有关)
		 * @return 
		 */
		public function get activityType(): int{
			return _activityType;
		}
		
		/**
		 * set 活动类型(与充值有关)
		 */
		public function set activityType(value: int): void{
			this._activityType = value;
		}
		
		/**
		 * get 活动名称
		 * @return 
		 */
		public function get activityName(): String{
			return _activityName;
		}
		
		/**
		 * set 活动名称
		 */
		public function set activityName(value: String): void{
			this._activityName = value;
		}
		
		/**
		 * get 活动奖励(json)
		 * @return 
		 */
		public function get activityReward(): String{
			return _activityReward;
		}
		
		/**
		 * set 活动奖励(json)
		 */
		public function set activityReward(value: String): void{
			this._activityReward = value;
		}
		
		/**
		 * get 是否领取，0已经领取，1可领取， 2不可领取
		 * @return 
		 */
		public function get status(): int{
			return _status;
		}
		
		/**
		 * set 是否领取，0已经领取，1可领取， 2不可领取
		 */
		public function set status(value: int): void{
			this._status = value;
		}
		
		/**
		 * get 已经领取次数
		 * @return 
		 */
		public function get rewardTimes(): int{
			return _rewardTimes;
		}
		
		/**
		 * set 已经领取次数
		 */
		public function set rewardTimes(value: int): void{
			this._rewardTimes = value;
		}
		
		/**
		 * get 总共可重复领取次数
		 * @return 
		 */
		public function get repeatTimes(): int{
			return _repeatTimes;
		}
		
		/**
		 * set 总共可重复领取次数
		 */
		public function set repeatTimes(value: int): void{
			this._repeatTimes = value;
		}
		
		/**
		 * get 活动结束剩余时间(秒)
		 * @return 
		 */
		public function get overTime(): int{
			return _overTime;
		}
		
		/**
		 * set 活动结束剩余时间(秒)
		 */
		public function set overTime(value: int): void{
			this._overTime = value;
		}
		
		/**
		 * get 活动内容介绍
		 * @return 
		 */
		public function get info(): String{
			return _info;
		}
		
		/**
		 * set 活动内容介绍
		 */
		public function set info(value: String): void{
			this._info = value;
		}
		
		/**
		 * get 活动ICON
		 * @return 
		 */
		public function get resflag(): String{
			return _resflag;
		}
		
		/**
		 * set 活动ICON
		 */
		public function set resflag(value: String): void{
			this._resflag = value;
		}
		
		/**
		 * get 活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
		 * @return 
		 */
		public function get top(): int{
			return _top;
		}
		
		/**
		 * set 活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
		 */
		public function set top(value: int): void{
			this._top = value;
		}
		
		/**
		 * get 是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
		 * @return 
		 */
		public function get icon(): String{
			return _icon;
		}
		
		/**
		 * set 是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
		 */
		public function set icon(value: String): void{
			this._icon = value;
		}
		
		/**
		 * get 活动所在的分页标签
		 * @return 
		 */
		public function get fenye(): String{
			return _fenye;
		}
		
		/**
		 * set 活动所在的分页标签
		 */
		public function set fenye(value: String): void{
			this._fenye = value;
		}
		
		/**
		 * get 完成进度分子
		 * @return 
		 */
		public function get numerator(): int{
			return _numerator;
		}
		
		/**
		 * set 完成进度分子
		 */
		public function set numerator(value: int): void{
			this._numerator = value;
		}
		
		/**
		 * get 完成进度分母
		 * @return 
		 */
		public function get denominator(): int{
			return _denominator;
		}
		
		/**
		 * set 完成进度分母
		 */
		public function set denominator(value: int): void{
			this._denominator = value;
		}
		
		/**
		 * get 主面板类型
		 * @return 
		 */
		public function get mainPanelType(): int{
			return _mainPanelType;
		}
		
		/**
		 * set 主面板类型
		 */
		public function set mainPanelType(value: int): void{
			this._mainPanelType = value;
		}
		
		/**
		 * get 主面板类型
		 * @return 
		 */
		public function get subPanelType(): int{
			return _subPanelType;
		}
		
		/**
		 * set 主面板类型
		 */
		public function set subPanelType(value: int): void{
			this._subPanelType = value;
		}
		
		/**
		 * get 开始时间
		 * @return 
		 */
		public function get startTime(): int{
			return _startTime;
		}
		
		/**
		 * set 开始时间
		 */
		public function set startTime(value: int): void{
			this._startTime = value;
		}
		
		/**
		 * get 结束时间
		 * @return 
		 */
		public function get endTime(): int{
			return _endTime;
		}
		
		/**
		 * set 结束时间
		 */
		public function set endTime(value: int): void{
			this._endTime = value;
		}
		
		/**
		 * get 奖励领取条件
		 * @return 
		 */
		public function get exchange(): String{
			return _exchange;
		}
		
		/**
		 * set 奖励领取条件
		 */
		public function set exchange(value: String): void{
			this._exchange = value;
		}
		
		/**
		 * get 其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
		 * @return 
		 */
		public function get other(): String{
			return _other;
		}
		
		/**
		 * set 其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
		 */
		public function set other(value: String): void{
			this._other = value;
		}
		
	}
}