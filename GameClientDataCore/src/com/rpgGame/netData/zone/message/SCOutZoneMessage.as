package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 退出副本
	 */
	public class SCOutZoneMessage extends Message {
	
		//副本ID
		private var _zoneId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155138;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneId(): int{
			return _zoneId;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneId(value: int): void{
			this._zoneId = value;
		}
		
	}
}