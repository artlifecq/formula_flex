package com.rpgGame.netData.crossdatasync.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家增加经验,发送到原服
	 */
	public class ReqPlayerExpAddFightToGameMessage extends Message {
	
		//增加的经验
		private var _exp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//增加的经验
			writeInt(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//增加的经验
			_exp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251258;
		}
		
		/**
		 * get 增加的经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 增加的经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
	}
}