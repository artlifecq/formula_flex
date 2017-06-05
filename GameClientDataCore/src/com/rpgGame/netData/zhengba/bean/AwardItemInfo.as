package com.rpgGame.netData.zhengba.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 奖励信息
	 */
	public class AwardItemInfo extends Bean {
	
		//奖励类型
		private var _type: int;
		
		//奖励值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//奖励类型
			writeInt(_type);
			//奖励值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//奖励类型
			_type = readInt();
			//奖励值
			_value = readInt();
			return true;
		}
		
		/**
		 * get 奖励类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 奖励类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 奖励值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 奖励值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}