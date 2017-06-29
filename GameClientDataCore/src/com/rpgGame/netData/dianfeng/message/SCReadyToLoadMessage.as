package com.rpgGame.netData.dianfeng.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 开始准备进入比赛
	 */
	public class SCReadyToLoadMessage extends Message {
	
		//准备时间 秒
		private var _delayTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//准备时间 秒
			writeInt(_delayTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//准备时间 秒
			_delayTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128102;
		}
		
		/**
		 * get 准备时间 秒
		 * @return 
		 */
		public function get delayTime(): int{
			return _delayTime;
		}
		
		/**
		 * set 准备时间 秒
		 */
		public function set delayTime(value: int): void{
			this._delayTime = value;
		}
		
	}
}