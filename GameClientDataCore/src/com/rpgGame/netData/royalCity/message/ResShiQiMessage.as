package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 当前士气值
	 */
	public class ResShiQiMessage extends Message {
	
		//士气值
		private var _shiQi: int;
		
		//副本剩余时间（秒）
		private var _remianTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//士气值
			writeInt(_shiQi);
			//副本剩余时间（秒）
			writeInt(_remianTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//士气值
			_shiQi = readInt();
			//副本剩余时间（秒）
			_remianTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222503;
		}
		
		/**
		 * get 士气值
		 * @return 
		 */
		public function get shiQi(): int{
			return _shiQi;
		}
		
		/**
		 * set 士气值
		 */
		public function set shiQi(value: int): void{
			this._shiQi = value;
		}
		
		/**
		 * get 副本剩余时间（秒）
		 * @return 
		 */
		public function get remianTime(): int{
			return _remianTime;
		}
		
		/**
		 * set 副本剩余时间（秒）
		 */
		public function set remianTime(value: int): void{
			this._remianTime = value;
		}
		
	}
}