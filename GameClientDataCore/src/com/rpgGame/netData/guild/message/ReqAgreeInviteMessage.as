package com.rpgGame.netData.guild.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 同意帮会邀请
	 */
	public class ReqAgreeInviteMessage extends Message {
	
		//0 拒绝 1 同意
		private var _isAgree: int;
		
		//邀请的帮会id
		private var _inviteGuildId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0 拒绝 1 同意
			writeByte(_isAgree);
			//邀请的帮会id
			writeLong(_inviteGuildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0 拒绝 1 同意
			_isAgree = readByte();
			//邀请的帮会id
			_inviteGuildId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111220;
		}
		
		/**
		 * get 0 拒绝 1 同意
		 * @return 
		 */
		public function get isAgree(): int{
			return _isAgree;
		}
		
		/**
		 * set 0 拒绝 1 同意
		 */
		public function set isAgree(value: int): void{
			this._isAgree = value;
		}
		
		/**
		 * get 邀请的帮会id
		 * @return 
		 */
		public function get inviteGuildId(): long{
			return _inviteGuildId;
		}
		
		/**
		 * set 邀请的帮会id
		 */
		public function set inviteGuildId(value: long): void{
			this._inviteGuildId = value;
		}
		
	}
}