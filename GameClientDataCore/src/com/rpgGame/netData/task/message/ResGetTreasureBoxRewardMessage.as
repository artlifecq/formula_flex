package com.rpgGame.netData.task.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取宝箱任务奖励
	 */
	public class ResGetTreasureBoxRewardMessage extends Message {
	
		//领取的宝箱奖励类型 0-军功 1-道具
		private var _rewardType: int;
		
		//领取的奖励编号
		private var _rewardId: int;
		
		//当前幸运值
		private var _lucky: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取的宝箱奖励类型 0-军功 1-道具
			writeByte(_rewardType);
			//领取的奖励编号
			writeInt(_rewardId);
			//当前幸运值
			writeInt(_lucky);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取的宝箱奖励类型 0-军功 1-道具
			_rewardType = readByte();
			//领取的奖励编号
			_rewardId = readInt();
			//当前幸运值
			_lucky = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124107;
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
		
		/**
		 * get 领取的奖励编号
		 * @return 
		 */
		public function get rewardId(): int{
			return _rewardId;
		}
		
		/**
		 * set 领取的奖励编号
		 */
		public function set rewardId(value: int): void{
			this._rewardId = value;
		}
		
		/**
		 * get 当前幸运值
		 * @return 
		 */
		public function get lucky(): int{
			return _lucky;
		}
		
		/**
		 * set 当前幸运值
		 */
		public function set lucky(value: int): void{
			this._lucky = value;
		}
		
	}
}