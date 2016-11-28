package com.rpgGame.netData.chat.message{
	import com.rpgGame.netData.chat.bean.ExtraResInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 聊天消息
	 */
	public class ResChatMessage extends Message {
	
		//玩家ID
		private var _playerId: long;
		
		//玩家名字
		private var _name: String;
		
		//聊天类型
		private var _type: int;
		
		//地域标示（前后端枚举）
		private var _playerarea: int;
		
		//聊天内容
		private var _chatText: String;
		
		//聊天目标id
		private var _targetPlayerId: long;
		
		//返回的其余数据
		private var _extraResInfo: ExtraResInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_playerId);
			//玩家名字
			writeString(_name);
			//聊天类型
			writeByte(_type);
			//地域标示（前后端枚举）
			writeByte(_playerarea);
			//聊天内容
			writeString(_chatText);
			//聊天目标id
			writeLong(_targetPlayerId);
			//返回的其余数据
			writeBean(_extraResInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_playerId = readLong();
			//玩家名字
			_name = readString();
			//聊天类型
			_type = readByte();
			//地域标示（前后端枚举）
			_playerarea = readByte();
			//聊天内容
			_chatText = readString();
			//聊天目标id
			_targetPlayerId = readLong();
			//返回的其余数据
			_extraResInfo = readBean(ExtraResInfo) as ExtraResInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112101;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 聊天类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 聊天类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 地域标示（前后端枚举）
		 * @return 
		 */
		public function get playerarea(): int{
			return _playerarea;
		}
		
		/**
		 * set 地域标示（前后端枚举）
		 */
		public function set playerarea(value: int): void{
			this._playerarea = value;
		}
		
		/**
		 * get 聊天内容
		 * @return 
		 */
		public function get chatText(): String{
			return _chatText;
		}
		
		/**
		 * set 聊天内容
		 */
		public function set chatText(value: String): void{
			this._chatText = value;
		}
		
		/**
		 * get 聊天目标id
		 * @return 
		 */
		public function get targetPlayerId(): long{
			return _targetPlayerId;
		}
		
		/**
		 * set 聊天目标id
		 */
		public function set targetPlayerId(value: long): void{
			this._targetPlayerId = value;
		}
		
		/**
		 * get 返回的其余数据
		 * @return 
		 */
		public function get extraResInfo(): ExtraResInfo{
			return _extraResInfo;
		}
		
		/**
		 * set 返回的其余数据
		 */
		public function set extraResInfo(value: ExtraResInfo): void{
			this._extraResInfo = value;
		}
		
	}
}