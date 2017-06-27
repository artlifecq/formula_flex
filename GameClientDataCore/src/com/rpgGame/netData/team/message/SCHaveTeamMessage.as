package com.rpgGame.netData.team.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 你已经在退伍里,弹出面板提示
	 */
	public class SCHaveTeamMessage extends Message {
	
		//玩家Id
		private var _playerId: long;
		
		//退队 原因
		private var _type: int;
		
		//提示内容
		private var _content: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//退队 原因
			writeInt(_type);
			//提示内容
			writeString(_content);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//退队 原因
			_type = readInt();
			//提示内容
			_content = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109218;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 退队 原因
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 退队 原因
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 提示内容
		 * @return 
		 */
		public function get content(): String{
			return _content;
		}
		
		/**
		 * set 提示内容
		 */
		public function set content(value: String): void{
			this._content = value;
		}
		
	}
}