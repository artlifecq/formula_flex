package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用前端请求副本面板信息
	 */
	public class ReqZoneCommonPanelInfoMessage extends Message {
	
		//副本ID
		private var _zoneModelids: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//副本ID
			writeShort(_zoneModelids.length);
			for (i = 0; i < _zoneModelids.length; i++) {
				writeInt(_zoneModelids[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//副本ID
			var zoneModelids_length : int = readShort();
			for (i = 0; i < zoneModelids_length; i++) {
				_zoneModelids[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155209;
		}
		
		/**
		 * get 副本ID
		 * @return 
		 */
		public function get zoneModelids(): Vector.<int>{
			return _zoneModelids;
		}
		
		/**
		 * set 副本ID
		 */
		public function set zoneModelids(value: Vector.<int>): void{
			this._zoneModelids = value;
		}
		
	}
}