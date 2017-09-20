package com.rpgGame.netData.zone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用前端请求退出副本
	 */
	public class ReqZoneCommonQuitMessage extends Message {
	
		//地图唯一id
		private var _verityMapId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//地图唯一id
			writeLong(_verityMapId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//地图唯一id
			_verityMapId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155208;
		}
		
		/**
		 * get 地图唯一id
		 * @return 
		 */
		public function get verityMapId(): long{
			return _verityMapId;
		}
		
		/**
		 * set 地图唯一id
		 */
		public function set verityMapId(value: long): void{
			this._verityMapId = value;
		}
		
	}
}