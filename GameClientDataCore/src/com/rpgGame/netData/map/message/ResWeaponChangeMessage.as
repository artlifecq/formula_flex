package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武器换装
	 */
	public class ResWeaponChangeMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//武器资源Id
		private var _weaponResId: int;
		
		//副武器资源Id
		private var _deputyWeaponResId: int;
		
		//强化等级
		private var _weaponStreng: int;
		
		//注灵等级
		private var _weaponSoul: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//武器资源Id
			writeInt(_weaponResId);
			//副武器资源Id
			writeInt(_deputyWeaponResId);
			//强化等级
			writeByte(_weaponStreng);
			//注灵等级
			writeByte(_weaponSoul);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//武器资源Id
			_weaponResId = readInt();
			//副武器资源Id
			_deputyWeaponResId = readInt();
			//强化等级
			_weaponStreng = readByte();
			//注灵等级
			_weaponSoul = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101118;
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
		 * get 武器资源Id
		 * @return 
		 */
		public function get weaponResId(): int{
			return _weaponResId;
		}
		
		/**
		 * set 武器资源Id
		 */
		public function set weaponResId(value: int): void{
			this._weaponResId = value;
		}
		
		/**
		 * get 副武器资源Id
		 * @return 
		 */
		public function get deputyWeaponResId(): int{
			return _deputyWeaponResId;
		}
		
		/**
		 * set 副武器资源Id
		 */
		public function set deputyWeaponResId(value: int): void{
			this._deputyWeaponResId = value;
		}
		
		/**
		 * get 强化等级
		 * @return 
		 */
		public function get weaponStreng(): int{
			return _weaponStreng;
		}
		
		/**
		 * set 强化等级
		 */
		public function set weaponStreng(value: int): void{
			this._weaponStreng = value;
		}
		
		/**
		 * get 注灵等级
		 * @return 
		 */
		public function get weaponSoul(): int{
			return _weaponSoul;
		}
		
		/**
		 * set 注灵等级
		 */
		public function set weaponSoul(value: int): void{
			this._weaponSoul = value;
		}
		
	}
}