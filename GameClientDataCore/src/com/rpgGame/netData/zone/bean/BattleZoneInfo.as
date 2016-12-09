package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 经典战役信息
	 */
	public class BattleZoneInfo extends Bean {
	
		//是否首次,1首次
		private var _isFirst: int;
		
		//副本模组ID
		private var _zoneModelid: int;
		
		//今日通关次数
		private var _crossnum: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否首次,1首次
			writeInt(_isFirst);
			//副本模组ID
			writeInt(_zoneModelid);
			//今日通关次数
			writeInt(_crossnum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否首次,1首次
			_isFirst = readInt();
			//副本模组ID
			_zoneModelid = readInt();
			//今日通关次数
			_crossnum = readInt();
			return true;
		}
		
		/**
		 * get 是否首次,1首次
		 * @return 
		 */
		public function get isFirst(): int{
			return _isFirst;
		}
		
		/**
		 * set 是否首次,1首次
		 */
		public function set isFirst(value: int): void{
			this._isFirst = value;
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
		 * get 今日通关次数
		 * @return 
		 */
		public function get crossnum(): int{
			return _crossnum;
		}
		
		/**
		 * set 今日通关次数
		 */
		public function set crossnum(value: int): void{
			this._crossnum = value;
		}
		
	}
}