package com.rpgGame.netData.login.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 错误信息
	 */
	public class ResErrorMessage extends Message {
	
		//失败原因 1-服务器未开启 等
		private var _reason: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//失败原因 1-服务器未开启 等
			writeInt(_reason);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//失败原因 1-服务器未开启 等
			_reason = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 100104;
		}
		
		/**
		 * get 失败原因 1-服务器未开启 等
		 * @return 
		 */
		public function get reason(): int{
			return _reason;
		}
		
		/**
		 * set 失败原因 1-服务器未开启 等
		 */
		public function set reason(value: int): void{
			this._reason = value;
		}
		
	}
}