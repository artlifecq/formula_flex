package com.rpgGame.netData.monster.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家对BOSS仇恨信息
	 */
	public class HateInfo extends Bean {
	
		//仇恨值
		private var _hate: int;
		
		//玩家名字Name
		private var _playerName: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//仇恨值
			writeInt(_hate);
			//玩家名字Name
			writeString(_playerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//仇恨值
			_hate = readInt();
			//玩家名字Name
			_playerName = readString();
			return true;
		}
		
		/**
		 * get 仇恨值
		 * @return 
		 */
		public function get hate(): int{
			return _hate;
		}
		
		/**
		 * set 仇恨值
		 */
		public function set hate(value: int): void{
			this._hate = value;
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
		
	}
}