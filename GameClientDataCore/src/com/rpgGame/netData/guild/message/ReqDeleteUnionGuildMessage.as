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
	 * 删除同盟帮会
	 */
	public class ReqDeleteUnionGuildMessage extends Message {
	
		//目标帮会ID
		private var _guildId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//目标帮会ID
			writeLong(_guildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//目标帮会ID
			_guildId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111225;
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