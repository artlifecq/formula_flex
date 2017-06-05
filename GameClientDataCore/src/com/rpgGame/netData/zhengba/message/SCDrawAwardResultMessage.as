package com.rpgGame.netData.zhengba.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取奖励结果
	 */
	public class SCDrawAwardResultMessage extends Message {
	
		//0 失败  1 成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 失败  1 成功
			writeByte(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 失败  1 成功
			_result = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127106;
		}
		
		/**
		 * get 0 失败  1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 失败  1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}