package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 拾取
	 */
	public class ReqTakeUpMessage extends Message {
	
		//掉落ID
		private var _goodsId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//掉落ID
			writeShort(_goodsId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//掉落ID
			_goodsId = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108211;
		}
		
		/**
		 * get 掉落ID
		 * @return 
		 */
		public function get goodsId(): int{
			return _goodsId;
		}
		
		/**
		 * set 掉落ID
		 */
		public function set goodsId(value: int): void{
			this._goodsId = value;
		}
		
	}
}