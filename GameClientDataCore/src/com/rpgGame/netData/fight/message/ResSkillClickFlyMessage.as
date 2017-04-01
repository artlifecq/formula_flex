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
	 * 击飞技能效果
	 */
	public class ResSkillClickFlyMessage extends Message {
	
		//战斗id
		private var _fightId: long;
		
		//技能model
		private var _skillModel: int;
		
		//实体id
		private var _entityId: long;
		
		//速度
		private var _speed: int;
		
		//击退终点
		private var _pos: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战斗id
			writeLong(_fightId);
			//技能model
			writeInt(_skillModel);
			//实体id
			writeLong(_entityId);
			//速度
			writeInt(_speed);
			//击退终点
			writeBean(_pos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战斗id
			_fightId = readLong();
			//技能model
			_skillModel = readInt();
			//实体id
			_entityId = readLong();
			//速度
			_speed = readInt();
			//击退终点
			_pos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102111;
		}
		
		/**
		 * get 战斗id
		 * @return 
		 */
		public function get fightId(): long{
			return _fightId;
		}
		
		/**
		 * set 战斗id
		 */
		public function set fightId(value: long): void{
			this._fightId = value;
		}
		
		/**
		 * get 技能model
		 * @return 
		 */
		public function get skillModel(): int{
			return _skillModel;
		}
		
		/**
		 * set 技能model
		 */
		public function set skillModel(value: int): void{
			this._skillModel = value;
		}
		
		/**
		 * get 实体id
		 * @return 
		 */
		public function get entityId(): long{
			return _entityId;
		}
		
		/**
		 * set 实体id
		 */
		public function set entityId(value: long): void{
			this._entityId = value;
		}
		
		/**
		 * get 速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get 击退终点
		 * @return 
		 */
		public function get pos(): com.rpgGame.netData.structs.Position{
			return _pos;
		}
		
		/**
		 * set 击退终点
		 */
		public function set pos(value: com.rpgGame.netData.structs.Position): void{
			this._pos = value;
		}
		
	}
}