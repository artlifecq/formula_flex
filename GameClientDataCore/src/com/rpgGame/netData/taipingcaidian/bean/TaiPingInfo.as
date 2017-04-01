package com.rpgGame.netData.taipingcaidian.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 太平财典面板数据
	 */
	public class TaiPingInfo extends Bean {
	
		//NPC模版ID
		private var _npcModelId: int;
		
		//所在地图ID
		private var _mapModelId: int;
		
		//到期时间(秒)
		private var _times: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//NPC模版ID
			writeInt(_npcModelId);
			//所在地图ID
			writeInt(_mapModelId);
			//到期时间(秒)
			writeInt(_times);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//NPC模版ID
			_npcModelId = readInt();
			//所在地图ID
			_mapModelId = readInt();
			//到期时间(秒)
			_times = readInt();
			return true;
		}
		
		/**
		 * get NPC模版ID
		 * @return 
		 */
		public function get npcModelId(): int{
			return _npcModelId;
		}
		
		/**
		 * set NPC模版ID
		 */
		public function set npcModelId(value: int): void{
			this._npcModelId = value;
		}
		
		/**
		 * get 所在地图ID
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 所在地图ID
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get 到期时间(秒)
		 * @return 
		 */
		public function get times(): int{
			return _times;
		}
		
		/**
		 * set 到期时间(秒)
		 */
		public function set times(value: int): void{
			this._times = value;
		}
		
	}
}