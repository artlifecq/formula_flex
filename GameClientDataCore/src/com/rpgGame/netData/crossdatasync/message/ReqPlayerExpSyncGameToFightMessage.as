package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家经验同步(覆盖到跨服)
	 */
	public class ReqPlayerExpSyncGameToFightMessage extends Message {
	
		//总经验
		private var _exp: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//总经验
			writeLong(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//总经验
			_exp = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251259;
		}
		
		/**
		 * get 总经验
		 * @return 
		 */
		public function get exp(): long{
			return _exp;
		}
		
		/**
		 * set 总经验
		 */
		public function set exp(value: long): void{
			this._exp = value;
		}
		
	}
}