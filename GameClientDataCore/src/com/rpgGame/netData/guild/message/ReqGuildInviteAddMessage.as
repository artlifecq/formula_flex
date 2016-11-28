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
	 * 邀请加入帮会
	 */
	public class ReqGuildInviteAddMessage extends Message {
	
		//邀请者Id
		private var _InvitedPlayerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//邀请者Id
			writeLong(_InvitedPlayerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//邀请者Id
			_InvitedPlayerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111205;
		}
		
		/**
		 * get 邀请者Id
		 * @return 
		 */
		public function get InvitedPlayerId(): long{
			return _InvitedPlayerId;
		}
		
		/**
		 * set 邀请者Id
		 */
		public function set InvitedPlayerId(value: long): void{
			this._InvitedPlayerId = value;
		}
		
	}
}