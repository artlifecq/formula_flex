package com.rpgGame.netData.fate.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 兑换结果
	 */
	public class ResFateExchangeMessage extends Message {
	
		//0成功 1失败
		private var _result: int;
		
		//兑换主键ID
		private var _exId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0成功 1失败
			writeByte(_result);
			//兑换主键ID
			writeInt(_exId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0成功 1失败
			_result = readByte();
			//兑换主键ID
			_exId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 213103;
		}
		
		/**
		 * get 0成功 1失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0成功 1失败
		 */
		public function set result(value: int): void{
			this._result = value;
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