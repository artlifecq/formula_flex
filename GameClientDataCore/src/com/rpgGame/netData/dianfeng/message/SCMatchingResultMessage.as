package com.rpgGame.netData.dianfeng.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 匹配结果
	 */
	public class SCMatchingResultMessage extends Message {
	
		//匹配结果  1 成功  0 失败
		private var _result: int;
		
		//倒计时  秒
		private var _delayTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//匹配结果  1 成功  0 失败
			writeInt(_result);
			//倒计时  秒
			writeInt(_delayTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//匹配结果  1 成功  0 失败
			_result = readInt();
			//倒计时  秒
			_delayTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128101;
		}
		
		/**
		 * get 匹配结果  1 成功  0 失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 匹配结果  1 成功  0 失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 倒计时  秒
		 * @return 
		 */
		public function get delayTime(): int{
			return _delayTime;
		}
		
		/**
		 * set 倒计时  秒
		 */
		public function set delayTime(value: int): void{
			this._delayTime = value;
		}
		
	}
}