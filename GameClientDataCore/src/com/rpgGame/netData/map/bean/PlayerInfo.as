package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.player.bean.AttributeItem;
	import com.rpgGame.netData.buff.bean.BuffInfo;
	import com.rpgGame.netData.structs.Position;
	import com.rpgGame.netData.structs.IntKeyValue;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 角色信息类(在地图上显示)
	 */
	public class PlayerInfo extends Bean {
	
		//角色Id
		private var _personId: int;
		
		//角色名字
		private var _name: String;
		
		//玩家所在位置
		private var _position: com.rpgGame.netData.structs.Position;
		
		//人物面对方向
		private var _dir: int;
		
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
		
		//战旗
		private var _warflag: int;
		
		//护宝旗
		private var _convoy: int;
		
		//军阶头顶显示
		private var _junJieId: int;
		
		//帮派Id
		private var _guildId: long;
		
		//帮会名称
		private var _guildName: String;
		
		//帮会职位
		private var _guildMemberType: int;
		
		//帮会职位(统帅,1:是,0:不是)
		private var _guildIsLeader: int;
		
		//排行榜称号
		private var _topLeaderTypes: Vector.<int> = new Vector.<int>();
		//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
		private var _pkType: int;
		
		//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
		private var _relation: int;
		
		//阵营Id
		private var _faction: int;
		
		//角色属性信息
		private var _attributes: Vector.<com.rpgGame.netData.player.bean.AttributeItem> = new Vector.<com.rpgGame.netData.player.bean.AttributeItem>();
		//跑步坐标集合
		private var _positions: Vector.<com.rpgGame.netData.structs.Position> = new Vector.<com.rpgGame.netData.structs.Position>();
		//buff列表
		private var _buffs: Vector.<com.rpgGame.netData.buff.bean.BuffInfo> = new Vector.<com.rpgGame.netData.buff.bean.BuffInfo>();
		//额外需要显示的参数
		private var _keyValueList: Vector.<com.rpgGame.netData.structs.IntKeyValue> = new Vector.<com.rpgGame.netData.structs.IntKeyValue>();
		//结婚对象名字
		private var _marriageName: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//角色名字
			writeString(_name);
			//玩家所在位置
			writeBean(_position);
			//人物面对方向
			writeShort(_dir);
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
			//战旗
			writeInt(_warflag);
			//护宝旗
			writeInt(_convoy);
			//军阶头顶显示
			writeInt(_junJieId);
			//帮派Id
			writeLong(_guildId);
			//帮会名称
			writeString(_guildName);
			//帮会职位
			writeInt(_guildMemberType);
			//帮会职位(统帅,1:是,0:不是)
			writeByte(_guildIsLeader);
			//排行榜称号
			writeShort(_topLeaderTypes.length);
			for (var i: int = 0; i < _topLeaderTypes.length; i++) {
				writeInt(_topLeaderTypes[i]);
			}
			//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
			writeByte(_pkType);
			//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
			writeByte(_relation);
			//阵营Id
			writeByte(_faction);
			//角色属性信息
			writeShort(_attributes.length);
			for (var i: int = 0; i < _attributes.length; i++) {
				writeBean(_attributes[i]);
			}
			//跑步坐标集合
			writeShort(_positions.length);
			for (var i: int = 0; i < _positions.length; i++) {
				writeBean(_positions[i]);
			}
			//buff列表
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeBean(_buffs[i]);
			}
			//额外需要显示的参数
			writeShort(_keyValueList.length);
			for (var i: int = 0; i < _keyValueList.length; i++) {
				writeBean(_keyValueList[i]);
			}
			//结婚对象名字
			writeString(_marriageName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//角色名字
			_name = readString();
			//玩家所在位置
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//人物面对方向
			_dir = readShort();
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
			//战旗
			_warflag = readInt();
			//护宝旗
			_convoy = readInt();
			//军阶头顶显示
			_junJieId = readInt();
			//帮派Id
			_guildId = readLong();
			//帮会名称
			_guildName = readString();
			//帮会职位
			_guildMemberType = readInt();
			//帮会职位(统帅,1:是,0:不是)
			_guildIsLeader = readByte();
			//排行榜称号
			var topLeaderTypes_length : int = readShort();
			for (var i: int = 0; i < topLeaderTypes_length; i++) {
				_topLeaderTypes[i] = readInt();
			}
			//PK类型(0-和平 1-组队 2-帮会 3-全体 4-阵营 5-善恶)
			_pkType = readByte();
			//阵营关系，为0则检查默认敌对关系，大于0则和相同阵营友好，不同阵营敌对
			_relation = readByte();
			//阵营Id
			_faction = readByte();
			//角色属性信息
			var attributes_length : int = readShort();
			for (var i: int = 0; i < attributes_length; i++) {
				_attributes[i] = readBean(com.rpgGame.netData.player.bean.AttributeItem) as com.rpgGame.netData.player.bean.AttributeItem;
			}
			//跑步坐标集合
			var positions_length : int = readShort();
			for (var i: int = 0; i < positions_length; i++) {
				_positions[i] = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			}
			//buff列表
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readBean(com.rpgGame.netData.buff.bean.BuffInfo) as com.rpgGame.netData.buff.bean.BuffInfo;
			}
			//额外需要显示的参数
			var keyValueList_length : int = readShort();
			for (var i: int = 0; i < keyValueList_length; i++) {
				_keyValueList[i] = readBean(com.rpgGame.netData.structs.IntKeyValue) as com.rpgGame.netData.structs.IntKeyValue;
			}
			//结婚对象名字
			_marriageName = readString();
			return true;
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
		 * get 玩家所在位置
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 玩家所在位置
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
		
		/**
		 * get 战旗
		 * @return 
		 */
		public function get warflag(): int{
			return _warflag;
		}
		
		/**
		 * set 战旗
		 */
		public function set warflag(value: int): void{
			this._warflag = value;
		}
		
		/**
		 * get 护宝旗
		 * @return 
		 */
		public function get convoy(): int{
			return _convoy;
		}
		
		/**
		 * set 护宝旗
		 */
		public function set convoy(value: int): void{
			this._convoy = value;
		}
		
		/**
		 * get 军阶头顶显示
		 * @return 
		 */
		public function get junJieId(): int{
			return _junJieId;
		}
		
		/**
		 * set 军阶头顶显示
		 */
		public function set junJieId(value: int): void{
			this._junJieId = value;
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
		
		/**
		 * get 帮会名称
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 帮会名称
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
		}
		
		/**
		 * get 帮会职位
		 * @return 
		 */
		public function get guildMemberType(): int{
			return _guildMemberType;
		}
		
		/**
		 * set 帮会职位
		 */
		public function set guildMemberType(value: int): void{
			this._guildMemberType = value;
		}
		
		/**
		 * get 帮会职位(统帅,1:是,0:不是)
		 * @return 
		 */
		public function get guildIsLeader(): int{
			return _guildIsLeader;
		}
		
		/**
		 * set 帮会职位(统帅,1:是,0:不是)
		 */
		public function set guildIsLeader(value: int): void{
			this._guildIsLeader = value;
		}
		
		/**
		 * get 排行榜称号
		 * @return 
		 */
		public function get topLeaderTypes(): Vector.<int>{
			return _topLeaderTypes;
		}
		
		/**
		 * set 排行榜称号
		 */
		public function set topLeaderTypes(value: Vector.<int>): void{
			this._topLeaderTypes = value;
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
		 * get 阵营Id
		 * @return 
		 */
		public function get faction(): int{
			return _faction;
		}
		
		/**
		 * set 阵营Id
		 */
		public function set faction(value: int): void{
			this._faction = value;
		}
		
		/**
		 * get 角色属性信息
		 * @return 
		 */
		public function get attributes(): Vector.<com.rpgGame.netData.player.bean.AttributeItem>{
			return _attributes;
		}
		
		/**
		 * set 角色属性信息
		 */
		public function set attributes(value: Vector.<com.rpgGame.netData.player.bean.AttributeItem>): void{
			this._attributes = value;
		}
		
		/**
		 * get 跑步坐标集合
		 * @return 
		 */
		public function get positions(): Vector.<com.rpgGame.netData.structs.Position>{
			return _positions;
		}
		
		/**
		 * set 跑步坐标集合
		 */
		public function set positions(value: Vector.<com.rpgGame.netData.structs.Position>): void{
			this._positions = value;
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
		 * get 额外需要显示的参数
		 * @return 
		 */
		public function get keyValueList(): Vector.<com.rpgGame.netData.structs.IntKeyValue>{
			return _keyValueList;
		}
		
		/**
		 * set 额外需要显示的参数
		 */
		public function set keyValueList(value: Vector.<com.rpgGame.netData.structs.IntKeyValue>): void{
			this._keyValueList = value;
		}
		
		/**
		 * get 结婚对象名字
		 * @return 
		 */
		public function get marriageName(): String{
			return _marriageName;
		}
		
		/**
		 * set 结婚对象名字
		 */
		public function set marriageName(value: String): void{
			this._marriageName = value;
		}
		
	}
}