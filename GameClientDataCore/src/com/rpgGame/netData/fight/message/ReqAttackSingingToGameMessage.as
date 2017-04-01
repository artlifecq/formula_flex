package com.rpgGame.netData.fight.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求吟唱
	 */
	public class ReqAttackSingingToGameMessage extends Message {
	
		//攻击类型(技能ID)
		private var _fightType: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击类型(技能ID)
			writeInt(_fightType);
			//攻击朝向
			writeShort(_fightDirection);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击类型(技能ID)
			_fightType = readInt();
			//攻击朝向
			_fightDirection = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102206;
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
		
	}
}