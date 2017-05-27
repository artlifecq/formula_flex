package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 服务器返回客户端的触发消息
	 */
	public class SCClientTriggerValiedMessage extends Message {
	
		//触发ID
		private var _triggerId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//触发ID
			writeShort(_triggerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//触发ID
			_triggerId = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155136;
		}
		
		/**
		 * get 触发ID
		 * @return 
		 */
		public function get triggerId(): int{
			return _triggerId;
		}
		
		/**
		 * set 触发ID
		 */
		public function set triggerId(value: int): void{
			this._triggerId = value;
		}
		
	}
}