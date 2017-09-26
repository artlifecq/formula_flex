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
	 * 玩家跑步信息(新)
	 */
	public class ReqNewRunningMessage extends Message {
	
		//冲锋标志 1 可以冲锋  0 不可冲锋
		private var _chargeFlag: int;
		
		//跑步坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//开始走路时间戳(秒数部分)
		private var _runTime: int;
		
		//开始走路时间戳(毫秒数部分)
		private var _runTimeMs: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//冲锋标志 1 可以冲锋  0 不可冲锋
			writeByte(_chargeFlag);
			//跑步坐标集合
			writeShort(_positions.length);
			for (i = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//开始走路时间戳(秒数部分)
			writeInt(_runTime);
			//开始走路时间戳(毫秒数部分)
			writeInt(_runTimeMs);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//冲锋标志 1 可以冲锋  0 不可冲锋
			_chargeFlag = readByte();
			//跑步坐标集合
			var positions_length : int = readShort();
			for (i = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//开始走路时间戳(秒数部分)
			_runTime = readInt();
			//开始走路时间戳(毫秒数部分)
			_runTimeMs = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101215;
		}
		
		/**
		 * get 冲锋标志 1 可以冲锋  0 不可冲锋
		 * @return 
		 */
		public function get chargeFlag(): int{
			return _chargeFlag;
		}
		
		/**
		 * set 冲锋标志 1 可以冲锋  0 不可冲锋
		 */
		public function set chargeFlag(value: int): void{
			this._chargeFlag = value;
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
		 * get 开始走路时间戳(秒数部分)
		 * @return 
		 */
		public function get runTime(): int{
			return _runTime;
		}
		
		/**
		 * set 开始走路时间戳(秒数部分)
		 */
		public function set runTime(value: int): void{
			this._runTime = value;
		}
		
		/**
		 * get 开始走路时间戳(毫秒数部分)
		 * @return 
		 */
		public function get runTimeMs(): int{
			return _runTimeMs;
		}
		
		/**
		 * set 开始走路时间戳(毫秒数部分)
		 */
		public function set runTimeMs(value: int): void{
			this._runTimeMs = value;
		}
		
	}
}