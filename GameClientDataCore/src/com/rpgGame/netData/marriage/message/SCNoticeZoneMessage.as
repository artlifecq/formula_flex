package com.rpgGame.netData.marriage.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 挑战夫妻副本  通知另一个伴侣
	 */
	public class SCNoticeZoneMessage extends Message {
	
		//挑战的副本id
		private var _zoneId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//挑战的副本id
			writeLong(_zoneId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//挑战的副本id
			_zoneId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150116;
		}
		
		/**
		 * get 挑战的副本id
		 * @return 
		 */
		public function get zoneId(): long{
			return _zoneId;
		}
		
		/**
		 * set 挑战的副本id
		 */
		public function set zoneId(value: long): void{
			this._zoneId = value;
		}
		
	}
}