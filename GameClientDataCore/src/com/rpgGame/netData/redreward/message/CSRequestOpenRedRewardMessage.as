package com.rpgGame.netData.redreward.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求打开红包
	 */
	public class CSRequestOpenRedRewardMessage extends Message {
	
		//是否领取多个
		private var _isMore: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否领取多个
			writeByte(_isMore);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否领取多个
			_isMore = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254201;
		}
		
		/**
		 * get 是否领取多个
		 * @return 
		 */
		public function get isMore(): int{
			return _isMore;
		}
		
		/**
		 * set 是否领取多个
		 */
		public function set isMore(value: int): void{
			this._isMore = value;
		}
		
	}
}