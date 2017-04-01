package com.rpgGame.netData.monster.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家对BOSS伤害信息
	 */
	public class BossDamageInfo extends Bean {
	
		//伤害值
		private var _damage: int;
		
		//玩家名字Name
		private var _playerName: String;
		
		//玩家id(奖励信息用，排行榜同步时为0)
		private var _playerId: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//伤害值
			writeInt(_damage);
			//玩家名字Name
			writeString(_playerName);
			//玩家id(奖励信息用，排行榜同步时为0)
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//伤害值
			_damage = readInt();
			//玩家名字Name
			_playerName = readString();
			//玩家id(奖励信息用，排行榜同步时为0)
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get 伤害值
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 伤害值
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
		/**
		 * get 玩家名字Name
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名字Name
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 玩家id(奖励信息用，排行榜同步时为0)
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id(奖励信息用，排行榜同步时为0)
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
	}
}