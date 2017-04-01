package com.rpgGame.netData.zone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武神殿寻路信息
	 */
	public class ResBossGuideInfoMessage extends Message {
	
		//怪物唯一ID
		private var _monsterId: long;
		
		//怪物模型ID
		private var _monsterModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物唯一ID
			writeLong(_monsterId);
			//怪物模型ID
			writeInt(_monsterModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物唯一ID
			_monsterId = readLong();
			//怪物模型ID
			_monsterModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155134;
		}
		
		/**
		 * get 怪物唯一ID
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物唯一ID
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 怪物模型ID
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set 怪物模型ID
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
	}
}