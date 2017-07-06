package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.structs.IntKeyValue;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知矿信息
	 */
	public class ResGuildWarOreInfoMessage extends Message {
	
		//玩家Id
		private var _playerId: long;
		
		//矿列表
		private var _oreList: Vector.<com.rpgGame.netData.structs.IntKeyValue> = new Vector.<com.rpgGame.netData.structs.IntKeyValue>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家Id
			writeLong(_playerId);
			//矿列表
			writeShort(_oreList.length);
			for (i = 0; i < _oreList.length; i++) {
				writeBean(_oreList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//玩家Id
			_playerId = readLong();
			//矿列表
			var oreList_length : int = readShort();
			for (i = 0; i < oreList_length; i++) {
				_oreList[i] = readBean(com.rpgGame.netData.structs.IntKeyValue) as com.rpgGame.netData.structs.IntKeyValue;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253105;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 矿列表
		 * @return 
		 */
		public function get oreList(): Vector.<com.rpgGame.netData.structs.IntKeyValue>{
			return _oreList;
		}
		
		/**
		 * set 矿列表
		 */
		public function set oreList(value: Vector.<com.rpgGame.netData.structs.IntKeyValue>): void{
			this._oreList = value;
		}
		
	}
}