package com.rpgGame.netData.mail.bean{
	import com.rpgGame.netData.mail.bean.Attachment;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 邮件详细信息
	 */
	public class MailDetailInfo extends Bean {
	
		//邮件编号
		private var _mailInfoId: long;
		
		//邮件标题
		private var _subject: String;
		
		//邮件内容
		private var _content: String;
		
		//发送者
		private var _sender: long;
		
		//发送者姓名
		private var _senderName: String;
		
		//发送时间
		private var _sendTime: long;
		
		//剩余天数
		private var _leftDays: int;
		
		//附件列表
		private var _attachments: Vector.<Attachment> = new Vector.<Attachment>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件编号
			writeLong(_mailInfoId);
			//邮件标题
			writeString(_subject);
			//邮件内容
			writeString(_content);
			//发送者
			writeLong(_sender);
			//发送者姓名
			writeString(_senderName);
			//发送时间
			writeLong(_sendTime);
			//剩余天数
			writeInt(_leftDays);
			//附件列表
			writeShort(_attachments.length);
			for (var i: int = 0; i < _attachments.length; i++) {
				writeBean(_attachments[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邮件编号
			_mailInfoId = readLong();
			//邮件标题
			_subject = readString();
			//邮件内容
			_content = readString();
			//发送者
			_sender = readLong();
			//发送者姓名
			_senderName = readString();
			//发送时间
			_sendTime = readLong();
			//剩余天数
			_leftDays = readInt();
			//附件列表
			var attachments_length : int = readShort();
			for (var i: int = 0; i < attachments_length; i++) {
				_attachments[i] = readBean(Attachment) as Attachment;
			}
			return true;
		}
		
		/**
		 * get 邮件编号
		 * @return 
		 */
		public function get mailInfoId(): long{
			return _mailInfoId;
		}
		
		/**
		 * set 邮件编号
		 */
		public function set mailInfoId(value: long): void{
			this._mailInfoId = value;
		}
		
		/**
		 * get 邮件标题
		 * @return 
		 */
		public function get subject(): String{
			return _subject;
		}
		
		/**
		 * set 邮件标题
		 */
		public function set subject(value: String): void{
			this._subject = value;
		}
		
		/**
		 * get 邮件内容
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 邮件内容
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
		/**
		 * get 发送者
		 * @return 
		 */
		public function get sender(): long{
			return _sender;
		}
		
		/**
		 * set 发送者
		 */
		public function set sender(value: long): void{
			this._sender = value;
		}
		
		/**
		 * get 发送者姓名
		 * @return 
		 */
		public function get senderName(): String{
			return _senderName;
		}
		
		/**
		 * set 发送者姓名
		 */
		public function set senderName(value: String): void{
			this._senderName = value;
		}
		
		/**
		 * get 发送时间
		 * @return 
		 */
		public function get sendTime(): long{
			return _sendTime;
		}
		
		/**
		 * set 发送时间
		 */
		public function set sendTime(value: long): void{
			this._sendTime = value;
		}
		
		/**
		 * get 剩余天数
		 * @return 
		 */
		public function get leftDays(): int{
			return _leftDays;
		}
		
		/**
		 * set 剩余天数
		 */
		public function set leftDays(value: int): void{
			this._leftDays = value;
		}
		
		/**
		 * get 附件列表
		 * @return 
		 */
		public function get attachments(): Vector.<Attachment>{
			return _attachments;
		}
		
		/**
		 * set 附件列表
		 */
		public function set attachments(value: Vector.<Attachment>): void{
			this._attachments = value;
		}
		
	}
}