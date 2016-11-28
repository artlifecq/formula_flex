package com.rpgGame.netData.guild.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 成员信息
	 */
	public class MemberInfo extends Bean {
	
		//玩家id
		private var _playerId: long;
		
		//玩家名
		private var _playerName: String;
		
		//所在地图Id
		private var _mapModelId: int;
		
		//玩家等级
		private var _level: int;
		
		//帮会职位等级 1 帮主 2 副帮主
		private var _guildPowerLevel: int;
		
		//昵称
		private var _nickName: String;
		
		//入会时间
		private var _addTime: int;
		
		//上次在线时间
		private var _lastOnlineTime: int;
		
		//战斗力
		private var _fightPower: int;
		
		//是否在线
		private var _isOnline: int;
		
		//军衔等级
		private var _rankLevel: int;
		
		//历史捐献金币
		private var _hisGuildMoney: long;
		
		//历史捐献青龙令
		private var _hisQingLong: int;
		
		//历史捐献白虎令
		private var _hisBaiHu: int;
		
		//历史捐献朱雀令
		private var _hisZhuQue: int;
		
		//历史捐献玄武令
		private var _hisXuanWu: int;
		
		//今日贡献点
		private var _todayDevote: int;
		
		//是否已领取军功值 1已领取 0否
		private var _isRewardRank: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家id
			writeLong(_playerId);
			//玩家名
			writeString(_playerName);
			//所在地图Id
			writeInt(_mapModelId);
			//玩家等级
			writeInt(_level);
			//帮会职位等级 1 帮主 2 副帮主
			writeByte(_guildPowerLevel);
			//昵称
			writeString(_nickName);
			//入会时间
			writeInt(_addTime);
			//上次在线时间
			writeInt(_lastOnlineTime);
			//战斗力
			writeInt(_fightPower);
			//是否在线
			writeByte(_isOnline);
			//军衔等级
			writeInt(_rankLevel);
			//历史捐献金币
			writeLong(_hisGuildMoney);
			//历史捐献青龙令
			writeInt(_hisQingLong);
			//历史捐献白虎令
			writeInt(_hisBaiHu);
			//历史捐献朱雀令
			writeInt(_hisZhuQue);
			//历史捐献玄武令
			writeInt(_hisXuanWu);
			//今日贡献点
			writeInt(_todayDevote);
			//是否已领取军功值 1已领取 0否
			writeByte(_isRewardRank);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家id
			_playerId = readLong();
			//玩家名
			_playerName = readString();
			//所在地图Id
			_mapModelId = readInt();
			//玩家等级
			_level = readInt();
			//帮会职位等级 1 帮主 2 副帮主
			_guildPowerLevel = readByte();
			//昵称
			_nickName = readString();
			//入会时间
			_addTime = readInt();
			//上次在线时间
			_lastOnlineTime = readInt();
			//战斗力
			_fightPower = readInt();
			//是否在线
			_isOnline = readByte();
			//军衔等级
			_rankLevel = readInt();
			//历史捐献金币
			_hisGuildMoney = readLong();
			//历史捐献青龙令
			_hisQingLong = readInt();
			//历史捐献白虎令
			_hisBaiHu = readInt();
			//历史捐献朱雀令
			_hisZhuQue = readInt();
			//历史捐献玄武令
			_hisXuanWu = readInt();
			//今日贡献点
			_todayDevote = readInt();
			//是否已领取军功值 1已领取 0否
			_isRewardRank = readByte();
			return true;
		}
		
		/**
		 * get 玩家id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 玩家名
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 所在地图Id
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 所在地图Id
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get 玩家等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 玩家等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 帮会职位等级 1 帮主 2 副帮主
		 * @return 
		 */
		public function get guildPowerLevel(): int{
			return _guildPowerLevel;
		}
		
		/**
		 * set 帮会职位等级 1 帮主 2 副帮主
		 */
		public function set guildPowerLevel(value: int): void{
			this._guildPowerLevel = value;
		}
		
		/**
		 * get 昵称
		 * @return 
		 */
		public function get nickName(): String{
			return _nickName;
		}
		
		/**
		 * set 昵称
		 */
		public function set nickName(value: String): void{
			this._nickName = value;
		}
		
		/**
		 * get 入会时间
		 * @return 
		 */
		public function get addTime(): int{
			return _addTime;
		}
		
		/**
		 * set 入会时间
		 */
		public function set addTime(value: int): void{
			this._addTime = value;
		}
		
		/**
		 * get 上次在线时间
		 * @return 
		 */
		public function get lastOnlineTime(): int{
			return _lastOnlineTime;
		}
		
		/**
		 * set 上次在线时间
		 */
		public function set lastOnlineTime(value: int): void{
			this._lastOnlineTime = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fightPower(): int{
			return _fightPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fightPower(value: int): void{
			this._fightPower = value;
		}
		
		/**
		 * get 是否在线
		 * @return 
		 */
		public function get isOnline(): int{
			return _isOnline;
		}
		
		/**
		 * set 是否在线
		 */
		public function set isOnline(value: int): void{
			this._isOnline = value;
		}
		
		/**
		 * get 军衔等级
		 * @return 
		 */
		public function get rankLevel(): int{
			return _rankLevel;
		}
		
		/**
		 * set 军衔等级
		 */
		public function set rankLevel(value: int): void{
			this._rankLevel = value;
		}
		
		/**
		 * get 历史捐献金币
		 * @return 
		 */
		public function get hisGuildMoney(): long{
			return _hisGuildMoney;
		}
		
		/**
		 * set 历史捐献金币
		 */
		public function set hisGuildMoney(value: long): void{
			this._hisGuildMoney = value;
		}
		
		/**
		 * get 历史捐献青龙令
		 * @return 
		 */
		public function get hisQingLong(): int{
			return _hisQingLong;
		}
		
		/**
		 * set 历史捐献青龙令
		 */
		public function set hisQingLong(value: int): void{
			this._hisQingLong = value;
		}
		
		/**
		 * get 历史捐献白虎令
		 * @return 
		 */
		public function get hisBaiHu(): int{
			return _hisBaiHu;
		}
		
		/**
		 * set 历史捐献白虎令
		 */
		public function set hisBaiHu(value: int): void{
			this._hisBaiHu = value;
		}
		
		/**
		 * get 历史捐献朱雀令
		 * @return 
		 */
		public function get hisZhuQue(): int{
			return _hisZhuQue;
		}
		
		/**
		 * set 历史捐献朱雀令
		 */
		public function set hisZhuQue(value: int): void{
			this._hisZhuQue = value;
		}
		
		/**
		 * get 历史捐献玄武令
		 * @return 
		 */
		public function get hisXuanWu(): int{
			return _hisXuanWu;
		}
		
		/**
		 * set 历史捐献玄武令
		 */
		public function set hisXuanWu(value: int): void{
			this._hisXuanWu = value;
		}
		
		/**
		 * get 今日贡献点
		 * @return 
		 */
		public function get todayDevote(): int{
			return _todayDevote;
		}
		
		/**
		 * set 今日贡献点
		 */
		public function set todayDevote(value: int): void{
			this._todayDevote = value;
		}
		
		/**
		 * get 是否已领取军功值 1已领取 0否
		 * @return 
		 */
		public function get isRewardRank(): int{
			return _isRewardRank;
		}
		
		/**
		 * set 是否已领取军功值 1已领取 0否
		 */
		public function set isRewardRank(value: int): void{
			this._isRewardRank = value;
		}
		
	}
}