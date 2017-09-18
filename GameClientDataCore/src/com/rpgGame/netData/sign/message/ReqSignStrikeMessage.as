package com.rpgGame.netData.sign.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 提前签到
	 */
	public class ReqSignStrikeMessage extends Message {
	
		//提前签那一天(号)
		private var _strikeDday: int;
		
		//月份
		private var _strikeMonth: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//提前签那一天(号)
			writeInt(_strikeDday);
			//月份
			writeInt(_strikeMonth);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//提前签那一天(号)
			_strikeDday = readInt();
			//月份
			_strikeMonth = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 154205;
		}
		
		/**
		 * get 提前签那一天(号)
		 * @return 
		 */
		public function get strikeDday(): int{
			return _strikeDday;
		}
		
		/**
		 * set 提前签那一天(号)
		 */
		public function set strikeDday(value: int): void{
			this._strikeDday = value;
		}
		
		/**
		 * get 月份
		 * @return 
		 */
		public function get strikeMonth(): int{
			return _strikeMonth;
		}
		
		/**
		 * set 月份
		 */
		public function set strikeMonth(value: int): void{
			this._strikeMonth = value;
		}
		
	}
}