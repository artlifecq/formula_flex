package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildDiplomacyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送帮会外交面板消息
	 */
	public class ResGuildDiplomacyInfosMessage extends Message {
	
		//帮会外交信息
		private var _guildDiplomacyInfo: Vector.<GuildDiplomacyInfo> = new Vector.<GuildDiplomacyInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮会外交信息
			writeShort(_guildDiplomacyInfo.length);
			for (i = 0; i < _guildDiplomacyInfo.length; i++) {
				writeBean(_guildDiplomacyInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮会外交信息
			var guildDiplomacyInfo_length : int = readShort();
			for (i = 0; i < guildDiplomacyInfo_length; i++) {
				_guildDiplomacyInfo[i] = readBean(GuildDiplomacyInfo) as GuildDiplomacyInfo;
			}
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
		 * get 帮会外交信息
		 * @return 
		 */
		public function get guildDiplomacyInfo(): Vector.<GuildDiplomacyInfo>{
			return _guildDiplomacyInfo;
		}
		
		/**
		 * set 帮会外交信息
		 */
		public function set guildDiplomacyInfo(value: Vector.<GuildDiplomacyInfo>): void{
			this._guildDiplomacyInfo = value;
		}
		
	}
}