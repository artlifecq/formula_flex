package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * Vip领取额外奖励
	 */
	public class ReqSignObtainAwardMessage extends Message {
	
		//vip 1成功  首签  0
		private var _isVip: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//vip 1成功  首签  0
			writeByte(_isVip);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//vip 1成功  首签  0
			_isVip = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154204;
		}
		
		/**
		 * get vip 1成功  首签  0
		 * @return 
		 */
		public function get isVip(): int{
			return _isVip;
		}
		
		/**
		 * set vip 1成功  首签  0
		 */
		public function set isVip(value: int): void{
			this._isVip = value;
		}
		
	}
}