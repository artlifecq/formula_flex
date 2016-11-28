package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求服务器触发指定的效果
	 */
	public class ReqClientLogicTriggerEffectMessage extends Message {
	
		//触发类型,类型说明参见ClientLogicTypeConst
		private var _type: int;
		
		//触发值
		private var _value: int;
		
		//触发扩展值
		private var _strJson: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//触发类型,类型说明参见ClientLogicTypeConst
			writeInt(_type);
			//触发值
			writeInt(_value);
			//触发扩展值
			writeString(_strJson);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//触发类型,类型说明参见ClientLogicTypeConst
			_type = readInt();
			//触发值
			_value = readInt();
			//触发扩展值
			_strJson = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103214;
		}
		
		/**
		 * get 触发类型,类型说明参见ClientLogicTypeConst
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 触发类型,类型说明参见ClientLogicTypeConst
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 触发值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 触发值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
		/**
		 * get 触发扩展值
		 * @return 
		 */
		public function get strJson(): String{
			return _strJson;
		}
		
		/**
		 * set 触发扩展值
		 */
		public function set strJson(value: String): void{
			this._strJson = value;
		}
		
	}
}