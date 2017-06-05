package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 多人副本奖励消息
	 */
	public class SCMultiZoneRewardMessage extends Message {
	
		//副本ID
		private var _zoneID: int;
		
		//0不能领1可领取
		private var _passReward: int;
		
		//0不能领1可领取
		private var _extraReward: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneID);
			//0不能领1可领取
			writeByte(_passReward);
			//0不能领1可领取
			writeByte(_extraReward);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneID = readInt();
			//0不能领1可领取
			_passReward = readByte();
			//0不能领1可领取
			_extraReward = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155145;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneID(): int{
			return _zoneID;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneID(value: int): void{
			this._zoneID = value;
		}
		
		/**
		 * get 0不能领1可领取
		 * @return 
		 */
		public function get passReward(): int{
			return _passReward;
		}
		
		/**
		 * set 0不能领1可领取
		 */
		public function set passReward(value: int): void{
			this._passReward = value;
		}
		
		/**
		 * get 0不能领1可领取
		 * @return 
		 */
		public function get extraReward(): int{
			return _extraReward;
		}
		
		/**
		 * set 0不能领1可领取
		 */
		public function set extraReward(value: int): void{
			this._extraReward = value;
		}
		
	}
}