package com.rpgGame.netData.pet.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 美人副本状态消息
	 */
	public class ResPetZoneResultMessage extends Message {
	
		//0失败1成功
		private var _success: int;
		
		//当前关卡
		private var _level: int;
		
		//倒计时
		private var _time: int;
		
		//美人ID
		private var _petId: int;
		
		//副本ID
		private var _zoneModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0失败1成功
			writeByte(_success);
			//当前关卡
			writeByte(_level);
			//倒计时
			writeInt(_time);
			//美人ID
			writeInt(_petId);
			//副本ID
			writeInt(_zoneModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0失败1成功
			_success = readByte();
			//当前关卡
			_level = readByte();
			//倒计时
			_time = readInt();
			//美人ID
			_petId = readInt();
			//副本ID
			_zoneModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 148111;
		}
		
		/**
		 * get 0失败1成功
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 0失败1成功
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
		/**
		 * get 当前关卡
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 当前关卡
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 倒计时
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 倒计时
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 美人ID
		 * @return 
		 */
		public function get petId(): int{
			return _petId;
		}
		
		/**
		 * set 美人ID
		 */
		public function set petId(value: int): void{
			this._petId = value;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
	}
}