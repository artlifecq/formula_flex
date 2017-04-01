package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 修改公告
	 */
	public class ReqGuildChangeAnnouncementMessage extends Message {
	
		//帮会公告
		private var _guildBulletin: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会公告
			writeString(_guildBulletin);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会公告
			_guildBulletin = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111213;
		}
		
		/**
		 * get 帮会公告
		 * @return 
		 */
		public function get guildBulletin(): String{
			return _guildBulletin;
		}
		
		/**
		 * set 帮会公告
		 */
		public function set guildBulletin(value: String): void{
			this._guildBulletin = value;
		}
		
	}
}