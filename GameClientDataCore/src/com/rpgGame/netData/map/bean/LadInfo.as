package com.rpgGame.netData.map.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 童子信息类
	 */
	public class LadInfo extends Bean {
	
		//童子唯一Id
		private var _ladId: long;
		
		//童子模板Id
		private var _ladModelId: int;
		
		//童子模板Id
		private var _ladtype: int;
		
		//所有者ID
		private var _ownerId: long;
		
		//所有者名称
		private var _ownerName: String;
		
		//童子所在X
		private var _x: int;
		
		//童子所在Y
		private var _y: int;
		
		//童子速度
		private var _speed: int;
		
		//童子面对方向
		private var _dir: int;
		
		//跑步坐标集合
		private var _positions: Vector.<int> = new Vector.<int>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//童子唯一Id
			writeLong(_ladId);
			//童子模板Id
			writeShort(_ladModelId);
			//童子模板Id
			writeShort(_ladtype);
			//所有者ID
			writeLong(_ownerId);
			//所有者名称
			writeString(_ownerName);
			//童子所在X
			writeShort(_x);
			//童子所在Y
			writeShort(_y);
			//童子速度
			writeShort(_speed);
			//童子面对方向
			writeByte(_dir);
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeByte(_positions[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//童子唯一Id
			_ladId = readLong();
			//童子模板Id
			_ladModelId = readShort();
			//童子模板Id
			_ladtype = readShort();
			//所有者ID
			_ownerId = readLong();
			//所有者名称
			_ownerName = readString();
			//童子所在X
			_x = readShort();
			//童子所在Y
			_y = readShort();
			//童子速度
			_speed = readShort();
			//童子面对方向
			_dir = readByte();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readByte();
			}
			return true;
		}
		
		/**
		 * get 童子唯一Id
		 * @return 
		 */
		public function get ladId(): long{
			return _ladId;
		}
		
		/**
		 * set 童子唯一Id
		 */
		public function set ladId(value: long): void{
			this._ladId = value;
		}
		
		/**
		 * get 童子模板Id
		 * @return 
		 */
		public function get ladModelId(): int{
			return _ladModelId;
		}
		
		/**
		 * set 童子模板Id
		 */
		public function set ladModelId(value: int): void{
			this._ladModelId = value;
		}
		
		/**
		 * get 童子模板Id
		 * @return 
		 */
		public function get ladtype(): int{
			return _ladtype;
		}
		
		/**
		 * set 童子模板Id
		 */
		public function set ladtype(value: int): void{
			this._ladtype = value;
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
		 * get 童子所在X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 童子所在X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 童子所在Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 童子所在Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 童子速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 童子速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get 童子面对方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 童子面对方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
		}
		
		/**
		 * get 跑步坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<int>{
			return _positions;
		}
		
		/**
		 * set 跑步坐标集合
		 */
		public function set positions(value: Vector.<int>): void{
			this._positions = value;
		}
		
	}
}