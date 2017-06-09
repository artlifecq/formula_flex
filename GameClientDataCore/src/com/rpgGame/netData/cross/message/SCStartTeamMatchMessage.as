package com.rpgGame.netData.cross.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 服务器开始匹配
	 */
	public class SCStartTeamMatchMessage extends Message {
	
		//匹配副本
		private var _zoneModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//匹配副本
			writeInt(_zoneModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//匹配副本
			_zoneModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250265;
		}
		
		/**
		 * get 匹配副本
		 * @return 
		 */
		public function get zoneModelId(): int{
			return _zoneModelId;
		}
		
		/**
		 * set 匹配副本
		 */
		public function set zoneModelId(value: int): void{
			this._zoneModelId = value;
		}
		
	}
}