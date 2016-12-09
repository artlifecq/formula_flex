package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 绝命套装触发后同步原服
	 */
	public class ReqFateGameToFightMessage extends Message {
	
		//绝命任务类型
		private var _fateEnum: int;
		
		//参数
		private var _value: Vector.<String> = new Vector.<String>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//绝命任务类型
			writeInt(_fateEnum);
			//参数
			writeShort(_value.length);
			for (i = 0; i < _value.length; i++) {
				writeString(_value[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//绝命任务类型
			_fateEnum = readInt();
			//参数
			var value_length : int = readShort();
			for (i = 0; i < value_length; i++) {
				_value[i] = readString();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251278;
		}
		
		/**
		 * get 绝命任务类型
		 * @return 
		 */
		public function get fateEnum(): int{
			return _fateEnum;
		}
		
		/**
		 * set 绝命任务类型
		 */
		public function set fateEnum(value: int): void{
			this._fateEnum = value;
		}
		
		/**
		 * get 参数
		 * @return 
		 */
		public function get value(): Vector.<String>{
			return _value;
		}
		
		/**
		 * set 参数
		 */
		public function set value(value: Vector.<String>): void{
			this._value = value;
		}
		
	}
}