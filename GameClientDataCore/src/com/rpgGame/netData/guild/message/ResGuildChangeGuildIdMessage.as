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
	 * 通知玩家帮派Id改变
	 */
	public class ResGuildChangeGuildIdMessage extends Message {
	
		//帮派Id,-1:为离开帮派
		private var _guildId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派Id,-1:为离开帮派
			writeLong(_guildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮派Id,-1:为离开帮派
			_guildId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111106;
		}
		
		/**
		 * get 帮派Id,-1:为离开帮派
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮派Id,-1:为离开帮派
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
	}
}