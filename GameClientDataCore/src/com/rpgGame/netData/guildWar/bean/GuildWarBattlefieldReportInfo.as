package com.rpgGame.netData.guildWar.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战报信息
	 */
	public class GuildWarBattlefieldReportInfo extends Bean {
	
		//王城Id
		private var _id: int;
		
		//争夺时间(s)
		private var _warTime: int;
		
		//攻击帮派名
		private var _attackGuildName: String;
		
		//攻击帮派Id
		private var _attackGuildId: long;
		
		//防守帮派名
		private var _defendGuildName: String;
		
		//防守帮派Id
		private var _defendGuildId: long;
		
		//胜利帮派Id
		private var _winGuildId: long;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//王城Id
			writeInt(_id);
			//争夺时间(s)
			writeInt(_warTime);
			//攻击帮派名
			writeString(_attackGuildName);
			//攻击帮派Id
			writeLong(_attackGuildId);
			//防守帮派名
			writeString(_defendGuildName);
			//防守帮派Id
			writeLong(_defendGuildId);
			//胜利帮派Id
			writeLong(_winGuildId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//王城Id
			_id = readInt();
			//争夺时间(s)
			_warTime = readInt();
			//攻击帮派名
			_attackGuildName = readString();
			//攻击帮派Id
			_attackGuildId = readLong();
			//防守帮派名
			_defendGuildName = readString();
			//防守帮派Id
			_defendGuildId = readLong();
			//胜利帮派Id
			_winGuildId = readLong();
			return true;
		}
		
		/**
		 * get 王城Id
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 王城Id
		 */
		public function set id(value: int): void{
			this._id = value;
		}
		
		/**
		 * get 争夺时间(s)
		 * @return 
		 */
		public function get warTime(): int{
			return _warTime;
		}
		
		/**
		 * set 争夺时间(s)
		 */
		public function set warTime(value: int): void{
			this._warTime = value;
		}
		
		/**
		 * get 攻击帮派名
		 * @return 
		 */
		public function get attackGuildName(): String{
			return _attackGuildName;
		}
		
		/**
		 * set 攻击帮派名
		 */
		public function set attackGuildName(value: String): void{
			this._attackGuildName = value;
		}
		
		/**
		 * get 攻击帮派Id
		 * @return 
		 */
		public function get attackGuildId(): long{
			return _attackGuildId;
		}
		
		/**
		 * set 攻击帮派Id
		 */
		public function set attackGuildId(value: long): void{
			this._attackGuildId = value;
		}
		
		/**
		 * get 防守帮派名
		 * @return 
		 */
		public function get defendGuildName(): String{
			return _defendGuildName;
		}
		
		/**
		 * set 防守帮派名
		 */
		public function set defendGuildName(value: String): void{
			this._defendGuildName = value;
		}
		
		/**
		 * get 防守帮派Id
		 * @return 
		 */
		public function get defendGuildId(): long{
			return _defendGuildId;
		}
		
		/**
		 * set 防守帮派Id
		 */
		public function set defendGuildId(value: long): void{
			this._defendGuildId = value;
		}
		
		/**
		 * get 胜利帮派Id
		 * @return 
		 */
		public function get winGuildId(): long{
			return _winGuildId;
		}
		
		/**
		 * set 胜利帮派Id
		 */
		public function set winGuildId(value: long): void{
			this._winGuildId = value;
		}
		
	}
}