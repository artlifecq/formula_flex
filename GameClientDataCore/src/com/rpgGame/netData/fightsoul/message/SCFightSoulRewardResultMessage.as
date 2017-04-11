package com.rpgGame.netData.fightsoul.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取奖励结果
	 */
	public class SCFightSoulRewardResultMessage extends Message {
	
		//奖励领取状态
		private var _rewardBit: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//奖励领取状态
			writeByte(_rewardBit);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//奖励领取状态
			_rewardBit = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 223006;
		}
		
		/**
		 * get 奖励领取状态
		 * @return 
		 */
		public function get rewardBit(): int{
			return _rewardBit;
		}
		
		/**
		 * set 奖励领取状态
		 */
		public function set rewardBit(value: int): void{
			this._rewardBit = value;
		}
		
	}
}