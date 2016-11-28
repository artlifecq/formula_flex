package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用前端请求进入副本
	 */
	public class ReqZoneCommonEnterMessage extends Message {
	
		//副本ID
		private var _zoneModelid: int;
		
		//额外数据
		private var _extradata: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本ID
			writeInt(_zoneModelid);
			//额外数据
			writeInt(_extradata);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本ID
			_zoneModelid = readInt();
			//额外数据
			_extradata = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155207;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 额外数据
		 * @return 
		 */
		public function get extradata(): int{
			return _extradata;
		}
		
		/**
		 * set 额外数据
		 */
		public function set extradata(value: int): void{
			this._extradata = value;
		}
		
	}
}