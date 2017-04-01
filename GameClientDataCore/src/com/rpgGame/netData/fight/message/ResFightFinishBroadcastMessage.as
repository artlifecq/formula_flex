package com.rpgGame.netData.fight.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 行进魔法,攻击结束广播
	 */
	public class ResFightFinishBroadcastMessage extends Message {
	
		//战斗Id
		private var _fightId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战斗Id
			writeLong(_fightId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战斗Id
			_fightId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102106;
		}
		
		/**
		 * get 战斗Id
		 * @return 
		 */
		public function get fightId(): long{
			return _fightId;
		}
		
		/**
		 * set 战斗Id
		 */
		public function set fightId(value: long): void{
			this._fightId = value;
		}
		
	}
}