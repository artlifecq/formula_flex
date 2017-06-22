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
		
		//当前层数
		private var _tier: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//结果  1 成功    0 失败
			writeInt(_result);
			//当前层数
			writeInt(_tier);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//结果  1 成功    0 失败
			_result = readInt();
			//当前层数
			_tier = readInt();
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
		 * get 当前层数
		 * @return 
		 */
		public function get tier(): int{
			return _tier;
		}
		
		/**
		 * set 当前层数
		 */
		public function set tier(value: int): void{
			this._tier = value;
		}
		
	}
}