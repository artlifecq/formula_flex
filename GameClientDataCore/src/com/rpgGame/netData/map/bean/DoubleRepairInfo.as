package com.rpgGame.netData.map.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 双修信息
	 */
	public class DoubleRepairInfo extends Bean {
	
		//玩家ID
		private var _sourceid: long;
		
		//玩家ID
		private var _targetid: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_sourceid);
			//玩家ID
			writeLong(_targetid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_sourceid = readLong();
			//玩家ID
			_targetid = readLong();
			return true;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get sourceid(): long{
			return _sourceid;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set sourceid(value: long): void{
			this._sourceid = value;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get targetid(): long{
			return _targetid;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set targetid(value: long): void{
			this._targetid = value;
		}
		
	}
}