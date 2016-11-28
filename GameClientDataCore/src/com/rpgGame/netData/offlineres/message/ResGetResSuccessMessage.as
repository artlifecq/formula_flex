package com.rpgGame.netData.offlineres.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领奖成功消息
	 */
	public class ResGetResSuccessMessage extends Message {
	
		//类型列表
		private var _types: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//类型列表
			writeShort(_types.length);
			for (i = 0; i < _types.length; i++) {
				writeByte(_types[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//类型列表
			var types_length : int = readShort();
			for (i = 0; i < types_length; i++) {
				_types[i] = readByte();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209104;
		}
		
		/**
		 * get 类型列表
		 * @return 
		 */
		public function get types(): Vector.<int>{
			return _types;
		}
		
		/**
		 * set 类型列表
		 */
		public function set types(value: Vector.<int>): void{
			this._types = value;
		}
		
	}
}