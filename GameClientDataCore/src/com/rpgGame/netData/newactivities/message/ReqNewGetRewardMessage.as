package com.rpgGame.netData.newactivities.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求领取信息
	 */
	public class ReqNewGetRewardMessage extends Message {
	
		//活动id
		private var _activityId: int;
		
		//领取次数
		private var _times: int;
		
		//选择奖励
		private var _selected: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//活动id
			writeInt(_activityId);
			//领取次数
			writeInt(_times);
			//选择奖励
			writeInt(_selected);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//活动id
			_activityId = readInt();
			//领取次数
			_times = readInt();
			//选择奖励
			_selected = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 182201;
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
		 * get 领取次数
		 * @return 
		 */
		public function get times(): int{
			return _times;
		}
		
		/**
		 * set 领取次数
		 */
		public function set times(value: int): void{
			this._times = value;
		}
		
		/**
		 * get 选择奖励
		 * @return 
		 */
		public function get selected(): int{
			return _selected;
		}
		
		/**
		 * set 选择奖励
		 */
		public function set selected(value: int): void{
			this._selected = value;
		}
		
	}
}