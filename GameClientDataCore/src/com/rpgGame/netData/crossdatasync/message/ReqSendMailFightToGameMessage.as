package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 跨服邮件同步原服
	 */
	public class ReqSendMailFightToGameMessage extends Message {
	
		//serverKey
		private var _serverKey: int;
		
		//发送给玩家Id
		private var _targetPlayerId: long;
		
		//邮件类型
		private var _type: int;
		
		//题目
		private var _title: String;
		
		//内容
		private var _content: String;
		
		//附件
		private var _items: String;
		
		//附加参数
		private var _jsonParam: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//serverKey
			writeInt(_serverKey);
			//发送给玩家Id
			writeLong(_targetPlayerId);
			//邮件类型
			writeInt(_type);
			//题目
			writeString(_title);
			//内容
			writeString(_content);
			//附件
			writeString(_items);
			//附加参数
			writeString(_jsonParam);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//serverKey
			_serverKey = readInt();
			//发送给玩家Id
			_targetPlayerId = readLong();
			//邮件类型
			_type = readInt();
			//题目
			_title = readString();
			//内容
			_content = readString();
			//附件
			_items = readString();
			//附加参数
			_jsonParam = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251273;
		}
		
		/**
		 * get serverKey
		 * @return 
		 */
		public function get serverKey(): int{
			return _serverKey;
		}
		
		/**
		 * set serverKey
		 */
		public function set serverKey(value: int): void{
			this._serverKey = value;
		}
		
		/**
		 * get 发送给玩家Id
		 * @return 
		 */
		public function get targetPlayerId(): long{
			return _targetPlayerId;
		}
		
		/**
		 * set 发送给玩家Id
		 */
		public function set targetPlayerId(value: long): void{
			this._targetPlayerId = value;
		}
		
		/**
		 * get 邮件类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 邮件类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 题目
		 * @return 
		 */
		public function get title(): String{
			return _title;
		}
		
		/**
		 * set 题目
		 */
		public function set title(value: String): void{
			this._title = value;
		}
		
		/**
		 * get 内容
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 内容
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
		/**
		 * get 附件
		 * @return 
		 */
		public function get items(): String{
			return _items;
		}
		
		/**
		 * set 附件
		 */
		public function set items(value: String): void{
			this._items = value;
		}
		
		/**
		 * get 附加参数
		 * @return 
		 */
		public function get jsonParam(): String{
			return _jsonParam;
		}
		
		/**
		 * set 附加参数
		 */
		public function set jsonParam(value: String): void{
			this._jsonParam = value;
		}
		
	}
}