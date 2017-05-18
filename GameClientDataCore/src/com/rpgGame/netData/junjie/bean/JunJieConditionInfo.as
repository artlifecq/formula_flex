package com.rpgGame.netData.junjie.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 军阶条件
	 */
	public class JunJieConditionInfo extends Bean {
	
		//条件类型
		private var _type: int;
		
		//当前值
		private var _currentValue: int;
		
		//最大值
		private var _maxValue: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//条件类型
			writeInt(_type);
			//当前值
			writeInt(_currentValue);
			//最大值
			writeInt(_maxValue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//条件类型
			_type = readInt();
			//当前值
			_currentValue = readInt();
			//最大值
			_maxValue = readInt();
			return true;
		}
		
		/**
		 * get 条件类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 条件类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 当前值
		 * @return 
		 */
		public function get currentValue(): int{
			return _currentValue;
		}
		
		/**
		 * set 当前值
		 */
		public function set currentValue(value: int): void{
			this._currentValue = value;
		}
		
		/**
		 * get 最大值
		 * @return 
		 */
		public function get maxValue(): int{
			return _maxValue;
		}
		
		/**
		 * set 最大值
		 */
		public function set maxValue(value: int): void{
			this._maxValue = value;
		}
		
	}
}