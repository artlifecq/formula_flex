package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家跳跃信息
	 */
	public class ReqJumpMessage extends Message {
	
		//跳跃类型
		private var _type: int;
		
		//跳跃坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//是否后端强制
		private var _force: int;
		
		//检测
		private var _test: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//跳跃类型
			writeByte(_type);
			//跳跃坐标集合
			writeShort(_positions.length);
			for (i = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//是否后端强制
			writeByte(_force);
			//检测
			writeByte(_test);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//跳跃类型
			_type = readByte();
			//跳跃坐标集合
			var positions_length : int = readShort();
			for (i = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//是否后端强制
			_force = readByte();
			//检测
			_test = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101202;
		}
		
		/**
		 * get 跳跃类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 跳跃类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 跳跃坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set 跳跃坐标集合
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
		}
		
		/**
		 * get 是否后端强制
		 * @return 
		 */
		public function get force(): int{
			return _force;
		}
		
		/**
		 * set 是否后端强制
		 */
		public function set force(value: int): void{
			this._force = value;
		}
		
		/**
		 * get 检测
		 * @return 
		 */
		public function get test(): int{
			return _test;
		}
		
		/**
		 * set 检测
		 */
		public function set test(value: int): void{
			this._test = value;
		}
		
	}
}