package com.rpgGame.netData.specialactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活动预告信息
	 */
	public class ActivityNotifyInfo extends Bean {
	
		//活动id
		private var _activityId: int;
		
		//预告时间(分钟)
		private var _notifyTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//预告时间(分钟)
			writeInt(_notifyTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//预告时间(分钟)
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
		 * get 预告时间(分钟)
		 * @return 
		 */
		public function get notifyTime(): int{
			return _notifyTime;
		}
		
		/**
		 * set 预告时间(分钟)
		 */
		public function set notifyTime(value: int): void{
			this._notifyTime = value;
		}
		
	}
}