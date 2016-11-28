package com.rpgGame.netData.activities.message{
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领奖返回
	 */
	public class ResActivitiesGetRewardInfoMessage extends Message {
	
		//活动信息
		private var _info: ActivityInfo;
		
		//获得的奖励
		private var _rewards: Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>();
		//领取次数
		private var _times: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//活动信息
			writeBean(_info);
			//获得的奖励
			writeShort(_rewards.length);
			for (i = 0; i < _rewards.length; i++) {
				writeBean(_rewards[i]);
			}
			//领取次数
			writeInt(_times);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//活动信息
			_info = readBean(ActivityInfo) as ActivityInfo;
			//获得的奖励
			var rewards_length : int = readShort();
			for (i = 0; i < rewards_length; i++) {
				_rewards[i] = readBean(com.rpgGame.netData.backpack.bean.TempItemInfo) as com.rpgGame.netData.backpack.bean.TempItemInfo;
			}
			//领取次数
			_times = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 181102;
		}
		
		/**
		 * get 活动信息
		 * @return 
		 */
		public function get info(): ActivityInfo{
			return _info;
		}
		
		/**
		 * set 活动信息
		 */
		public function set info(value: ActivityInfo): void{
			this._info = value;
		}
		
		/**
		 * get 获得的奖励
		 * @return 
		 */
		public function get rewards(): Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>{
			return _rewards;
		}
		
		/**
		 * set 获得的奖励
		 */
		public function set rewards(value: Vector.<com.rpgGame.netData.backpack.bean.TempItemInfo>): void{
			this._rewards = value;
		}
		
		/**
		 * get 领取次数
		 * @return 
		 */
		public function get times(): int{
			return _times;
		}
		
		/**
		 * set 领取次数
		 */
		public function set times(value: int): void{
			this._times = value;
		}
		
	}
}