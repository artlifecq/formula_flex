package com.rpgGame.netData.daysdowngold.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送奖励信息
	 */
	public class SCRewardInfoMessage extends Message {
	
		//奖励
		private var _reward: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		
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
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130105;
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
		
	}
}