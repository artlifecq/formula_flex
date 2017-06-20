package com.rpgGame.netData.guild.bean{
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派邀请信息
	 */
	public class GuildInviteInfo extends Bean {
	
		//邀请Id
		private var _id: int;
		
		//帮派信息
		private var _info: GuildListInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邀请Id
			writeInt(_id);
			//帮派信息
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邀请Id
			_id = readInt();
			//帮派信息
			_info = readBean(GuildListInfo) as GuildListInfo;
			return true;
		}
		
		/**
		 * get 邀请Id
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 邀请Id
		 */
		public function set id(value: int): void{
			this._id = value;
		}
		
		/**
		 * get 帮派信息
		 * @return 
		 */
		public function get info(): GuildListInfo{
			return _info;
		}
		
		/**
		 * set 帮派信息
		 */
		public function set info(value: GuildListInfo): void{
			this._info = value;
		}
		
	}
}