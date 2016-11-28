package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 修改帮旗名称
	 */
	public class ReqGuildFlagNameUpdateMessage extends Message {
	
		//新帮旗名称
		private var _flagName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//新帮旗名称
			writeString(_flagName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//新帮旗名称
			_flagName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111222;
		}
		
		/**
		 * get 新帮旗名称
		 * @return 
		 */
		public function get flagName(): String{
			return _flagName;
		}
		
		/**
		 * set 新帮旗名称
		 */
		public function set flagName(value: String): void{
			this._flagName = value;
		}
		
	}
}