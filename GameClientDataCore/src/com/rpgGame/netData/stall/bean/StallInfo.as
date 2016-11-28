package com.rpgGame.netData.stall.bean{
	import com.rpgGame.netData.stall.bean.StallGoodsInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 摊位信息
	 */
	public class StallInfo extends Bean {
	
		//角色Id
		private var _playerId: long;
		
		//角色名
		private var _playerName: String;
		
		//摊位名字
		private var _stallName: String;
		
		//摊位索引
		private var _stallIndex: int;
		
		//摊位物品信息列表
		private var _stallgoodsinfo: Vector.<StallGoodsInfo> = new Vector.<StallGoodsInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_playerId);
			//角色名
			writeString(_playerName);
			//摊位名字
			writeString(_stallName);
			//摊位索引
			writeInt(_stallIndex);
			//摊位物品信息列表
			writeShort(_stallgoodsinfo.length);
			for (var i: int = 0; i < _stallgoodsinfo.length; i++) {
				writeBean(_stallgoodsinfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_playerId = readLong();
			//角色名
			_playerName = readString();
			//摊位名字
			_stallName = readString();
			//摊位索引
			_stallIndex = readInt();
			//摊位物品信息列表
			var stallgoodsinfo_length : int = readShort();
			for (var i: int = 0; i < stallgoodsinfo_length; i++) {
				_stallgoodsinfo[i] = readBean(StallGoodsInfo) as StallGoodsInfo;
			}
			return true;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 角色名
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 角色名
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 摊位名字
		 * @return 
		 */
		public function get stallName(): String{
			return _stallName;
		}
		
		/**
		 * set 摊位名字
		 */
		public function set stallName(value: String): void{
			this._stallName = value;
		}
		
		/**
		 * get 摊位索引
		 * @return 
		 */
		public function get stallIndex(): int{
			return _stallIndex;
		}
		
		/**
		 * set 摊位索引
		 */
		public function set stallIndex(value: int): void{
			this._stallIndex = value;
		}
		
		/**
		 * get 摊位物品信息列表
		 * @return 
		 */
		public function get stallgoodsinfo(): Vector.<StallGoodsInfo>{
			return _stallgoodsinfo;
		}
		
		/**
		 * set 摊位物品信息列表
		 */
		public function set stallgoodsinfo(value: Vector.<StallGoodsInfo>): void{
			this._stallgoodsinfo = value;
		}
		
	}
}