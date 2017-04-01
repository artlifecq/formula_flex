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
	 * 购买商品
	 */
	public class ReqStallBuyMessage extends Message {
	
		//摆摊的玩家ID
		private var _playerId: long;
		
		//商品索引(验证用)
		private var _goodsIndex: int;
		
		//商品金币价格
		private var _money: int;
		
		//商品元宝价格
		private var _gold: int;
		
		//商品数量(验证用)
		private var _num: int;
		
		//商品道具唯一ID，-1元宝，-2金币
		private var _goodsId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//摆摊的玩家ID
			writeLong(_playerId);
			//商品索引(验证用)
			writeInt(_goodsIndex);
			//商品金币价格
			writeInt(_money);
			//商品元宝价格
			writeInt(_gold);
			//商品数量(验证用)
			writeInt(_num);
			//商品道具唯一ID，-1元宝，-2金币
			writeLong(_goodsId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//摆摊的玩家ID
			_playerId = readLong();
			//商品索引(验证用)
			_goodsIndex = readInt();
			//商品金币价格
			_money = readInt();
			//商品元宝价格
			_gold = readInt();
			//商品数量(验证用)
			_num = readInt();
			//商品道具唯一ID，-1元宝，-2金币
			_goodsId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142206;
		}
		
		/**
		 * get 摆摊的玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 摆摊的玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 商品索引(验证用)
		 * @return 
		 */
		public function get goodsIndex(): int{
			return _goodsIndex;
		}
		
		/**
		 * set 商品索引(验证用)
		 */
		public function set goodsIndex(value: int): void{
			this._goodsIndex = value;
		}
		
		/**
		 * get 商品金币价格
		 * @return 
		 */
		public function get money(): int{
			return _money;
		}
		
		/**
		 * set 商品金币价格
		 */
		public function set money(value: int): void{
			this._money = value;
		}
		
		/**
		 * get 商品元宝价格
		 * @return 
		 */
		public function get gold(): int{
			return _gold;
		}
		
		/**
		 * set 商品元宝价格
		 */
		public function set gold(value: int): void{
			this._gold = value;
		}
		
		/**
		 * get 商品数量(验证用)
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 商品数量(验证用)
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get 商品道具唯一ID，-1元宝，-2金币
		 * @return 
		 */
		public function get goodsId(): long{
			return _goodsId;
		}
		
		/**
		 * set 商品道具唯一ID，-1元宝，-2金币
		 */
		public function set goodsId(value: long): void{
			this._goodsId = value;
		}
		
	}
}