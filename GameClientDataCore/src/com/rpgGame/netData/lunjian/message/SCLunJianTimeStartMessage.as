package com.rpgGame.netData.lunjian.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 论剑计时开始
	 */
	public class SCLunJianTimeStartMessage extends Message {
	
		//论剑ID
		private var _ljId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//论剑ID
			writeShort(_ljId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//论剑ID
			_ljId = readShort();
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
		
	}
}