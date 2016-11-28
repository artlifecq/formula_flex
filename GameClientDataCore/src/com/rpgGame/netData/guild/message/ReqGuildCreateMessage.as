package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 创建公会
	 */
	public class ReqGuildCreateMessage extends Message {
	
		//公会名字
		private var _guildName: String;
		
		//帮旗名称
		private var _guildFlagName: String;
		
		//帮旗造型ID
		private var _guildFlagModelId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//公会名字
			writeString(_guildName);
			//帮旗名称
			writeString(_guildFlagName);
			//帮旗造型ID
			writeInt(_guildFlagModelId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//公会名字
			_guildName = readString();
			//帮旗名称
			_guildFlagName = readString();
			//帮旗造型ID
			_guildFlagModelId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111201;
		}
		
		/**
		 * get 公会名字
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 公会名字
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 帮旗名称
		 * @return 
		 */
		public function get guildFlagName(): String{
			return _guildFlagName;
		}
		
		/**
		 * set 帮旗名称
		 */
		public function set guildFlagName(value: String): void{
			this._guildFlagName = value;
		}
		
		/**
		 * get 帮旗造型ID
		 * @return 
		 */
		public function get guildFlagModelId(): int{
			return _guildFlagModelId;
		}
		
		/**
		 * set 帮旗造型ID
		 */
		public function set guildFlagModelId(value: int): void{
			this._guildFlagModelId = value;
		}
		
	}
}