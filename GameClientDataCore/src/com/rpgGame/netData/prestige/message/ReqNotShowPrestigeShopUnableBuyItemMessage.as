package com.rpgGame.netData.prestige.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 不显示声望商店中不能购买的物品
	 */
	public class ReqNotShowPrestigeShopUnableBuyItemMessage extends Message {
	
		//0显示，1不显示
		private var _notShow: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0显示，1不显示
			writeByte(_notShow);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0显示，1不显示
			_notShow = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 212205;
		}
		
		/**
		 * get 0显示，1不显示
		 * @return 
		 */
		public function get notShow(): int{
			return _notShow;
		}
		
		/**
		 * set 0显示，1不显示
		 */
		public function set notShow(value: int): void{
			this._notShow = value;
		}
		
	}
}