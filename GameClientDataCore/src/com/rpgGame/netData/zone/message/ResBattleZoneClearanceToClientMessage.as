package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回前端战役副本通关
	 */
	public class ResBattleZoneClearanceToClientMessage extends Message {
	
		//副本模组ID
		private var _zoneModelid: int;
		
		//通关用时
		private var _time: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模组ID
			writeInt(_zoneModelid);
			//通关用时
			writeInt(_time);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模组ID
			_zoneModelid = readInt();
			//通关用时
			_time = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155103;
		}
		
		/**
		 * get 副本模组ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本模组ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 通关用时
		 * @return 
		 */
		public function get time(): int{
			return _time;
		}
		
		/**
		 * set 通关用时
		 */
		public function set time(value: int): void{
			this._time = value;
		}
		
	}
}