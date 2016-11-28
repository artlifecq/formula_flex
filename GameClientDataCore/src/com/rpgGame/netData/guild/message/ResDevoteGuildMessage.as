package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildDevoteInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回帮会捐献消息
	 */
	public class ResDevoteGuildMessage extends Message {
	
		//记录
		private var _guildDevoteInfos: Vector.<GuildDevoteInfo> = new Vector.<GuildDevoteInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//记录
			writeShort(_guildDevoteInfos.length);
			for (i = 0; i < _guildDevoteInfos.length; i++) {
				writeBean(_guildDevoteInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//记录
			var guildDevoteInfos_length : int = readShort();
			for (i = 0; i < guildDevoteInfos_length; i++) {
				_guildDevoteInfos[i] = readBean(GuildDevoteInfo) as GuildDevoteInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111114;
		}
		
		/**
		 * get 记录
		 * @return 
		 */
		public function get guildDevoteInfos(): Vector.<GuildDevoteInfo>{
			return _guildDevoteInfos;
		}
		
		/**
		 * set 记录
		 */
		public function set guildDevoteInfos(value: Vector.<GuildDevoteInfo>): void{
			this._guildDevoteInfos = value;
		}
		
	}
}