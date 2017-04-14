package com.rpgGame.netData.fightsoul.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取奖励
	 */
	public class CSFightSoulRewardMessage extends Message {
	
		//对应奖励的位
		private var _bitReward: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//对应奖励的位
			writeByte(_bitReward);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//对应奖励的位
			_bitReward = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223503;
		}
		
		/**
		 * get 对应奖励的位
		 * @return 
		 */
		public function get bitReward(): int{
			return _bitReward;
		}
		
		/**
		 * set 对应奖励的位
		 */
		public function set bitReward(value: int): void{
			this._bitReward = value;
		}
		
	}
}