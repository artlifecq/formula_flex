package com.rpgGame.netData.monster.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * BOSS详细信息
	 */
	public class WGBossInfo extends Bean {
	
		//BOSS唯一ID
		private var _monsterId: long;
		
		//boss的id
		private var _monsterModelId: int;
		
		//boss所在地图id
		private var _mapModelId: int;
		
		//boss所在线
		private var _line: int;
		
		//当前状态（小于0死亡（下次刷新时间剩余秒）大于等于0存活（血量万分比前端除10000显示））
		private var _status: int;
		
		//上次最后一刀击杀者id
		private var _killerId: long;
		
		//上次最后一刀击杀者Name
		private var _killerName: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//BOSS唯一ID
			writeLong(_monsterId);
			//boss的id
			writeInt(_monsterModelId);
			//boss所在地图id
			writeInt(_mapModelId);
			//boss所在线
			writeByte(_line);
			//当前状态（小于0死亡（下次刷新时间剩余秒）大于等于0存活（血量万分比前端除10000显示））
			writeInt(_status);
			//上次最后一刀击杀者id
			writeLong(_killerId);
			//上次最后一刀击杀者Name
			writeString(_killerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//BOSS唯一ID
			_monsterId = readLong();
			//boss的id
			_monsterModelId = readInt();
			//boss所在地图id
			_mapModelId = readInt();
			//boss所在线
			_line = readByte();
			//当前状态（小于0死亡（下次刷新时间剩余秒）大于等于0存活（血量万分比前端除10000显示））
			_status = readInt();
			//上次最后一刀击杀者id
			_killerId = readLong();
			//上次最后一刀击杀者Name
			_killerName = readString();
			return true;
		}
		
		/**
		 * get BOSS唯一ID
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set BOSS唯一ID
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get boss的id
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set boss的id
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get boss所在地图id
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set boss所在地图id
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get boss所在线
		 * @return 
		 */
		public function get line(): int{
			return _line;
		}
		
		/**
		 * set boss所在线
		 */
		public function set line(value: int): void{
			this._line = value;
		}
		
		/**
		 * get 当前状态（小于0死亡（下次刷新时间剩余秒）大于等于0存活（血量万分比前端除10000显示））
		 * @return 
		 */
		public function get status(): int{
			return _status;
		}
		
		/**
		 * set 当前状态（小于0死亡（下次刷新时间剩余秒）大于等于0存活（血量万分比前端除10000显示））
		 */
		public function set status(value: int): void{
			this._status = value;
		}
		
		/**
		 * get 上次最后一刀击杀者id
		 * @return 
		 */
		public function get killerId(): long{
			return _killerId;
		}
		
		/**
		 * set 上次最后一刀击杀者id
		 */
		public function set killerId(value: long): void{
			this._killerId = value;
		}
		
		/**
		 * get 上次最后一刀击杀者Name
		 * @return 
		 */
		public function get killerName(): String{
			return _killerName;
		}
		
		/**
		 * set 上次最后一刀击杀者Name
		 */
		public function set killerName(value: String): void{
			this._killerName = value;
		}
		
	}
}