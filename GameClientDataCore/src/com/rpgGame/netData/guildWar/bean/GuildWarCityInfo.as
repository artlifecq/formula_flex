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
	 * 王城信息
	 */
	public class GuildWarCityInfo extends Bean {
	
		//王城Id
		private var _id: int;
		
		//占领帮派名
		private var _occupyGuildName: String;
		
		//占领帮派Id
		private var _occupyGuildId: long;
		
		//指令帮派帮主名
		private var _occupyCheifName: String;
		
		//占领天数
		private var _occupyDay: int;
		
		//攻击帮派名
		private var _attackGuildName: String;
		
		//攻击帮派Id
		private var _attackGuildId: long;
		
		//状态,2:竞标,3:准备,4:战斗,5:结束
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//王城Id
			writeInt(_id);
			//占领帮派名
			writeString(_occupyGuildName);
			//占领帮派Id
			writeLong(_occupyGuildId);
			//指令帮派帮主名
			writeString(_occupyCheifName);
			//占领天数
			writeInt(_occupyDay);
			//攻击帮派名
			writeString(_attackGuildName);
			//攻击帮派Id
			writeLong(_attackGuildId);
			//状态,2:竞标,3:准备,4:战斗,5:结束
			writeInt(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//王城Id
			_id = readInt();
			//占领帮派名
			_occupyGuildName = readString();
			//占领帮派Id
			_occupyGuildId = readLong();
			//指令帮派帮主名
			_occupyCheifName = readString();
			//占领天数
			_occupyDay = readInt();
			//攻击帮派名
			_attackGuildName = readString();
			//攻击帮派Id
			_attackGuildId = readLong();
			//状态,2:竞标,3:准备,4:战斗,5:结束
			_state = readInt();
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
		 * get 占领帮派名
		 * @return 
		 */
		public function get occupyGuildName(): String{
			return _occupyGuildName;
		}
		
		/**
		 * set 占领帮派名
		 */
		public function set occupyGuildName(value: String): void{
			this._occupyGuildName = value;
		}
		
		/**
		 * get 占领帮派Id
		 * @return 
		 */
		public function get occupyGuildId(): long{
			return _occupyGuildId;
		}
		
		/**
		 * set 占领帮派Id
		 */
		public function set occupyGuildId(value: long): void{
			this._occupyGuildId = value;
		}
		
		/**
		 * get 指令帮派帮主名
		 * @return 
		 */
		public function get occupyCheifName(): String{
			return _occupyCheifName;
		}
		
		/**
		 * set 指令帮派帮主名
		 */
		public function set occupyCheifName(value: String): void{
			this._occupyCheifName = value;
		}
		
		/**
		 * get 占领天数
		 * @return 
		 */
		public function get occupyDay(): int{
			return _occupyDay;
		}
		
		/**
		 * set 占领天数
		 */
		public function set occupyDay(value: int): void{
			this._occupyDay = value;
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
		 * get 状态,2:竞标,3:准备,4:战斗,5:结束
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 状态,2:竞标,3:准备,4:战斗,5:结束
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}