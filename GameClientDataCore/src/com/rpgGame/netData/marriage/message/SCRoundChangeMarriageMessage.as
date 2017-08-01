package com.rpgGame.netData.marriage.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 广播给周围玩家 ，某个玩家的婚姻变化
	 */
	public class SCRoundChangeMarriageMessage extends Message {
	
		//发生变化的玩家id
		private var _playerId: long;
		
		//婚姻对象的名字   null 没有
		private var _marriageName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//发生变化的玩家id
			writeLong(_playerId);
			//婚姻对象的名字   null 没有
			writeString(_marriageName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//发生变化的玩家id
			_playerId = readLong();
			//婚姻对象的名字   null 没有
			_marriageName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150122;
		}
		
		/**
		 * get 发生变化的玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 发生变化的玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 婚姻对象的名字   null 没有
		 * @return 
		 */
		public function get marriageName(): String{
			return _marriageName;
		}
		
		/**
		 * set 婚姻对象的名字   null 没有
		 */
		public function set marriageName(value: String): void{
			this._marriageName = value;
		}
		
	}
}