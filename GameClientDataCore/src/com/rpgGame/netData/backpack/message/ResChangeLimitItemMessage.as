package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 道具数量限制改变
	 */
	public class ResChangeLimitItemMessage extends Message {
	
		//道具配置Id
		private var _itemModelId: int;
		
		//限制类型1:天,2:周,3:月,4:年
		private var _limitType: int;
		
		//限制数量
		private var _limitNum: int;
		
		//限制剩余数量
		private var _limitValue: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具配置Id
			writeInt(_itemModelId);
			//限制类型1:天,2:周,3:月,4:年
			writeInt(_limitType);
			//限制数量
			writeInt(_limitNum);
			//限制剩余数量
			writeInt(_limitValue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具配置Id
			_itemModelId = readInt();
			//限制类型1:天,2:周,3:月,4:年
			_limitType = readInt();
			//限制数量
			_limitNum = readInt();
			//限制剩余数量
			_limitValue = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108116;
		}
		
		/**
		 * get 道具配置Id
		 * @return 
		 */
		public function get itemModelId(): int{
			return _itemModelId;
		}
		
		/**
		 * set 道具配置Id
		 */
		public function set itemModelId(value: int): void{
			this._itemModelId = value;
		}
		
		/**
		 * get 限制类型1:天,2:周,3:月,4:年
		 * @return 
		 */
		public function get limitType(): int{
			return _limitType;
		}
		
		/**
		 * set 限制类型1:天,2:周,3:月,4:年
		 */
		public function set limitType(value: int): void{
			this._limitType = value;
		}
		
		/**
		 * get 限制数量
		 * @return 
		 */
		public function get limitNum(): int{
			return _limitNum;
		}
		
		/**
		 * set 限制数量
		 */
		public function set limitNum(value: int): void{
			this._limitNum = value;
		}
		
		/**
		 * get 限制剩余数量
		 * @return 
		 */
		public function get limitValue(): int{
			return _limitValue;
		}
		
		/**
		 * set 限制剩余数量
		 */
		public function set limitValue(value: int): void{
			this._limitValue = value;
		}
		
	}
}