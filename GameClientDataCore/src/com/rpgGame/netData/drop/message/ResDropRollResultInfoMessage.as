package com.rpgGame.netData.drop.message{
	import com.rpgGame.netData.drop.bean.RollResultInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * roll点结果信息
	 */
	public class ResDropRollResultInfoMessage extends Message {
	
		//唯一ID
		private var _uniqueId: long;
		
		//我的点数
		private var _myPoint: int;
		
		//最高点数
		private var _biggestPoint: int;
		
		//物品获得者
		private var _winner: String;
		
		//玩家ROLL点结果集
		private var _playerRollList: Vector.<RollResultInfo> = new Vector.<RollResultInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//唯一ID
			writeLong(_uniqueId);
			//我的点数
			writeByte(_myPoint);
			//最高点数
			writeByte(_biggestPoint);
			//物品获得者
			writeString(_winner);
			//玩家ROLL点结果集
			writeShort(_playerRollList.length);
			for (i = 0; i < _playerRollList.length; i++) {
				writeBean(_playerRollList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//唯一ID
			_uniqueId = readLong();
			//我的点数
			_myPoint = readByte();
			//最高点数
			_biggestPoint = readByte();
			//物品获得者
			_winner = readString();
			//玩家ROLL点结果集
			var playerRollList_length : int = readShort();
			for (i = 0; i < playerRollList_length; i++) {
				_playerRollList[i] = readBean(RollResultInfo) as RollResultInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 210102;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get uniqueId(): long{
			return _uniqueId;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set uniqueId(value: long): void{
			this._uniqueId = value;
		}
		
		/**
		 * get 我的点数
		 * @return 
		 */
		public function get myPoint(): int{
			return _myPoint;
		}
		
		/**
		 * set 我的点数
		 */
		public function set myPoint(value: int): void{
			this._myPoint = value;
		}
		
		/**
		 * get 最高点数
		 * @return 
		 */
		public function get biggestPoint(): int{
			return _biggestPoint;
		}
		
		/**
		 * set 最高点数
		 */
		public function set biggestPoint(value: int): void{
			this._biggestPoint = value;
		}
		
		/**
		 * get 物品获得者
		 * @return 
		 */
		public function get winner(): String{
			return _winner;
		}
		
		/**
		 * set 物品获得者
		 */
		public function set winner(value: String): void{
			this._winner = value;
		}
		
		/**
		 * get 玩家ROLL点结果集
		 * @return 
		 */
		public function get playerRollList(): Vector.<RollResultInfo>{
			return _playerRollList;
		}
		
		/**
		 * set 玩家ROLL点结果集
		 */
		public function set playerRollList(value: Vector.<RollResultInfo>): void{
			this._playerRollList = value;
		}
		
	}
}