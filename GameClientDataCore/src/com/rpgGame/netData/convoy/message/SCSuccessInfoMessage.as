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
	 * 领奖成功后消息
	 */
	public class SCSuccessInfoMessage extends Message {
	
		//奖励
		private var _reward: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//奖励倍数
		private var _isdouble: int;
		
		//剩余次数
		private var _remainNum: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//奖励
			writeShort(_reward.length);
			for (i = 0; i < _reward.length; i++) {
				writeBean(_reward[i]);
			}
			//奖励倍数
			writeByte(_isdouble);
			//剩余次数
			writeInt(_remainNum);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//奖励
			var reward_length : int = readShort();
			for (i = 0; i < reward_length; i++) {
				_reward[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//奖励倍数
			_isdouble = readByte();
			//剩余次数
			_remainNum = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 230105;
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
		 * get 奖励倍数
		 * @return 
		 */
		public function get isdouble(): int{
			return _isdouble;
		}
		
		/**
		 * set 奖励倍数
		 */
		public function set isdouble(value: int): void{
			this._isdouble = value;
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
		
	}
}