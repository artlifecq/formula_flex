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
	 * 怪物技能预警
	 */
	public class SCSkillWarningInfoMessage extends Message {
	
		//预警者ID
		private var _monsterId: int;
		
		//技能ID
		private var _skillId: int;
		
		//目标对象列表
		private var _targets: Vector.<int> = new Vector.<int>();
		//目标点列表
		private var _posList: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//预警者ID
			writeShort(_monsterId);
			//技能ID
			writeInt(_skillId);
			//目标对象列表
			writeShort(_targets.length);
			for (i = 0; i < _targets.length; i++) {
				writeShort(_targets[i]);
			}
			//目标点列表
			writeShort(_posList.length);
			for (i = 0; i < _posList.length; i++) {
				writeBean(_posList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//预警者ID
			_monsterId = readShort();
			//技能ID
			_skillId = readInt();
			//目标对象列表
			var targets_length : int = readShort();
			for (i = 0; i < targets_length; i++) {
				_targets[i] = readShort();
			}
			//目标点列表
			var posList_length : int = readShort();
			for (i = 0; i < posList_length; i++) {
				_posList[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102117;
		}
		
		/**
		 * get 预警者ID
		 * @return 
		 */
		public function get monsterId(): int{
			return _monsterId;
		}
		
		/**
		 * set 预警者ID
		 */
		public function set monsterId(value: int): void{
			this._monsterId = value;
		}
		
		/**
		 * get 技能ID
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 技能ID
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
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
		
	}
}