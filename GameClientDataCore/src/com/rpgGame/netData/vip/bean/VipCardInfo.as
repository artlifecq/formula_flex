package com.rpgGame.netData.vip.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * vip card 信息
	 */
	public class VipCardInfo extends Bean {
	
		//当前vip等级
		private var _vipId: int;
		
		//激活奖励领取状态  0 非领取状态  1 开通奖励  2 徐芬奖励
		private var _optainAwardState: int;
		
		//激活奖励领取状态  0 不能领取   1 可领取
		private var _dailyAwardState: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前vip等级
			writeInt(_vipId);
			//激活奖励领取状态  0 非领取状态  1 开通奖励  2 徐芬奖励
			writeByte(_optainAwardState);
			//激活奖励领取状态  0 不能领取   1 可领取
			writeByte(_dailyAwardState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前vip等级
			_vipId = readInt();
			//激活奖励领取状态  0 非领取状态  1 开通奖励  2 徐芬奖励
			_optainAwardState = readByte();
			//激活奖励领取状态  0 不能领取   1 可领取
			_dailyAwardState = readByte();
			return true;
		}
		
		/**
		 * get 当前vip等级
		 * @return 
		 */
		public function get vipId(): int{
			return _vipId;
		}
		
		/**
		 * set 当前vip等级
		 */
		public function set vipId(value: int): void{
			this._vipId = value;
		}
		
		/**
		 * get 激活奖励领取状态  0 非领取状态  1 开通奖励  2 徐芬奖励
		 * @return 
		 */
		public function get optainAwardState(): int{
			return _optainAwardState;
		}
		
		/**
		 * set 激活奖励领取状态  0 非领取状态  1 开通奖励  2 徐芬奖励
		 */
		public function set optainAwardState(value: int): void{
			this._optainAwardState = value;
		}
		
		/**
		 * get 激活奖励领取状态  0 不能领取   1 可领取
		 * @return 
		 */
		public function get dailyAwardState(): int{
			return _dailyAwardState;
		}
		
		/**
		 * set 激活奖励领取状态  0 不能领取   1 可领取
		 */
		public function set dailyAwardState(value: int): void{
			this._dailyAwardState = value;
		}
		
	}
}