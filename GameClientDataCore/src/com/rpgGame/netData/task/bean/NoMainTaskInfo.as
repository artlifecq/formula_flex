package com.rpgGame.netData.task.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 卡级提示信息
	 */
	public class NoMainTaskInfo extends Bean {
	
		//类型
		private var _type: int;
		
		//当前最小值
		private var _min: int;
		
		//当前最大值
		private var _max: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型
			writeInt(_type);
			//当前最小值
			writeInt(_min);
			//当前最大值
			writeInt(_max);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型
			_type = readInt();
			//当前最小值
			_min = readInt();
			//当前最大值
			_max = readInt();
			return true;
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
		 * get 当前最小值
		 * @return 
		 */
		public function get min(): int{
			return _min;
		}
		
		/**
		 * set 当前最小值
		 */
		public function set min(value: int): void{
			this._min = value;
		}
		
		/**
		 * get 当前最大值
		 * @return 
		 */
		public function get max(): int{
			return _max;
		}
		
		/**
		 * set 当前最大值
		 */
		public function set max(value: int): void{
			this._max = value;
		}
		
	}
}