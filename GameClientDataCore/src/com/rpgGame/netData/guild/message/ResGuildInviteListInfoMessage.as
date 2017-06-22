package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 邀请列表信息
	 */
	public class ResGuildInviteListInfoMessage extends Message {
	
		//邀请列表信息
		private var _inviteList: Vector.<GuildInviteInfo> = new Vector.<GuildInviteInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//邀请列表信息
			writeShort(_inviteList.length);
			for (i = 0; i < _inviteList.length; i++) {
				writeBean(_inviteList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//邀请列表信息
			var inviteList_length : int = readShort();
			for (i = 0; i < inviteList_length; i++) {
				_inviteList[i] = readBean(GuildInviteInfo) as GuildInviteInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111104;
		}
		
		/**
		 * get 邀请列表信息
		 * @return 
		 */
		public function get inviteList(): Vector.<GuildInviteInfo>{
			return _inviteList;
		}
		
		/**
		 * set 邀请列表信息
		 */
		public function set inviteList(value: Vector.<GuildInviteInfo>): void{
			this._inviteList = value;
		}
		
	}
}