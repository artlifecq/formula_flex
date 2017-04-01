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
	 * 删除帮会成员
	 */
	public class ReqGuildDeleteMemberMessage extends Message {
	
		//被操作玩家ID
		private var _playerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被操作玩家ID
			writeLong(_playerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被操作玩家ID
			_playerId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111211;
		}
		
		/**
		 * get 被操作玩家ID
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 被操作玩家ID
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
	}
}