package com.rpgGame.netData.cross.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 来自游戏服的公共服GM指令
	 */
	public class PesGmCommandPublicMessage extends Message {
	
		//指令内容
		private var _cmd: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//指令内容
			writeString(_cmd);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//指令内容
			_cmd = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 250102;
		}
		
		/**
		 * get 指令内容
		 * @return 
		 */
		public function get cmd(): String{
			return _cmd;
		}
		
		/**
		 * set 指令内容
		 */
		public function set cmd(value: String): void{
			this._cmd = value;
		}
		
	}
}