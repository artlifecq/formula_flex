package com.rpgGame.netData.monster.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 世界BOSS击杀者名字
	 */
	public class SCWorldBossKillerNameMessage extends Message {
	
		//活动ID
		private var _activityId: int;
		
		//击杀者名字
		private var _killerName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activityId);
			//击杀者名字
			writeString(_killerName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activityId = readInt();
			//击杀者名字
			_killerName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114119;
		}
		
		/**
		 * get 活动ID
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 活动ID
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
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