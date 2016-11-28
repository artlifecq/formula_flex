package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会查找
	 */
	public class ReqSearchGuildMessage extends Message {
	
		//帮会名称(空默认全部)
		private var _guildName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会名称(空默认全部)
			writeString(_guildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会名称(空默认全部)
			_guildName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111227;
		}
		
		/**
		 * get 帮会名称(空默认全部)
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名称(空默认全部)
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
	}
}