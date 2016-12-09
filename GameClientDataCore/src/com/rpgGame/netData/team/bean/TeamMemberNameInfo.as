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
	 * 队员名字等级信息
	 */
	public class TeamMemberNameInfo extends Bean {
	
		//队员ID
		private var _memberId: long;
		
		//队员名字
		private var _memberName: String;
		
		//队员等级
		private var _memberLevel: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//队员ID
			writeLong(_memberId);
			//队员名字
			writeString(_memberName);
			//队员等级
			writeInt(_memberLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//队员ID
			_memberId = readLong();
			//队员名字
			_memberName = readString();
			//队员等级
			_memberLevel = readInt();
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
		 * get 队员名字
		 * @return 
		 */
		public function get memberName(): String{
			return _memberName;
		}
		
		/**
		 * set 队员名字
		 */
		public function set memberName(value: String): void{
			this._memberName = value;
		}
		
		/**
		 * get 队员等级
		 * @return 
		 */
		public function get memberLevel(): int{
			return _memberLevel;
		}
		
		/**
		 * set 队员等级
		 */
		public function set memberLevel(value: int): void{
			this._memberLevel = value;
		}
		
	}
}