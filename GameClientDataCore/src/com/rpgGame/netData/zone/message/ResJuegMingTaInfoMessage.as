package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回绝命塔信息
	 */
	public class ResJuegMingTaInfoMessage extends Message {
	
		//历史已通关层数
		private var _historyLayer: int;
		
		//今日已通关层数
		private var _dayLayer: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//历史已通关层数
			writeShort(_historyLayer);
			//今日已通关层数
			writeShort(_dayLayer);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//历史已通关层数
			_historyLayer = readShort();
			//今日已通关层数
			_dayLayer = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155109;
		}
		
		/**
		 * get 历史已通关层数
		 * @return 
		 */
		public function get historyLayer(): int{
			return _historyLayer;
		}
		
		/**
		 * set 历史已通关层数
		 */
		public function set historyLayer(value: int): void{
			this._historyLayer = value;
		}
		
		/**
		 * get 今日已通关层数
		 * @return 
		 */
		public function get dayLayer(): int{
			return _dayLayer;
		}
		
		/**
		 * set 今日已通关层数
		 */
		public function set dayLayer(value: int): void{
			this._dayLayer = value;
		}
		
	}
}