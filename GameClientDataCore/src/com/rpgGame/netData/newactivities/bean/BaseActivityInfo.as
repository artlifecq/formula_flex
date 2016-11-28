package com.rpgGame.netData.newactivities.bean{
	
	
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
	public class BaseActivityInfo extends Bean {
	
		//活动id
		private var _activityId: int;
		
		//活动类型
		private var _activityType: int;
		
		//活动描述
		private var _activityDescribe: String;
		
		//活动奖励
		private var _activityReward: String;
		
		//是否领取，0已经领取，1可领取， 2不可领取
		private var _status: int;
		
		//是否需要世界服验证 0-不需要 1-需要
		private var _toWorld: int;
		
		//显示类型
		private var _show: int;
		
		//是否推荐
		private var _recommend: int;
		
		//活动时间
		private var _time: String;
		
		//服务器时间
		private var _servertime: int;
		
		//可重复领取次数
		private var _times: int;
		
		//世界可领取次数
		private var _worldTimes: int;
		
		//分组
		private var _group: int;
		
		//分组类型
		private var _grouptype: int;
		
		//标识
		private var _sign: String;
		
		//检测活动是否有分页
		private var _pagination: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//活动类型
			writeInt(_activityType);
			//活动描述
			writeString(_activityDescribe);
			//活动奖励
			writeString(_activityReward);
			//是否领取，0已经领取，1可领取， 2不可领取
			writeInt(_status);
			//是否需要世界服验证 0-不需要 1-需要
			writeInt(_toWorld);
			//显示类型
			writeInt(_show);
			//是否推荐
			writeInt(_recommend);
			//活动时间
			writeString(_time);
			//服务器时间
			writeInt(_servertime);
			//可重复领取次数
			writeInt(_times);
			//世界可领取次数
			writeInt(_worldTimes);
			//分组
			writeInt(_group);
			//分组类型
			writeInt(_grouptype);
			//标识
			writeString(_sign);
			//检测活动是否有分页
			writeString(_pagination);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//活动类型
			_activityType = readInt();
			//活动描述
			_activityDescribe = readString();
			//活动奖励
			_activityReward = readString();
			//是否领取，0已经领取，1可领取， 2不可领取
			_status = readInt();
			//是否需要世界服验证 0-不需要 1-需要
			_toWorld = readInt();
			//显示类型
			_show = readInt();
			//是否推荐
			_recommend = readInt();
			//活动时间
			_time = readString();
			//服务器时间
			_servertime = readInt();
			//可重复领取次数
			_times = readInt();
			//世界可领取次数
			_worldTimes = readInt();
			//分组
			_group = readInt();
			//分组类型
			_grouptype = readInt();
			//标识
			_sign = readString();
			//检测活动是否有分页
			_pagination = readString();
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
		 * get 活动类型
		 * @return 
		 */
		public function get activityType(): int{
			return _activityType;
		}
		
		/**
		 * set 活动类型
		 */
		public function set activityType(value: int): void{
			this._activityType = value;
		}
		
		/**
		 * get 活动描述
		 * @return 
		 */
		public function get activityDescribe(): String{
			return _activityDescribe;
		}
		
		/**
		 * set 活动描述
		 */
		public function set activityDescribe(value: String): void{
			this._activityDescribe = value;
		}
		
		/**
		 * get 活动奖励
		 * @return 
		 */
		public function get activityReward(): String{
			return _activityReward;
		}
		
		/**
		 * set 活动奖励
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
		 * get 是否需要世界服验证 0-不需要 1-需要
		 * @return 
		 */
		public function get toWorld(): int{
			return _toWorld;
		}
		
		/**
		 * set 是否需要世界服验证 0-不需要 1-需要
		 */
		public function set toWorld(value: int): void{
			this._toWorld = value;
		}
		
		/**
		 * get 显示类型
		 * @return 
		 */
		public function get show(): int{
			return _show;
		}
		
		/**
		 * set 显示类型
		 */
		public function set show(value: int): void{
			this._show = value;
		}
		
		/**
		 * get 是否推荐
		 * @return 
		 */
		public function get recommend(): int{
			return _recommend;
		}
		
		/**
		 * set 是否推荐
		 */
		public function set recommend(value: int): void{
			this._recommend = value;
		}
		
		/**
		 * get 活动时间
		 * @return 
		 */
		public function get time(): String{
			return _time;
		}
		
		/**
		 * set 活动时间
		 */
		public function set time(value: String): void{
			this._time = value;
		}
		
		/**
		 * get 服务器时间
		 * @return 
		 */
		public function get servertime(): int{
			return _servertime;
		}
		
		/**
		 * set 服务器时间
		 */
		public function set servertime(value: int): void{
			this._servertime = value;
		}
		
		/**
		 * get 可重复领取次数
		 * @return 
		 */
		public function get times(): int{
			return _times;
		}
		
		/**
		 * set 可重复领取次数
		 */
		public function set times(value: int): void{
			this._times = value;
		}
		
		/**
		 * get 世界可领取次数
		 * @return 
		 */
		public function get worldTimes(): int{
			return _worldTimes;
		}
		
		/**
		 * set 世界可领取次数
		 */
		public function set worldTimes(value: int): void{
			this._worldTimes = value;
		}
		
		/**
		 * get 分组
		 * @return 
		 */
		public function get group(): int{
			return _group;
		}
		
		/**
		 * set 分组
		 */
		public function set group(value: int): void{
			this._group = value;
		}
		
		/**
		 * get 分组类型
		 * @return 
		 */
		public function get grouptype(): int{
			return _grouptype;
		}
		
		/**
		 * set 分组类型
		 */
		public function set grouptype(value: int): void{
			this._grouptype = value;
		}
		
		/**
		 * get 标识
		 * @return 
		 */
		public function get sign(): String{
			return _sign;
		}
		
		/**
		 * set 标识
		 */
		public function set sign(value: String): void{
			this._sign = value;
		}
		
		/**
		 * get 检测活动是否有分页
		 * @return 
		 */
		public function get pagination(): String{
			return _pagination;
		}
		
		/**
		 * set 检测活动是否有分页
		 */
		public function set pagination(value: String): void{
			this._pagination = value;
		}
		
	}
}