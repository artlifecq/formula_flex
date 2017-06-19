package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 进入妖塔
	 */
	public class SCEnterYaoTaResultMessage extends Message {
	
		//结果  1 成功    0 失败
		private var _result: int;
		
		//剩余时间
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//结果  1 成功    0 失败
			writeInt(_result);
			//剩余时间
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//结果  1 成功    0 失败
			_result = readInt();
			//剩余时间
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129101;
		}
		
		/**
		 * get 结果  1 成功    0 失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果  1 成功    0 失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}