package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 多人副本面板单个信息
	 */
	public class SCMultiZonePanelSingleInfoMessage extends Message {
	
		//副本ID
		private var _zoneId: int;
		
		//今日已通关次数
		private var _count: int;
		
		//奖励已领取次数
		private var _rewardCount: int;
		
		//多人副本今日总共挑战次数
		private var _challengeCount: int;
		
		
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
			//多人副本今日总共挑战次数
			writeByte(_challengeCount);
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
			//多人副本今日总共挑战次数
			_challengeCount = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155147;
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
		
		/**
		 * get 多人副本今日总共挑战次数
		 * @return 
		 */
		public function get challengeCount(): int{
			return _challengeCount;
		}
		
		/**
		 * set 多人副本今日总共挑战次数
		 */
		public function set challengeCount(value: int): void{
			this._challengeCount = value;
		}
		
	}
}