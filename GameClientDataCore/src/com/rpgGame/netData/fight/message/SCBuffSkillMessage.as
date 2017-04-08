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
	 * 模拟弹道技能
	 */
	public class SCBuffSkillMessage extends Message {
	
		//施法者ID
		private var _playerId: long;
		
		//技能ID
		private var _skillId: int;
		
		//目标对象列表
		private var _targets: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//施法者ID
			writeLong(_playerId);
			//技能ID
			writeInt(_skillId);
			//目标对象列表
			writeShort(_targets.length);
			for (i = 0; i < _targets.length; i++) {
				writeLong(_targets[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//施法者ID
			_playerId = readLong();
			//技能ID
			_skillId = readInt();
			//目标对象列表
			var targets_length : int = readShort();
			for (i = 0; i < targets_length; i++) {
				_targets[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102116;
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
		 * get 目标对象列表
		 * @return 
		 */
		public function get targets(): Vector.<long>{
			return _targets;
		}
		
		/**
		 * set 目标对象列表
		 */
		public function set targets(value: Vector.<long>): void{
			this._targets = value;
		}
		
	}
}