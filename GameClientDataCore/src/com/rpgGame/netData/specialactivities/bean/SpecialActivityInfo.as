package com.rpgGame.netData.specialactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活动基本信息
	 */
	public class SpecialActivityInfo extends Bean {
	
		//活动id
		private var _activityId: int;
		
		//活动类型：0综合活动，1世界BOSS
		private var _activityType: int;
		
		//参与状态0:非当日 1:未开启  2:进行中3:Boss已击杀 4:已结束
		private var _joinState: int;
		
		//通知时间(-1:离开启时间超过半小时,0:还有半小时开启,其他表示还有多少时间关闭活动)
		private var _notifyTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//活动类型：0综合活动，1世界BOSS
			writeInt(_activityType);
			//参与状态0:非当日 1:未开启  2:进行中3:Boss已击杀 4:已结束
			writeInt(_joinState);
			//通知时间(-1:离开启时间超过半小时,0:还有半小时开启,其他表示还有多少时间关闭活动)
			writeInt(_notifyTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//活动类型：0综合活动，1世界BOSS
			_activityType = readInt();
			//参与状态0:非当日 1:未开启  2:进行中3:Boss已击杀 4:已结束
			_joinState = readInt();
			//通知时间(-1:离开启时间超过半小时,0:还有半小时开启,其他表示还有多少时间关闭活动)
			_notifyTime = readInt();
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
		 * get 活动类型：0综合活动，1世界BOSS
		 * @return 
		 */
		public function get activityType(): int{
			return _activityType;
		}
		
		/**
		 * set 活动类型：0综合活动，1世界BOSS
		 */
		public function set activityType(value: int): void{
			this._activityType = value;
		}
		
		/**
		 * get 参与状态0:非当日 1:未开启  2:进行中3:Boss已击杀 4:已结束
		 * @return 
		 */
		public function get joinState(): int{
			return _joinState;
		}
		
		/**
		 * set 参与状态0:非当日 1:未开启  2:进行中3:Boss已击杀 4:已结束
		 */
		public function set joinState(value: int): void{
			this._joinState = value;
		}
		
		/**
		 * get 通知时间(-1:离开启时间超过半小时,0:还有半小时开启,其他表示还有多少时间关闭活动)
		 * @return 
		 */
		public function get notifyTime(): int{
			return _notifyTime;
		}
		
		/**
		 * set 通知时间(-1:离开启时间超过半小时,0:还有半小时开启,其他表示还有多少时间关闭活动)
		 */
		public function set notifyTime(value: int): void{
			this._notifyTime = value;
		}
		
	}
}