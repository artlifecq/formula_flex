package com.rpgGame.netData.player.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家增加经验
	 */
	public class ResPlayerAddExpMessage extends Message {
	
		//玩家增加经验
		private var _exp: long;
		
		//玩家增加经验原因ID
		private var _reason: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家增加经验
			writeLong(_exp);
			//玩家增加经验原因ID
			writeInt(_reason);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家增加经验
			_exp = readLong();
			//玩家增加经验原因ID
			_reason = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103102;
		}
		
		/**
		 * get 玩家增加经验
		 * @return 
		 */
		public function get exp(): long{
			return _exp;
		}
		
		/**
		 * set 玩家增加经验
		 */
		public function set exp(value: long): void{
			this._exp = value;
		}
		
		/**
		 * get 玩家增加经验原因ID
		 * @return 
		 */
		public function get reason(): int{
			return _reason;
		}
		
		/**
		 * set 玩家增加经验原因ID
		 */
		public function set reason(value: int): void{
			this._reason = value;
		}
		
	}
}