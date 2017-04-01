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
	
		//当前vip等级
		private var _vipId: int;
		
		//领取奖励类型 1 开通/续费奖励   2 每日奖励
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//当前vip等级
			writeInt(_vipId);
			//领取奖励类型 1 开通/续费奖励   2 每日奖励
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//当前vip等级
			_vipId = readInt();
			//领取奖励类型 1 开通/续费奖励   2 每日奖励
			_type = readByte();
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
		 * get 领取奖励类型 1 开通/续费奖励   2 每日奖励
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 领取奖励类型 1 开通/续费奖励   2 每日奖励
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}