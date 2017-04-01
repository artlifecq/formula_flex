package com.rpgGame.netData.guild.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会捐献近期列表
	 */
	public class GuildDevoteInfo extends Bean {
	
		//道具模版ID
		private var _itemModelId: int;
		
		//数量
		private var _num: int;
		
		//捐献玩家名字
		private var _playerName: String;
		
		//时间
		private var _time: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具模版ID
			writeInt(_itemModelId);
			//数量
			writeInt(_num);
			//捐献玩家名字
			writeString(_playerName);
			//时间
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具模版ID
			_itemModelId = readInt();
			//数量
			_num = readInt();
			//捐献玩家名字
			_playerName = readString();
			//时间
			_time = readInt();
			return true;
		}
		
		/**
		 * get 道具模版ID
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 道具模版ID
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 捐献玩家名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 捐献玩家名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 时间
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 时间
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}