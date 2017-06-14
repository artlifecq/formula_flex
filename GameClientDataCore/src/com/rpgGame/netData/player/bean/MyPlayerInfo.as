package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.ResourceDataItem;
	import com.rpgGame.netData.player.bean.AttributeItem;
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.structs.Position;
	
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
		
		//角色所在位置
		private var _position: com.rpgGame.netData.structs.Position;
		
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
		
		//头发
		private var _hair: int;
		
		//主武器
		private var _weapon: int;
		
		//副武器
		private var _second_weapon: int;
		
		//坐骑
		private var _mount: int;
		
		//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
		private var _pkType: int;
		
		//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
		private var _relation: int;
		
		//角色属性信息
		private var _attributes: Vector.<AttributeItem> = new Vector.<AttributeItem>();
		//buff列表
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		//资源属性项
		private var _resourceData: Vector.<ResourceDataItem> = new Vector.<ResourceDataItem>();
		//当前经验值
		private var _exp: long;
		
		//最大经验值
		private var _maxExp: long;
		
		//最大真气值
		private var _maxZhenQi: long;
		
		//帮派Id
		private var _guildId: long;
		
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
			//角色所在位置
			writeBean(_position);
			//人物面对方向
			writeShort(_dir);
			//玩家性别 1男 2女
			writeByte(_sex);
			//阶段
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
			//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
			writeByte(_pkType);
			//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
			writeByte(_relation);
			//角色属性信息
			writeShort(_attributes.length);
			for (var i: int = 0; i < _attributes.length; i++) {
				writeBean(_attributes[i]);
			}
			//buff列表
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			//资源属性项
			writeShort(_resourceData.length);
			for (var i: int = 0; i < _resourceData.length; i++) {
				writeBean(_resourceData[i]);
			}
			//当前经验值
			writeLong(_exp);
			//最大经验值
			writeLong(_maxExp);
			//最大真气值
			writeLong(_maxZhenQi);
			//帮派Id
			writeLong(_guildId);
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
			//角色所在位置
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//人物面对方向
			_dir = readShort();
			//玩家性别 1男 2女
			_sex = readByte();
			//阶段
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
			//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
			_pkType = readByte();
			//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
			_relation = readByte();
			//角色属性信息
			var attributes_length : int = readShort();
			for (var i: int = 0; i < attributes_length; i++) {
				_attributes[i] = readBean(AttributeItem) as AttributeItem;
			}
			//buff列表
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			//资源属性项
			var resourceData_length : int = readShort();
			for (var i: int = 0; i < resourceData_length; i++) {
				_resourceData[i] = readBean(ResourceDataItem) as ResourceDataItem;
			}
			//当前经验值
			_exp = readLong();
			//最大经验值
			_maxExp = readLong();
			//最大真气值
			_maxZhenQi = readLong();
			//帮派Id
			_guildId = readLong();
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
		 * get 角色所在位置
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 角色所在位置
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
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
		
		/**
		 * get PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
		 * @return 
		 */
		public function get pkType(): int{
			return _pkType;
		}
		
		/**
		 * set PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
		 */
		public function set pkType(value: int): void{
			this._pkType = value;
		}
		
		/**
		 * get 阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
		 * @return 
		 */
		public function get relation(): int{
			return _relation;
		}
		
		/**
		 * set 阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
		 */
		public function set relation(value: int): void{
			this._relation = value;
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
		
		/**
		 * get buff列表
		 * @return 
		 */
		public function get buffs(): Vector.<com.rpgGame.netData.buff.bean.BuffInfo>{
			return _buffs;
		}
		
		/**
		 * set buff列表
		 */
		public function set buffs(value: Vector.<com.rpgGame.netData.buff.bean.BuffInfo>): void{
			this._buffs = value;
		}
		
		/**
		 * get 资源属性项
		 * @return 
		 */
		public function get resourceData(): Vector.<ResourceDataItem>{
			return _resourceData;
		}
		
		/**
		 * set 资源属性项
		 */
		public function set resourceData(value: Vector.<ResourceDataItem>): void{
			this._resourceData = value;
		}
		
		/**
		 * get 当前经验值
		 * @return 
		 */
		public function get exp(): long{
			return _exp;
		}
		
		/**
		 * set 当前经验值
		 */
		public function set exp(value: long): void{
			this._exp = value;
		}
		
		/**
		 * get 最大经验值
		 * @return 
		 */
		public function get maxExp(): long{
			return _maxExp;
		}
		
		/**
		 * set 最大经验值
		 */
		public function set maxExp(value: long): void{
			this._maxExp = value;
		}
		
		/**
		 * get 最大真气值
		 * @return 
		 */
		public function get maxZhenQi(): long{
			return _maxZhenQi;
		}
		
		/**
		 * set 最大真气值
		 */
		public function set maxZhenQi(value: long): void{
			this._maxZhenQi = value;
		}
		
		/**
		 * get 帮派Id
		 * @return 
		 */
		public function get guildId(): long{
			return _guildId;
		}
		
		/**
		 * set 帮派Id
		 */
		public function set guildId(value: long): void{
			this._guildId = value;
		}
		
	}
}