package com.rpgGame.netData.daysdowngold.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送元宝变化
	 */
	public class SCCashGiftChangeMessage extends Message {
	
		//玩家获得的元宝
		private var _cashGiftNum: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家获得的元宝
			writeInt(_cashGiftNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家获得的元宝
			_cashGiftNum = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130106;
		}
		
		/**
		 * get 玩家获得的元宝
		 * @return 
		 */
		public function get cashGiftNum(): int{
			return _cashGiftNum;
		}
		
		/**
		 * set 玩家获得的元宝
		 */
		public function set cashGiftNum(value: int): void{
			this._cashGiftNum = value;
		}
		
	}
}