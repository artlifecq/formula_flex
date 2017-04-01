package com.rpgGame.netData.achievement.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求成就信息
	 */
	public class ReqSendAchievementDataInfoMessage extends Message {
	
		//成就等级(需要获取哪级的信息就发哪级)
		private var _level: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//成就等级(需要获取哪级的信息就发哪级)
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//成就等级(需要获取哪级的信息就发哪级)
			_level = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 153201;
		}
		
		/**
		 * get 成就等级(需要获取哪级的信息就发哪级)
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 成就等级(需要获取哪级的信息就发哪级)
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}