package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 复活成功
	 */
	public class ResReviveSuccessMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//角色生命值
		private var _hp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//角色生命值
			writeInt(_hp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//角色生命值
			_hp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103115;
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
		 * get 角色生命值
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set 角色生命值
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
	}
}