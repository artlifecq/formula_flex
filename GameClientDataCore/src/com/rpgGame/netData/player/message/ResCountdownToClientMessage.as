package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 展示倒计时状态
	 */
	public class ResCountdownToClientMessage extends Message {
	
		//角色ID
		private var _playerId: int;
		
		//倒计时时间(秒)
		private var _time: int;
		
		//倒计时类型1,是头上冒字
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色ID
			writeShort(_playerId);
			//倒计时时间(秒)
			writeInt(_time);
			//倒计时类型1,是头上冒字
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色ID
			_playerId = readShort();
			//倒计时时间(秒)
			_time = readInt();
			//倒计时类型1,是头上冒字
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103122;
		}
		
		/**
		 * get 角色ID
		 * @return 
		 */
		public function get playerId(): int{
			return _playerId;
		}
		
		/**
		 * set 角色ID
		 */
		public function set playerId(value: int): void{
			this._playerId = value;
		}
		
		/**
		 * get 倒计时时间(秒)
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 倒计时时间(秒)
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
		/**
		 * get 倒计时类型1,是头上冒字
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 倒计时类型1,是头上冒字
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}