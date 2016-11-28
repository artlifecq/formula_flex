package com.rpgGame.netData.achievement.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 单个成就信息
	 */
	public class AchievementInfo extends Bean {
	
		//成就ID
		private var _achievementId: int;
		
		//当前完成度
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//成就ID
			writeInt(_achievementId);
			//当前完成度
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//成就ID
			_achievementId = readInt();
			//当前完成度
			_value = readInt();
			return true;
		}
		
		/**
		 * get 成就ID
		 * @return 
		 */
		public function get achievementId(): int{
			return _achievementId;
		}
		
		/**
		 * set 成就ID
		 */
		public function set achievementId(value: int): void{
			this._achievementId = value;
		}
		
		/**
		 * get 当前完成度
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 当前完成度
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}