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
	 * 掉落道具归属变更
	 */
	public class SCChangeMasterMessage extends Message {
	
		//唯一ID
		private var _uniqueId: long;
		
		//所有者ID 无主为0
		private var _ownerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeLong(_uniqueId);
			//所有者ID 无主为0
			writeLong(_ownerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_uniqueId = readLong();
			//所有者ID 无主为0
			_ownerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 210104;
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
		 * get 所有者ID 无主为0
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set 所有者ID 无主为0
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
	}
}