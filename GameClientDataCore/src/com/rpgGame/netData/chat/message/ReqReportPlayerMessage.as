package com.rpgGame.netData.chat.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 举报玩家发言问题
	 */
	public class ReqReportPlayerMessage extends Message {
	
		//被举报角色id
		private var _reportid: long;
		
		//举报类型
		private var _type: int;
		
		//详细内容(玩家填写)
		private var _content: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被举报角色id
			writeLong(_reportid);
			//举报类型
			writeInt(_type);
			//详细内容(玩家填写)
			writeString(_content);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被举报角色id
			_reportid = readLong();
			//举报类型
			_type = readInt();
			//详细内容(玩家填写)
			_content = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112202;
		}
		
		/**
		 * get 被举报角色id
		 * @return 
		 */
		public function get reportid(): long{
			return _reportid;
		}
		
		/**
		 * set 被举报角色id
		 */
		public function set reportid(value: long): void{
			this._reportid = value;
		}
		
		/**
		 * get 举报类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 举报类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 详细内容(玩家填写)
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 详细内容(玩家填写)
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
	}
}