package com.rpgGame.netData.gameactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 等级礼包在线提示领奖
	 */
	public class ResRewardNoticeMessage extends Message {
	
		//领取等级
		private var _level: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取等级
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取等级
			_level = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 192103;
		}
		
		/**
		 * get 领取等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 领取等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}