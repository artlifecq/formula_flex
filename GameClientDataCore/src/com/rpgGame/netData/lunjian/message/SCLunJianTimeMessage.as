package com.rpgGame.netData.lunjian.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 论剑剩余时间
	 */
	public class SCLunJianTimeMessage extends Message {
	
		//论剑ID
		private var _ljId: int;
		
		//剩余时间
		private var _remainTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//论剑ID
			writeShort(_ljId);
			//剩余时间
			writeInt(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//论剑ID
			_ljId = readShort();
			//剩余时间
			_remainTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 227502;
		}
		
		/**
		 * get 论剑ID
		 * @return 
		 */
		public function get ljId(): int{
			return _ljId;
		}
		
		/**
		 * set 论剑ID
		 */
		public function set ljId(value: int): void{
			this._ljId = value;
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