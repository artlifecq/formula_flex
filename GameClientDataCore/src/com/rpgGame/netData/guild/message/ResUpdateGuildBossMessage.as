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
	 * 更新帮会boss
	 */
	public class ResUpdateGuildBossMessage extends Message {
	
		//帮会boss
		private var _bossInfo: GuildBossInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会boss
			writeBean(_bossInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会boss
			_bossInfo = readBean(GuildBossInfo) as GuildBossInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111502;
		}
		
		/**
		 * get 帮会boss
		 * @return 
		 */
		public function get bossInfo(): GuildBossInfo{
			return _bossInfo;
		}
		
		/**
		 * set 帮会boss
		 */
		public function set bossInfo(value: GuildBossInfo): void{
			this._bossInfo = value;
		}
		
	}
}