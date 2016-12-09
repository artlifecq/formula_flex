package com.rpgGame.netData.map.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 角色改变性别，可见范围内广播
	 */
	public class ResChangeSexMessage extends Message {
	
		//角色Id
		private var _personId: long;
		
		//武器模板id
		private var _weapon: int;
		
		//衣服模板id
		private var _armor: int;
		
		//头像模板id
		private var _avatar: int;
		
		//角色性别 1-男 2-女
		private var _sex: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_personId);
			//武器模板id
			writeInt(_weapon);
			//衣服模板id
			writeInt(_armor);
			//头像模板id
			writeInt(_avatar);
			//角色性别 1-男 2-女
			writeByte(_sex);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readLong();
			//武器模板id
			_weapon = readInt();
			//衣服模板id
			_armor = readInt();
			//头像模板id
			_avatar = readInt();
			//角色性别 1-男 2-女
			_sex = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101138;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): long{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: long): void{
			this._personId = value;
		}
		
		/**
		 * get 武器模板id
		 * @return 
		 */
		public function get weapon(): int{
			return _weapon;
		}
		
		/**
		 * set 武器模板id
		 */
		public function set weapon(value: int): void{
			this._weapon = value;
		}
		
		/**
		 * get 衣服模板id
		 * @return 
		 */
		public function get armor(): int{
			return _armor;
		}
		
		/**
		 * set 衣服模板id
		 */
		public function set armor(value: int): void{
			this._armor = value;
		}
		
		/**
		 * get 头像模板id
		 * @return 
		 */
		public function get avatar(): int{
			return _avatar;
		}
		
		/**
		 * set 头像模板id
		 */
		public function set avatar(value: int): void{
			this._avatar = value;
		}
		
		/**
		 * get 角色性别 1-男 2-女
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 角色性别 1-男 2-女
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
	}
}