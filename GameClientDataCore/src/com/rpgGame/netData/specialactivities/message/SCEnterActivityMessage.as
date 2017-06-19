package com.rpgGame.netData.specialactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 进入活动
	 */
	public class SCEnterActivityMessage extends Message {
	
		//活动ID
		private var _activity: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activity);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activity = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 162105;
		}
		
		/**
		 * get 活动ID
		 * @return 
		 */
		public function get activity(): int{
			return _activity;
		}
		
		/**
		 * set 活动ID
		 */
		public function set activity(value: int): void{
			this._activity = value;
		}
		
	}
}