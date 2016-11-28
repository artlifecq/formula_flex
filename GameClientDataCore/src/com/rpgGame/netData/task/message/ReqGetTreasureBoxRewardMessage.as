package com.rpgGame.netData.task.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领取宝箱奖励
	 */
	public class ReqGetTreasureBoxRewardMessage extends Message {
	
		//领取的宝箱奖励类型 0-军功 1-道具
		private var _rewardType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取的宝箱奖励类型 0-军功 1-道具
			writeByte(_rewardType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取的宝箱奖励类型 0-军功 1-道具
			_rewardType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124208;
		}
		
		/**
		 * get 领取的宝箱奖励类型 0-军功 1-道具
		 * @return 
		 */
		public function get rewardType(): int{
			return _rewardType;
		}
		
		/**
		 * set 领取的宝箱奖励类型 0-军功 1-道具
		 */
		public function set rewardType(value: int): void{
			this._rewardType = value;
		}
		
	}
}