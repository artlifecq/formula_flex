package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求使用小飞鞋
	 */
	public class ReqSmallFlyShoesMessage extends Message {
	
		//是否自动扣除元宝（0否1是）
		private var _autoGold: int;
		
		//目的地图model
		private var _mapModel: int;
		
		//目的地图线（0是自动分配线路）
		private var _mapLine: int;
		
		//目的坐标坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否自动扣除元宝（0否1是）
			writeByte(_autoGold);
			//目的地图model
			writeInt(_mapModel);
			//目的地图线（0是自动分配线路）
			writeInt(_mapLine);
			//目的坐标坐标
			writeBean(_position);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否自动扣除元宝（0否1是）
			_autoGold = readByte();
			//目的地图model
			_mapModel = readInt();
			//目的地图线（0是自动分配线路）
			_mapLine = readInt();
			//目的坐标坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101216;
		}
		
		/**
		 * get 是否自动扣除元宝（0否1是）
		 * @return 
		 */
		public function get autoGold(): int{
			return _autoGold;
		}
		
		/**
		 * set 是否自动扣除元宝（0否1是）
		 */
		public function set autoGold(value: int): void{
			this._autoGold = value;
		}
		
		/**
		 * get 目的地图model
		 * @return 
		 */
		public function get mapModel(): int{
			return _mapModel;
		}
		
		/**
		 * set 目的地图model
		 */
		public function set mapModel(value: int): void{
			this._mapModel = value;
		}
		
		/**
		 * get 目的地图线（0是自动分配线路）
		 * @return 
		 */
		public function get mapLine(): int{
			return _mapLine;
		}
		
		/**
		 * set 目的地图线（0是自动分配线路）
		 */
		public function set mapLine(value: int): void{
			this._mapLine = value;
		}
		
		/**
		 * get 目的坐标坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 目的坐标坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
	}
}