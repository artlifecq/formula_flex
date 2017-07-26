package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗辅助购买消息
	 */
	public class ResExtraBuyMessage extends Message {
	
		//元宝购买次数
		private var _goldBuy: int;
		
		//礼金购买次数
		private var _cashBuy: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//元宝购买次数
			writeShort(_goldBuy);
			//礼金购买次数
			writeShort(_cashBuy);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//元宝购买次数
			_goldBuy = readShort();
			//礼金购买次数
			_cashBuy = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148112;
		}
		
		/**
		 * get 元宝购买次数
		 * @return 
		 */
		public function get goldBuy(): int{
			return _goldBuy;
		}
		
		/**
		 * set 元宝购买次数
		 */
		public function set goldBuy(value: int): void{
			this._goldBuy = value;
		}
		
		/**
		 * get 礼金购买次数
		 * @return 
		 */
		public function get cashBuy(): int{
			return _cashBuy;
		}
		
		/**
		 * set 礼金购买次数
		 */
		public function set cashBuy(value: int): void{
			this._cashBuy = value;
		}
		
	}
}