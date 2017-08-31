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
	 * 更新玩家的排行榜称号
	 */
	public class SCUpdateTopLeaderTitleMessage extends Message {
	
		//玩家id
		private var _playerId: long;
		
		//称号列表
		private var _topLeaderTypes: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家id
			writeLong(_playerId);
			//称号列表
			writeShort(_topLeaderTypes.length);
			for (i = 0; i < _topLeaderTypes.length; i++) {
				writeInt(_topLeaderTypes[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家id
			_playerId = readLong();
			//称号列表
			var topLeaderTypes_length : int = readShort();
			for (i = 0; i < topLeaderTypes_length; i++) {
				_topLeaderTypes[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141110;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 称号列表
		 * @return 
		 */
		public function get topLeaderTypes(): Vector.<int>{
			return _topLeaderTypes;
		}
		
		/**
		 * set 称号列表
		 */
		public function set topLeaderTypes(value: Vector.<int>): void{
			this._topLeaderTypes = value;
		}
		
	}
}