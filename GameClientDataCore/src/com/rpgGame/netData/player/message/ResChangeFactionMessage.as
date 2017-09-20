package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更改pk状态
	 */
	public class ResChangeFactionMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//角色阵营
		private var _faction: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//角色阵营
			writeByte(_faction);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//角色阵营
			_faction = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103129;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: int): void{
			this._personId = value;
		}
		
		/**
		 * get 角色阵营
		 * @return 
		 */
		public function get faction(): int{
			return _faction;
		}
		
		/**
		 * set 角色阵营
		 */
		public function set faction(value: int): void{
			this._faction = value;
		}
		
	}
}