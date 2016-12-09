package com.rpgGame.netData.achievement.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 达成某个成就
	 */
	public class ResSendFinishAchievementMessage extends Message {
	
		//成就等级
		private var _level: int;
		
		//成就ID
		private var _achievementId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//成就等级
			writeInt(_level);
			//成就ID
			writeInt(_achievementId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//成就等级
			_level = readInt();
			//成就ID
			_achievementId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 153102;
		}
		
		/**
		 * get 成就等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 成就等级
		 */
		public function set level(value: int): void{
			this._level = value;
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
		
	}
}