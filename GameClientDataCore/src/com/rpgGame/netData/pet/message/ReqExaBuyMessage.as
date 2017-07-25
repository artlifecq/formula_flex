package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗辅助购买
	 */
	public class ReqExaBuyMessage extends Message {
	
		//1元宝,2礼金
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1元宝,2礼金
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1元宝,2礼金
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148207;
		}
		
		/**
		 * get 1元宝,2礼金
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1元宝,2礼金
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}