package com.rpgGame.netData.dianfeng.bean{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 巅峰排名数据
	 */
	public class DianFengRankInfo extends Bean {
	
		//玩家id
		private var _playerId: long;
		
		//排名
		private var _rank: int;
		
		//玩家外观
		private var _playerAppearanceInfo: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		//段位等级
		private var _level: int;
		
		//当前积分
		private var _currentIntegral: int;
		
		//vip等级
		private var _vipLevel: int;
		
		//玩家名字
		private var _playerName: String;
		
		//玩家战斗力
		private var _fightPower: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerId);
			//排名
			writeInt(_rank);
			//玩家外观
			writeBean(_playerAppearanceInfo);
			//段位等级
			writeInt(_level);
			//当前积分
			writeInt(_currentIntegral);
			//vip等级
			writeInt(_vipLevel);
			//玩家名字
			writeString(_playerName);
			//玩家战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readLong();
			//排名
			_rank = readInt();
			//玩家外观
			_playerAppearanceInfo = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			//段位等级
			_level = readInt();
			//当前积分
			_currentIntegral = readInt();
			//vip等级
			_vipLevel = readInt();
			//玩家名字
			_playerName = readString();
			//玩家战斗力
			_fightPower = readInt();
			return true;
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
		 * get 排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 玩家外观
		 * @return 
		 */
		public function get playerAppearanceInfo(): com.rpgGame.netData.player.bean.PlayerAppearanceInfo{
			return _playerAppearanceInfo;
		}
		
		/**
		 * set 玩家外观
		 */
		public function set playerAppearanceInfo(value: com.rpgGame.netData.player.bean.PlayerAppearanceInfo): void{
			this._playerAppearanceInfo = value;
		}
		
		/**
		 * get 段位等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 段位等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 当前积分
		 * @return 
		 */
		public function get currentIntegral(): int{
			return _currentIntegral;
		}
		
		/**
		 * set 当前积分
		 */
		public function set currentIntegral(value: int): void{
			this._currentIntegral = value;
		}
		
		/**
		 * get vip等级
		 * @return 
		 */
		public function get vipLevel(): int{
			return _vipLevel;
		}
		
		/**
		 * set vip等级
		 */
		public function set vipLevel(value: int): void{
			this._vipLevel = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 玩家战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 玩家战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
	}
}