package com.rpgGame.netData.achievement.message{
	import com.rpgGame.netData.achievement.bean.AchievementDataInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送成就基本信息
	 */
	public class ResSendAchievementDataInfoMessage extends Message {
	
		//当前成就等级
		private var _level: int;
		
		//当前等级是否已经领取奖励
		private var _getAward: int;
		
		//成就基本信息
		private var _achievementDataInfo: AchievementDataInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前成就等级
			writeInt(_level);
			//当前等级是否已经领取奖励
			writeByte(_getAward);
			//成就基本信息
			writeBean(_achievementDataInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前成就等级
			_level = readInt();
			//当前等级是否已经领取奖励
			_getAward = readByte();
			//成就基本信息
			_achievementDataInfo = readBean(AchievementDataInfo) as AchievementDataInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 153101;
		}
		
		/**
		 * get 当前成就等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 当前成就等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 当前等级是否已经领取奖励
		 * @return 
		 */
		public function get getAward(): int{
			return _getAward;
		}
		
		/**
		 * set 当前等级是否已经领取奖励
		 */
		public function set getAward(value: int): void{
			this._getAward = value;
		}
		
		/**
		 * get 成就基本信息
		 * @return 
		 */
		public function get achievementDataInfo(): AchievementDataInfo{
			return _achievementDataInfo;
		}
		
		/**
		 * set 成就基本信息
		 */
		public function set achievementDataInfo(value: AchievementDataInfo): void{
			this._achievementDataInfo = value;
		}
		
	}
}