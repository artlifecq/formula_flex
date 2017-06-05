package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 多人副本面板信息
	 */
	public class MultiZonePanelInfo extends Bean {
	
		//副本ID
		private var _zoneId: int;
		
		//今日已通关次数
		private var _count: int;
		
		//奖励已领取次数
		private var _rewardCount: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneId);
			//今日已通关次数
			writeByte(_count);
			//奖励已领取次数
			writeByte(_rewardCount);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneId = readInt();
			//今日已通关次数
			_count = readByte();
			//奖励已领取次数
			_rewardCount = readByte();
			return true;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneId(): int{
			return _zoneId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneId(value: int): void{
			this._zoneId = value;
		}
		
		/**
		 * get 今日已通关次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 今日已通关次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 奖励已领取次数
		 * @return 
		 */
		public function get rewardCount(): int{
			return _rewardCount;
		}
		
		/**
		 * set 奖励已领取次数
		 */
		public function set rewardCount(value: int): void{
			this._rewardCount = value;
		}
		
	}
}