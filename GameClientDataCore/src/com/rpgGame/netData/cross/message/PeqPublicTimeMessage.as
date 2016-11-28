package com.rpgGame.netData.cross.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 公共服日期时间
	 */
	public class PeqPublicTimeMessage extends Message {
	
		//公共服务器日期时间
		private var _timems: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//公共服务器日期时间
			writeLong(_timems);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//公共服务器日期时间
			_timems = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250258;
		}
		
		/**
		 * get 公共服务器日期时间
		 * @return 
		 */
		public function get timems(): long{
			return _timems;
		}
		
		/**
		 * set 公共服务器日期时间
		 */
		public function set timems(value: long): void{
			this._timems = value;
		}
		
	}
}