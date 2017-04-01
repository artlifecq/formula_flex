package com.rpgGame.netData.achievement.bean{
	import com.rpgGame.netData.achievement.bean.AchievementInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 成就基本信息
	 */
	public class AchievementDataInfo extends Bean {
	
		//成就等级
		private var _level: int;
		
		//单个成就信息列表
		private var _achievementInfolist: Vector.<AchievementInfo> = new Vector.<AchievementInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//成就等级
			writeInt(_level);
			//单个成就信息列表
			writeShort(_achievementInfolist.length);
			for (var i: int = 0; i < _achievementInfolist.length; i++) {
				writeBean(_achievementInfolist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//成就等级
			_level = readInt();
			//单个成就信息列表
			var achievementInfolist_length : int = readShort();
			for (var i: int = 0; i < achievementInfolist_length; i++) {
				_achievementInfolist[i] = readBean(AchievementInfo) as AchievementInfo;
			}
			return true;
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
		 * get 单个成就信息列表
		 * @return 
		 */
		public function get achievementInfolist(): Vector.<AchievementInfo>{
			return _achievementInfolist;
		}
		
		/**
		 * set 单个成就信息列表
		 */
		public function set achievementInfolist(value: Vector.<AchievementInfo>): void{
			this._achievementInfolist = value;
		}
		
	}
}