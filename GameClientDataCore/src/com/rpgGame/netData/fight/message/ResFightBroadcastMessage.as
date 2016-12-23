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
	
		//角色Id
		private var _personId: long;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//技能编号
		private var _skillModelId: int;
		
		//攻击目标
		private var _fightTarget: long;
		
		//唯一ID
		private var _uid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_personId);
			//攻击朝向
			writeByte(_fightDirection);
			//技能编号
			writeInt(_skillModelId);
			//攻击目标
			writeLong(_fightTarget);
			//唯一ID
			writeInt(_uid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readLong();
			//攻击朝向
			_fightDirection = readByte();
			//技能编号
			_skillModelId = readInt();
			//攻击目标
			_fightTarget = readLong();
			//唯一ID
			_uid = readInt();
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
		 * get 技能编号
		 * @return 
		 */
		public function get skillModelId(): int{
			return _skillModelId;
		}
		
		/**
		 * set 技能编号
		 */
		public function set skillModelId(value: int): void{
			this._skillModelId = value;
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
		 * get 唯一ID
		 * @return 
		 */
		public function get uid(): int{
			return _uid;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uid(value: int): void{
			this._uid = value;
		}
		
	}
}