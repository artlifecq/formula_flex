package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.structs.Position;
	
	
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
		private var _id: int;
		
		//模型id
		private var _modelId: int;
		
		//玩家名字
		private var _playerName: String;
		
		//排行榜类型
		private var _topType: int;
		
		//怪物所在坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		
		//称号
		private var _title: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一id
			writeShort(_id);
			//模型id
			writeInt(_modelId);
			//玩家名字
			writeString(_playerName);
			//排行榜类型
			writeInt(_topType);
			//怪物所在坐标
			writeBean(_position);
			//称号
			writeInt(_title);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一id
			_id = readShort();
			//模型id
			_modelId = readInt();
			//玩家名字
			_playerName = readString();
			//排行榜类型
			_topType = readInt();
			//怪物所在坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//称号
			_title = readInt();
			return true;
		}
		
		/**
		 * get 唯一id
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 唯一id
		 */
		public function set id(value: int): void{
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
		/**
		 * get 称号
		 * @return 
		 */
		public function get title(): int{
			return _title;
		}
		
		/**
		 * set 称号
		 */
		public function set title(value: int): void{
			this._title = value;
		}
	}
}