package com.rpgGame.netData.horse.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送升阶结果信息
	 */
	public class ResHorseUpResultToClientMessage extends Message {
	
		//本次升阶是否成功(1表示成功0表示失败)
		private var _isSuccess: int;
		
		//本次升阶后的祝福值
		private var _exp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//本次升阶是否成功(1表示成功0表示失败)
			writeByte(_isSuccess);
			//本次升阶后的祝福值
			writeInt(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//本次升阶是否成功(1表示成功0表示失败)
			_isSuccess = readByte();
			//本次升阶后的祝福值
			_exp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144105;
		}
		
		/**
		 * get 本次升阶是否成功(1表示成功0表示失败)
		 * @return 
		 */
		public function get isSuccess(): int{
			return _isSuccess;
		}
		
		/**
		 * set 本次升阶是否成功(1表示成功0表示失败)
		 */
		public function set isSuccess(value: int): void{
			this._isSuccess = value;
		}
		
		/**
		 * get 本次升阶后的祝福值
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 本次升阶后的祝福值
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
	}
}