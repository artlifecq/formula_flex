package com.rpgGame.netData.monster.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求BOSS概要列表
	 */
	public class ReqQueryBossListMessage extends Message {
	
		//配置表里的boss类型，0全部（慎用），1世界，2统领
		private var _bosstype: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//配置表里的boss类型，0全部（慎用），1世界，2统领
			writeByte(_bosstype);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//配置表里的boss类型，0全部（慎用），1世界，2统领
			_bosstype = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114201;
		}
		
		/**
		 * get 配置表里的boss类型，0全部（慎用），1世界，2统领
		 * @return 
		 */
		public function get bosstype(): int{
			return _bosstype;
		}
		
		/**
		 * set 配置表里的boss类型，0全部（慎用），1世界，2统领
		 */
		public function set bosstype(value: int): void{
			this._bosstype = value;
		}
		
	}
}