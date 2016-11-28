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
	 * 战斗广播
	 */
	public class ResFightBroadcastMessage extends Message {
	
		//是否是攻击虚拟侍宠0不是，1是
		private var _isAttackPet: int;
		
		//角色Id
		private var _personId: long;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//攻击类型
		private var _fightType: int;
		
		//攻击目标
		private var _fightTarget: long;
		
		//攻击特效(目前只有平砍有)
		private var _effects: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否是攻击虚拟侍宠0不是，1是
			writeByte(_isAttackPet);
			//角色Id
			writeLong(_personId);
			//攻击朝向
			writeByte(_fightDirection);
			//攻击类型
			writeInt(_fightType);
			//攻击目标
			writeLong(_fightTarget);
			//攻击特效(目前只有平砍有)
			writeByte(_effects);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否是攻击虚拟侍宠0不是，1是
			_isAttackPet = readByte();
			//角色Id
			_personId = readLong();
			//攻击朝向
			_fightDirection = readByte();
			//攻击类型
			_fightType = readInt();
			//攻击目标
			_fightTarget = readLong();
			//攻击特效(目前只有平砍有)
			_effects = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102101;
		}
		
		/**
		 * get 是否是攻击虚拟侍宠0不是，1是
		 * @return 
		 */
		public function get isAttackPet(): int{
			return _isAttackPet;
		}
		
		/**
		 * set 是否是攻击虚拟侍宠0不是，1是
		 */
		public function set isAttackPet(value: int): void{
			this._isAttackPet = value;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: long): void{
			this._personId = value;
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
		 * get 攻击类型
		 * @return 
		 */
		public function get fightType(): int{
			return _fightType;
		}
		
		/**
		 * set 攻击类型
		 */
		public function set fightType(value: int): void{
			this._fightType = value;
		}
		
		/**
		 * get 攻击目标
		 * @return 
		 */
		public function get fightTarget(): long{
			return _fightTarget;
		}
		
		/**
		 * set 攻击目标
		 */
		public function set fightTarget(value: long): void{
			this._fightTarget = value;
		}
		
		/**
		 * get 攻击特效(目前只有平砍有)
		 * @return 
		 */
		public function get effects(): int{
			return _effects;
		}
		
		/**
		 * set 攻击特效(目前只有平砍有)
		 */
		public function set effects(value: int): void{
			this._effects = value;
		}
		
	}
}