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
	
		//玩家性别 1男 2女
		private var _sex: int;
		
		//骨骼
		private var _body: int;
		
		//职业
		private var _job: int;
		
		//衣服套装
		private var _cloths: int;
		
		//头发
		private var _hair: int;
		
		//主武器
		private var _weapon: int;
		
		//副武器
		private var _second_weapon: int;
		
		//坐骑
		private var _mount: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家性别 1男 2女
			writeByte(_sex);
			//骨骼
			writeByte(_body);
			//职业
			writeByte(_job);
			//衣服套装
			writeInt(_cloths);
			//头发
			writeInt(_hair);
			//主武器
			writeInt(_weapon);
			//副武器
			writeInt(_second_weapon);
			//坐骑
			writeInt(_mount);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家性别 1男 2女
			_sex = readByte();
			//骨骼
			_body = readByte();
			//职业
			_job = readByte();
			//衣服套装
			_cloths = readInt();
			//头发
			_hair = readInt();
			//主武器
			_weapon = readInt();
			//副武器
			_second_weapon = readInt();
			//坐骑
			_mount = readInt();
			return true;
		}
		
		/**
		 * get 玩家性别 1男 2女
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 玩家性别 1男 2女
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 骨骼
		 * @return 
		 */
		public function get body(): int{
			return _body;
		}
		
		/**
		 * set 骨骼
		 */
		public function set body(value: int): void{
			this._body = value;
		}
		
		/**
		 * get 职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 职业
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get 衣服套装
		 * @return 
		 */
		public function get cloths(): int{
			return _cloths;
		}
		
		/**
		 * set 衣服套装
		 */
		public function set cloths(value: int): void{
			this._cloths = value;
		}
		
		/**
		 * get 头发
		 * @return 
		 */
		public function get hair(): int{
			return _hair;
		}
		
		/**
		 * set 头发
		 */
		public function set hair(value: int): void{
			this._hair = value;
		}
		
		/**
		 * get 主武器
		 * @return 
		 */
		public function get weapon(): int{
			return _weapon;
		}
		
		/**
		 * set 主武器
		 */
		public function set weapon(value: int): void{
			this._weapon = value;
		}
		
		/**
		 * get 副武器
		 * @return 
		 */
		public function get second_weapon(): int{
			return _second_weapon;
		}
		
		/**
		 * set 副武器
		 */
		public function set second_weapon(value: int): void{
			this._second_weapon = value;
		}
		
		/**
		 * get 坐骑
		 * @return 
		 */
		public function get mount(): int{
			return _mount;
		}
		
		/**
		 * set 坐骑
		 */
		public function set mount(value: int): void{
			this._mount = value;
		}
		
	}
}