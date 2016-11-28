package com.rpgGame.netData.top.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家排行信息
	 */
	public class TopInfo extends Bean {
	
		//玩家Id
		private var _playerid: long;
		
		//玩家名字
		private var _playername: String;
		
		//vip等级
		private var _vipId: int;
		
		//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
		private var _weapon_clothes_sex: int;
		
		//排名
		private var _rank: int;
		
		//昨天排名
		private var _oldrank: int;
		
		//排行类型 1等级 2坐骑 3 战斗力 ....
		private var _toptype: int;
		
		//排行参数(等级榜对应等级 战力对应战斗力)
		private var _param: int;
		
		//崇拜值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerid);
			//玩家名字
			writeString(_playername);
			//vip等级
			writeShort(_vipId);
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			writeInt(_weapon_clothes_sex);
			//排名
			writeInt(_rank);
			//昨天排名
			writeInt(_oldrank);
			//排行类型 1等级 2坐骑 3 战斗力 ....
			writeInt(_toptype);
			//排行参数(等级榜对应等级 战力对应战斗力)
			writeInt(_param);
			//崇拜值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerid = readLong();
			//玩家名字
			_playername = readString();
			//vip等级
			_vipId = readShort();
			//武器造型ID_衣服造型ID_性别 注:武器低15位，衣服依次15位，性别2位 0女 1男
			_weapon_clothes_sex = readInt();
			//排名
			_rank = readInt();
			//昨天排名
			_oldrank = readInt();
			//排行类型 1等级 2坐骑 3 战斗力 ....
			_toptype = readInt();
			//排行参数(等级榜对应等级 战力对应战斗力)
			_param = readInt();
			//崇拜值
			_value = readInt();
			return true;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerid(): long{
			return _playerid;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerid(value: long): void{
			this._playerid = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get playername(): String{
			return _playername;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set playername(value: String): void{
			this._playername = value;
		}
		
		/**
		 * get vip等级
		 * @return 
		 */
		public function get vipId(): int{
			return _vipId;
		}
		
		/**
		 * set vip等级
		 */
		public function set vipId(value: int): void{
			this._vipId = value;
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
		 * get 排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 昨天排名
		 * @return 
		 */
		public function get oldrank(): int{
			return _oldrank;
		}
		
		/**
		 * set 昨天排名
		 */
		public function set oldrank(value: int): void{
			this._oldrank = value;
		}
		
		/**
		 * get 排行类型 1等级 2坐骑 3 战斗力 ....
		 * @return 
		 */
		public function get toptype(): int{
			return _toptype;
		}
		
		/**
		 * set 排行类型 1等级 2坐骑 3 战斗力 ....
		 */
		public function set toptype(value: int): void{
			this._toptype = value;
		}
		
		/**
		 * get 排行参数(等级榜对应等级 战力对应战斗力)
		 * @return 
		 */
		public function get param(): int{
			return _param;
		}
		
		/**
		 * set 排行参数(等级榜对应等级 战力对应战斗力)
		 */
		public function set param(value: int): void{
			this._param = value;
		}
		
		/**
		 * get 崇拜值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 崇拜值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}