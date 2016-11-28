package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 处理帮会成员仓库物品申请
	 */
	public class ReqAllowApplyMessage extends Message {
	
		//玩家ID
		private var _playerId: long;
		
		//物品ID
		private var _itemId: long;
		
		//0 拒绝  1 同意
		private var _allow: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家ID
			writeLong(_playerId);
			//物品ID
			writeLong(_itemId);
			//0 拒绝  1 同意
			writeByte(_allow);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家ID
			_playerId = readLong();
			//物品ID
			_itemId = readLong();
			//0 拒绝  1 同意
			_allow = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111305;
		}
		
		/**
		 * get 玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 物品ID
		 * @return 
		 */
		public function get itemId(): long{
			return _itemId;
		}
		
		/**
		 * set 物品ID
		 */
		public function set itemId(value: long): void{
			this._itemId = value;
		}
		
		/**
		 * get 0 拒绝  1 同意
		 * @return 
		 */
		public function get allow(): int{
			return _allow;
		}
		
		/**
		 * set 0 拒绝  1 同意
		 */
		public function set allow(value: int): void{
			this._allow = value;
		}
		
	}
}