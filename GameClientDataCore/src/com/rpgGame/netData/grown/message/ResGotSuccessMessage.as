package com.rpgGame.netData.grown.message{
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
	public class ResGotSuccessMessage extends Message {
	
		//领取的等级
		private var _level: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//领取的等级
			writeInt(_level);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//领取的等级
			_level = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 192102;
		}
		
		/**
		 * get 领取的等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 领取的等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
	}
}