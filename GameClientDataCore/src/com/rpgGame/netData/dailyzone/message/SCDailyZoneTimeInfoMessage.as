package com.rpgGame.netData.dailyzone.message{
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
	
		//1.成功  为1时停表,否则校正时间
		private var _success: int;
		
		//剩余时间
		private var _remainTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1.成功  为1时停表,否则校正时间
			writeByte(_success);
			//剩余时间
			writeInt(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1.成功  为1时停表,否则校正时间
			_success = readByte();
			//剩余时间
			_remainTime = readInt();
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
		 * get 1.成功  为1时停表,否则校正时间
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 1.成功  为1时停表,否则校正时间
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
	}
}