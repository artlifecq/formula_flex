package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.structs.Position;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 宠物信息类
	 */
	public class PetInfo extends Bean {
	
		//宠物唯一Id
		private var _petId: long;
		
		//宠物模板Id
		private var _petModelId: int;
		
		//所有者ID
		private var _ownerId: long;
		
		//所有者名称
		private var _ownerName: String;
		
		//宠物等阶
		private var _rank: int;
		
		//宠物所在X
		private var _x: int;
		
		//宠物所在Y
		private var _y: int;
		
		//宠物速度
		private var _speed: int;
		
		//宠物面对方向
		private var _dir: int;
		
		//跑步坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//buff集合
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//宠物唯一Id
			writeLong(_petId);
			//宠物模板Id
			writeShort(_petModelId);
			//所有者ID
			writeLong(_ownerId);
			//所有者名称
			writeString(_ownerName);
			//宠物等阶
			writeShort(_rank);
			//宠物所在X
			writeShort(_x);
			//宠物所在Y
			writeShort(_y);
			//宠物速度
			writeShort(_speed);
			//宠物面对方向
			writeShort(_dir);
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//buff集合
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//宠物唯一Id
			_petId = readLong();
			//宠物模板Id
			_petModelId = readShort();
			//所有者ID
			_ownerId = readLong();
			//所有者名称
			_ownerName = readString();
			//宠物等阶
			_rank = readShort();
			//宠物所在X
			_x = readShort();
			//宠物所在Y
			_y = readShort();
			//宠物速度
			_speed = readShort();
			//宠物面对方向
			_dir = readShort();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//buff集合
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			return true;
		}
		
		/**
		 * get 宠物唯一Id
		 * @return 
		 */
		public function get petId(): long{
			return _petId;
		}
		
		/**
		 * set 宠物唯一Id
		 */
		public function set petId(value: long): void{
			this._petId = value;
		}
		
		/**
		 * get 宠物模板Id
		 * @return 
		 */
		public function get petModelId(): int{
			return _petModelId;
		}
		
		/**
		 * set 宠物模板Id
		 */
		public function set petModelId(value: int): void{
			this._petModelId = value;
		}
		
		/**
		 * get 所有者ID
		 * @return 
		 */
		public function get ownerId(): long{
			return _ownerId;
		}
		
		/**
		 * set 所有者ID
		 */
		public function set ownerId(value: long): void{
			this._ownerId = value;
		}
		
		/**
		 * get 所有者名称
		 * @return 
		 */
		public function get ownerName(): String{
			return _ownerName;
		}
		
		/**
		 * set 所有者名称
		 */
		public function set ownerName(value: String): void{
			this._ownerName = value;
		}
		
		/**
		 * get 宠物等阶
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 宠物等阶
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 宠物所在X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 宠物所在X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 宠物所在Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 宠物所在Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 宠物速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 宠物速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get 宠物面对方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 宠物面对方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get 跑步坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set 跑步坐标集合
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
		}
		
		/**
		 * get buff集合
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff集合
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
	}
}