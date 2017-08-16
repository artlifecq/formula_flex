package com.rpgGame.netData.fight.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 取消技能
	 */
	public class SCCancelSkillMessage extends Message {
	
		//施法者ID
		private var _playerId: long;
		
		//技能ID
		private var _skillId: int;
		
		//是否是自己取消(0否，1是)
		private var _selfCancel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//施法者ID
			writeLong(_playerId);
			//技能ID
			writeInt(_skillId);
			//是否是自己取消(0否，1是)
			writeByte(_selfCancel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//施法者ID
			_playerId = readLong();
			//技能ID
			_skillId = readInt();
			//是否是自己取消(0否，1是)
			_selfCancel = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102115;
		}
		
		/**
		 * get 施法者ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 施法者ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 技能ID
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 技能ID
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
		/**
		 * get 是否是自己取消(0否，1是)
		 * @return 
		 */
		public function get selfCancel(): int{
			return _selfCancel;
		}
		
		/**
		 * set 是否是自己取消(0否，1是)
		 */
		public function set selfCancel(value: int): void{
			this._selfCancel = value;
		}
		
	}
}