package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.GuildWarGuildRank;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复王城信息
	 */
	public class ResGuildWarCityInfoMessage extends Message {
	
		//王城列表
		private var _citys: Vector.<GuildWarCityInfo> = new Vector.<GuildWarCityInfo>();
		//帮会排行
		private var _ranks: Vector.<GuildWarGuildRank> = new Vector.<GuildWarGuildRank>();
		//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
		private var _haveDailyGift: int;
		
		//本次帮会战时间(s),-1:没有战争
		private var _curWarTime: int;
		
		//下一次帮会战时间(s)
		private var _nextWarTime: int;
		
		//帮派活跃度
		private var _guildActive: int;
		
		//申请城市Id, -1:没有申请
		private var _applyCityId: int;
		
		//申请城市中,当前出价最高帮派Id,-1:没有
		private var _curMaxPriceGuildId: int;
		
		//申请城市中,当前出价最高帮派名
		private var _curMaxPriceGuildName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//王城列表
			writeShort(_citys.length);
			for (i = 0; i < _citys.length; i++) {
				writeBean(_citys[i]);
			}
			//帮会排行
			writeShort(_ranks.length);
			for (i = 0; i < _ranks.length; i++) {
				writeBean(_ranks[i]);
			}
			//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
			writeByte(_haveDailyGift);
			//本次帮会战时间(s),-1:没有战争
			writeInt(_curWarTime);
			//下一次帮会战时间(s)
			writeInt(_nextWarTime);
			//帮派活跃度
			writeInt(_guildActive);
			//申请城市Id, -1:没有申请
			writeInt(_applyCityId);
			//申请城市中,当前出价最高帮派Id,-1:没有
			writeInt(_curMaxPriceGuildId);
			//申请城市中,当前出价最高帮派名
			writeString(_curMaxPriceGuildName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//王城列表
			var citys_length : int = readShort();
			for (i = 0; i < citys_length; i++) {
				_citys[i] = readBean(GuildWarCityInfo) as GuildWarCityInfo;
			}
			//帮会排行
			var ranks_length : int = readShort();
			for (i = 0; i < ranks_length; i++) {
				_ranks[i] = readBean(GuildWarGuildRank) as GuildWarGuildRank;
			}
			//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
			_haveDailyGift = readByte();
			//本次帮会战时间(s),-1:没有战争
			_curWarTime = readInt();
			//下一次帮会战时间(s)
			_nextWarTime = readInt();
			//帮派活跃度
			_guildActive = readInt();
			//申请城市Id, -1:没有申请
			_applyCityId = readInt();
			//申请城市中,当前出价最高帮派Id,-1:没有
			_curMaxPriceGuildId = readInt();
			//申请城市中,当前出价最高帮派名
			_curMaxPriceGuildName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253101;
		}
		
		/**
		 * get 王城列表
		 * @return 
		 */
		public function get citys(): Vector.<GuildWarCityInfo>{
			return _citys;
		}
		
		/**
		 * set 王城列表
		 */
		public function set citys(value: Vector.<GuildWarCityInfo>): void{
			this._citys = value;
		}
		
		/**
		 * get 帮会排行
		 * @return 
		 */
		public function get ranks(): Vector.<GuildWarGuildRank>{
			return _ranks;
		}
		
		/**
		 * set 帮会排行
		 */
		public function set ranks(value: Vector.<GuildWarGuildRank>): void{
			this._ranks = value;
		}
		
		/**
		 * get 是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
		 * @return 
		 */
		public function get haveDailyGift(): int{
			return _haveDailyGift;
		}
		
		/**
		 * set 是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
		 */
		public function set haveDailyGift(value: int): void{
			this._haveDailyGift = value;
		}
		
		/**
		 * get 本次帮会战时间(s),-1:没有战争
		 * @return 
		 */
		public function get curWarTime(): int{
			return _curWarTime;
		}
		
		/**
		 * set 本次帮会战时间(s),-1:没有战争
		 */
		public function set curWarTime(value: int): void{
			this._curWarTime = value;
		}
		
		/**
		 * get 下一次帮会战时间(s)
		 * @return 
		 */
		public function get nextWarTime(): int{
			return _nextWarTime;
		}
		
		/**
		 * set 下一次帮会战时间(s)
		 */
		public function set nextWarTime(value: int): void{
			this._nextWarTime = value;
		}
		
		/**
		 * get 帮派活跃度
		 * @return 
		 */
		public function get guildActive(): int{
			return _guildActive;
		}
		
		/**
		 * set 帮派活跃度
		 */
		public function set guildActive(value: int): void{
			this._guildActive = value;
		}
		
		/**
		 * get 申请城市Id, -1:没有申请
		 * @return 
		 */
		public function get applyCityId(): int{
			return _applyCityId;
		}
		
		/**
		 * set 申请城市Id, -1:没有申请
		 */
		public function set applyCityId(value: int): void{
			this._applyCityId = value;
		}
		
		/**
		 * get 申请城市中,当前出价最高帮派Id,-1:没有
		 * @return 
		 */
		public function get curMaxPriceGuildId(): int{
			return _curMaxPriceGuildId;
		}
		
		/**
		 * set 申请城市中,当前出价最高帮派Id,-1:没有
		 */
		public function set curMaxPriceGuildId(value: int): void{
			this._curMaxPriceGuildId = value;
		}
		
		/**
		 * get 申请城市中,当前出价最高帮派名
		 * @return 
		 */
		public function get curMaxPriceGuildName(): String{
			return _curMaxPriceGuildName;
		}
		
		/**
		 * set 申请城市中,当前出价最高帮派名
		 */
		public function set curMaxPriceGuildName(value: String): void{
			this._curMaxPriceGuildName = value;
		}
		
	}
}