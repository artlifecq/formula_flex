package com.rpgGame.netData.specialactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回活动开启信息
	 */
	public class SCSpecialActivityOpenMessage extends Message {
	
		//返回活动开启id
		private var _activityId: int;
		
		//参与状态0:非当日 1:未开启  2:进行中 3:Boss已击杀4:已结束
		private var _joinState: int;
		
		//活动剩余时间
		private var _remainTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//返回活动开启id
			writeInt(_activityId);
			//参与状态0:非当日 1:未开启  2:进行中 3:Boss已击杀4:已结束
			writeInt(_joinState);
			//活动剩余时间
			writeInt(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//返回活动开启id
			_activityId = readInt();
			//参与状态0:非当日 1:未开启  2:进行中 3:Boss已击杀4:已结束
			_joinState = readInt();
			//活动剩余时间
			_remainTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162102;
		}
		
		/**
		 * get 返回活动开启id
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 返回活动开启id
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
		}
		
		/**
		 * get 参与状态0:非当日 1:未开启  2:进行中 3:Boss已击杀4:已结束
		 * @return 
		 */
		public function get joinState(): int{
			return _joinState;
		}
		
		/**
		 * set 参与状态0:非当日 1:未开启  2:进行中 3:Boss已击杀4:已结束
		 */
		public function set joinState(value: int): void{
			this._joinState = value;
		}
		
		/**
		 * get 活动剩余时间
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 活动剩余时间
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
	}
}