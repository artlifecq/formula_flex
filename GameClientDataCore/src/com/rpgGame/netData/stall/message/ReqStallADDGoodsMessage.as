package com.rpgGame.netData.stall.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 商品上架
	 */
	public class ReqStallADDGoodsMessage extends Message {
	
		//道具唯一ID，-1元宝，-2金币
		private var _goodsId: long;
		
		//金币价格
		private var _money: int;
		
		//元宝价格
		private var _gold: int;
		
		//上架的道具数量（如果是元宝，金币那就是元宝或金币的数量）
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			writeLong(_goodsId);
			//金币价格
			writeInt(_money);
			//元宝价格
			writeInt(_gold);
			//上架的道具数量（如果是元宝，金币那就是元宝或金币的数量）
			writeInt(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			_goodsId = readLong();
			//金币价格
			_money = readInt();
			//元宝价格
			_gold = readInt();
			//上架的道具数量（如果是元宝，金币那就是元宝或金币的数量）
			_num = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142203;
		}
		
		/**
		 * get 道具唯一ID，-1元宝，-2金币
		 * @return 
		 */
		public function get goodsId(): long{
			return _goodsId;
		}
		
		/**
		 * set 道具唯一ID，-1元宝，-2金币
		 */
		public function set goodsId(value: long): void{
			this._goodsId = value;
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
		 * get 上架的道具数量（如果是元宝，金币那就是元宝或金币的数量）
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 上架的道具数量（如果是元宝，金币那就是元宝或金币的数量）
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}