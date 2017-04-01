package com.rpgGame.netData.client.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 被丢弃的消息
	 */
	public class ResClientMessageMessage extends Message {
	
		//消息id
		private var _msgid: int;
		
		//消息内容
		private var _context: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//消息id
			writeInt(_msgid);
			//消息内容
			writeString(_context);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//消息id
			_msgid = readInt();
			//消息内容
			_context = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301101;
		}
		
		/**
		 * get 消息id
		 * @return 
		 */
		public function get msgid(): int{
			return _msgid;
		}
		
		/**
		 * set 消息id
		 */
		public function set msgid(value: int): void{
			this._msgid = value;
		}
		
		/**
		 * get 消息内容
		 * @return 
		 */
		public function get context(): String{
			return _context;
		}
		
		/**
		 * set 消息内容
		 */
		public function set context(value: String): void{
			this._context = value;
		}
		
	}
}