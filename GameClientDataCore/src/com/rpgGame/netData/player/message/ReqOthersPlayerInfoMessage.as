package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 查看他人信息
	 */
	public class ReqOthersPlayerInfoMessage extends Message {
	
		//角色名称
		private var _personName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色名称
			writeString(_personName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色名称
			_personName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103210;
		}
		
		/**
		 * get 角色名称
		 * @return 
		 */
		public function get personName(): String{
			return _personName;
		}
		
		/**
		 * set 角色名称
		 */
		public function set personName(value: String): void{
			this._personName = value;
		}
		
	}
}