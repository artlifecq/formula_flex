package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 衣服换装
	 */
	public class ResArmorChangeMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//衣服资源Id
		private var _armorResId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//衣服资源Id
			writeInt(_armorResId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//衣服资源Id
			_armorResId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101119;
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
		 * get 衣服资源Id
		 * @return 
		 */
		public function get armorResId(): int{
			return _armorResId;
		}
		
		/**
		 * set 衣服资源Id
		 */
		public function set armorResId(value: int): void{
			this._armorResId = value;
		}
		
	}
}