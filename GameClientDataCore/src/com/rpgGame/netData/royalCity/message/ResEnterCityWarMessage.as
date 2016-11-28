package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 进入王城争霸副本
	 */
	public class ResEnterCityWarMessage extends Message {
	
		//王城类型
		private var _cityType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//王城类型
			writeInt(_cityType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//王城类型
			_cityType = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222506;
		}
		
		/**
		 * get 王城类型
		 * @return 
		 */
		public function get cityType(): int{
			return _cityType;
		}
		
		/**
		 * set 王城类型
		 */
		public function set cityType(value: int): void{
			this._cityType = value;
		}
		
	}
}