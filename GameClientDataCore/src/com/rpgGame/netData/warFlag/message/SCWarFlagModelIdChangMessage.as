package com.rpgGame.netData.warFlag.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送当前战旗ID给地图周围的玩家(改变外观)消息
	 */
	public class SCWarFlagModelIdChangMessage extends Message {
	
		//玩家ID
		private var _playerId: long;
		
		//战旗ID
		private var _warFlagModelid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_playerId);
			//战旗ID
			writeShort(_warFlagModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_playerId = readLong();
			//战旗ID
			_warFlagModelid = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 229107;
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
		 * get 战旗ID
		 * @return 
		 */
		public function get warFlagModelid(): int{
			return _warFlagModelid;
		}
		
		/**
		 * set 战旗ID
		 */
		public function set warFlagModelid(value: int): void{
			this._warFlagModelid = value;
		}
		
	}
}