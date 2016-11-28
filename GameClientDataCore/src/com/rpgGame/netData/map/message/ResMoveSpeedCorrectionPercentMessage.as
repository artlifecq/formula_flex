package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 移动速度修正万分比参数
	 */
	public class ResMoveSpeedCorrectionPercentMessage extends Message {
	
		//修正的万分比
		private var _percent: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//修正的万分比
			writeInt(_percent);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//修正的万分比
			_percent = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101139;
		}
		
		/**
		 * get 修正的万分比
		 * @return 
		 */
		public function get percent(): int{
			return _percent;
		}
		
		/**
		 * set 修正的万分比
		 */
		public function set percent(value: int): void{
			this._percent = value;
		}
		
	}
}