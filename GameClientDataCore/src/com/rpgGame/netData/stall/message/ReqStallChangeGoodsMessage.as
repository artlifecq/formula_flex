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
	 * 商品调整
	 */
	public class ReqStallChangeGoodsMessage extends Message {
	
		//道具唯一ID，-1元宝，-2金币
		private var _goodsId: long;
		
		//原始金币价格
		private var _oldMoney: int;
		
		//原始元宝价格
		private var _oldGold: int;
		
		//原始数量（只是用来检测，后端另有验证）
		private var _oldNum: int;
		
		//新的金币价格
		private var _newMoney: int;
		
		//新的元宝价格
		private var _newGold: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			writeLong(_goodsId);
			//原始金币价格
			writeInt(_oldMoney);
			//原始元宝价格
			writeInt(_oldGold);
			//原始数量（只是用来检测，后端另有验证）
			writeInt(_oldNum);
			//新的金币价格
			writeInt(_newMoney);
			//新的元宝价格
			writeInt(_newGold);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具唯一ID，-1元宝，-2金币
			_goodsId = readLong();
			//原始金币价格
			_oldMoney = readInt();
			//原始元宝价格
			_oldGold = readInt();
			//原始数量（只是用来检测，后端另有验证）
			_oldNum = readInt();
			//新的金币价格
			_newMoney = readInt();
			//新的元宝价格
			_newGold = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142205;
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
		 * get 原始金币价格
		 * @return 
		 */
		public function get oldMoney(): int{
			return _oldMoney;
		}
		
		/**
		 * set 原始金币价格
		 */
		public function set oldMoney(value: int): void{
			this._oldMoney = value;
		}
		
		/**
		 * get 原始元宝价格
		 * @return 
		 */
		public function get oldGold(): int{
			return _oldGold;
		}
		
		/**
		 * set 原始元宝价格
		 */
		public function set oldGold(value: int): void{
			this._oldGold = value;
		}
		
		/**
		 * get 原始数量（只是用来检测，后端另有验证）
		 * @return 
		 */
		public function get oldNum(): int{
			return _oldNum;
		}
		
		/**
		 * set 原始数量（只是用来检测，后端另有验证）
		 */
		public function set oldNum(value: int): void{
			this._oldNum = value;
		}
		
		/**
		 * get 新的金币价格
		 * @return 
		 */
		public function get newMoney(): int{
			return _newMoney;
		}
		
		/**
		 * set 新的金币价格
		 */
		public function set newMoney(value: int): void{
			this._newMoney = value;
		}
		
		/**
		 * get 新的元宝价格
		 * @return 
		 */
		public function get newGold(): int{
			return _newGold;
		}
		
		/**
		 * set 新的元宝价格
		 */
		public function set newGold(value: int): void{
			this._newGold = value;
		}
		
	}
}