package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildStoreOptInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 添加帮会仓库记录
	 */
	public class ResGuildStoreOptAddMessage extends Message {
	
		//记录信息
		private var _info: GuildStoreOptInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//记录信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//记录信息
			_info = readBean(GuildStoreOptInfo) as GuildStoreOptInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111405;
		}
		
		/**
		 * get 记录信息
		 * @return 
		 */
		public function get info(): GuildStoreOptInfo{
			return _info;
		}
		
		/**
		 * set 记录信息
		 */
		public function set info(value: GuildStoreOptInfo): void{
			this._info = value;
		}
		
	}
}