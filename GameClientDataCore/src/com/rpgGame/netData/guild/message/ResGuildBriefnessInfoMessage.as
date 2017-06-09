package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildBriefnessInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派简介信息
	 */
	public class ResGuildBriefnessInfoMessage extends Message {
	
		//帮派简介信息
		private var _guildBriefnessInfo: GuildBriefnessInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派简介信息
			writeBean(_guildBriefnessInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮派简介信息
			_guildBriefnessInfo = readBean(GuildBriefnessInfo) as GuildBriefnessInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111102;
		}
		
		/**
		 * get 帮派简介信息
		 * @return 
		 */
		public function get guildBriefnessInfo(): GuildBriefnessInfo{
			return _guildBriefnessInfo;
		}
		
		/**
		 * set 帮派简介信息
		 */
		public function set guildBriefnessInfo(value: GuildBriefnessInfo): void{
			this._guildBriefnessInfo = value;
		}
		
	}
}