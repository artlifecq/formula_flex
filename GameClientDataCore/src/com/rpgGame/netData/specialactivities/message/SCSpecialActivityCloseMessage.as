package com.rpgGame.netData.specialactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回活动结束
	 */
	public class SCSpecialActivityCloseMessage extends Message {
	
		//返回活动结束Id
		private var _activityId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//返回活动结束Id
			writeInt(_activityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//返回活动结束Id
			_activityId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162103;
		}
		
		/**
		 * get 返回活动结束Id
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 返回活动结束Id
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
		}
		
	}
}