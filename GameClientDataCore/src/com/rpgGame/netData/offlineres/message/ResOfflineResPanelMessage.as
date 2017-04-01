package com.rpgGame.netData.offlineres.message{
	import com.rpgGame.netData.offlineres.bean.OfflineResZoneBackInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 离线资源追回面板信息消息
	 */
	public class ResOfflineResPanelMessage extends Message {
	
		//副本追回面板
		private var _zoneBackInfo: Vector.<OfflineResZoneBackInfo> = new Vector.<OfflineResZoneBackInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//副本追回面板
			writeShort(_zoneBackInfo.length);
			for (i = 0; i < _zoneBackInfo.length; i++) {
				writeBean(_zoneBackInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//副本追回面板
			var zoneBackInfo_length : int = readShort();
			for (i = 0; i < zoneBackInfo_length; i++) {
				_zoneBackInfo[i] = readBean(OfflineResZoneBackInfo) as OfflineResZoneBackInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209102;
		}
		
		/**
		 * get 副本追回面板
		 * @return 
		 */
		public function get zoneBackInfo(): Vector.<OfflineResZoneBackInfo>{
			return _zoneBackInfo;
		}
		
		/**
		 * set 副本追回面板
		 */
		public function set zoneBackInfo(value: Vector.<OfflineResZoneBackInfo>): void{
			this._zoneBackInfo = value;
		}
		
	}
}