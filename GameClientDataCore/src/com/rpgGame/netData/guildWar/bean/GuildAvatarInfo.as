package com.rpgGame.netData.guildWar.bean{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会avatar信息
	 */
	public class GuildAvatarInfo extends Bean {
	
		//职位类型
		private var _guildMemberType: int;
		
		//玩家名
		private var _playerName: String;
		
		//玩家等级
		private var _playerLevel: int;
		
		//外观信息
		private var _playerAvatarInfo: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//职位类型
			writeInt(_guildMemberType);
			//玩家名
			writeString(_playerName);
			//玩家等级
			writeInt(_playerLevel);
			//外观信息
			writeBean(_playerAvatarInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//职位类型
			_guildMemberType = readInt();
			//玩家名
			_playerName = readString();
			//玩家等级
			_playerLevel = readInt();
			//外观信息
			_playerAvatarInfo = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			return true;
		}
		
		/**
		 * get 职位类型
		 * @return 
		 */
		public function get guildMemberType(): int{
			return _guildMemberType;
		}
		
		/**
		 * set 职位类型
		 */
		public function set guildMemberType(value: int): void{
			this._guildMemberType = value;
		}
		
		/**
		 * get 玩家名
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 玩家等级
		 * @return 
		 */
		public function get playerLevel(): int{
			return _playerLevel;
		}
		
		/**
		 * set 玩家等级
		 */
		public function set playerLevel(value: int): void{
			this._playerLevel = value;
		}
		
		/**
		 * get 外观信息
		 * @return 
		 */
		public function get playerAvatarInfo(): com.rpgGame.netData.player.bean.PlayerAppearanceInfo{
			return _playerAvatarInfo;
		}
		
		/**
		 * set 外观信息
		 */
		public function set playerAvatarInfo(value: com.rpgGame.netData.player.bean.PlayerAppearanceInfo): void{
			this._playerAvatarInfo = value;
		}
		
	}
}