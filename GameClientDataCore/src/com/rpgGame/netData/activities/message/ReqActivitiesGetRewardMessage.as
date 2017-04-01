package com.rpgGame.netData.activities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求领取信息
	 */
	public class ReqActivitiesGetRewardMessage extends Message {
	
		//活动id
		private var _activityId: int;
		
		//领取次数
		private var _times: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//领取次数
			writeInt(_times);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//领取次数
			_times = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181201;
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
		 * get 领取次数
		 * @return 
		 */
		public function get times(): int{
			return _times;
		}
		
		/**
		 * set 领取次数
		 */
		public function set times(value: int): void{
			this._times = value;
		}
		
	}
}