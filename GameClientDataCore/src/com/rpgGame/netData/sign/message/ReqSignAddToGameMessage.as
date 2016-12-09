package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求补签
	 */
	public class ReqSignAddToGameMessage extends Message {
	
		//补签号数
		private var _day: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//补签号数
			writeInt(_day);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//补签号数
			_day = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154204;
		}
		
		/**
		 * get 补签号数
		 * @return 
		 */
		public function get day(): int{
			return _day;
		}
		
		/**
		 * set 补签号数
		 */
		public function set day(value: int): void{
			this._day = value;
		}
		
	}
}