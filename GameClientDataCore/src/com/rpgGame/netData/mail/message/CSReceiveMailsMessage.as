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
	 * 领取多个邮件
	 */
	public class CSReceiveMailsMessage extends Message {
	
		//邮件的Id
		private var _mailIds: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//邮件的Id
			writeShort(_mailIds.length);
			for (i = 0; i < _mailIds.length; i++) {
				writeLong(_mailIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//邮件的Id
			var mailIds_length : int = readShort();
			for (i = 0; i < mailIds_length; i++) {
				_mailIds[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 120205;
		}
		
		/**
		 * get 邮件的Id
		 * @return 
		 */
		public function get mailIds(): Vector.<long>{
			return _mailIds;
		}
		
		/**
		 * set 邮件的Id
		 */
		public function set mailIds(value: Vector.<long>): void{
			this._mailIds = value;
		}
		
	}
}