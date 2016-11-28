package com.rpgGame.netData.achievement.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求成就奖励
	 */
	public class ReqSendGetAchievementAwardMessage extends Message {
	
		//当前成就等级(后端验证)
		private var _level: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前成就等级(后端验证)
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前成就等级(后端验证)
			_level = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 153202;
		}
		
		/**
		 * get 当前成就等级(后端验证)
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 当前成就等级(后端验证)
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}