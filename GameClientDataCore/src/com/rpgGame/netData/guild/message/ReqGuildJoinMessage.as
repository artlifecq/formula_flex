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
	 * 请求加入帮派
	 */
	public class ReqGuildJoinMessage extends Message {
	
		//要加入帮派的Id,-1:为快速加入
		private var _guildId: long;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//要加入帮派的Id,-1:为快速加入
			writeLong(_guildId);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//要加入帮派的Id,-1:为快速加入
			_guildId = readLong();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111202;
		}
		
		/**
		 * get 要加入帮派的Id,-1:为快速加入
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 要加入帮派的Id,-1:为快速加入
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}