package com.rpgGame.netData.fight.message{
	import com.rpgGame.netData.structs.Position;
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
		
		//目标点
		private var _pos: com.rpgGame.netData.structs.Position;
		
		//唯一ID
		private var _uid: int;
		
		
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
			//目标点
			writeBean(_pos);
			//唯一ID
			writeInt(_uid);
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
			//目标点
			_pos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//唯一ID
			_uid = readInt();
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
		 * get 目标点
		 * @return 
		 */
		public function get pos(): com.rpgGame.netData.structs.Position{
			return _pos;
		}
		
		/**
		 * set 目标点
		 */
		public function set pos(value: com.rpgGame.netData.structs.Position): void{
			this._pos = value;
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