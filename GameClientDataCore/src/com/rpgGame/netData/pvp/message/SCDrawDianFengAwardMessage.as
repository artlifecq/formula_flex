package com.rpgGame.netData.pvp.message{
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
	public class SCDrawDianFengAwardMessage extends Message {
	
		//1 成功  0 失败
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 成功  0 失败
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 成功  0 失败
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128113;
		}
		
		/**
		 * get 1 成功  0 失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 1 成功  0 失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}