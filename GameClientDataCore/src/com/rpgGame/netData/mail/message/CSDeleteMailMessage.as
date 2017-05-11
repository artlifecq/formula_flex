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
	 * 删除邮件
	 */
	public class CSDeleteMailMessage extends Message {
	
		//删除邮件的id
		private var _mailId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//删除邮件的id
			writeLong(_mailId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//删除邮件的id
			_mailId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120203;
		}
		
		/**
		 * get 删除邮件的id
		 * @return 
		 */
		public function get mailId(): long{
			return _mailId;
		}
		
		/**
		 * set 删除邮件的id
		 */
		public function set mailId(value: long): void{
			this._mailId = value;
		}
		
	}
}