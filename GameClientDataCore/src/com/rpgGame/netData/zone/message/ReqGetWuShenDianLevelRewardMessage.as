package com.rpgGame.netData.zone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求领奖
	 */
	public class ReqGetWuShenDianLevelRewardMessage extends Message {
	
		//请求领奖怪物唯一ID
		private var _bossId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//请求领奖怪物唯一ID
			writeLong(_bossId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//请求领奖怪物唯一ID
			_bossId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155233;
		}
		
		/**
		 * get 请求领奖怪物唯一ID
		 * @return 
		 */
		public function get bossId(): long{
			return _bossId;
		}
		
		/**
		 * set 请求领奖怪物唯一ID
		 */
		public function set bossId(value: long): void{
			this._bossId = value;
		}
		
	}
}