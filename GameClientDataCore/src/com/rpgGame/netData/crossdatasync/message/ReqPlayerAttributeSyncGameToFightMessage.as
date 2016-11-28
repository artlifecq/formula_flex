package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 人物数值类属性变动同步到跨服,比如金币(覆盖到跨服)
	 */
	public class ReqPlayerAttributeSyncGameToFightMessage extends Message {
	
		//类型
		private var _type: int;
		
		//数值
		private var _value: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型
			writeByte(_type);
			//数值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型
			_type = readByte();
			//数值
			_value = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251256;
		}
		
		/**
		 * get 类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 数值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 数值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}