package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildBossInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会boss列表
	 */
	public class ResGuildBossListMessage extends Message {
	
		//帮会boss列表
		private var _bosslist: Vector.<GuildBossInfo> = new Vector.<GuildBossInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮会boss列表
			writeShort(_bosslist.length);
			for (i = 0; i < _bosslist.length; i++) {
				writeBean(_bosslist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮会boss列表
			var bosslist_length : int = readShort();
			for (i = 0; i < bosslist_length; i++) {
				_bosslist[i] = readBean(GuildBossInfo) as GuildBossInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111501;
		}
		
		/**
		 * get 帮会boss列表
		 * @return 
		 */
		public function get bosslist(): Vector.<GuildBossInfo>{
			return _bosslist;
		}
		
		/**
		 * set 帮会boss列表
		 */
		public function set bosslist(value: Vector.<GuildBossInfo>): void{
			this._bosslist = value;
		}
		
	}
}