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
	 * 攻击怪物请求
	 */
	public class ReqAttackMonsterMessage extends Message {
	
		//攻击类型(技能ID)
		private var _fightType: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//前端自定义信息(动作,状态) -1:代表玩家模拟侍宠攻击
		private var _effectsid: int;
		
		//攻击目标
		private var _fightTarget: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击类型(技能ID)
			writeInt(_fightType);
			//攻击朝向
			writeByte(_fightDirection);
			//前端自定义信息(动作,状态) -1:代表玩家模拟侍宠攻击
			writeByte(_effectsid);
			//攻击目标
			writeLong(_fightTarget);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击类型(技能ID)
			_fightType = readInt();
			//攻击朝向
			_fightDirection = readByte();
			//前端自定义信息(动作,状态) -1:代表玩家模拟侍宠攻击
			_effectsid = readByte();
			//攻击目标
			_fightTarget = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102201;
		}
		
		/**
		 * get 攻击类型(技能ID)
		 * @return 
		 */
		public function get fightType(): int{
			return _fightType;
		}
		
		/**
		 * set 攻击类型(技能ID)
		 */
		public function set fightType(value: int): void{
			this._fightType = value;
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
		 * get 前端自定义信息(动作,状态) -1:代表玩家模拟侍宠攻击
		 * @return 
		 */
		public function get effectsid(): int{
			return _effectsid;
		}
		
		/**
		 * set 前端自定义信息(动作,状态) -1:代表玩家模拟侍宠攻击
		 */
		public function set effectsid(value: int): void{
			this._effectsid = value;
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
		
	}
}