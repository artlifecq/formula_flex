package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 经典战役领取奖励
	 */
	public class ReqBattleZoneaWardToGameMessage extends Message {
	
		//副本模组ID
		private var _zoneModelid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模组ID
			writeInt(_zoneModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模组ID
			_zoneModelid = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155204;
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
		
	}
}