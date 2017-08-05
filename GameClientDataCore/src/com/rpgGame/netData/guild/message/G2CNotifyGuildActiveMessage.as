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
	 * 通知帮会活跃度(作废,参考[109,ResGuildActive])
	 */
	public class G2CNotifyGuildActiveMessage extends Message {
	
		//帮会Id
		private var _guildId: long;
		
		//帮会活跃度
		private var _active: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会Id
			writeLong(_guildId);
			//帮会活跃度
			writeInt(_active);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会Id
			_guildId = readLong();
			//帮会活跃度
			_active = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111116;
		}
		
		/**
		 * get 帮会Id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮会Id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 帮会活跃度
		 * @return 
		 */
		public function get active(): int{
			return _active;
		}
		
		/**
		 * set 帮会活跃度
		 */
		public function set active(value: int): void{
			this._active = value;
		}
		
	}
}