package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 道具使用后跨服BUFF效果
	 */
	public class ReqItemUseAddBuffGameToFightMessage extends Message {
	
		//道具ID
		private var _itemModelid: int;
		
		//道具数量
		private var _num: int;
		
		//buff列表
		private var _buffString: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具ID
			writeInt(_itemModelid);
			//道具数量
			writeInt(_num);
			//buff列表
			writeString(_buffString);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具ID
			_itemModelid = readInt();
			//道具数量
			_num = readInt();
			//buff列表
			_buffString = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251272;
		}
		
		/**
		 * get 道具ID
		 * @return 
		 */
		public function get itemModelid(): int{
			return _itemModelid;
		}
		
		/**
		 * set 道具ID
		 */
		public function set itemModelid(value: int): void{
			this._itemModelid = value;
		}
		
		/**
		 * get 道具数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 道具数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
		/**
		 * get buff列表
		 * @return 
		 */
		public function get buffString(): String{
			return _buffString;
		}
		
		/**
		 * set buff列表
		 */
		public function set buffString(value: String): void{
			this._buffString = value;
		}
		
	}
}