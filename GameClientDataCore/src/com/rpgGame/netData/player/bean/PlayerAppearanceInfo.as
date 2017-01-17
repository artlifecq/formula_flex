package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家外观展示信息
	 */
	public class PlayerAppearanceInfo extends Bean {
	
		//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		private var _weapon_clothes_sex: int;
		
		//坐骑ID
		private var _horseModelid: int;
		
		//光翼ID
		private var _wingModelId: int;
		
		//骑兵ID
		private var _weaponRideModelid: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			writeInt(_weapon_clothes_sex);
			//坐骑ID
			writeInt(_horseModelid);
			//光翼ID
			writeInt(_wingModelId);
			//骑兵ID
			writeInt(_weaponRideModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			_weapon_clothes_sex = readInt();
			//坐骑ID
			_horseModelid = readInt();
			//光翼ID
			_wingModelId = readInt();
			//骑兵ID
			_weaponRideModelid = readInt();
			return true;
		}
		
		/**
		 * get 武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		 * @return 
		 */
		public function get weapon_clothes_sex(): int{
			return _weapon_clothes_sex;
		}
		
		/**
		 * set 武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		 */
		public function set weapon_clothes_sex(value: int): void{
			this._weapon_clothes_sex = value;
		}
		
		/**
		 * get 坐骑ID
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 坐骑ID
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
		/**
		 * get 光翼ID
		 * @return 
		 */
		public function get wingModelId(): int{
			return _wingModelId;
		}
		
		/**
		 * set 光翼ID
		 */
		public function set wingModelId(value: int): void{
			this._wingModelId = value;
		}
		
		/**
		 * get 骑兵ID
		 * @return 
		 */
		public function get weaponRideModelid(): int{
			return _weaponRideModelid;
		}
		
		/**
		 * set 骑兵ID
		 */
		public function set weaponRideModelid(value: int): void{
			this._weaponRideModelid = value;
		}
		
	}
}