package com.rpgGame.netData.vip.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 获取vip奖励
	 */
	public class ReqGetVipAwardMessage extends Message {
	
		//当前领取vip等级
		private var _vipId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前领取vip等级
			writeInt(_vipId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前领取vip等级
			_vipId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 191203;
		}
		
		/**
		 * get 当前领取vip等级
		 * @return 
		 */
		public function get vipId(): int{
			return _vipId;
		}
		
		/**
		 * set 当前领取vip等级
		 */
		public function set vipId(value: int): void{
			this._vipId = value;
		}
		
	}
}