package com.rpgGame.netData.shop.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求拍卖数据
	 */
	public class ReqAuctionItemMessage extends Message {
	
		//0全部1原服2跨服
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0全部1原服2跨服
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0全部1原服2跨服
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 149208;
		}
		
		/**
		 * get 0全部1原服2跨服
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 0全部1原服2跨服
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}