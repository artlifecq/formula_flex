package com.rpgGame.netData.redreward.message{
	import com.rpgGame.netData.redreward.bean.RedRewardDataInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送单个红包信息
	 */
	public class SCSendRedRewardMessage extends Message {
	
		//红包数据
		private var _redReward: RedRewardDataInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//红包数据
			writeBean(_redReward);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//红包数据
			_redReward = readBean(RedRewardDataInfo) as RedRewardDataInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 254106;
		}
		
		/**
		 * get 红包数据
		 * @return 
		 */
		public function get redReward(): RedRewardDataInfo{
			return _redReward;
		}
		
		/**
		 * set 红包数据
		 */
		public function set redReward(value: RedRewardDataInfo): void{
			this._redReward = value;
		}
		
	}
}