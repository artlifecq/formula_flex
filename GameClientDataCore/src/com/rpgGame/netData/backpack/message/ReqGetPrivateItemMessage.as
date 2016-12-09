package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 提取私有物品
	 */
	public class ReqGetPrivateItemMessage extends Message {
	
		//类型
		private var _type: int;
		
		//私有物品特殊唯一Id
		private var _itemUId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型
			writeInt(_type);
			//私有物品特殊唯一Id
			writeInt(_itemUId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型
			_type = readInt();
			//私有物品特殊唯一Id
			_itemUId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108217;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 私有物品特殊唯一Id
		 * @return 
		 */
		public function get itemUId(): int{
			return _itemUId;
		}
		
		/**
		 * set 私有物品特殊唯一Id
		 */
		public function set itemUId(value: int): void{
			this._itemUId = value;
		}
		
	}
}