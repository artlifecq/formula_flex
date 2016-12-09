package com.rpgGame.netData.treasurehunt.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 寻宝单个道具记录信息
	 */
	public class TreasureHuntInfo extends Bean {
	
		//玩家名称
		private var _name: String;
		
		//获得道具时间(秒)
		private var _time: int;
		
		//道具模版ID
		private var _itemId: int;
		
		//获得道具数量
		private var _itemNum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家名称
			writeString(_name);
			//获得道具时间(秒)
			writeInt(_time);
			//道具模版ID
			writeInt(_itemId);
			//获得道具数量
			writeInt(_itemNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家名称
			_name = readString();
			//获得道具时间(秒)
			_time = readInt();
			//道具模版ID
			_itemId = readInt();
			//获得道具数量
			_itemNum = readInt();
			return true;
		}
		
		/**
		 * get 玩家名称
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名称
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 获得道具时间(秒)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 获得道具时间(秒)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 道具模版ID
		 * @return 
		 */
		public function get itemId(): int{
			return _itemId;
		}
		
		/**
		 * set 道具模版ID
		 */
		public function set itemId(value: int): void{
			this._itemId = value;
		}
		
		/**
		 * get 获得道具数量
		 * @return 
		 */
		public function get itemNum(): int{
			return _itemNum;
		}
		
		/**
		 * set 获得道具数量
		 */
		public function set itemNum(value: int): void{
			this._itemNum = value;
		}
		
	}
}