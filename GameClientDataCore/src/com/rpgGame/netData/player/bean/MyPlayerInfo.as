package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.AttributeItem;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 本人玩家详细信息
	 */
	public class MyPlayerInfo extends Bean {
	
		//角色Id
		private var _personId: long;
		
		//角色名字
		private var _name: String;
		
		//角色所在地图模版
		private var _mapModelId: int;
		
		//角色所在X
		private var _x: int;
		
		//角色所在Y
		private var _y: int;
		
		//人物面对方向
		private var _dir: int;
		
		//玩家性别 1男 2女
		private var _sex: int;
		
		//阶段
		private var _body: int;
		
		//职业
		private var _job: int;
		
		//衣服套装
		private var _cloths: int;
		
		//主武器
		private var _weapon: int;
		
		//副武器
		private var _second_weapon: int;
		
		//坐骑
		private var _mount: int;
		
		//PK类型
		private var _pkType: int;
		
		//角色属性信息
		private var _attributes: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeLong(_personId);
			//角色名字
			writeString(_name);
			//角色所在地图模版
			writeInt(_mapModelId);
			//角色所在X
			writeShort(_x);
			//角色所在Y
			writeShort(_y);
			//人物面对方向
			writeByte(_dir);
			//玩家性别 1男 2女
			writeByte(_sex);
			//阶段
			writeByte(_body);
			//职业
			writeByte(_job);
			//衣服套装
			writeInt(_cloths);
			//主武器
			writeInt(_weapon);
			//副武器
			writeInt(_second_weapon);
			//坐骑
			writeInt(_mount);
			//PK类型
			writeInt(_pkType);
			//角色属性信息
			writeShort(_attributes.length);
			for (var i: int = 0; i < _attributes.length; i++) {
				writeBean(_attributes[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readLong();
			//角色名字
			_name = readString();
			//角色所在地图模版
			_mapModelId = readInt();
			//角色所在X
			_x = readShort();
			//角色所在Y
			_y = readShort();
			//人物面对方向
			_dir = readByte();
			//玩家性别 1男 2女
			_sex = readByte();
			//阶段
			_body = readByte();
			//职业
			_job = readByte();
			//衣服套装
			_cloths = readInt();
			//主武器
			_weapon = readInt();
			//副武器
			_second_weapon = readInt();
			//坐骑
			_mount = readInt();
			//PK类型
			_pkType = readInt();
			//角色属性信息
			var attributes_length : int = readShort();
			for (var i: int = 0; i < attributes_length; i++) {
				_attributes[i] = readBean(AttributeItem) as AttributeItem;
			}
			return true;
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
		 * get 角色名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 角色名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 角色所在地图模版
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 角色所在地图模版
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get 角色所在X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 角色所在X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 角色所在Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 角色所在Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 人物面对方向
		 * @return 
		 */
		public function get dir(): int{
			return _dir;
		}
		
		/**
		 * set 人物面对方向
		 */
		public function set dir(value: int): void{
			this._dir = value;
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
		 * get 阶段
		 * @return 
		 */
		public function get body(): int{
			return _body;
		}
		
		/**
		 * set 阶段
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
		
		/**
		 * get PK类型
		 * @return 
		 */
		public function get pkType(): int{
			return _pkType;
		}
		
		/**
		 * set PK类型
		 */
		public function set pkType(value: int): void{
			this._pkType = value;
		}
		
		/**
		 * get 角色属性信息
		 * @return 
		 */
		public function get attributes(): Vector.<AttributeItem>{
			return _attributes;
		}
		
		/**
		 * set 角色属性信息
		 */
		public function set attributes(value: Vector.<AttributeItem>): void{
			this._attributes = value;
		}
		
	}
}