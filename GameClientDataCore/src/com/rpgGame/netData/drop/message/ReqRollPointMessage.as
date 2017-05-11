package com.rpgGame.netData.drop.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求Roll点消息
	 */
	public class ReqRollPointMessage extends Message {
	
		//唯一ID
		private var _uniqueId: long;
		
		//0需求 1贪婪 2弃权
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeLong(_uniqueId);
			//0需求 1贪婪 2弃权
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_uniqueId = readLong();
			//0需求 1贪婪 2弃权
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 210201;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get uniqueId(): long{
			return _uniqueId;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uniqueId(value: long): void{
			this._uniqueId = value;
		}
		
		/**
		 * get 0需求 1贪婪 2弃权
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 0需求 1贪婪 2弃权
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}