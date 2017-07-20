package com.rpgGame.netData.top.bean{
	import com.rpgGame.netData.player.bean.PlayerBriefInfo;
	
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
		
		//玩家职业
		private var _job: int;
		
		//排名
		private var _rank: int;
		
		//排行类型 1等级 2坐骑 3 战斗力 ....
		private var _toptype: int;
		
		//排行参数(等级榜对应等级 战力对应战斗力)
		private var _param: int;
		
		//角色外观
		private var _playerBriefInfo: com.rpgGame.netData.player.bean.PlayerBriefInfo;
		
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
			//玩家职业
			writeInt(_job);
			//排名
			writeInt(_rank);
			//排行类型 1等级 2坐骑 3 战斗力 ....
			writeInt(_toptype);
			//排行参数(等级榜对应等级 战力对应战斗力)
			writeInt(_param);
			//角色外观
			writeBean(_playerBriefInfo);
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
			//玩家职业
			_job = readInt();
			//排名
			_rank = readInt();
			//排行类型 1等级 2坐骑 3 战斗力 ....
			_toptype = readInt();
			//排行参数(等级榜对应等级 战力对应战斗力)
			_param = readInt();
			//角色外观
			_playerBriefInfo = readBean(com.rpgGame.netData.player.bean.PlayerBriefInfo) as com.rpgGame.netData.player.bean.PlayerBriefInfo;
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
		 * get 玩家职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 玩家职业
		 */
		public function set job(value: int): void{
			this._job = value;
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
		 * get 角色外观
		 * @return 
		 */
		public function get playerBriefInfo(): com.rpgGame.netData.player.bean.PlayerBriefInfo{
			return _playerBriefInfo;
		}
		
		/**
		 * set 角色外观
		 */
		public function set playerBriefInfo(value: com.rpgGame.netData.player.bean.PlayerBriefInfo): void{
			this._playerBriefInfo = value;
		}
		
	}
}