package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮派信息
	 */
	public class ResGuildInfoMessage extends Message {
	
		//帮派信息
		private var _guildInfo: GuildInfo;
		
		//帮派成员列表
		private var _memberList: Vector.<GuildMemberInfo> = new Vector.<GuildMemberInfo>();
		//是否还有每日礼包,1:还没领取,0:已经领取
		private var _haveDailyGift: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮派信息
			writeBean(_guildInfo);
			//帮派成员列表
			writeShort(_memberList.length);
			for (i = 0; i < _memberList.length; i++) {
				writeBean(_memberList[i]);
			}
			//是否还有每日礼包,1:还没领取,0:已经领取
			writeByte(_haveDailyGift);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮派信息
			_guildInfo = readBean(GuildInfo) as GuildInfo;
			//帮派成员列表
			var memberList_length : int = readShort();
			for (i = 0; i < memberList_length; i++) {
				_memberList[i] = readBean(GuildMemberInfo) as GuildMemberInfo;
			}
			//是否还有每日礼包,1:还没领取,0:已经领取
			_haveDailyGift = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111101;
		}
		
		/**
		 * get 帮派信息
		 * @return 
		 */
		public function get guildInfo(): GuildInfo{
			return _guildInfo;
		}
		
		/**
		 * set 帮派信息
		 */
		public function set guildInfo(value: GuildInfo): void{
			this._guildInfo = value;
		}
		
		/**
		 * get 帮派成员列表
		 * @return 
		 */
		public function get memberList(): Vector.<GuildMemberInfo>{
			return _memberList;
		}
		
		/**
		 * set 帮派成员列表
		 */
		public function set memberList(value: Vector.<GuildMemberInfo>): void{
			this._memberList = value;
		}
		
		/**
		 * get 是否还有每日礼包,1:还没领取,0:已经领取
		 * @return 
		 */
		public function get haveDailyGift(): int{
			return _haveDailyGift;
		}
		
		/**
		 * set 是否还有每日礼包,1:还没领取,0:已经领取
		 */
		public function set haveDailyGift(value: int): void{
			this._haveDailyGift = value;
		}
		
	}
}