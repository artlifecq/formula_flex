package com.rpgGame.netData.team.bean{
	import com.rpgGame.netData.team.bean.TeamMemberNameInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 当前地图队伍信息类
	 */
	public class MapTeamInfo extends Bean {
	
		//队伍Id
		private var _teamid: long;
		
		//队长Id
		private var _captainid: long;
		
		//队长名字
		private var _captainname: String;
		
		//队伍人数
		private var _teamnum: int;
		
		//队长等级
		private var _captainlv: int;
		
		//队长地图
		private var _captainMap: int;
		
		//最高等级
		private var _highestlv: int;
		
		//平均等级
		private var _averagelv: int;
		
		//平均战斗力
		private var _avgFightPower: int;
		
		//所在线路
		private var _line: int;
		
		//队伍成员信息列表
		private var _memberinfo: Vector.<TeamMemberNameInfo> = new Vector.<TeamMemberNameInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队伍Id
			writeLong(_teamid);
			//队长Id
			writeLong(_captainid);
			//队长名字
			writeString(_captainname);
			//队伍人数
			writeByte(_teamnum);
			//队长等级
			writeShort(_captainlv);
			//队长地图
			writeInt(_captainMap);
			//最高等级
			writeShort(_highestlv);
			//平均等级
			writeShort(_averagelv);
			//平均战斗力
			writeInt(_avgFightPower);
			//所在线路
			writeByte(_line);
			//队伍成员信息列表
			writeShort(_memberinfo.length);
			for (var i: int = 0; i < _memberinfo.length; i++) {
				writeBean(_memberinfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队伍Id
			_teamid = readLong();
			//队长Id
			_captainid = readLong();
			//队长名字
			_captainname = readString();
			//队伍人数
			_teamnum = readByte();
			//队长等级
			_captainlv = readShort();
			//队长地图
			_captainMap = readInt();
			//最高等级
			_highestlv = readShort();
			//平均等级
			_averagelv = readShort();
			//平均战斗力
			_avgFightPower = readInt();
			//所在线路
			_line = readByte();
			//队伍成员信息列表
			var memberinfo_length : int = readShort();
			for (var i: int = 0; i < memberinfo_length; i++) {
				_memberinfo[i] = readBean(TeamMemberNameInfo) as TeamMemberNameInfo;
			}
			return true;
		}
		
		/**
		 * get 队伍Id
		 * @return 
		 */
		public function get teamid(): long{
			return _teamid;
		}
		
		/**
		 * set 队伍Id
		 */
		public function set teamid(value: long): void{
			this._teamid = value;
		}
		
		/**
		 * get 队长Id
		 * @return 
		 */
		public function get captainid(): long{
			return _captainid;
		}
		
		/**
		 * set 队长Id
		 */
		public function set captainid(value: long): void{
			this._captainid = value;
		}
		
		/**
		 * get 队长名字
		 * @return 
		 */
		public function get captainname(): String{
			return _captainname;
		}
		
		/**
		 * set 队长名字
		 */
		public function set captainname(value: String): void{
			this._captainname = value;
		}
		
		/**
		 * get 队伍人数
		 * @return 
		 */
		public function get teamnum(): int{
			return _teamnum;
		}
		
		/**
		 * set 队伍人数
		 */
		public function set teamnum(value: int): void{
			this._teamnum = value;
		}
		
		/**
		 * get 队长等级
		 * @return 
		 */
		public function get captainlv(): int{
			return _captainlv;
		}
		
		/**
		 * set 队长等级
		 */
		public function set captainlv(value: int): void{
			this._captainlv = value;
		}
		
		/**
		 * get 队长地图
		 * @return 
		 */
		public function get captainMap(): int{
			return _captainMap;
		}
		
		/**
		 * set 队长地图
		 */
		public function set captainMap(value: int): void{
			this._captainMap = value;
		}
		
		/**
		 * get 最高等级
		 * @return 
		 */
		public function get highestlv(): int{
			return _highestlv;
		}
		
		/**
		 * set 最高等级
		 */
		public function set highestlv(value: int): void{
			this._highestlv = value;
		}
		
		/**
		 * get 平均等级
		 * @return 
		 */
		public function get averagelv(): int{
			return _averagelv;
		}
		
		/**
		 * set 平均等级
		 */
		public function set averagelv(value: int): void{
			this._averagelv = value;
		}
		
		/**
		 * get 平均战斗力
		 * @return 
		 */
		public function get avgFightPower(): int{
			return _avgFightPower;
		}
		
		/**
		 * set 平均战斗力
		 */
		public function set avgFightPower(value: int): void{
			this._avgFightPower = value;
		}
		
		/**
		 * get 所在线路
		 * @return 
		 */
		public function get line(): int{
			return _line;
		}
		
		/**
		 * set 所在线路
		 */
		public function set line(value: int): void{
			this._line = value;
		}
		
		/**
		 * get 队伍成员信息列表
		 * @return 
		 */
		public function get memberinfo(): Vector.<TeamMemberNameInfo>{
			return _memberinfo;
		}
		
		/**
		 * set 队伍成员信息列表
		 */
		public function set memberinfo(value: Vector.<TeamMemberNameInfo>): void{
			this._memberinfo = value;
		}
		
	}
}