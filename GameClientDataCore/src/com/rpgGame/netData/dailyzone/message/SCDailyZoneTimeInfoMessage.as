package com.rpgGame.netData.dailyzone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本计时
	 */
	public class SCDailyZoneTimeInfoMessage extends Message {
		
		//结束时间
		private var _endTime: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//结束时间
			writeLong(_endTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//结束时间
			_endTime = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400103;
		}
		
		/**
		 * get 结束时间
		 * @return 
		 */
		public function get endTime(): long{
			return _endTime;
		}
		
		/**
		 * set 结束时间
		 */
		public function set endTime(value: long): void{
			this._endTime = value;
		}
		
	}
}