package com.rpgGame.netData.dailyzone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 日常副本ID
	 */
	public class SCDailyZoneIdInfoMessage extends Message {
	
		//日常副本ID
		private var _dailyZoneId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//日常副本ID
			writeInt(_dailyZoneId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//日常副本ID
			_dailyZoneId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400105;
		}
		
		/**
		 * get 日常副本ID
		 * @return 
		 */
		public function get dailyZoneId(): int{
			return _dailyZoneId;
		}
		
		/**
		 * set 日常副本ID
		 */
		public function set dailyZoneId(value: int): void{
			this._dailyZoneId = value;
		}
		
	}
}