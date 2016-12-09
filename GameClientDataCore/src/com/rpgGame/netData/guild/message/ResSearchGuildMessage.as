package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildSearchInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回帮会搜索消息
	 */
	public class ResSearchGuildMessage extends Message {
	
		//搜索bean
		private var _guildSearchInfos: Vector.<GuildSearchInfo> = new Vector.<GuildSearchInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//搜索bean
			writeShort(_guildSearchInfos.length);
			for (i = 0; i < _guildSearchInfos.length; i++) {
				writeBean(_guildSearchInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//搜索bean
			var guildSearchInfos_length : int = readShort();
			for (i = 0; i < guildSearchInfos_length; i++) {
				_guildSearchInfos[i] = readBean(GuildSearchInfo) as GuildSearchInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111113;
		}
		
		/**
		 * get 搜索bean
		 * @return 
		 */
		public function get guildSearchInfos(): Vector.<GuildSearchInfo>{
			return _guildSearchInfos;
		}
		
		/**
		 * set 搜索bean
		 */
		public function set guildSearchInfos(value: Vector.<GuildSearchInfo>): void{
			this._guildSearchInfos = value;
		}
		
	}
}