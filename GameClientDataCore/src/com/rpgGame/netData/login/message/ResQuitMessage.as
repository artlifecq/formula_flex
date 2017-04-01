package com.rpgGame.netData.login.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 退出游戏
	 */
	public class ResQuitMessage extends Message {
	
		//角色唯一Id
		private var _personId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色唯一Id
			writeLong(_personId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色唯一Id
			_personId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 100105;
		}
		
		/**
		 * get 角色唯一Id
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set 角色唯一Id
		 */
		public function set personId(value: long): void{
			this._personId = value;
		}
		
	}
}