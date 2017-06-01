package com.rpgGame.netData.zhengba.bean{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 基本信息
	 */
	public class PlayerBriefInfo extends Bean {
	
		//玩家外观
		private var _playerAppearanceInfo: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		//玩家名字
		private var _playerName: String;
		
		//玩家排名
		private var _rank: int;
		
		//战斗力
		private var _fightPower: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家外观
			writeBean(_playerAppearanceInfo);
			//玩家名字
			writeString(_playerName);
			//玩家排名
			writeInt(_rank);
			//战斗力
			writeInt(_fightPower);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家外观
			_playerAppearanceInfo = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			//玩家名字
			_playerName = readString();
			//玩家排名
			_rank = readInt();
			//战斗力
			_fightPower = readInt();
			return true;
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
		 * get 玩家排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 玩家排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
	}
}