package com.rpgGame.netData.shop.message{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 购买成功消息
	 */
	public class ResBuyItemResultMessage extends Message {
	
		//销售Id
		private var _shopModelId: int;
		
		//花费类型
		private var _costType: int;
		
		//花费金额
		private var _costNumber: int;
		
		//物品
		private var _item: com.rpgGame.netData.backpack.bean.TempItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//销售Id
			writeInt(_shopModelId);
			//花费类型
			writeInt(_costType);
			//花费金额
			writeInt(_costNumber);
			//物品
			writeBean(_item);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//销售Id
			_shopModelId = readInt();
			//花费类型
			_costType = readInt();
			//花费金额
			_costNumber = readInt();
			//物品
			_item = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149105;
		}
		
		/**
		 * get 销售Id
		 * @return 
		 */
		public function get shopModelId(): int{
			return _shopModelId;
		}
		
		/**
		 * set 销售Id
		 */
		public function set shopModelId(value: int): void{
			this._shopModelId = value;
		}
		
		/**
		 * get 花费类型
		 * @return 
		 */
		public function get costType(): int{
			return _costType;
		}
		
		/**
		 * set 花费类型
		 */
		public function set costType(value: int): void{
			this._costType = value;
		}
		
		/**
		 * get 花费金额
		 * @return 
		 */
		public function get costNumber(): int{
			return _costNumber;
		}
		
		/**
		 * set 花费金额
		 */
		public function set costNumber(value: int): void{
			this._costNumber = value;
		}
		
		/**
		 * get 物品
		 * @return 
		 */
		public function get item(): com.rpgGame.netData.backpack.bean.TempItemInfo{
			return _item;
		}
		
		/**
		 * set 物品
		 */
		public function set item(value: com.rpgGame.netData.backpack.bean.TempItemInfo): void{
			this._item = value;
		}
		
	}
}