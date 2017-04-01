package com.rpgGame.netData.fight.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 攻击地面空放魔法
	 */
	public class ReqAttackVentToGameMessage extends Message {
	
		//攻击类型(技能ID)
		private var _fightType: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//前端自定义信息(动作,状态)
		private var _effectsid: int;
		
		//攻击坐标x(格子坐标)
		private var _x: int;
		
		//攻击坐标y(格子坐标)
		private var _y: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击类型(技能ID)
			writeInt(_fightType);
			//攻击朝向
			writeByte(_fightDirection);
			//前端自定义信息(动作,状态)
			writeByte(_effectsid);
			//攻击坐标x(格子坐标)
			writeShort(_x);
			//攻击坐标y(格子坐标)
			writeShort(_y);
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
			//前端自定义信息(动作,状态)
			_effectsid = readByte();
			//攻击坐标x(格子坐标)
			_x = readShort();
			//攻击坐标y(格子坐标)
			_y = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102205;
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
		 * get 前端自定义信息(动作,状态)
		 * @return 
		 */
		public function get effectsid(): int{
			return _effectsid;
		}
		
		/**
		 * set 前端自定义信息(动作,状态)
		 */
		public function set effectsid(value: int): void{
			this._effectsid = value;
		}
		
		/**
		 * get 攻击坐标x(格子坐标)
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 攻击坐标x(格子坐标)
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 攻击坐标y(格子坐标)
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 攻击坐标y(格子坐标)
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
	}
}