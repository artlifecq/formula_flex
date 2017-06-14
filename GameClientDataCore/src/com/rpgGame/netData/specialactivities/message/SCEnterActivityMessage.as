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
		private var _activity: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//活动ID
			writeShort(_activity.length);
			for (i = 0; i < _activity.length; i++) {
				writeInt(_activity[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//活动ID
			var activity_length : int = readShort();
			for (i = 0; i < activity_length; i++) {
				_activity[i] = readInt();
			}
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
		public function get activity(): Vector.<int>{
			return _activity;
		}
		
		/**
		 * set 活动ID
		 */
		public function set activity(value: Vector.<int>): void{
			this._activity = value;
		}
		
	}
}