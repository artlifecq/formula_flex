package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 获取帮会列表返回
	 */
	public class ResGuildGetGuildListToClientMessage extends Message {
	
		//所有帮会列表
		private var _guildList: Vector.<GuildInfo> = new Vector.<GuildInfo>();
		//已申请帮会列表
		private var _appliedGuildList: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//所有帮会列表
			writeShort(_guildList.length);
			for (i = 0; i < _guildList.length; i++) {
				writeBean(_guildList[i]);
			}
			//已申请帮会列表
			writeShort(_appliedGuildList.length);
			for (i = 0; i < _appliedGuildList.length; i++) {
				writeLong(_appliedGuildList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//所有帮会列表
			var guildList_length : int = readShort();
			for (i = 0; i < guildList_length; i++) {
				_guildList[i] = readBean(GuildInfo) as GuildInfo;
			}
			//已申请帮会列表
			var appliedGuildList_length : int = readShort();
			for (i = 0; i < appliedGuildList_length; i++) {
				_appliedGuildList[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111101;
		}
		
		/**
		 * get 所有帮会列表
		 * @return 
		 */
		public function get guildList(): Vector.<GuildInfo>{
			return _guildList;
		}
		
		/**
		 * set 所有帮会列表
		 */
		public function set guildList(value: Vector.<GuildInfo>): void{
			this._guildList = value;
		}
		
		/**
		 * get 已申请帮会列表
		 * @return 
		 */
		public function get appliedGuildList(): Vector.<long>{
			return _appliedGuildList;
		}
		
		/**
		 * set 已申请帮会列表
		 */
		public function set appliedGuildList(value: Vector.<long>): void{
			this._appliedGuildList = value;
		}
		
	}
}