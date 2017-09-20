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
	 * 战斗广播
	 */
	public class ResFightBroadcastMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//攻击朝向
		private var _fightDirection: int;
		
		//技能编号
		private var _skillModelId: int;
		
		//攻击目标
		private var _fightTarget: int;
		
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
			writeShort(_personId);
			//攻击朝向
			writeShort(_fightDirection);
			//技能编号
			writeInt(_skillModelId);
			//攻击目标
			writeShort(_fightTarget);
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
			_personId = readShort();
			//攻击朝向
			_fightDirection = readShort();
			//技能编号
			_skillModelId = readInt();
			//攻击目标
			_fightTarget = readShort();
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
			return 102101;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: int): void{
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
		public function get fightTarget(): int{
			return _fightTarget;
		}
		
		/**
		 * set 攻击目标
		 */
		public function set fightTarget(value: int): void{
			this._fightTarget = value;
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