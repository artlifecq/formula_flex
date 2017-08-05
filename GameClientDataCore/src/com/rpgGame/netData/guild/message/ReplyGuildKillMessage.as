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
	 * 回复提出成员操作
	 */
	public class ReplyGuildKillMessage extends Message {
	
		//目标玩家Id
		private var _targerPlayerId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//目标玩家Id
			writeLong(_targerPlayerId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//目标玩家Id
			_targerPlayerId = readLong();
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
		 * get 目标玩家Id
		 * @return 
		 */
		public function get targerPlayerId(): long{
			return _targerPlayerId;
		}
		
		/**
		 * set 目标玩家Id
		 */
		public function set targerPlayerId(value: long): void{
			this._targerPlayerId = value;
		}
		
	}
}