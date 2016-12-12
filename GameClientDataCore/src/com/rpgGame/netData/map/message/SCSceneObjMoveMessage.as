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
		private var _objId: long;
		
		//移动速度
		private var _speed: int;
		
		//开始移动时间(秒)
		private var _startTime: int;
		
		//坐标点
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//移动对象ID
			writeLong(_objId);
			//移动速度
			writeShort(_speed);
			//开始移动时间(秒)
			writeInt(_startTime);
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
			_objId = readLong();
			//移动速度
			_speed = readShort();
			//开始移动时间(秒)
			_startTime = readInt();
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
		public function get objId(): long{
			return _objId;
		}
		
		/**
		 * set 移动对象ID
		 */
		public function set objId(value: long): void{
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
		 * get 开始移动时间(秒)
		 * @return 
		 */
		public function get startTime(): int{
			return _startTime;
		}
		
		/**
		 * set 开始移动时间(秒)
		 */
		public function set startTime(value: int): void{
			this._startTime = value;
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