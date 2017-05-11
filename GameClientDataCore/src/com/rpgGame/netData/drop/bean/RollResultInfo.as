package com.rpgGame.netData.drop.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家roll点结果
	 */
	public class RollResultInfo extends Bean {
	
		//玩家名字
		private var _playerName: String;
		
		//投掷点数
		private var _throwPoint: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家名字
			writeString(_playerName);
			//投掷点数
			writeByte(_throwPoint);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家名字
			_playerName = readString();
			//投掷点数
			_throwPoint = readByte();
			return true;
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
		 * get 投掷点数
		 * @return 
		 */
		public function get throwPoint(): int{
			return _throwPoint;
		}
		
		/**
		 * set 投掷点数
		 */
		public function set throwPoint(value: int): void{
			this._throwPoint = value;
		}
		
	}
}