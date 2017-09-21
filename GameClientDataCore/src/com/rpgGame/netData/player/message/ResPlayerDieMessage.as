package com.rpgGame.netData.player.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家死亡消息
	 */
	public class ResPlayerDieMessage extends Message {
		
		//死亡的角色Id
		private var _personId: int;
		
		//是否自动复活(1自动 0不自动)
		private var _autoRevive: int;
		
		//自动复活时间
		private var _autoTime: int;
		
		//怪物模型ID
		private var _monstermodelid: int;
		
		//攻击者玩家ID
		private var _attackerid: int;
		
		//攻击者玩家名字
		private var _attackername: String;
		
		//死亡位置
		private var _position: com.rpgGame.netData.structs.Position;
		
		//死亡时间
		private var _time: int;
		
		//伤害技能id
		private var _skillId: int;
		
		//是否弹出复活面板(1弹出 0不弹出)
		private var _panel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//死亡的角色Id
			writeShort(_personId);
			//是否自动复活(1自动 0不自动)
			writeByte(_autoRevive);
			//自动复活时间
			writeByte(_autoTime);
			//怪物模型ID
			writeInt(_monstermodelid);
			//攻击者玩家ID
			writeShort(_attackerid);
			//攻击者玩家名字
			writeString(_attackername);
			//死亡位置
			writeBean(_position);
			//死亡时间
			writeInt(_time);
			//伤害技能id
			writeInt(_skillId);
			//是否弹出复活面板(1弹出 0不弹出)
			writeByte(_panel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//死亡的角色Id
			_personId = readShort();
			//是否自动复活(1自动 0不自动)
			_autoRevive = readByte();
			//自动复活时间
			_autoTime = readByte();
			//怪物模型ID
			_monstermodelid = readInt();
			//攻击者玩家ID
			_attackerid = readShort();
			//攻击者玩家名字
			_attackername = readString();
			//死亡位置
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//死亡时间
			_time = readInt();
			//伤害技能id
			_skillId = readInt();
			//是否弹出复活面板(1弹出 0不弹出)
			_panel = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103114;
		}
		
		/**
		 * get 死亡的角色Id
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 死亡的角色Id
		 */
		public function set personId(value: int): void{
			this._personId = value;
		}
		
		/**
		 * get 是否自动复活(1自动 0不自动)
		 * @return 
		 */
		public function get autoRevive(): int{
			return _autoRevive;
		}
		
		/**
		 * set 是否自动复活(1自动 0不自动)
		 */
		public function set autoRevive(value: int): void{
			this._autoRevive = value;
		}
		
		/**
		 * get 自动复活时间
		 * @return 
		 */
		public function get autoTime(): int{
			return _autoTime;
		}
		
		/**
		 * set 自动复活时间
		 */
		public function set autoTime(value: int): void{
			this._autoTime = value;
		}
		
		/**
		 * get 怪物模型ID
		 * @return 
		 */
		public function get monstermodelid(): int{
			return _monstermodelid;
		}
		
		/**
		 * set 怪物模型ID
		 */
		public function set monstermodelid(value: int): void{
			this._monstermodelid = value;
		}
		
		/**
		 * get 攻击者玩家ID
		 * @return 
		 */
		public function get attackerid(): int{
			return _attackerid;
		}
		
		/**
		 * set 攻击者玩家ID
		 */
		public function set attackerid(value: int): void{
			this._attackerid = value;
		}
		
		/**
		 * get 攻击者玩家名字
		 * @return 
		 */
		public function get attackername(): String{
			return _attackername;
		}
		
		/**
		 * set 攻击者玩家名字
		 */
		public function set attackername(value: String): void{
			this._attackername = value;
		}
		
		/**
		 * get 死亡位置
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 死亡位置
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
		/**
		 * get 死亡时间
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 死亡时间
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 伤害技能id
		 * @return 
		 */
		public function get skillId(): int{
			return _skillId;
		}
		
		/**
		 * set 伤害技能id
		 */
		public function set skillId(value: int): void{
			this._skillId = value;
		}
		
		/**
		 * get 是否弹出复活面板(1弹出 0不弹出)
		 * @return 
		 */
		public function get panel(): int{
			return _panel;
		}
		
		/**
		 * set 是否弹出复活面板(1弹出 0不弹出)
		 */
		public function set panel(value: int): void{
			this._panel = value;
		}
		
	}
}