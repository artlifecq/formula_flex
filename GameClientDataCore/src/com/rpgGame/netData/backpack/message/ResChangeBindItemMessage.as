package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 道具绑定属性改变
	 */
	public class ResChangeBindItemMessage extends Message {
	
		//道具格子Id
		private var _itemGridId: int;
		
		//0:不绑定,1:绑定
		private var _isBind: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具格子Id
			writeInt(_itemGridId);
			//0:不绑定,1:绑定
			writeByte(_isBind);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具格子Id
			_itemGridId = readInt();
			//0:不绑定,1:绑定
			_isBind = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108115;
		}
		
		/**
		 * get 道具格子Id
		 * @return 
		 */
		public function get itemGridId(): int{
			return _itemGridId;
		}
		
		/**
		 * set 道具格子Id
		 */
		public function set itemGridId(value: int): void{
			this._itemGridId = value;
		}
		
		/**
		 * get 0:不绑定,1:绑定
		 * @return 
		 */
		public function get isBind(): int{
			return _isBind;
		}
		
		/**
		 * set 0:不绑定,1:绑定
		 */
		public function set isBind(value: int): void{
			this._isBind = value;
		}
		
	}
}