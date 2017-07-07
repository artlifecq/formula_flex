package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 离婚结果
	 */
	public class SCDivorceMessage extends Message {
	
		//0 失败  1 成功
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 失败  1 成功
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 失败  1 成功
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150112;
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