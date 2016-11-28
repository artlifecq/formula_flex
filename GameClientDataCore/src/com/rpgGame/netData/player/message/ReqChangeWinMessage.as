package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 改变游戏窗口大小
	 */
	public class ReqChangeWinMessage extends Message {
	
		//窗口高像素
		private var _win_high: int;
		
		//窗口宽像素
		private var _win_width: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//窗口高像素
			writeInt(_win_high);
			//窗口宽像素
			writeInt(_win_width);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//窗口高像素
			_win_high = readInt();
			//窗口宽像素
			_win_width = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103211;
		}
		
		/**
		 * get 窗口高像素
		 * @return 
		 */
		public function get win_high(): int{
			return _win_high;
		}
		
		/**
		 * set 窗口高像素
		 */
		public function set win_high(value: int): void{
			this._win_high = value;
		}
		
		/**
		 * get 窗口宽像素
		 * @return 
		 */
		public function get win_width(): int{
			return _win_width;
		}
		
		/**
		 * set 窗口宽像素
		 */
		public function set win_width(value: int): void{
			this._win_width = value;
		}
		
	}
}