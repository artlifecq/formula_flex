package com.rpgGame.netData.convoy.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送护送面板信息
	 */
	public class SCConvoyInfoMessage extends Message {
	
		//剩余次数
		private var _remainNum: int;
		
		//奖励
		private var _reward: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//宝物id
		private var _girlId: int;
		
		//剩余时间
		private var _remainTime: int;
		
		//完成任务npcId
		private var _npcId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//剩余次数
			writeInt(_remainNum);
			//奖励
			writeShort(_reward.length);
			for (i = 0; i < _reward.length; i++) {
				writeBean(_reward[i]);
			}
			//宝物id
			writeInt(_girlId);
			//剩余时间
			writeInt(_remainTime);
			//完成任务npcId
			writeInt(_npcId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//剩余次数
			_remainNum = readInt();
			//奖励
			var reward_length : int = readShort();
			for (i = 0; i < reward_length; i++) {
				_reward[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//宝物id
			_girlId = readInt();
			//剩余时间
			_remainTime = readInt();
			//完成任务npcId
			_npcId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230102;
		}
		
		/**
		 * get 剩余次数
		 * @return 
		 */
		public function get remainNum(): int{
			return _remainNum;
		}
		
		/**
		 * set 剩余次数
		 */
		public function set remainNum(value: int): void{
			this._remainNum = value;
		}
		
		/**
		 * get 奖励
		 * @return 
		 */
		public function get reward(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _reward;
		}
		
		/**
		 * set 奖励
		 */
		public function set reward(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._reward = value;
		}
		
		/**
		 * get 宝物id
		 * @return 
		 */
		public function get girlId(): int{
			return _girlId;
		}
		
		/**
		 * set 宝物id
		 */
		public function set girlId(value: int): void{
			this._girlId = value;
		}
		
		/**
		 * get 剩余时间
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 剩余时间
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
		/**
		 * get 完成任务npcId
		 * @return 
		 */
		public function get npcId(): int{
			return _npcId;
		}
		
		/**
		 * set 完成任务npcId
		 */
		public function set npcId(value: int): void{
			this._npcId = value;
		}
		
	}
}