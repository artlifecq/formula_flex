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
	 * 虚拟战斗对象攻击返回
	 */
	public class ResVirFightObjectAttackResultMessage extends Message {
	
		//攻击者id
		private var _attackId: long;
		
		//被攻击者id
		private var _targetId: long;
		
		//技能ID
		private var _skillMoldeId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击者id
			writeLong(_attackId);
			//被攻击者id
			writeLong(_targetId);
			//技能ID
			writeInt(_skillMoldeId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击者id
			_attackId = readLong();
			//被攻击者id
			_targetId = readLong();
			//技能ID
			_skillMoldeId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102113;
		}
		
		/**
		 * get 攻击者id
		 * @return 
		 */
		public function get attackId(): long{
			return _attackId;
		}
		
		/**
		 * set 攻击者id
		 */
		public function set attackId(value: long): void{
			this._attackId = value;
		}
		
		/**
		 * get 被攻击者id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 被攻击者id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get 技能ID
		 * @return 
		 */
		public function get skillMoldeId(): int{
			return _skillMoldeId;
		}
		
		/**
		 * set 技能ID
		 */
		public function set skillMoldeId(value: int): void{
			this._skillMoldeId = value;
		}
		
	}
}