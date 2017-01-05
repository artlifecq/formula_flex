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
	 * 释放技能请求
	 */
	public class CSPerformTargetSkillMessage extends Message {
	
		//技能ID
		private var _skillId: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//攻击目标
		private var _targetId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//技能ID
			writeInt(_skillId);
			//攻击朝向
			writeShort(_fightDirection);
			//攻击目标
			writeLong(_targetId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//技能ID
			_skillId = readInt();
			//攻击朝向
			_fightDirection = readShort();
			//攻击目标
			_targetId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102209;
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
		 * get 攻击朝向
		 * @return 
		 */
		public function get fightDirection(): int{
			return _fightDirection;
		}
		
		/**
		 * set 攻击朝向
		 */
		public function set fightDirection(value: int): void{
			this._fightDirection = value;
		}
		
		/**
		 * get 攻击目标
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 攻击目标
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
	}
}