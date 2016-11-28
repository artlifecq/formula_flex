package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通用副本面板信息
	 */
	public class ZoneCommonPanelInfo extends Bean {
	
		//副本模板ID
		private var _zoneModelid: int;
		
		//限时活动剩余时间（秒）
		private var _limiTtime: int;
		
		//已通关波数
		private var _passdLevel: int;
		
		//剩余进入次数
		private var _canResetCount: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//副本模板ID
			writeInt(_zoneModelid);
			//限时活动剩余时间（秒）
			writeInt(_limiTtime);
			//已通关波数
			writeInt(_passdLevel);
			//剩余进入次数
			writeByte(_canResetCount);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//副本模板ID
			_zoneModelid = readInt();
			//限时活动剩余时间（秒）
			_limiTtime = readInt();
			//已通关波数
			_passdLevel = readInt();
			//剩余进入次数
			_canResetCount = readByte();
			return true;
		}
		
		/**
		 * get 副本模板ID
		 * @return 
		 */
		public function get zoneModelid(): int{
			return _zoneModelid;
		}
		
		/**
		 * set 副本模板ID
		 */
		public function set zoneModelid(value: int): void{
			this._zoneModelid = value;
		}
		
		/**
		 * get 限时活动剩余时间（秒）
		 * @return 
		 */
		public function get limiTtime(): int{
			return _limiTtime;
		}
		
		/**
		 * set 限时活动剩余时间（秒）
		 */
		public function set limiTtime(value: int): void{
			this._limiTtime = value;
		}
		
		/**
		 * get 已通关波数
		 * @return 
		 */
		public function get passdLevel(): int{
			return _passdLevel;
		}
		
		/**
		 * set 已通关波数
		 */
		public function set passdLevel(value: int): void{
			this._passdLevel = value;
		}
		
		/**
		 * get 剩余进入次数
		 * @return 
		 */
		public function get canResetCount(): int{
			return _canResetCount;
		}
		
		/**
		 * set 剩余进入次数
		 */
		public function set canResetCount(value: int): void{
			this._canResetCount = value;
		}
		
	}
}