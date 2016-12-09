package com.rpgGame.netData.chat.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 聊天记录
	 */
	public class ChatRecordInfo extends Bean {
	
		//0 发送者 1接受者
		private var _who: int;
		
		//聊天内容
		private var _content: String;
		
		//消息时间
		private var _time: long;
		
		//是否存在道具展示 0 没有 1有
		private var _showType: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 发送者 1接受者
			writeByte(_who);
			//聊天内容
			writeString(_content);
			//消息时间
			writeLong(_time);
			//是否存在道具展示 0 没有 1有
			writeByte(_showType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 发送者 1接受者
			_who = readByte();
			//聊天内容
			_content = readString();
			//消息时间
			_time = readLong();
			//是否存在道具展示 0 没有 1有
			_showType = readByte();
			return true;
		}
		
		/**
		 * get 0 发送者 1接受者
		 * @return 
		 */
		public function get who(): int{
			return _who;
		}
		
		/**
		 * set 0 发送者 1接受者
		 */
		public function set who(value: int): void{
			this._who = value;
		}
		
		/**
		 * get 聊天内容
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 聊天内容
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
		/**
		 * get 消息时间
		 * @return 
		 */
		public function get time(): long{
			return _time;
		}
		
		/**
		 * set 消息时间
		 */
		public function set time(value: long): void{
			this._time = value;
		}
		
		/**
		 * get 是否存在道具展示 0 没有 1有
		 * @return 
		 */
		public function get showType(): int{
			return _showType;
		}
		
		/**
		 * set 是否存在道具展示 0 没有 1有
		 */
		public function set showType(value: int): void{
			this._showType = value;
		}
		
	}
}