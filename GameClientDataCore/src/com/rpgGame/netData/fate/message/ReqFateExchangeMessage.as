package com.rpgGame.netData.fate.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 绝命套装兑换
	 */
	public class ReqFateExchangeMessage extends Message {
	
		//兑换主键ID
		private var _exId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//兑换主键ID
			writeInt(_exId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//兑换主键ID
			_exId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 213202;
		}
		
		/**
		 * get 兑换主键ID
		 * @return 
		 */
		public function get exId(): int{
			return _exId;
		}
		
		/**
		 * set 兑换主键ID
		 */
		public function set exId(value: int): void{
			this._exId = value;
		}
		
	}
}