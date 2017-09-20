package com.rpgGame.netData.fight.message{
	import com.rpgGame.netData.structs.Position;
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
		private var _playerid: int;
		
		//攻击类型(技能ID)
		private var _fightType: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//目标点
		private var _pos: com.rpgGame.netData.structs.Position;
		
		//目标点列表
		private var _posList: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//目标对象列表
		private var _targets: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//角色Id
			writeShort(_playerid);
			//攻击类型(技能ID)
			writeInt(_fightType);
			//攻击朝向
			writeShort(_fightDirection);
			//目标点
			writeBean(_pos);
			//目标点列表
			writeShort(_posList.length);
			for (i = 0; i < _posList.length; i++) {
				writeBean(_posList[i]);
			}
			//目标对象列表
			writeShort(_targets.length);
			for (i = 0; i < _targets.length; i++) {
				writeShort(_targets[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//角色Id
			_playerid = readShort();
			//攻击类型(技能ID)
			_fightType = readInt();
			//攻击朝向
			_fightDirection = readShort();
			//目标点
			_pos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//目标点列表
			var posList_length : int = readShort();
			for (i = 0; i < posList_length; i++) {
				_posList[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//目标对象列表
			var targets_length : int = readShort();
			for (i = 0; i < targets_length; i++) {
				_targets[i] = readShort();
			}
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
		public function get playerid(): int{
			return _playerid;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerid(value: int): void{
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
		 * get 目标点列表
		 * @return 
		 */
		public function get posList(): Vector.<com.rpgGame.netData.structs.Position>{
			return _posList;
		}
		
		/**
		 * set 目标点列表
		 */
		public function set posList(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._posList = value;
		}
		
		/**
		 * get 目标对象列表
		 * @return 
		 */
		public function get targets(): Vector.<int>{
			return _targets;
		}
		
		/**
		 * set 目标对象列表
		 */
		public function set targets(value: Vector.<int>): void{
			this._targets = value;
		}
		
	}
}