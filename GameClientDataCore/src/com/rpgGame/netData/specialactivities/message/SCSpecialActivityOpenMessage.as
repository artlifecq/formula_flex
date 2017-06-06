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
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//返回活动开启id
			writeInt(_activityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//返回活动开启id
			_activityId = readInt();
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
		
	}
}