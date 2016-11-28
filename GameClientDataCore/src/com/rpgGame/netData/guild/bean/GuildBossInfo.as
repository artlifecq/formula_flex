package com.rpgGame.netData.guild.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会boss信息
	 */
	public class GuildBossInfo extends Bean {
	
		//地图
		private var _mapId: int;
		
		//自己是否挑战 0 未挑战  1  已经挑战
		private var _isChallenge: int;
		
		//已通关次数
		private var _finishTimes: int;
		
		//是否已领奖
		private var _isAward: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//地图
			writeInt(_mapId);
			//自己是否挑战 0 未挑战  1  已经挑战
			writeByte(_isChallenge);
			//已通关次数
			writeInt(_finishTimes);
			//是否已领奖
			writeByte(_isAward);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//地图
			_mapId = readInt();
			//自己是否挑战 0 未挑战  1  已经挑战
			_isChallenge = readByte();
			//已通关次数
			_finishTimes = readInt();
			//是否已领奖
			_isAward = readByte();
			return true;
		}
		
		/**
		 * get 地图
		 * @return 
		 */
		public function get mapId(): int{
			return _mapId;
		}
		
		/**
		 * set 地图
		 */
		public function set mapId(value: int): void{
			this._mapId = value;
		}
		
		/**
		 * get 自己是否挑战 0 未挑战  1  已经挑战
		 * @return 
		 */
		public function get isChallenge(): int{
			return _isChallenge;
		}
		
		/**
		 * set 自己是否挑战 0 未挑战  1  已经挑战
		 */
		public function set isChallenge(value: int): void{
			this._isChallenge = value;
		}
		
		/**
		 * get 已通关次数
		 * @return 
		 */
		public function get finishTimes(): int{
			return _finishTimes;
		}
		
		/**
		 * set 已通关次数
		 */
		public function set finishTimes(value: int): void{
			this._finishTimes = value;
		}
		
		/**
		 * get 是否已领奖
		 * @return 
		 */
		public function get isAward(): int{
			return _isAward;
		}
		
		/**
		 * set 是否已领奖
		 */
		public function set isAward(value: int): void{
			this._isAward = value;
		}
		
	}
}