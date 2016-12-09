package com.rpgGame.netData.royalCity.message{
	import com.rpgGame.netData.royalCity.bean.CityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 城市信息
	 */
	public class ResCityInfosMessage extends Message {
	
		//征战城市ID
		private var _zhengCityId: int;
		
		//开启倒计时
		private var _remainTime: int;
		
		//城市信息列表
		private var _cityInfos: Vector.<CityInfo> = new Vector.<CityInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//征战城市ID
			writeInt(_zhengCityId);
			//开启倒计时
			writeInt(_remainTime);
			//城市信息列表
			writeShort(_cityInfos.length);
			for (i = 0; i < _cityInfos.length; i++) {
				writeBean(_cityInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//征战城市ID
			_zhengCityId = readInt();
			//开启倒计时
			_remainTime = readInt();
			//城市信息列表
			var cityInfos_length : int = readShort();
			for (i = 0; i < cityInfos_length; i++) {
				_cityInfos[i] = readBean(CityInfo) as CityInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222501;
		}
		
		/**
		 * get 征战城市ID
		 * @return 
		 */
		public function get zhengCityId(): int{
			return _zhengCityId;
		}
		
		/**
		 * set 征战城市ID
		 */
		public function set zhengCityId(value: int): void{
			this._zhengCityId = value;
		}
		
		/**
		 * get 开启倒计时
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 开启倒计时
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
		/**
		 * get 城市信息列表
		 * @return 
		 */
		public function get cityInfos(): Vector.<CityInfo>{
			return _cityInfos;
		}
		
		/**
		 * set 城市信息列表
		 */
		public function set cityInfos(value: Vector.<CityInfo>): void{
			this._cityInfos = value;
		}
		
	}
}