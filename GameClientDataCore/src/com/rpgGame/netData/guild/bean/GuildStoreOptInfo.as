package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会记录
	 */
	public class GuildStoreOptInfo extends Bean {
	
		//玩家
		private var _playerId: long;
		
		//玩家名字
		private var _name: String;
		
		//物品Id
		private var _itemModelId: int;
		
		//物品数量
		private var _itemNum: int;
		
		//操作类型 0捐献   1取出
		private var _type: int;
		
		//操作时间
		private var _optTime: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家
			writeLong(_playerId);
			//玩家名字
			writeString(_name);
			//物品Id
			writeInt(_itemModelId);
			//物品数量
			writeInt(_itemNum);
			//操作类型 0捐献   1取出
			writeInt(_type);
			//操作时间
			writeInt(_optTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家
			_playerId = readLong();
			//玩家名字
			_name = readString();
			//物品Id
			_itemModelId = readInt();
			//物品数量
			_itemNum = readInt();
			//操作类型 0捐献   1取出
			_type = readInt();
			//操作时间
			_optTime = readInt();
			return true;
		}
		
		/**
		 * get 玩家
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 物品Id
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 物品Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 物品数量
		 * @return 
		 */
		public function get itemNum(): int{
			return _itemNum;
		}
		
		/**
		 * set 物品数量
		 */
		public function set itemNum(value: int): void{
			this._itemNum = value;
		}
		
		/**
		 * get 操作类型 0捐献   1取出
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 操作类型 0捐献   1取出
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 操作时间
		 * @return 
		 */
		public function get optTime(): int{
			return _optTime;
		}
		
		/**
		 * set 操作时间
		 */
		public function set optTime(value: int): void{
			this._optTime = value;
		}
		
	}
}