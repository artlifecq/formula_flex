package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复帮会升级
	 */
	public class ReplyGuildLevelUpMessage extends Message {
	
		//新的帮会等级
		private var _guildLevel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//新的帮会等级
			writeInt(_guildLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//新的帮会等级
			_guildLevel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111112;
		}
		
		/**
		 * get 新的帮会等级
		 * @return 
		 */
		public function get guildLevel(): int{
			return _guildLevel;
		}
		
		/**
		 * set 新的帮会等级
		 */
		public function set guildLevel(value: int): void{
			this._guildLevel = value;
		}
		
	}
}