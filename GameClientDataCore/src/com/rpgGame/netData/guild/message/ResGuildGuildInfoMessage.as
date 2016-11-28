package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.MemberInfo;
	import com.rpgGame.netData.guild.bean.GuildConfig;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送单独帮会信息给客户端
	 */
	public class ResGuildGuildInfoMessage extends Message {
	
		//单独帮会信息
		private var _guildInfo: GuildInfo;
		
		//帮会配置
		private var _guildConfig: GuildConfig;
		
		//自己的成员信息
		private var _memberInfo: MemberInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//单独帮会信息
			writeBean(_guildInfo);
			//帮会配置
			writeBean(_guildConfig);
			//自己的成员信息
			writeBean(_memberInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//单独帮会信息
			_guildInfo = readBean(GuildInfo) as GuildInfo;
			//帮会配置
			_guildConfig = readBean(GuildConfig) as GuildConfig;
			//自己的成员信息
			_memberInfo = readBean(MemberInfo) as MemberInfo;
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
		 * get 单独帮会信息
		 * @return 
		 */
		public function get guildInfo(): GuildInfo{
			return _guildInfo;
		}
		
		/**
		 * set 单独帮会信息
		 */
		public function set guildInfo(value: GuildInfo): void{
			this._guildInfo = value;
		}
		
		/**
		 * get 帮会配置
		 * @return 
		 */
		public function get guildConfig(): GuildConfig{
			return _guildConfig;
		}
		
		/**
		 * set 帮会配置
		 */
		public function set guildConfig(value: GuildConfig): void{
			this._guildConfig = value;
		}
		
		/**
		 * get 自己的成员信息
		 * @return 
		 */
		public function get memberInfo(): MemberInfo{
			return _memberInfo;
		}
		
		/**
		 * set 自己的成员信息
		 */
		public function set memberInfo(value: MemberInfo): void{
			this._memberInfo = value;
		}
		
	}
}