package com.rpgGame.netData.specialactivities.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 活动基本信息
	 */
	public class SpecialActivityInfo extends Bean {
	
		//活动id
		private var _activityId: int;
		
		//活动类型：0综合活动，1世界BOSS
		private var _activityType: int;
		
		//参与状态0:活动未开启 1:可以参与  2:正在进行中
		private var _joinState: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//活动类型：0综合活动，1世界BOSS
			writeInt(_activityType);
			//参与状态0:活动未开启 1:可以参与  2:正在进行中
			writeInt(_joinState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//活动类型：0综合活动，1世界BOSS
			_activityType = readInt();
			//参与状态0:活动未开启 1:可以参与  2:正在进行中
			_joinState = readInt();
			return true;
		}
		
		/**
		 * get 活动id
		 * @return 
		 */
		public function get activityId(): int{
			return _activityId;
		}
		
		/**
		 * set 活动id
		 */
		public function set activityId(value: int): void{
			this._activityId = value;
		}
		
		/**
		 * get 活动类型：0综合活动，1世界BOSS
		 * @return 
		 */
		public function get activityType(): int{
			return _activityType;
		}
		
		/**
		 * set 活动类型：0综合活动，1世界BOSS
		 */
		public function set activityType(value: int): void{
			this._activityType = value;
		}
		
		/**
		 * get 参与状态0:活动未开启 1:可以参与  2:正在进行中
		 * @return 
		 */
		public function get joinState(): int{
			return _joinState;
		}
		
		/**
		 * set 参与状态0:活动未开启 1:可以参与  2:正在进行中
		 */
		public function set joinState(value: int): void{
			this._joinState = value;
		}
		
	}
}