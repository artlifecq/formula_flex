package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.GuildAvatarInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回跨服帮会战占领信息
	 */
	public class G2CRespKingGuidWarAvatarInfoMessage extends Message {
	
		//占领帮派名
		private var _guildName: String;
		
		//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
		private var _haveDailyGift: int;
		
		//外观信息
		private var _avatarInfo: Vector.<GuildAvatarInfo> = new Vector.<GuildAvatarInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//占领帮派名
			writeString(_guildName);
			//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
			writeByte(_haveDailyGift);
			//外观信息
			writeShort(_avatarInfo.length);
			for (i = 0; i < _avatarInfo.length; i++) {
				writeBean(_avatarInfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//占领帮派名
			_guildName = readString();
			//是否还有每日礼包,-1:没有奖励,1:还没领取,0:已经领取
			_haveDailyGift = readByte();
			//外观信息
			var avatarInfo_length : int = readShort();
			for (i = 0; i < avatarInfo_length; i++) {
				_avatarInfo[i] = readBean(GuildAvatarInfo) as GuildAvatarInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253114;
		}
		
		/**
		 * get 占领帮派名
		 * @return 
		 */
		public function get guildName(): String{
			return _guildName;
		}
		
		/**
		 * set 占领帮派名
		 */
		public function set guildName(value: String): void{
			this._guildName = value;
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
		 * get 外观信息
		 * @return 
		 */
		public function get avatarInfo(): Vector.<GuildAvatarInfo>{
			return _avatarInfo;
		}
		
		/**
		 * set 外观信息
		 */
		public function set avatarInfo(value: Vector.<GuildAvatarInfo>): void{
			this._avatarInfo = value;
		}
		
	}
}