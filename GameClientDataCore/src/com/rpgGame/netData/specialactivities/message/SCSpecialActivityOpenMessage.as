package com.rpgGame.netData.specialactivities.message{
	import org.game.netCore.data.long;
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
		
		//参与状态0:未开启 1:开启中  2:进行中
		private var _joinState: int;
		
		//活动剩余时间
		private var _remainTime: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//返回活动开启id
			writeInt(_activityId);
			//参与状态0:未开启 1:开启中  2:进行中
			writeInt(_joinState);
			//活动剩余时间
			writeLong(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//返回活动开启id
			_activityId = readInt();
			//参与状态0:未开启 1:开启中  2:进行中
			_joinState = readInt();
			//活动剩余时间
			_remainTime = readLong();
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
		 * get 参与状态0:未开启 1:开启中  2:进行中
		 * @return 
		 */
		public function get joinState(): int{
			return _joinState;
		}
		
		/**
		 * set 参与状态0:未开启 1:开启中  2:进行中
		 */
		public function set joinState(value: int): void{
			this._joinState = value;
		}
		
		/**
		 * get 活动剩余时间
		 * @return 
		 */
		public function get remainTime(): long{
			return _remainTime;
		}
		
		/**
		 * set 活动剩余时间
		 */
		public function set remainTime(value: long): void{
			this._remainTime = value;
		}
		
	}
}