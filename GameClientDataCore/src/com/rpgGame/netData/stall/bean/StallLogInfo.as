package com.rpgGame.netData.stall.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 摊位单个交易日志
	 */
	public class StallLogInfo extends Bean {
	
		//交易者ID
		private var _playerId: long;
		
		//交易者名字
		private var _name: String;
		
		//交易类型，0出售，1购买
		private var _type: int;
		
		//交易时间（秒）
		private var _time: int;
		
		//金币价格
		private var _money: int;
		
		//元宝价格
		private var _gold: int;
		
		//获得经验
		private var _exp: int;
		
		//交易的道具信息
		private var _iteminfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//交易者ID
			writeLong(_playerId);
			//交易者名字
			writeString(_name);
			//交易类型，0出售，1购买
			writeByte(_type);
			//交易时间（秒）
			writeInt(_time);
			//金币价格
			writeInt(_money);
			//元宝价格
			writeInt(_gold);
			//获得经验
			writeInt(_exp);
			//交易的道具信息
			writeBean(_iteminfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//交易者ID
			_playerId = readLong();
			//交易者名字
			_name = readString();
			//交易类型，0出售，1购买
			_type = readByte();
			//交易时间（秒）
			_time = readInt();
			//金币价格
			_money = readInt();
			//元宝价格
			_gold = readInt();
			//获得经验
			_exp = readInt();
			//交易的道具信息
			_iteminfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get 交易者ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 交易者ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 交易者名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 交易者名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 交易类型，0出售，1购买
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 交易类型，0出售，1购买
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 交易时间（秒）
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 交易时间（秒）
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 金币价格
		 * @return 
		 */
		public function get money(): int{
			return _money;
		}
		
		/**
		 * set 金币价格
		 */
		public function set money(value: int): void{
			this._money = value;
		}
		
		/**
		 * get 元宝价格
		 * @return 
		 */
		public function get gold(): int{
			return _gold;
		}
		
		/**
		 * set 元宝价格
		 */
		public function set gold(value: int): void{
			this._gold = value;
		}
		
		/**
		 * get 获得经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 获得经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 交易的道具信息
		 * @return 
		 */
		public function get iteminfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _iteminfo;
		}
		
		/**
		 * set 交易的道具信息
		 */
		public function set iteminfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._iteminfo = value;
		}
		
	}
}