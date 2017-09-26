package com.rpgGame.netData.monster.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 世界BOSS击杀者排行榜名字
	 */
	public class SCWorldBossKillerRankNameMessage extends Message {
	
		//击杀者名字
		private var _killerName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//击杀者名字
			writeString(_killerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//击杀者名字
			_killerName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114122;
		}
		
		/**
		 * get 击杀者名字
		 * @return 
		 */
		public function get killerName(): String{
			return _killerName;
		}
		
		/**
		 * set 击杀者名字
		 */
		public function set killerName(value: String): void{
			this._killerName = value;
		}
		
	}
}