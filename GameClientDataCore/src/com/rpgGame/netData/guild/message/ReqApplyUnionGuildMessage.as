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
	 * 答复对方的同盟请求
	 */
	public class ReqApplyUnionGuildMessage extends Message {
	
		//选择 1 同意 0 拒绝
		private var _applyType: int;
		
		//目标帮会ID
		private var _guildId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//选择 1 同意 0 拒绝
			writeInt(_applyType);
			//目标帮会ID
			writeLong(_guildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//选择 1 同意 0 拒绝
			_applyType = readInt();
			//目标帮会ID
			_guildId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111228;
		}
		
		/**
		 * get 选择 1 同意 0 拒绝
		 * @return 
		 */
		public function get applyType(): int{
			return _applyType;
		}
		
		/**
		 * set 选择 1 同意 0 拒绝
		 */
		public function set applyType(value: int): void{
			this._applyType = value;
		}
		
		/**
		 * get 目标帮会ID
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 目标帮会ID
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
	}
}