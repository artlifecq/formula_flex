package com.rpgGame.netData.monster.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物说话
	 */
	public class ResMonsterSayMessage extends Message {
	
		//怪物id
		private var _monsterId: long;
		
		//说话内容索引
		private var _sayId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物id
			writeLong(_monsterId);
			//说话内容索引
			writeInt(_sayId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物id
			_monsterId = readLong();
			//说话内容索引
			_sayId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114110;
		}
		
		/**
		 * get 怪物id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 说话内容索引
		 * @return 
		 */
		public function get sayId(): int{
			return _sayId;
		}
		
		/**
		 * set 说话内容索引
		 */
		public function set sayId(value: int): void{
			this._sayId = value;
		}
		
	}
}