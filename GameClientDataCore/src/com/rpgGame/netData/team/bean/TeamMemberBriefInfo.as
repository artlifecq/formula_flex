package com.rpgGame.netData.team.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 队员简要信息
	 */
	public class TeamMemberBriefInfo extends Bean {
	
		//队员ID
		private var _memberId: long;
		
		//当前血量
		private var _hp: int;
		
		//当前灵力
		private var _mp: int;
		
		//debuff列表
		private var _debufflist: Vector.<int> = new Vector.<int>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队员ID
			writeLong(_memberId);
			//当前血量
			writeInt(_hp);
			//当前灵力
			writeInt(_mp);
			//debuff列表
			writeShort(_debufflist.length);
			for (var i: int = 0; i < _debufflist.length; i++) {
				writeInt(_debufflist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队员ID
			_memberId = readLong();
			//当前血量
			_hp = readInt();
			//当前灵力
			_mp = readInt();
			//debuff列表
			var debufflist_length : int = readShort();
			for (var i: int = 0; i < debufflist_length; i++) {
				_debufflist[i] = readInt();
			}
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
		 * get 当前血量
		 * @return 
		 */
		public function get hp(): int{
			return _hp;
		}
		
		/**
		 * set 当前血量
		 */
		public function set hp(value: int): void{
			this._hp = value;
		}
		
		/**
		 * get 当前灵力
		 * @return 
		 */
		public function get mp(): int{
			return _mp;
		}
		
		/**
		 * set 当前灵力
		 */
		public function set mp(value: int): void{
			this._mp = value;
		}
		
		/**
		 * get debuff列表
		 * @return 
		 */
		public function get debufflist(): Vector.<int>{
			return _debufflist;
		}
		
		/**
		 * set debuff列表
		 */
		public function set debufflist(value: Vector.<int>): void{
			this._debufflist = value;
		}
		
	}
}