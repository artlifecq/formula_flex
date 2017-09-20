package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 角色升级
	 */
	public class SCPlayerLevelUpMessage extends Message {
	
		//角色ID
		private var _playerId: int;
		
		//新等级
		private var _newLevel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色ID
			writeShort(_playerId);
			//新等级
			writeInt(_newLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色ID
			_playerId = readShort();
			//新等级
			_newLevel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103126;
		}
		
		/**
		 * get 角色ID
		 * @return 
		 */
		public function get playerId(): int{
			return _playerId;
		}
		
		/**
		 * set 角色ID
		 */
		public function set playerId(value: int): void{
			this._playerId = value;
		}
		
		/**
		 * get 新等级
		 * @return 
		 */
		public function get newLevel(): int{
			return _newLevel;
		}
		
		/**
		 * set 新等级
		 */
		public function set newLevel(value: int): void{
			this._newLevel = value;
		}
		
	}
}