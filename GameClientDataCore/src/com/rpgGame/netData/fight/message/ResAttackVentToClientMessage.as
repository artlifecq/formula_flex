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
	 * 攻击地面坐标广播(应该和战斗广播是一样的,收到这个消息表示技能成功)
	 */
	public class ResAttackVentToClientMessage extends Message {
	
		//角色Id
		private var _playerid: long;
		
		//攻击类型(技能ID)
		private var _fightType: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//攻击坐标x(格子坐标)
		private var _x: int;
		
		//攻击坐标y(格子坐标)
		private var _y: int;
		
		//攻击特效(目前只有平砍有)
		private var _effects: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_playerid);
			//攻击类型(技能ID)
			writeInt(_fightType);
			//攻击朝向
			writeByte(_fightDirection);
			//攻击坐标x(格子坐标)
			writeShort(_x);
			//攻击坐标y(格子坐标)
			writeShort(_y);
			//攻击特效(目前只有平砍有)
			writeByte(_effects);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_playerid = readLong();
			//攻击类型(技能ID)
			_fightType = readInt();
			//攻击朝向
			_fightDirection = readByte();
			//攻击坐标x(格子坐标)
			_x = readShort();
			//攻击坐标y(格子坐标)
			_y = readShort();
			//攻击特效(目前只有平砍有)
			_effects = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102107;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
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