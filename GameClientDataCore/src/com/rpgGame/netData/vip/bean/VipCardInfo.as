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
		
		//剩余奖励次数
		private var _count: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前vip等级
			writeInt(_vipId);
			//剩余奖励次数
			writeByte(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前vip等级
			_vipId = readInt();
			//剩余奖励次数
			_count = readByte();
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
		 * get 剩余奖励次数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 剩余奖励次数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}