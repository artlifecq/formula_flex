package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 王城争霸活动开始
	 */
	public class ResCityWarStartMessage extends Message {
	
		//城市编号
		private var _cityId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//城市编号
			writeInt(_cityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//城市编号
			_cityId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222507;
		}
		
		/**
		 * get 城市编号
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 城市编号
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
	}
}