package com.rpgGame.netData.monster.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 极限挑战BOSS结算消息
	 */
	public class SCLimitChallengeBossResultMessage extends Message {
	
		//活动ID
		private var _activityId: int;
		
		//0失败，1成功
		private var _success: int;
		
		//排名
		private var _rank: int;
		
		//累计伤害
		private var _damage: int;
		
		//总伤害值
		private var _totalDamage: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动ID
			writeInt(_activityId);
			//0失败，1成功
			writeByte(_success);
			//排名
			writeShort(_rank);
			//累计伤害
			writeInt(_damage);
			//总伤害值
			writeInt(_totalDamage);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动ID
			_activityId = readInt();
			//0失败，1成功
			_success = readByte();
			//排名
			_rank = readShort();
			//累计伤害
			_damage = readInt();
			//总伤害值
			_totalDamage = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114120;
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
		 * get 0失败，1成功
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 0失败，1成功
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
		/**
		 * get 排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 累计伤害
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 累计伤害
		 */
		public function set damage(value: int): void{
			this._damage = value;
		}
		
		/**
		 * get 总伤害值
		 * @return 
		 */
		public function get totalDamage(): int{
			return _totalDamage;
		}
		
		/**
		 * set 总伤害值
		 */
		public function set totalDamage(value: int): void{
			this._totalDamage = value;
		}
		
	}
}