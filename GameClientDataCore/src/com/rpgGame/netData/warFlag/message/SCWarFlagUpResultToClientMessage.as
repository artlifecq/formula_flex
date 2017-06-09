package com.rpgGame.netData.warFlag.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送升阶结果信息消息
	 */
	public class SCWarFlagUpResultToClientMessage extends Message {
	
		//本次升阶后阶数
		private var _isSuccess: int;
		
		//本次升阶后的祝福值
		private var _exp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//本次升阶后阶数
			writeByte(_isSuccess);
			//本次升阶后的祝福值
			writeInt(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//本次升阶后阶数
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
			return 229105;
		}
		
		/**
		 * get 本次升阶后阶数
		 * @return 
		 */
		public function get isSuccess(): int{
			return _isSuccess;
		}
		
		/**
		 * set 本次升阶后阶数
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