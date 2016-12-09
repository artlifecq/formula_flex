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
	 * 同步客户端正常攻击的目标
	 */
	public class ResAttackTargetMessage extends Message {
	
		//攻击者id
		private var _attackId: long;
		
		//被攻击者id
		private var _targetId: long;
		
		//攻击者类型 0:怪物 1:侍宠
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击者id
			writeLong(_attackId);
			//被攻击者id
			writeLong(_targetId);
			//攻击者类型 0:怪物 1:侍宠
			writeByte(_type);
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
			//攻击者类型 0:怪物 1:侍宠
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102112;
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
		 * get 攻击者类型 0:怪物 1:侍宠
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 攻击者类型 0:怪物 1:侍宠
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}