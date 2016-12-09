package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求我的充值信息
	 */
	public class ResRechargeInfoMessage extends Message {
	
		//当月充值
		private var _month: int;
		
		//总充值
		private var _all: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当月充值
			writeInt(_month);
			//总充值
			writeInt(_all);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当月充值
			_month = readInt();
			//总充值
			_all = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103123;
		}
		
		/**
		 * get 当月充值
		 * @return 
		 */
		public function get month(): int{
			return _month;
		}
		
		/**
		 * set 当月充值
		 */
		public function set month(value: int): void{
			this._month = value;
		}
		
		/**
		 * get 总充值
		 * @return 
		 */
		public function get all(): int{
			return _all;
		}
		
		/**
		 * set 总充值
		 */
		public function set all(value: int): void{
			this._all = value;
		}
		
	}
}