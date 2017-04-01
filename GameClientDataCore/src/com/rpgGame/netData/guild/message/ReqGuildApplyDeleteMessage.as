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
	 * 撤销之前的申请记录
	 */
	public class ReqGuildApplyDeleteMessage extends Message {
	
		//帮会ID
		private var _guildId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会ID
			writeLong(_guildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会ID
			_guildId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111229;
		}
		
		/**
		 * get 帮会ID
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮会ID
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
	}
}