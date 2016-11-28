package com.rpgGame.netData.task.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 宝箱信息
	 */
	public class TreasureInfo extends Bean {
	
		//是否已领取奖励 0-未领取 1-已领取
		private var _getRewardState: int;
		
		//幸运值
		private var _lucky: int;
		
		//幸运值产生的时刻
		private var _luckyTime: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否已领取奖励 0-未领取 1-已领取
			writeByte(_getRewardState);
			//幸运值
			writeInt(_lucky);
			//幸运值产生的时刻
			writeLong(_luckyTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否已领取奖励 0-未领取 1-已领取
			_getRewardState = readByte();
			//幸运值
			_lucky = readInt();
			//幸运值产生的时刻
			_luckyTime = readLong();
			return true;
		}
		
		/**
		 * get 是否已领取奖励 0-未领取 1-已领取
		 * @return 
		 */
		public function get getRewardState(): int{
			return _getRewardState;
		}
		
		/**
		 * set 是否已领取奖励 0-未领取 1-已领取
		 */
		public function set getRewardState(value: int): void{
			this._getRewardState = value;
		}
		
		/**
		 * get 幸运值
		 * @return 
		 */
		public function get lucky(): int{
			return _lucky;
		}
		
		/**
		 * set 幸运值
		 */
		public function set lucky(value: int): void{
			this._lucky = value;
		}
		
		/**
		 * get 幸运值产生的时刻
		 * @return 
		 */
		public function get luckyTime(): long{
			return _luckyTime;
		}
		
		/**
		 * set 幸运值产生的时刻
		 */
		public function set luckyTime(value: long): void{
			this._luckyTime = value;
		}
		
	}
}