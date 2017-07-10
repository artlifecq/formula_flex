package com.rpgGame.netData.redreward.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求发红包
	 */
	public class CSSendRedRewardMessage extends Message {
	
		//发送红包数量
		private var _count: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//发送红包数量
			writeShort(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//发送红包数量
			_count = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254203;
		}
		
		/**
		 * get 发送红包数量
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 发送红包数量
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}