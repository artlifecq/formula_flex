package com.rpgGame.netData.pet.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 侍宠目标
	 */
	public class ResPetTargetMessage extends Message {
	
		//侍宠主玩家id
		private var _ownerId: long;
		
		//目标id
		private var _targetId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠主玩家id
			writeLong(_ownerId);
			//目标id
			writeLong(_targetId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠主玩家id
			_ownerId = readLong();
			//目标id
			_targetId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148102;
		}
		
		/**
		 * get 侍宠主玩家id
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set 侍宠主玩家id
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
		/**
		 * get 目标id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 目标id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
	}
}