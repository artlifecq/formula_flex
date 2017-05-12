package com.rpgGame.netData.mail.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 删除邮件结果
	 */
	public class SCDeleteResultMessage extends Message {
	
		//邮件ID
		private var _mailId: long;
		
		//0 失败，1 成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件ID
			writeLong(_mailId);
			//0 失败，1 成功
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邮件ID
			_mailId = readLong();
			//0 失败，1 成功
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120105;
		}
		
		/**
		 * get 邮件ID
		 * @return 
		 */
		public function get mailId(): long{
			return _mailId;
		}
		
		/**
		 * set 邮件ID
		 */
		public function set mailId(value: long): void{
			this._mailId = value;
		}
		
		/**
		 * get 0 失败，1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 失败，1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}