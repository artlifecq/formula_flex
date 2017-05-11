package com.rpgGame.netData.team.bean{
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 队员信息
	 */
	public class TeamMemberInfo extends Bean {
	
		//队员ID
		private var _memberId: long;
		
		//队员名字
		private var _memberName: String;
		
		//队员等级
		private var _memberLevel: int;
		
		//队员所在地图线路
		private var _memberMapLine: int;
		
		//队员所在地图唯一ID(区分副本用)
		private var _memberMapUniqueID: long;
		
		//玩家是否在线 0否  1是
		private var _isonline: int;
		
		//队员所在地图模组ID
		private var _memberMapModelID: int;
		
		//像素坐标x
		private var _x: int;
		
		//像素坐标y
		private var _y: int;
		
		//队员最大血量
		private var _maxhp: int;
		
		//队员最大灵力
		private var _maxmp: int;
		
		//造型信息
		private var _appearanceInfo: com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队员ID
			writeLong(_memberId);
			//队员名字
			writeString(_memberName);
			//队员等级
			writeInt(_memberLevel);
			//队员所在地图线路
			writeInt(_memberMapLine);
			//队员所在地图唯一ID(区分副本用)
			writeLong(_memberMapUniqueID);
			//玩家是否在线 0否  1是
			writeByte(_isonline);
			//队员所在地图模组ID
			writeInt(_memberMapModelID);
			//像素坐标x
			writeShort(_x);
			//像素坐标y
			writeShort(_y);
			//队员最大血量
			writeInt(_maxhp);
			//队员最大灵力
			writeInt(_maxmp);
			//造型信息
			writeBean(_appearanceInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队员ID
			_memberId = readLong();
			//队员名字
			_memberName = readString();
			//队员等级
			_memberLevel = readInt();
			//队员所在地图线路
			_memberMapLine = readInt();
			//队员所在地图唯一ID(区分副本用)
			_memberMapUniqueID = readLong();
			//玩家是否在线 0否  1是
			_isonline = readByte();
			//队员所在地图模组ID
			_memberMapModelID = readInt();
			//像素坐标x
			_x = readShort();
			//像素坐标y
			_y = readShort();
			//队员最大血量
			_maxhp = readInt();
			//队员最大灵力
			_maxmp = readInt();
			//造型信息
			_appearanceInfo = readBean(com.rpgGame.netData.player.bean.PlayerAppearanceInfo) as com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
			return true;
		}
		
		/**
		 * get 队员ID
		 * @return 
		 */
		public function get memberId(): long{
			return _memberId;
		}
		
		/**
		 * set 队员ID
		 */
		public function set memberId(value: long): void{
			this._memberId = value;
		}
		
		/**
		 * get 队员名字
		 * @return 
		 */
		public function get memberName(): String{
			return _memberName;
		}
		
		/**
		 * set 队员名字
		 */
		public function set memberName(value: String): void{
			this._memberName = value;
		}
		
		/**
		 * get 队员等级
		 * @return 
		 */
		public function get memberLevel(): int{
			return _memberLevel;
		}
		
		/**
		 * set 队员等级
		 */
		public function set memberLevel(value: int): void{
			this._memberLevel = value;
		}
		
		/**
		 * get 队员所在地图线路
		 * @return 
		 */
		public function get memberMapLine(): int{
			return _memberMapLine;
		}
		
		/**
		 * set 队员所在地图线路
		 */
		public function set memberMapLine(value: int): void{
			this._memberMapLine = value;
		}
		
		/**
		 * get 队员所在地图唯一ID(区分副本用)
		 * @return 
		 */
		public function get memberMapUniqueID(): long{
			return _memberMapUniqueID;
		}
		
		/**
		 * set 队员所在地图唯一ID(区分副本用)
		 */
		public function set memberMapUniqueID(value: long): void{
			this._memberMapUniqueID = value;
		}
		
		/**
		 * get 玩家是否在线 0否  1是
		 * @return 
		 */
		public function get isonline(): int{
			return _isonline;
		}
		
		/**
		 * set 玩家是否在线 0否  1是
		 */
		public function set isonline(value: int): void{
			this._isonline = value;
		}
		
		/**
		 * get 队员所在地图模组ID
		 * @return 
		 */
		public function get memberMapModelID(): int{
			return _memberMapModelID;
		}
		
		/**
		 * set 队员所在地图模组ID
		 */
		public function set memberMapModelID(value: int): void{
			this._memberMapModelID = value;
		}
		
		/**
		 * get 像素坐标x
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 像素坐标x
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 像素坐标y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 像素坐标y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 队员最大血量
		 * @return 
		 */
		public function get maxhp(): int{
			return _maxhp;
		}
		
		/**
		 * set 队员最大血量
		 */
		public function set maxhp(value: int): void{
			this._maxhp = value;
		}
		
		/**
		 * get 队员最大灵力
		 * @return 
		 */
		public function get maxmp(): int{
			return _maxmp;
		}
		
		/**
		 * set 队员最大灵力
		 */
		public function set maxmp(value: int): void{
			this._maxmp = value;
		}
		
		/**
		 * get 造型信息
		 * @return 
		 */
		public function get appearanceInfo(): com.rpgGame.netData.player.bean.PlayerAppearanceInfo{
			return _appearanceInfo;
		}
		
		/**
		 * set 造型信息
		 */
		public function set appearanceInfo(value: com.rpgGame.netData.player.bean.PlayerAppearanceInfo): void{
			this._appearanceInfo = value;
		}
		
	}
}