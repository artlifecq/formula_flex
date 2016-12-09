package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取累计签到奖励
	 */
	public class ReqSignSumAwardToGameMessage extends Message {
	
		//累计签到天数
		private var _day: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//累计签到天数
			writeInt(_day);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//累计签到天数
			_day = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154205;
		}
		
		/**
		 * get 累计签到天数
		 * @return 
		 */
		public function get day(): int{
			return _day;
		}
		
		/**
		 * set 累计签到天数
		 */
		public function set day(value: int): void{
			this._day = value;
		}
		
	}
}