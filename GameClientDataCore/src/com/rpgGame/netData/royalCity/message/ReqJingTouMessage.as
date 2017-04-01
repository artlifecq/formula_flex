package com.rpgGame.netData.royalCity.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求竞投消息
	 */
	public class ReqJingTouMessage extends Message {
	
		//竞投玩家ID
		private var _playerId: long;
		
		//竞投城市ID
		private var _cityId: int;
		
		//竞投资财数量
		private var _ziCai: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//竞投玩家ID
			writeLong(_playerId);
			//竞投城市ID
			writeInt(_cityId);
			//竞投资财数量
			writeInt(_ziCai);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//竞投玩家ID
			_playerId = readLong();
			//竞投城市ID
			_cityId = readInt();
			//竞投资财数量
			_ziCai = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 222004;
		}
		
		/**
		 * get 竞投玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 竞投玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 竞投城市ID
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 竞投城市ID
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
		/**
		 * get 竞投资财数量
		 * @return 
		 */
		public function get ziCai(): int{
			return _ziCai;
		}
		
		/**
		 * set 竞投资财数量
		 */
		public function set ziCai(value: int): void{
			this._ziCai = value;
		}
		
	}
}