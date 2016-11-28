package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求进入王城争霸活动
	 */
	public class ReqJoinCityWarMessage extends Message {
	
		//进入城市ID
		private var _cityId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//进入城市ID
			writeInt(_cityId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//进入城市ID
			_cityId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222006;
		}
		
		/**
		 * get 进入城市ID
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 进入城市ID
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
	}
}