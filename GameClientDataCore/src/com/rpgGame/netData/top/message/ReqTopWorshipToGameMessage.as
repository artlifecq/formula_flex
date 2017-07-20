package com.rpgGame.netData.top.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求崇拜
	 */
	public class ReqTopWorshipToGameMessage extends Message {
	
		//玩家Id
		private var _playerid: long;
		
		//1 金币膜拜   2 元宝膜拜
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerid);
			//1 金币膜拜   2 元宝膜拜
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerid = readLong();
			//1 金币膜拜   2 元宝膜拜
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141204;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
		/**
		 * get 1 金币膜拜   2 元宝膜拜
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 金币膜拜   2 元宝膜拜
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}