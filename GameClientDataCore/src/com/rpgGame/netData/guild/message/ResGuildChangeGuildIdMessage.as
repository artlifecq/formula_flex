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
	 * 通知玩家帮派Id改变
	 */
	public class ResGuildChangeGuildIdMessage extends Message {
	
		//帮派Id,-1:为离开帮派
		private var _guildId: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮派Id,-1:为离开帮派
			writeShort(_guildId.length);
			for (i = 0; i < _guildId.length; i++) {
				writeLong(_guildId[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮派Id,-1:为离开帮派
			var guildId_length : int = readShort();
			for (i = 0; i < guildId_length; i++) {
				_guildId[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111106;
		}
		
		/**
		 * get 帮派Id,-1:为离开帮派
		 * @return 
		 */
		public function get guildId(): Vector.<long>{
			return _guildId;
		}
		
		/**
		 * set 帮派Id,-1:为离开帮派
		 */
		public function set guildId(value: Vector.<long>): void{
			this._guildId = value;
		}
		
	}
}