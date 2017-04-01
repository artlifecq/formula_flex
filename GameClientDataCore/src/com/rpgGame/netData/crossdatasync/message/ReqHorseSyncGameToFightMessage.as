package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 坐骑数据同步(覆盖到跨服)
	 */
	public class ReqHorseSyncGameToFightMessage extends Message {
	
		//坐骑数据
		private var _data: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑数据
			writeString(_data);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑数据
			_data = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251260;
		}
		
		/**
		 * get 坐骑数据
		 * @return 
		 */
		public function get data(): String{
			return _data;
		}
		
		/**
		 * set 坐骑数据
		 */
		public function set data(value: String): void{
			this._data = value;
		}
		
	}
}