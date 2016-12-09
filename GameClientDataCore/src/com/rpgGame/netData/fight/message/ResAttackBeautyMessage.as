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
	 * 美人攻击结果
	 */
	public class ResAttackBeautyMessage extends Message {
	
		//主人Id
		private var _ownerId: long;
		
		//伤害(-1 闪避 >=0有伤害)
		private var _damage: int;
		
		//目标id
		private var _targetId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//主人Id
			writeLong(_ownerId);
			//伤害(-1 闪避 >=0有伤害)
			writeInt(_damage);
			//目标id
			writeLong(_targetId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//主人Id
			_ownerId = readLong();
			//伤害(-1 闪避 >=0有伤害)
			_damage = readInt();
			//目标id
			_targetId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102110;
		}
		
		/**
		 * get 主人Id
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set 主人Id
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
		/**
		 * get 伤害(-1 闪避 >=0有伤害)
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 伤害(-1 闪避 >=0有伤害)
		 */
		public function set damage(value: int): void{
			this._damage = value;
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