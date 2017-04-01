package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 人物数值类属性变动同步到原服,比如金币
	 */
	public class ReqPlayerAttributeFightToGameMessage extends Message {
	
		//类型
		private var _type: int;
		
		//数值
		private var _value: int;
		
		//原因
		private var _reasonId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型
			writeByte(_type);
			//数值
			writeInt(_value);
			//原因
			writeInt(_reasonId);
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
			//原因
			_reasonId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251257;
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
		
		/**
		 * get 原因
		 * @return 
		 */
		public function get reasonId(): int{
			return _reasonId;
		}
		
		/**
		 * set 原因
		 */
		public function set reasonId(value: int): void{
			this._reasonId = value;
		}
		
	}
}