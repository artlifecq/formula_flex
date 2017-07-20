package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 场景跳跃请求消息
	 */
	public class CSAreaJumpMessage extends Message {
	
		//跳跃ID
		private var _jumpId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//跳跃ID
			writeInt(_jumpId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//跳跃ID
			_jumpId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101220;
		}
		
		/**
		 * get 跳跃ID
		 * @return 
		 */
		public function get jumpId(): int{
			return _jumpId;
		}
		
		/**
		 * set 跳跃ID
		 */
		public function set jumpId(value: int): void{
			this._jumpId = value;
		}
		
	}
}