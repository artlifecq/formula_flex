package com.rpgGame.netData.monster.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 世界BOSS结算消息
	 */
	public class SCWorldBossResultMessage extends Message {
	
		//活动ID
		private var _activityId: int;
		
		//玩家排名
		private var _rank: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activityId);
			//玩家排名
			writeInt(_rank);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activityId = readInt();
			//玩家排名
			_rank = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114118;
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
		 * get 玩家排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 玩家排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
	}
}