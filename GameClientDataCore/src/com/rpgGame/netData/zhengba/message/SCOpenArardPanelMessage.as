package com.rpgGame.netData.zhengba.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 点开面板返回
	 */
	public class SCOpenArardPanelMessage extends Message {
	
		//获胜场次
		private var _win: int;
		
		//失败场次
		private var _defeat: int;
		
		//累计声望值
		private var _reputation: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//获胜场次
			writeInt(_win);
			//失败场次
			writeInt(_defeat);
			//累计声望值
			writeInt(_reputation);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//获胜场次
			_win = readInt();
			//失败场次
			_defeat = readInt();
			//累计声望值
			_reputation = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127109;
		}
		
		/**
		 * get 获胜场次
		 * @return 
		 */
		public function get win(): int{
			return _win;
		}
		
		/**
		 * set 获胜场次
		 */
		public function set win(value: int): void{
			this._win = value;
		}
		
		/**
		 * get 失败场次
		 * @return 
		 */
		public function get defeat(): int{
			return _defeat;
		}
		
		/**
		 * set 失败场次
		 */
		public function set defeat(value: int): void{
			this._defeat = value;
		}
		
		/**
		 * get 累计声望值
		 * @return 
		 */
		public function get reputation(): int{
			return _reputation;
		}
		
		/**
		 * set 累计声望值
		 */
		public function set reputation(value: int): void{
			this._reputation = value;
		}
		
	}
}