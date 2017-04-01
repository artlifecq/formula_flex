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
	 * 读取邮件
	 */
	public class ReqGetMailAttachmentMessage extends Message {
	
		//邮件Id
		private var _mailId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件Id
			writeLong(_mailId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邮件Id
			_mailId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120201;
		}
		
		/**
		 * get 邮件Id
		 * @return 
		 */
		public function get mailId(): long{
			return _mailId;
		}
		
		/**
		 * set 邮件Id
		 */
		public function set mailId(value: long): void{
			this._mailId = value;
		}
		
	}
}