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
	 * 邮件概要信息
	 */
	public class MailBriefInfo extends Bean {
	
		//邮件编号
		private var _mailInfoId: long;
		
		//邮件标题
		private var _subject: String;
		
		//哪一模块的邮件
		private var _type: int;
		
		//附件简要信息
		private var _items: Vector.<Attachment> = new Vector.<Attachment>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邮件编号
			writeLong(_mailInfoId);
			//邮件标题
			writeString(_subject);
			//哪一模块的邮件
			writeInt(_type);
			//附件简要信息
			writeShort(_items.length);
			for (var i: int = 0; i < _items.length; i++) {
				writeBean(_items[i]);
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
			//哪一模块的邮件
			_type = readInt();
			//附件简要信息
			var items_length : int = readShort();
			for (var i: int = 0; i < items_length; i++) {
				_items[i] = readBean(Attachment) as Attachment;
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
		 * get 哪一模块的邮件
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 哪一模块的邮件
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 附件简要信息
		 * @return 
		 */
		public function get items(): Vector.<Attachment>{
			return _items;
		}
		
		/**
		 * set 附件简要信息
		 */
		public function set items(value: Vector.<Attachment>): void{
			this._items = value;
		}
		
	}
}