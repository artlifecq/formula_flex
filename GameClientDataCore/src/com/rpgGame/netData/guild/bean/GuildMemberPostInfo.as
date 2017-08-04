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
	 * 帮派成员职位信息
	 */
	public class GuildMemberPostInfo extends Bean {
	
		//玩家Id
		private var _playerId: long;
		
		//职位类型
		private var _memberType: int;
		
		//是否是统帅,1:是,0:不是
		private var _isLeader: int;
		
		//是否是代理帮主,1:是,0:不是
		private var _isProxyChief: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家Id
			writeLong(_playerId);
			//职位类型
			writeInt(_memberType);
			//是否是统帅,1:是,0:不是
			writeByte(_isLeader);
			//是否是代理帮主,1:是,0:不是
			writeByte(_isProxyChief);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家Id
			_playerId = readLong();
			//职位类型
			_memberType = readInt();
			//是否是统帅,1:是,0:不是
			_isLeader = readByte();
			//是否是代理帮主,1:是,0:不是
			_isProxyChief = readByte();
			return true;
		}
		
		/**
		 * get 玩家Id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 玩家Id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 职位类型
		 * @return 
		 */
		public function get memberType(): int{
			return _memberType;
		}
		
		/**
		 * set 职位类型
		 */
		public function set memberType(value: int): void{
			this._memberType = value;
		}
		
		/**
		 * get 是否是统帅,1:是,0:不是
		 * @return 
		 */
		public function get isLeader(): int{
			return _isLeader;
		}
		
		/**
		 * set 是否是统帅,1:是,0:不是
		 */
		public function set isLeader(value: int): void{
			this._isLeader = value;
		}
		
		/**
		 * get 是否是代理帮主,1:是,0:不是
		 * @return 
		 */
		public function get isProxyChief(): int{
			return _isProxyChief;
		}
		
		/**
		 * set 是否是代理帮主,1:是,0:不是
		 */
		public function set isProxyChief(value: int): void{
			this._isProxyChief = value;
		}
		
	}
}