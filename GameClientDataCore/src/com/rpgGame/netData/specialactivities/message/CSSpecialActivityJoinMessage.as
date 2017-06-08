package com.rpgGame.netData.specialactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求参加活动信息
	 */
	public class CSSpecialActivityJoinMessage extends Message {
	
		//参加活动id
		private var _activityId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//参加活动id
			writeInt(_activityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//参加活动id
			_activityId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162202;
		}
		
		/**
		 * get 参加活动id
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 参加活动id
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
		}
		
	}
}