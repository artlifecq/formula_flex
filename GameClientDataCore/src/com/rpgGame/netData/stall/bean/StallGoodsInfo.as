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
	 * 摊位物品信息
	 */
	public class StallGoodsInfo extends Bean {
	
		//所属摊主ID
		private var _playerId: long;
		
		//摊主名
		private var _playerName: String;
		
		//商品索引
		private var _goodsIndex: int;
		
		//金币价格
		private var _money: int;
		
		//元宝价格
		private var _gold: int;
		
		//上架时间
		private var _time: long;
		
		//出售的道具信息
		private var _iteminfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//所属摊主ID
			writeLong(_playerId);
			//摊主名
			writeString(_playerName);
			//商品索引
			writeInt(_goodsIndex);
			//金币价格
			writeInt(_money);
			//元宝价格
			writeInt(_gold);
			//上架时间
			writeLong(_time);
			//出售的道具信息
			writeBean(_iteminfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//所属摊主ID
			_playerId = readLong();
			//摊主名
			_playerName = readString();
			//商品索引
			_goodsIndex = readInt();
			//金币价格
			_money = readInt();
			//元宝价格
			_gold = readInt();
			//上架时间
			_time = readLong();
			//出售的道具信息
			_iteminfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get 所属摊主ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 所属摊主ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 摊主名
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 摊主名
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 商品索引
		 * @return 
		 */
		public function get goodsIndex(): int{
			return _goodsIndex;
		}
		
		/**
		 * set 商品索引
		 */
		public function set goodsIndex(value: int): void{
			this._goodsIndex = value;
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
		 * get 上架时间
		 * @return 
		 */
		public function get time(): long{
			return _time;
		}
		
		/**
		 * set 上架时间
		 */
		public function set time(value: long): void{
			this._time = value;
		}
		
		/**
		 * get 出售的道具信息
		 * @return 
		 */
		public function get iteminfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _iteminfo;
		}
		
		/**
		 * set 出售的道具信息
		 */
		public function set iteminfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._iteminfo = value;
		}
		
	}
}