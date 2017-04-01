package com.rpgGame.netData.monster.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求单个BOSS概要信息
	 */
	public class ReqQueryBossAloneMessage extends Message {
	
		//怪物唯一Id
		private var _monsterId: long;
		
		//boss所在地图id
		private var _mapModelId: int;
		
		//boss所在线
		private var _line: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物唯一Id
			writeLong(_monsterId);
			//boss所在地图id
			writeInt(_mapModelId);
			//boss所在线
			writeByte(_line);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物唯一Id
			_monsterId = readLong();
			//boss所在地图id
			_mapModelId = readInt();
			//boss所在线
			_line = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114203;
		}
		
		/**
		 * get 怪物唯一Id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物唯一Id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
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
		
	}
}