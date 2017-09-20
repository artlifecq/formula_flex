package com.rpgGame.netData.map.message{
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
	 * 场景对象移动
	 */
	public class SCSceneObjMoveMessage extends Message {
	
		//移动对象ID
		private var _objId: int;
		
		//移动速度
		private var _speed: int;
		
		//开始移动时间
		private var _startTime: long;
		
		//0 正常移动       1 冲刺
		private var _type: int;
		
		//坐标点
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//移动对象ID
			writeShort(_objId);
			//移动速度
			writeShort(_speed);
			//开始移动时间
			writeLong(_startTime);
			//0 正常移动       1 冲刺
			writeByte(_type);
			//坐标点
			writeShort(_positions.length);
			for (i = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//移动对象ID
			_objId = readShort();
			//移动速度
			_speed = readShort();
			//开始移动时间
			_startTime = readLong();
			//0 正常移动       1 冲刺
			_type = readByte();
			//坐标点
			var positions_length : int = readShort();
			for (i = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101148;
		}
		
		/**
		 * get 移动对象ID
		 * @return 
		 */
		public function get objId(): int{
			return _objId;
		}
		
		/**
		 * set 移动对象ID
		 */
		public function set objId(value: int): void{
			this._objId = value;
		}
		
		/**
		 * get 移动速度
		 * @return 
		 */
		public function get speed(): int{
			return _speed;
		}
		
		/**
		 * set 移动速度
		 */
		public function set speed(value: int): void{
			this._speed = value;
		}
		
		/**
		 * get 开始移动时间
		 * @return 
		 */
		public function get startTime(): long{
			return _startTime;
		}
		
		/**
		 * set 开始移动时间
		 */
		public function set startTime(value: long): void{
			this._startTime = value;
		}
		
		/**
		 * get 0 正常移动       1 冲刺
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 0 正常移动       1 冲刺
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 坐标点
		 * @return 
		 */
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set 坐标点
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
		}
		
	}
}