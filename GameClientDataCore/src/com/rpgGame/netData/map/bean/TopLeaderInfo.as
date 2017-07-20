package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.structs.Position;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 排行榜雕像
	 */
	public class TopLeaderInfo extends Bean {
		
		//唯一id
		private var _id: long;
		
		//模型id
		private var _modelId: int;
		
		//玩家id
		private var _playerId: long;
		
		//玩家名字
		private var _playerName: String;
		
		//排行榜类型
		private var _topType: int;
		
		//怪物所在坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一id
			writeLong(_id);
			//模型id
			writeInt(_modelId);
			//玩家id
			writeLong(_playerId);
			//玩家名字
			writeString(_playerName);
			//排行榜类型
			writeInt(_topType);
			//怪物所在坐标
			writeBean(_position);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一id
			_id = readLong();
			//模型id
			_modelId = readInt();
			//玩家id
			_playerId = readLong();
			//玩家名字
			_playerName = readString();
			//排行榜类型
			_topType = readInt();
			//怪物所在坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get 唯一id
		 * @return 
		 */
		public function get id(): long{
			return _id;
		}
		
		/**
		 * set 唯一id
		 */
		public function set id(value: long): void{
			this._id = value;
		}
		
		/**
		 * get 模型id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 模型id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 排行榜类型
		 * @return 
		 */
		public function get topType(): int{
			return _topType;
		}
		
		/**
		 * set 排行榜类型
		 */
		public function set topType(value: int): void{
			this._topType = value;
		}
		
		/**
		 * get 怪物所在坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 怪物所在坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
	}
}